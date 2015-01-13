<?php
/*---------------------------------------------------------------------------
 小微OA系统 - 让工作更轻松快乐

 Copyright (c) 2013 http://www.smeoa.com All rights reserved.

 Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )

 Author:  jinzhu.yin<smeoa@qq.com>

 Support: https://git.oschina.net/smeoa/smeoa
 -------------------------------------------------------------------------*/

namespace Home\Controller;

class MailOrganizeController extends HomeController {
	protected $config = array('app_type' => 'personal');
	public function index() {
		$where["user_id"] = get_user_id();
		$list = M("MailOrganize") -> where($where) -> select();
		$this -> assign("list", $list);
		$this -> display();
	}

	function add() {
		$temp = R("Mail/_assign_mail_folder_list");
		$this -> assign('mail_folder', $temp);
		$this -> display();
	}

	function edit($id) {
		$model = D("UserFolder");
		$user_folder = $model -> get_folder_list("MailFolder");
		$system_folder = array( array("id" => 1, "name" => "收件箱"), array("id" => 2, "name" => "已发送"));
		if (!empty($user_folder)) {
			$mail_folder = array_merge($system_folder, $user_folder);
		} else {
			$mail_folder = $system_folder;
		}
		$this -> assign('folder_list', $mail_folder);
		$this -> _edit($id);
	}

	protected function _update() {
		$id = $_POST["id"];
		$model = M("MailOrganize");
		$model -> where("id=$id") -> delete();
		
		dump($id);
		$model = D("MailOrganize");
		if (false === $model -> create()) {
			$this -> error($model -> getError());
		}
		//保存当前数据对象
		$model->user_id=get_user_id();
		$list = $model -> add();
		if ($list !== false) {//保存成功
			$this -> assign('jumpUrl', get_return_url());
			$this -> success('编辑成功!');
		} else {
			//失败提示
			$this -> error('编辑失败!');
		}
	}

	function del($id) {		
		$this -> _destory($id);
	}
}
?>