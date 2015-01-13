<?php
/*---------------------------------------------------------------------------
 小微OA系统 - 让工作更轻松快乐

 Copyright (c) 2013 http://www.smeoa.com All rights reserved.

 Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )

 Author:  jinzhu.yin<smeoa@qq.com>

 Support: https://git.oschina.net/smeoa/smeoa
 -------------------------------------------------------------------------*/

namespace Home\Controller;

class IndexController extends HomeController {
	protected $config = array('app_type' => 'public');
	//过滤查询字段

	public function index() {
		$plugin['jquery-ui'] = true;
		$this -> assign("plugin", $plugin);

		cookie("current_node", null);
		cookie("top_menu", null);

		$config = D("UserConfig") -> get_config();
		$this -> assign("home_sort", $config['home_sort']);
		
		$this -> _mail_list();
		$this -> _flow_list();
		$this -> _schedule_list();
 

		$this -> display();
	}

	public function set_sort() {
		$val = I('val');
		$data['home_sort'] = $val;
		$model = D("UserConfig") -> set_config($data);
	}

	protected function _mail_list() {
		$user_id = get_user_id();
		$model = D('Mail');

		//获取最新邮件
		$where['user_id'] = $user_id;
		$where['is_del'] = array('eq', '0');
		$where['folder'] = array( array('eq', 1), array('gt',6), 'or');

		$new_mail_list = $model -> where($where) -> field("id,name,create_time") -> order("create_time desc") -> limit(10) -> select();
		$this -> assign('new_mail_list', $new_mail_list);

		//获取未读邮件
		$where['read'] = array('eq', '0');
		$unread_mail_list = $model -> where($where) -> field("id,name,create_time") -> order("create_time desc") -> limit(10) -> select();
		$this -> assign('unread_mail_list', $unread_mail_list);
	}

	protected function _flow_list() {
		$user_id = get_user_id();
		$emp_no = get_emp_no();
		$model = D('Flow');
		//带审批的列表
		$FlowLog = M("FlowLog");
		$where['emp_no'] = $emp_no;
		$where['_string'] = "result is null";
		$log_list = $FlowLog -> where($where) -> field('flow_id') -> select();
		$log_list = rotate($log_list);
				
		if (!empty($log_list)) {
			$map['id'] = array('in', $log_list['flow_id']);
			$todo_flow_list = $model -> where($map) -> field("id,name,create_time") -> limit(6) -> order("create_time desc") -> select();
			$this -> assign("todo_flow_list", $todo_flow_list);			
		}
		
		//已提交
		$map = array();
		$map['user_id'] = $user_id;
		$map['step'] = array('gt', 10);
		
		$submit_flow_list = $model -> where($map) -> field("id,name,create_time") -> limit(6) -> order("create_time desc") -> select();
	 
		$this -> assign("submit_flow_list", $submit_flow_list);
	}

	protected function _doc_list() {
		$user_id = get_user_id();
		$model = D('Doc');
		//获取最新邮件

		$where['is_del'] = array('eq', '0');
		$folder_list = D("SystemFolder") -> get_authed_folder(get_user_id(), "DocFolder");
		$where['folder'] = array("in", $folder_list);
		$doc_list = $model -> where($where) -> field("id,name,create_time") -> order("create_time desc") -> limit(10) -> select();
		$this -> assign("doc_list", $doc_list);
	}

	protected function _schedule_list() {
		$user_id = get_user_id();
		$model = M('Schedule');
		//获取最新邮件
		$start_date = date("Y-m-d");
		$where['user_id'] = $user_id;
		$where['start_date'] = array('egt', $start_date);
		$schedule_list = M("Schedule") -> where($where) -> order('start_date,priority desc') -> limit(10) -> select();
		$this -> assign("schedule_list", $schedule_list);

		$model = M("Todo");
		$where = array();
		$where['user_id'] = $user_id;
		$where['status'] = array("in", "1,2");
		$todo_list = M("Todo") -> where($where) -> order('priority desc,sort asc') -> limit(10) -> select();
		$this -> assign("todo_list", $todo_list);
	}
}
?>