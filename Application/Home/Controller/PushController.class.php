<?php
/*---------------------------------------------------------------------------
 小微OA系统 - 让工作更轻松快乐

 Copyright (c) 2013 http://www.smeoa.com All rights reserved.

 Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )

 Author:  jinzhu.yin<smeoa@qq.com>

 Support: https://git.oschina.net/smeoa/smeoa
 -------------------------------------------------------------------------*/

namespace Home\Controller;
use Think\Controller;

class PushController extends Controller {

	protected $config = array('app_type' => 'asst');

	function _initialize() {
		$auth_id = session(C('USER_AUTH_KEY'));
		if (!isset($auth_id)) {
			//跳转到认证网关
			die ;
		}
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
		while (empty($data))// check if the data file has been modified
		{
			if (time() - $start_time > 20) {
				header('HTTP/1.1 404 Not Found');
				die;
			}
			usleep(1000000);
			// sleep 10ms to unload the CPU
			clearstatcache();
			$data = $this -> get_data($user_id);
		}
		$data['info'] = 'test';
		// return a json array
		$response = array();
		$response['status'] = 1;
		$response['data'] = $data;
		$response['timestamp'] = $currentmodif;
		echo json_encode($response);
		flush();
	}

	function get_data($user_id) {
		$where = array();
		$where['user_id'] = $user_id;
		$where['create_time'] = array('elt', time() - 1);
		$model = M("Push");
		$data = $model -> where($where) -> find();
		if ($data) {
			$model -> where("id=" . $data['id']) -> delete();
		}
		return $data;
	}

	function add($status, $info, $data) {
		$user_id = get_user_id();
		$model = M("Push");
		$model -> user_id = $user_id;
		$model -> data = $data;
		$model -> status = $status;
		$model -> info = $info;
		$model -> add();
	}

}
?>