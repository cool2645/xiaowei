<?php
/*---------------------------------------------------------------------------
 小微OA系统 - 让工作更轻松快乐

 Copyright (c) 2013 http://www.smeoa.com All rights reserved.

 Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )

 Author:  jinzhu.yin<smeoa@qq.com>

 Support: https://git.oschina.net/smeoa/smeoa
 -------------------------------------------------------------------------*/

namespace Weixin\Controller;

class IndexController extends WeixinController {

	protected $config = array('app_type' => 'public');
	protected $agent_id=2;

	public function index(){
		$data = $weixin -> request();
		/* 获取回复信息 */

		list($content, $type) = $this -> reply($data);

		// 接收到的信息入不同的库
		//$this->add_log ( $data );

		/* 响应当前请求 */
		$weixin -> response($content, $type);
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
		$re = "";
		$re .= "您好，欢迎关注小微OA企业号。为了让您能方便快捷的使用小微OA";
		$re .= "请先确认您在小微OA系统中有帐号，并进行微信号码绑定，绑定后后可以直接进入小微OA";
		$re .= "<a href='" . C("SITE_URL") . "/wechat/oauth/?openid={$openid}'>点击立即进行绑定</a>";
		return array($re, 'text');
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
				case 'apply_task' :
					// 我申请的任务
					$reply = array("查看我申请的任务信息，<a href='" . C("SITE_URL") . "/wechat/tasklist/?action=apply&openid={$openid}'>请点击这里</a>", 'text');
					break;
				default :
					$reply = array('没有相关指令', 'text');
					break;
			}
		} else {
			$reply = array("您还没有绑定帐号。<a href='" . C("SITE_URL") . "/wechat/oauth/?openid={$openid}'>点击立即进行绑定</a>", 'text');
		}
		return $reply;
	}

	// 字段：jointype 1，申请，2邀请
	// 字段：status 任务状态 0申请中1接受2忽略3完成

	// 申请：
	// 全部= 申请中+接受+忽略
	// 等待回复 = 申请中+忽略
	// 申请通过 = 接受
	// 邀请 ：
	// 全部 = 申请中+接受+忽略
	// 已同意 = 接受
	// 尚未操作 = 申请中

	/**
	 * 跳出页面-任务列表
	 */

	public function task_list() {
		$openid = I('get.openid');
		$action = I('get.action');
		$tab = I('get.tab', 'all');
		if (empty($action))
			$this -> message('错误，没有找到相关信息');

		$this -> assign('openid', $openid);
		$this -> assign('action', $action);
		$this -> assign('tab', $tab);

		$map = array();
		// 查询条件

		switch ($action) {// 判断哪个类型
			case 'apply' :
				//申请
				$userid = $this -> get_cookie_id($openid);
				// 绑定的用户ID
				if ($userid < 0)
					$this -> message('错误，您还没有绑定帐号');
				$map['userid'] = $userid;
				$map['jointype'] = 1;
				switch ($tab) {
					case 'all' :
						// 全部
						$map['status'] = array('neq', 3);
						$taskcount = M('Task_apply') -> where($map) -> count();
						$this -> meta_title = '全部-我申请的任务';
						break;
					case 'wait' :
						// 等待
						$map['status'] = array( array('eq', 0), array('eq', 2), 'OR');
						$taskcount = M('Task_apply') -> where($map) -> count();
						$this -> meta_title = '等待回复-我申请的任务';
						break;
					case 'pass' :
						// 通过
						$map['status'] = 1;
						$taskcount = M('Task_apply') -> where($map) -> count();
						$this -> meta_title = '申请通过-我申请的任务';
						break;
				}
				break;
			case 'invite' :
				// 邀请
				$userid = $this -> get_cookie_id($openid);
				// 绑定的用户ID
				if ($userid < 0)
					$this -> message('错误，您还没有绑定帐号');
				$map['userid'] = $userid;
				$map['jointype'] = 2;
				switch ($tab) {
					case 'all' :
						// 全部
						$map['status'] = array('neq', 3);
						$taskcount = M('Task_apply') -> where($map) -> count();
						$this -> meta_title = '全部-邀请我的任务';
						break;
					case 'wait' :
						// 等待
						$map['status'] = 0;
						$taskcount = M('Task_apply') -> where($map) -> count();
						$this -> meta_title = '等待回复-邀请我的任务';
						break;
					case 'pass' :
						// 已同意
						$map['status'] = 1;
						$taskcount = M('Task_apply') -> where($map) -> count();
						$this -> meta_title = '已同意-邀请我的任务';
						break;
				}
				break;
			case 'comment' :
				//待评价
				$userid = $this -> get_cookie_id($openid);
				// 绑定的用户ID
				if ($userid < 0)
					$this -> message('错误，您还没有绑定帐号');
				$map['userid'] = $userid;
				$map['usercontent'] = array('eq', '');

				$taskcount = M('Comment') -> where($map) -> count();
				$this -> meta_title = '待评价的任务';
				break;
			case 'fit' :
				//适合我的任务
				$userid = $this -> get_cookie_id($openid);
				// 绑定的用户ID
				if ($userid < 0)
					$this -> message('错误，您还没有绑定帐号');
				$user = M('Member') -> field('itemid,areaid,skill,ccies') -> where("itemid = {$userid}") -> find();
				//用户资料
				$taskcount = $this -> getRecomTaskCount($user);
				$this -> meta_title = '适合我的任务';
				break;
			case 'search' :
				//任务检索
				$keyword = I('get.keyword');
				$map['title'] = array('like', '%' . $keyword . '%');
				$map['content'] = array('like', '%' . $keyword . '%');
				$map['_logic'] = 'or';
				$taskcount = M('Task') -> where($map) -> count();
				$this -> meta_title = '任务检索';
				break;
		}
		$totalPages = ceil($taskcount / 3);
		// 总页数
		$this -> assign('total', $totalPages);
		$this -> assign('taskcount', $taskcount);
		$this -> display('tasklist');
	}

	/**
	 * 获取微信用户基础资料
	 *
	 * @param string $openid
	 *        	用户openid
	 * @return array; 响应的数据
	 */
	private function get_weixin_user_info($openid = '') {
		import("@.ORG.Util.ThinkWechat");
		$weixin = new \ThinkWechat();
		// $openid = 'o0ehLt1pOAIEFZtPD4ghluvjamf0';
		$weuser = $weixin -> get_user_info($openid);
		// dump($weuser);
		return $weuser;
	}

	public function test() {
		$this -> send("test", "1001");
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
