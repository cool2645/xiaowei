<?php
/*---------------------------------------------------------------------------
 小微OA系统 - 让工作更轻松快乐

 Copyright (c) 2013 http://www.smeoa.com All rights reserved.

 Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )

 Author:  jinzhu.yin<smeoa@qq.com>

 Support: https://git.oschina.net/smeoa/smeoa
 -------------------------------------------------------------------------*/

// 后台用户模块
namespace Home\Controller;

class UserController extends HomeController {
	protected $config = array('app_type' => 'master');

	function _search_filter(&$map) {
		$keyword = I('keyword');
		if (!empty($keyword)) {
			$map['name|emp_no'] = array('like', "%" . $keyword . "%");
		}
	}

	public function index() {
		$plugin['date'] = true;
		$this -> assign("plugin", $plugin);
		$model = M("Position");
		$list = $model -> where('is_del=0') -> order('sort asc') -> getField('id,name');
		$this -> assign('position_list', $list);

		$model = M("Rank");
		$list = $model -> where('is_del=0') -> order('sort asc') -> getField('id,name');
		$this -> assign('rank_list', $list);

		$model = M("Dept");
		$list = $model -> where('is_del=0') -> order('sort asc') -> getField('id,name');
		$this -> assign('dept_list', $list);

		$model = M("Rank");
		$list = $model -> where('is_del=0') -> order('sort asc') -> getField('id,name');
		$this -> assign('rank_list', $list);

		if (isset($_POST['eq_is_del'])) {
			$eq_is_del = $_POST['eq_is_del'];
		} else {
			$eq_is_del = "0";
		}
		//die;
		$this -> assign('eq_is_del', $eq_is_del);

		$map = $this -> _search();
		if (method_exists($this, '_search_filter')) {
			$this -> _search_filter($map);
		}
		$map['is_del'] = array('eq', $eq_is_del);

		$model = D("User");

		if (!empty($model)) {
			$this -> _list($model, $map, "emp_no");
		}
		$this -> display();
	}

	public function add() {
		$plugin['date'] = true;
		$this -> assign("plugin", $plugin);

		$model = M("Position");
		$list = $model -> where('is_del=0') -> order('sort asc') -> getField('id,name');
		$this -> assign('position_list', $list);

		$model = M("Dept");
		$list = $model -> where('is_del=0') -> order('sort asc') -> getField('id,name');
		$this -> assign('dept_list', $list);

		$this -> display();
	}

	// 检查帐号
	public function check_account() {
		if (!preg_match('/^[a-z]\w{4,}$/i', $_POST['emp_no'])) {
			$this -> error('用户名必须是字母，且5位以上！');
		}
		$User = M("User");
		// 检测用户名是否冲突
		$name = I('emp_no');
		;
		$result = $User -> getByAccount($name);
		if ($result) {
			$this -> error('该编码已经存在！');
		} else {
			$this -> assign('jumpUrl', get_return_url());
			$this -> success('该编码可以使用！');
		}
	}

	// 插入数据
	public function _insert() {
		// 创建数据对象
		$model = D("User");
		if (!$model -> create()) {
			$this -> error($model -> getError());
		} else {
			// 写入帐号数据
			$model -> letter = get_letter($model -> name);
			$model -> password = md5($model -> emp_no . $model -> emp_no);
			$emp_no = $model -> emp_no;
			$name = $model -> name;
			$mobile_tel = $model -> mobile_tel;
			if ($result = $model -> add()) {
				$data['id'] = $result;
				M("UserConfig") -> add($data);
				if (!empty($mobile_tel)) {
					$agent_id = get_system_config('WEIXIN_AGENT_ID');
					$weixin = new \ThinkWechat($agent_id);
					$weixin -> add_user($emp_no,$name,$mobile_tel);
				}
				$this -> assign('jumpUrl', get_return_url());
				$this -> success('用户添加成功！');
			} else {
				$this -> error('用户添加失败！');
			}
		}
	}

	public function weixin_sync() {

		import("Weixin.ORG.Util.ThinkWechat");
		$agent_id = get_system_config('WEIXIN_AGENT_ID');
		$weixin = new \ThinkWechat($agent_id);
		$user_list = M("User") -> getField('emp_no', true);

		$weixin_user_list = $weixin -> get_user_list();
		foreach ($weixin_user_list as $key => $val) {
			$data[] = $val -> userid;
		}
		//$where['emp_no']=array('in',$data);

		$weixin -> del_user_list($data);

		$user_list = M("User") -> where(array('is_del' => 0)) -> getField('emp_no,name,mobile_tel');

		$error_code_desc = C('WEIXIN_ERROR_CODE');
		foreach ($user_list as $key => $val) {
			$error_code =     json_decode($weixin -> add_user($val['emp_no'], $val['name'], $val['mobile_tel'])) -> errcode;
			$list[$key]['error_code'] = $error_code;
			$list[$key]['desc'] = $error_code_desc[$error_code];
			$list[$key]['emp_no'] = $key;
		}
		$this -> assign('list', $list);
		$this -> display();
	}

	private function _add_weixin_user($user_id, $name, $mobile) {
		import("Weixin.ORG.Util.ThinkWechat");
		$weixin = new \ThinkWechat(2);
		// $openid = 'o0ehLt1pOAIEFZtPD4ghluvjamf0';
		$restr = $weixin -> add_user($id, $name, $mobile);
		return $restr;
	}

