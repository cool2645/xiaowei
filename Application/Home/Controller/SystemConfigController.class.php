<?php
/*---------------------------------------------------------------------------
 小微OA系统 - 让工作更轻松快乐

 Copyright (c) 2013 http://www.smeoa.com All rights reserved.

 Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )

 Author:  jinzhu.yin<smeoa@qq.com>

 Support: https://git.oschina.net/smeoa/smeoa
 -------------------------------------------------------------------------*/

namespace Home\Controller;

class SystemConfigController extends HomeController {

	protected $config = array('app_type' => 'master');

	public function index(){

		$node = M("SystemConfig");
		
		if (!empty($_POST['eq_pid'])) {
			$eq_pid = $_POST['eq_pid'];
		} else {
			$eq_pid = "#";
		}

		$this -> assign('eq_pid', $eq_pid);

		$list = $node -> where('pid=0') -> order('sort desc') -> getField('id,name');
		$this -> assign('groupList', $list);

		$node = M("SystemConfig");
		$menu = array();
		$menu = $node -> where($map) -> field('id,pid,name,is_del') -> order('sort desc') -> select();
		
		if ($eq_pid != "#") {
			$tree = list_to_tree($menu,$eq_pid);
		} else {
			$tree = list_to_tree($menu);
		}
						
		$this -> assign('menu', popup_tree_menu($tree));

		$model = M("SystemConfig");
		$list = $model -> order('sort asc') -> getField('id,name');
		$this -> assign('system_config_list', $list);

		$model = M("DeptGrade");
		$list = $model -> where('is_del=0') -> order('sort asc') -> getField('id,name');
		$this -> assign('dept_grade_list', $list);

		$this -> display();
	}

	public function del($id) {		
		$this -> _destory($id);
	}

	public function winpop() {
		$node = M("SystemConfig");
		$menu = array();
		$menu = $node -> where('is_del=0') -> field('id,pid,name') -> order('sort asc') -> select();

		$tree = list_to_tree($menu);
		$this -> assign('menu', popup_tree_menu($tree));

		$this -> assign('pid', $pid);
		$this -> display();
	}

	public function winpop2() {
		$this -> winpop();
	}

}
?>