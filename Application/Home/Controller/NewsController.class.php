<?php
/*---------------------------------------------------------------------------
 小微OA系统 - 让工作更轻松快乐

 Copyright (c) 2013 http://www.smeoa.com All rights reserved.

 Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )

 Author:  jinzhu.yin<smeoa@qq.com>

 Support: https://git.oschina.net/smeoa/smeoa
 -------------------------------------------------------------------------*/

namespace Home\Controller;

class NewsController extends HomeController {	
	protected $config = array('app_type' => 'folder', 'action_auth' => array('mark' => 'admin'));
	
	//过滤查询字段
	function _search_filter(&$map) {
		$map['is_del'] = array('eq', '0');
		$keyword=I('keyword');
		if (!empty($keyword) && empty($map['64'])) {
			$map['name'] = array('like', "%" . I('keyword') . "%");
		}
	}

	public function index(){
		$plugin['date'] = true;		
		$this -> assign("plugin", $plugin);
									
		$map = $this -> _search();
		if (method_exists($this, '_search_filter')) {
			$this -> _search_filter($map);
		}
				
		$folder_list=D("SystemFolder")->get_authed_folder(get_user_id());
		$map['folder']=array("in",$folder_list);
		$model = D("NewsView");
				
		if (!empty($model)) {
			$this -> _list($model, $map);
		}
		$this -> display();
	}

	public function edit() {
		$plugin['uploader'] = true;
		$plugin['editor'] = true;
		$this -> assign("plugin", $plugin);

		$id = I('id');		
		$model = M("News");
		$folder_id = $model -> where("id=$id") -> getField('folder');
		$this -> assign("auth", D("SystemFolder") -> get_folder_auth($folder_id));				
		$this->_edit();
	}

	public function folder(){
		$plugin['date'] = true;		
		$this -> assign("plugin", $plugin);
		$this -> assign('auth', $this -> config['auth']);
		
		$model = D("News");
		$map = $this -> _search();
		if (method_exists($this, '_search_filter')) {
			$this -> _search_filter($map);
		}

		$folder_id = I('fid');
		$map['folder'] = $folder_id;
		if (!empty($_REQUEST['tag'])) {
			$map['_string'] = "locate('{$_REQUEST['tag']}',News.tag_name)";
		}
		if (!empty($model)) {
			$this -> _list($model, $map);
		}

		$where = array();
		$where['id'] = array('eq', $folder_id);

		$folder_name = M("SystemFolder") -> where($where) -> getField("name");
		$this -> assign("folder_name", $folder_name);
		$this -> assign("folder", $folder_id);

		$this -> _assign_folder_list();
		$this -> display();
		return;
	}

	public function add(){
		$plugin['uploader'] = true;
		$plugin['editor'] = true;
		$this -> assign("plugin", $plugin);		
		
		$fid = I('fid');
		$type = D("SystemFolder") -> where("id=$fid") -> getField("folder");
		$this -> assign('folder', $fid);
		$this -> display();
	}

	public function read() {
		$id = I('id');		
		$model = M("News");
		$folder_id = $model -> where("id=$id") -> getField('folder');
		$this -> assign("auth", D("SystemFolder") -> get_folder_auth($folder_id));
		$this->_edit();
	}

	public function mark(){
		$action = I('action');;
		$id = I('id');
		if (!empty($id)) {
			switch ($action){
				case 'del' :
					$where['id'] = array('in', $id);
					$folder = M("News") -> distinct(true) -> where($where) -> field("folder") -> select();
					if (count($folder) == 1) {
						$auth = D("SystemFolder") -> get_folder_auth($folder[0]["folder"]);
						if ($auth['admin'] == true) {
							$field = 'is_del';
							$result = $this -> _set_field($id, $field, 1);
							if ($result) {
								$this -> ajaxReturn('', "删除成功", 1);
							} else {
								$this -> ajaxReturn('', "删除失败", 0);
							}
						}
					} else {
						$this -> ajaxReturn('', "删除失败", 0);
					}
					break;

				case 'move_folder' :
					$target_folder = I('val');
					$where['id'] = array('in', $id);
					$folder = M("News") -> distinct(true) -> where($where) -> field("folder") -> select();
					if (count($folder) == 1) {
						$auth = D("SystemFolder") -> get_folder_auth($folder[0]["folder"]);
						if ($auth['admin'] == true) {
							$field = 'folder';
							$this -> _set_field($id, $field, $target_folder);
						}
						$this -> ajaxReturn('', "操作成功", 1);
					} else {
						$this -> ajaxReturn('', "操作成功", 1);
					}
					break;
				default :
					break;
			}
		}
	}

	function tag_manage() {
		$this -> _tag_manage("标签管理");
	}

	function upload() {
		$this -> _upload();
	}

	function down() {
		$this -> _down();
	}
}