	private function _del_weixin_user($user_id, $name, $mobile) {
		import("Weixin.ORG.Util.ThinkWechat");
		$weixin = new \ThinkWechat(2);
		// $openid = 'o0ehLt1pOAIEFZtPD4ghluvjamf0';
		$restr = $weixin -> add_user($id, $name, $mobile);
		return $restr;
	}

	function _update() {
		$name = CONTROLLER_NAME;
		$model = D($name);
		if (false === $model -> create()) {
			$this -> error($model -> getError());
		}
		// 更新数据
		$model -> __set('letter', get_letter($model -> __get('name')));
		$emp_no = $model -> emp_no;
		$name = $model -> name;
		$mobile_tel = $model -> mobile_tel;
		$list = $model -> save();
		if (false !== $list) {
			//成功提示
			if (!empty($mobile_tel)) {
				$agent_id = get_system_config('WEIXIN_AGENT_ID');
				$weixin = new \ThinkWechat($agent_id);
				$weixin -> add_user($emp_no,$name,$mobile_tel);
			}
			$this -> assign('jumpUrl', get_return_url());
			$this -> success('编辑成功!');
		} else {
			//错误提示
			$this -> error('编辑失败!');
		}
	}

	protected function add_default_role($user_id) {
		//新增用户自动加入相应权限组
		$RoleUser = M("RoleUser");
		$RoleUser -> user_id = $user_id;
		// 默认加入网站编辑组
		$RoleUser -> role_id = 3;
		$RoleUser -> add();
	}

	//重置密码
	public function reset_pwd() {
		$id = $_POST['user_id'];
		$password = $_POST['password'];
		if ('' == trim($password)) {
			$this -> error('密码不能为空!');
		}
		$User = M('User');
		$User -> password = md5($password);
		$User -> id = $id;
		$result = $User -> save();
		if (false !== $result) {
			$this -> assign('jumpUrl', get_return_url());
			$this -> success("密码修改成功");
		} else {
			$this -> error('重置密码失败！');
		}
	}

	public function password() {
		$this -> assign("id", I('id'));
		$this -> display();
	}

	function json() {
		header("Content-Type:text/html; charset=utf-8");
		$key = $_REQUEST['key'];

		$model = M("User");
		$where['name'] = array('like', "%" . $key . "%");
		$where['emp_no'] = array('like', "%" . $key . "%");
		$where['_logic'] = 'or';
		$map['_complex'] = $where;
		$list = $model -> where($map) -> field('id,name') -> select();
		exit(json_encode($list));
	}

	function del() {
		$id = $_POST['user_id'];
		$this -> _destory($id);
	}

	public function import() {
		$opmode = $_POST["opmode"];
		if ($opmode == "import") {
			$File = D('File');
			$file_driver = C('DOWNLOAD_UPLOAD_DRIVER');
			$info = $File -> upload($_FILES, C('DOWNLOAD_UPLOAD'), C('DOWNLOAD_UPLOAD_DRIVER'), C("UPLOAD_{$file_driver}_CONFIG"));
			if (!$info) {
				$this -> error();
			} else {
				//取得成功上传的文件信息
				//$uploadList = $upload -> getUploadFileInfo();
				Vendor('Excel.PHPExcel');
				//导入thinkphp第三方类库

				$import_file = $info['uploadfile']["path"];
				$import_file = substr($import_file, 1);

				//$import_file=realpath($import_file);

				$objPHPExcel = \PHPExcel_IOFactory::load($import_file);
				//$objPHPExcel = \PHPExcel_IOFactory::load('Uploads/Download/Org/2014-12/547e87ac4b0bf.xls');
				$dept = M("Dept") -> getField('name,id');
				$position = M("Position") -> getField('name,id');
				$role = M("Role") -> getField('name,id');
				$sheetData = $objPHPExcel -> getActiveSheet() -> toArray(null, true, true, true);
				$model = D("User");
				for ($i = 2; $i <= count($sheetData); $i++) {
					$data = array();

					$data_user['emp_no'] = $sheetData[$i]["A"];
					$data_user['userid'] = $sheetData[$i]["A"];
					$data_user['name'] = $sheetData[$i]["B"];

					$data_user['dept_id'] = $dept[$sheetData[$i]["C"]];
					$data_user['position_id'] = $position[$sheetData[$i]["D"]];

					$data_user['duty'] = $sheetData[$i]["J"];
					$data_user['office_tel'] = $sheetData[$i]["F"];
					$data_user['mobile_tel'] = $sheetData[$i]["G"];
					$data_user['sex'] = $sheetData[$i]["H"];
					$data_user['birthday'] = $sheetData[$i]["I"];

					$role_list = explode($sheetData[$i]["E"]);
					foreach ($role_list as $key => $val) {
						$data_role[] = $role[$val];
					}
					$user_id = M("User") -> add($data_user);

					$this -> add_role($user_id, $data_role);
				}
				//dump($sheetData);
				$this -> assign('jumpUrl', get_return_url());
				$this -> success('导入成功！');
			}
		} else {
			$this -> display();
		}
	}

	function add_role($user_id, $role_list) {
		$role_list = explode(",", $role_list);
		$role_list = array_filter($role_list);
		$RoleUser = M("RoleUser");
		$RoleUser -> user_id = $user_id;
		foreach ($role_list as $role_id) {
			$RoleUser -> role_id = $role_id;
			$RoleUser -> add();
		}
	}

}
?>