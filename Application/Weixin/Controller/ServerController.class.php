<?php
/*---------------------------------------------------------------------------
 小微OA系统 - 让工作更轻松快乐

 Copyright (c) 2013 http://www.smeoa.com All rights reserved.

 Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )

 Author:  jinzhu.yin<smeoa@qq.com>

 Support: https://git.oschina.net/smeoa/smeoa
 -------------------------------------------------------------------------*/

namespace Weixin\Controller;

class ServerController extends WeixinController {

	protected $config = array('app_type' => 'public');
	protected $agent_id = 2;

	public function index() {

		/* 获取请求信息 */

		$data = $this->weixin -> request();
		/* 获取回复信息 */

		list($content, $type) = $this -> reply($data);

		// 接收到的信息入不同的库
		//$this->add_log ( $data );

		/* 响应当前请求 */
		$this->weixin -> response($content, $type);
	}

	/**
	 * 定制响应信息
	 * @param array $data 接收的数据
	 * @return array; 响应的数据
	 */
	private function reply($data) {
		// 消息类型
		switch ($data ['MsgType']) {
			case 'text' :
				// 类型是文本的
				switch ($data ['Content']) {
					case '解除绑定' :
						// 接触绑定
						$reply = $this -> getUnOauth($data['FromUserName']);
						break;
					case '1' :
						// 任务提醒
						$reply = $this -> get_task_event('ites_set', $data['FromUserName']);
						break;
					case '2' :
						// 任务检索
						$reply = array("任务检索，<a href='" . C("SITE_URL") . "/wechat/search/?openid={$data ['FromUserName']}'>请点击这里</a>", 'text');
						break;
					default :

						/* 加载分词SDK */
						//import ( "@.ORG.Util.SplitWord" );
						//$word = new SplitWord ();
						//$reply = $word->getWord($data ['Content']);

						if (strpos($data['Content'], '任务') !== false) {
							$html = $this -> getTaskHtml();
							$reply = array($html, 'text');
						} else {
							$reply = array('欢迎使用小微OA企业号', 'text');
						}
						break;
				}

				break;
			case 'event' :
				// 类型是事件的
				// 事件类型
				switch ($data ['Event']) {
					case 'subscribe' :
						// 刚刚关注的
						$reply = $this -> get_subscribe($data['FromUserName']);
						break;
					case 'click' :
						// 点击的事件
						$reply = $this -> get_task_event($data['EventKey'], $data['FromUserName']);
						break;
					/*
					 default :
					 $reply = array ( '没有相关事件',	'text' );
					 break;
					 */
				}

				break;
			default :
				$reply = array('没有相关消息类型', 'text');
				break;
		}
		return $reply;
	}

	/**
	 * 关注成功
	 * @param string $openid 用户openid
	 * @return array; 响应的数据
	 */
	private function get_subscribe($openid = '') {
		$subscribe_msg=get_system_config('SUBSCRIBE_MSG'); 
		$content = $subscribe_msg."<a href='" . C("SITE_URL") .U('Weixin/oauth/bind')."?openid={$openid}'>点击立即进行绑定</a>";
		return array($content, 'text');
	}

	/**
	 * 任务事件
	 * @param string $taskevent 事件
	 * @param string $openid   	用户openid
	 * @return array; 响应的数据
	 */
	private function get_task_event($taskevent = '', $openid = '') {
		$userid = $this -> get_cookie_id($openid);
		// 绑定的用户ID
		if ($openid && $userid > 0) {
			switch ($taskevent) {
				case 'sign_up' :
					// 签到
					$reply = array("签到成功", 'text');
					break;
				case 'unauth' :
					// 解除绑定
					$reply = $this -> getUnOauth($openid);
					break;
				case 'push_config' :
					// 我申请的任务
					$reply = array("设置微信推送相关设置，<a href='" . C("SITE_URL") .U('Home/UserConfig/index')."'>请点击这里</a>", 'text');
					break;
				default :
					$reply = array('没有相关指令', 'text');
					break;
			}
		} else {
			$reply = array("您还没有绑定帐号。<a href='" . C("SITE_URL").U('Weixin/oauth/bind')."?openid={$openid}'>点击立即进行绑定</a>", 'text');
		}
		return $reply;
	}

	/**
	 * 获取微信用户基础资料
	 *
	 * @param string $openid
	 *        	用户openid
	 * @return array; 响应的数据
	 */
	private function get_weixin_user_info($openid = '') {
		$weuser = $weixin -> get_user_info($openid);
		// dump($weuser);
		return $weuser;
	}

	public function test() {
		$this -> send("test", "1001");
	}

	public function set_menu() {

		$sub = array();
		$data = array();
		$subs = array();

		$corpid = C("WECHAT_CORPID");
		//echo $corpid;
		$redirect_uri = U('Weixin/oauth/login');
		$site_url = C("SITE_URL");

		$subs2[] = array('type' => 'view', 'name' => '绑定帐号', 'url' => $site_url . U('Weixin/oauth/bind'));
		$subs2[] = array('type' => 'view', 'name' => '解除绑定', 'url' => $site_url . U('Weixin/oauth/unbind'));
		$subs2[] = array('type' => 'click', 'name' => '推送设置', 'key' => 'push_config');
		$oauth_url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=$corpid&redirect_uri={$site_url}{$redirect_uri}&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect";

		$sub1 = array('type' => 'view', 'name' => '登录OA', 'url' => $oauth_url);
		$sub2 = array('name' => '帮助', 'sub_button' => $subs2);

		$data['button'][] = $sub1;
		$data['button'][] = $sub2;

		$data = jsencode($data);
		echo $this->weixin -> set_menu($data);
	}

	/**
	 * 生成COOKIE或从COOKIE获得用户ID
	 */
	private function get_cookie_id($openid = NULL) {
		if (empty($openid))
			return -3;
		$auth = cookie('user_auth');
		// 读取COOKIE
		if ($auth) {// 存在cookie
			$auth = decrypt($auth);
			// 解密cookie
			if (strpos($auth, '{@}') === FALSE) {// 如果是假冒的cookie
				$uid = -2;
			} else {// 真实，然后分解cookie
				$autharr = explode('{@}', $auth);
				$uid = $autharr[1];
			}
		} else {// 不存在cookie，则创建cookie
			$model = M("User");
			$where['openid'] = array('eq', $openid);
			$where['westatus'] = array('eq', 1);
			$where['is_del'] = array('eq', 0);
			$weuser = $model -> where($where) -> find();
			// 查到userid
			if (empty($weuser)) {// 查到没有绑定返回-1
				$uid = -1;
				$auth = encrypt($openid . '{@}' . $uid . '{@}' . time());
				cookie('user_auth', $auth);
			} else {// 绑定了的创建COOKIE；
				$uid = $weuser['id'];
				$auth = encrypt($openid . '{@}' . $uid . '{@}' . time());
				cookie('user_auth', $auth);
			}
		}
		return $uid;
		// 返回USERID
	}
}
