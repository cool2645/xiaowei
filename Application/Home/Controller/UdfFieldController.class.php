<?php
/*---------------------------------------------------------------------------
 小微OA系统 - 让工作更轻松快乐

 Copyright (c) 2013 http://www.smeoa.com All rights reserved.

 Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )

 Author:  jinzhu.yin<smeoa@qq.com>

 Support: https://git.oschina.net/smeoa/smeoa
 -------------------------------------------------------------------------*/

namespace Home\Controller;

class UdfFieldController extends HomeController {
	protected $config = array('app_type' => 'asst');

	function index($row_type) {		
		if (IS_POST){
			$opmode = I("opmode");
			$model = D("UdfField");
			if (false === $model -> create()) {
				$this -> error($model -> getError());
			}
			if ($opmode == "add") {
				$list = $model -> add();
				if ($list !== false) {//保存成功
					$this -> assign('jumpUrl', get_return_url());
					$this -> success('新增成功!');
				} else {
					$this -> error('新增失败!');
					//失败提示
				}
			}
			if ($opmode == "edit") {
				$list = $model -> save();
				if ($list !== false) {//保存成功
					$this -> assign('jumpUrl', get_return_url());
					$this -> success('保存成功!');
				} else {
					$this -> error('保存失败!');
					//失败提示
				}
			}
			if ($opmode == "del") {
				$id = $_REQUEST['id'];
				$list = $model -> where("id=$id") -> delete();
				if ($list !== false) {//保存成功
					$this -> assign('jumpUrl', get_return_url());
					$this -> success('删除成功!');
				} else {
					$this -> error('删除失败!');
					//失败提示
				}
			}
		}
				
		$plugin['editor'] = true;
		$plugin['date'] = true;
		$this -> assign("plugin", $plugin);

		$controller = CONTROLLER_NAME;
		$model = D("UdfField");
		$this -> assign('row_type', $row_type);

		$where['row_type'] = array('eq', $row_type);
		$where['is_del'] = 0;
		$where['controller'] = $controller;

		$field_list = $model -> where($where) -> order('sort asc') -> select();

		//$tree = list_to_tree($field_list);
		$this -> assign('menu', sub_tree_menu($field_list));
				
		$this -> assign("field_list", $field_list);
		$this -> display("UdfField:index");
	}
}
