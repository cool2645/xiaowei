<?php
/*---------------------------------------------------------------------------
 小微OA系统 - 让工作更轻松快乐

 Copyright (c) 2013 http://www.smeoa.com All rights reserved.

 Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )

 Author:  jinzhu.yin<smeoa@qq.com>

 Support: https://git.oschina.net/smeoa/smeoa
 -------------------------------------------------------------------------*/

namespace Home\Controller;

class SystemFolderController extends HomeController {
	protected $config = array('app_type' => 'asst');

	//过滤查询字段
	function _search_filter(&$map) {
		$map['name'] = array('like', "%" . $_POST['name'] . "%");
		$map['is_del'] = array('eq', '0');
	}

	function index() {
		$this -> _index();
	}

	protected function _index() {
		$node = M("SystemFolder");
		$menu = array();
		$where['folder'] = CONTROLLER_NAME;
		$menu = $node -> where($where) -> field('id,pid,name') -> order('sort asc') -> select();
		$tree = list_to_tree($menu);
		$this -> assign('menu', sub_tree_menu($tree));

		$model = M("SystemFolder");
		$list = $model -> where($where) -> getField('id,name');
		$this -> assign('folder_list', $list);
		$this -> assign('js_file', "SystemFolder:js/index");
		$this -> display("SystemFolder:index");
	}

	protected function _insert() {
		$model = D("SystemFolder");
		if (false === $model -> create()) {
			$this -> error($model -> getError());
		}
		//保存当前数据对象
		$model -> folder = CONTROLLER_NAME;
		$list = $model -> add();
		if ($list !== false) {//保存成功.
			$this -> assign('jumpUrl', get_return_url());
			$this -> success('新增成功!');
		} else {
			//失败提示
			$this -> error('新增失败!');
		}
	}

	protected function _update() {
		$model = D("SystemFolder");
		if (false === $model -> create()) {
			$this -> error($model -> getError());
		}
		// 更新数据
		$list = $model -> save();
		if (false !== $list) {
			//成功提示
			$this -> assign('jumpUrl', get_return_url());
			$this -> success('编辑成功!');
		} else {
			//错误提示
			$this -> error('编辑失败!');
		}
	}

	function read() {
		$model = M("SystemFolder");
		$id = I('id');
		$data = $model -> getById($id);
		if ($data !== false) {// 读取成功
			$return['data'] = $data;
			$this -> ajaxReturn($return);
		}
	}

	function del() {
		$id = I('id');
		$model = M("SystemFolder");
		$data = $model -> getById($id);
		$fid = $data['id'];
		$folder = $data['folder'];
		$count = M(str_replace("Folder", "", $folder)) -> where("folder=$fid") -> count();

		if ($count > 0) {// 读取成功
			$this -> ajaxReturn("", "只能删除空文件夹", 1);
		} else {
			$result = $model -> where("id=$id") -> delete();
			if ($result) {
				$return['info'] = '删除文件夹成功';
				$return['status'] = 1;
				$this -> ajaxReturn($return);
			}
		}
	}

	function winpop() {
		$node = M("SystemFolder");
		$menu = array();
		$where['folder'] = CONTROLLER_NAME;
		$menu = $node -> where($where) -> field('id,pid,name') -> order('sort asc') -> select();
		$tree = list_to_tree($menu);
		$this -> assign('menu', popup_tree_menu($tree));
		$this -> display("SystemFolder:winpop");
	}

}
