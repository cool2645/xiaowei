<?php
/*---------------------------------------------------------------------------
 小微OA系统 - 让工作更轻松快乐

 Copyright (c) 2013 http://www.smeoa.com All rights reserved.

 Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )

 Author:  jinzhu.yin<smeoa@qq.com>

 Support: https://git.oschina.net/smeoa/smeoa
 -------------------------------------------------------------------------*/

namespace Weixin\Controller;
use Think\Controller;

class WeixinController extends Controller {
	protected $config = array('app_type' => 'public');
	protected $weixin;

	function _initialize() {
		if (isset($this -> agent_id)) {
			/* 加载微信SDK */
			import("@.ORG.Util.ThinkWechat");
			$this->weixin = new \ThinkWechat($this -> agent_id);
		}else{
			$this->error('请定义agent_id');
		}
	}

	/**
	 * 跳出页面-信息提示页面
	 */
	public function message($msg = '') {
		$this -> assign('msg', $msg);
		$this -> display('Layout/message');
		exit();
	}

	/**
	 * 信息入库
	 * @param array $data 接收的数据
	 */
	private function add_log($data) {
		if ($data['MsgType'] == 'event') {
			M('wechat_event') -> data($data) -> add();
		} else {
			M('wechat_info') -> data($data) -> add();
		}
	}

	/**
	 * 主动发送消息
	 *
	 * @param string $content
	 *        	内容
	 * @param string $openid
	 *        	发送者用户名
	 * @param string $type
	 *        	类型
	 * @return array 返回的信息
	 */
	protected function send($content, $openid = '', $type = 'text') {
		// $openid = 'o0ehLt1pOAIEFZtPD4ghluvjamf0';
		$restr = $this->weixin -> send_msg($content, $openid, $type);
		return $restr;
	}
}
?>