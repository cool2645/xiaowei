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

class PushController extends HomeController {

	protected $config = array('app_type' => 'asst');
	
	function index(){
		$this -> redirect('folder', array('type' => 'all'));
	}

	public function folder($type) {
		switch ($type) {
			case 'all':
				
				break;
			case 'mail':
				$where['type']=array('eq',$mail);
				break;			
			default:				
				break;
		}
		$model = D('Push');
		if (!empty($model)) {
			$this -> _list($model, $where);
		}
		$this -> display();	
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
		{	if (connection_status() != 0) {
				exit();
			}
			if (time() - $start_time > 20) {
				$response['status'] = 0;
				$response['timestamp'] = $start_time;
				echo json_encode($response);
				die;
			}
			usleep(5000000);
			// sleep 10ms to unload the CPU
			clearstatcache();
			$data = $this -> get_data($user_id);
		}

		$response = array();
		$response['status'] = 1;
		$response['data'] = $data;
		$response['timestamp'] = time();
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
			$model -> delete($data['id']);
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