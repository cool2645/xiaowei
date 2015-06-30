<?php
/*--------------------------------------------------------------------
 小微OA系统 - 让工作更轻松快乐

 Copyright (c) 2013 http://www.smeoa.com All rights reserved.

 Author:  jinzhu.yin<smeoa@qq.com>

 Support: https://git.oschina.net/smeoa/xiaowei
 --------------------------------------------------------------*/

namespace Home\Controller;
use Think\Controller;

class PushController extends HomeController {
	protected $is_close = false;
	protected $config = array('app_type' => 'asst');

	function index() {
		$this -> redirect('folder', array('type' => 'all'));
	}

	public function folder($type) {
		switch ($type) {
			case 'all' :
				break;
			case 'mail' :
				$where['type'] = array('eq', $mail);
				break;
			default :
				break;
		}
		$model = D('Push');
		if (!empty($model)) {
			$this -> _list($model, $where);
		}
		$this -> display();
	}

	function test() {
		$data['type'] = 'type';
		$data['action'] = 'action';
		$data['title'] = 'title';
		$data['content'] = 'contnet';
		send_ws($data, array('1'));
	}

	function server() {
		$user_id = $user_id = get_user_id();
		session_write_close();
		while (true) {
			$where = array();
			$where['user_id'] = $user_id;
			$where['create_time'] = array('elt', time() - 1);
			$model = M("Push");
			$data = $model -> where($where) -> find();

			if ($data) {
				$model -> delete($data['id']);
				echo json_encode($data);
				flush();
				sleep(1);
				die ;
			} else {
				sleep(1);
				// sleep 10ms to unload the CPU
				clearstatcache();
			}
		}
	}

	function server2() {
		$user_id = get_user_id();

		session_write_close();
		for ($i = 0, $timeout = 10; $i < $timeout; $i++) {
			if (connection_status() != 0) {
				exit();
			}
			$where = array();
			$where['user_id'] = $user_id;
			$where['create_time'] = array('elt', time() - 1);

			$model = M("Push");
			$data = $model -> where($where) -> find();
			$where['id'] = $data['id'];

			if ($data) {
				sleep(1);
				$model -> where("id=" . $data['id']) -> delete();
				$this -> ajaxReturn($data);
			} else {
				sleep(2);
			}
		}
		$return['status'] = 0;
		$return['info'] = 'no-data';
		$this -> ajaxReturn($return);
	}

	function server3() {
		$user_id = get_user_id();
		session_write_close();
		$data = $this -> get_data($user_id);
		$start_time = time();

		$response = array();
		if (empty($data)) {
			$response['status'] = 0;
			$response['timestamp'] = $start_time;
		} else {
			$response['status'] = 1;
			$response['data'] = $data;
			$response['timestamp'] = time();
			$response['count']=$this->get_count($user_id);
		}
		echo json_encode($response);
		flush();
		die ;
	}

	function get_data($user_id) {
		$where['user_id'] = array('eq',$user_id);
		$where['create_time'] = array('elt', time() - 1);
		$model = M("Push");
		$data = $model -> where($where) -> find();
		if ($data) {
			$model -> delete($data['id']);
		}
		return $data;
	}

	function get_count($user_id) {
		$where['user_id'] = array('eq',$user_id);
		$where['create_time'] = array('elt', time() - 1);
		return M("Push")->where($where)->count();;
	}
}
?>