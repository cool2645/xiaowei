<?php

namespace Home\Controller;
use Think\Controller;

class PublicController extends Controller {
	protected $config = array('app_type' => 'public');
	/**
	 * 后台用户登录
	 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
	 */
	public function login(){
		$this->assign("is_verify_code",get_system_config("IS_VERIFY_CODE"));
		$auth_id = session(C('USER_AUTH_KEY'));
		if (!isset($auth_id)) {
			$this -> display();
		} else {
			header('Location: ' .__APP__);
		}
	}
	// 检测输入的验证码是否正确，$code为用户输入的验证码字符串
	function check_verify($code, $id = ''){
	    $verify = new \Think\Verify();
	    return $verify->check($code, $id);
	}

	// 登录检测
	public function check_login() {
		$is_verify_code = get_system_config("IS_VERIFY_CODE");
		if (!empty($is_verify_code)) {
			$check=$this->check_verify($_POST['verify'],1);
			if (!$check) {
				$this -> error('验证码错误！');
			}
		}

		if (empty($_POST['emp_no'])) {
			$this -> error('帐号必须！');
		} elseif (empty($_POST['password'])) {
			$this -> error('密码必须！');
		}
		if ($_POST['emp_no'] == 'admin') {
			$is_admin = true;
			session(C('ADMIN_AUTH_KEY'), true);
		}

		$map = array();
		// 支持使用绑定帐号登录
		$map['emp_no'] = $_POST['emp_no'];
		$map["is_del"] = array('eq', 0);
		$map['password'] = array('eq', md5($_POST['password']));
		$model = M("User");
		$auth_info = $model -> where($map) -> find();

		//使用用户名、密码和状态的方式进行认证
		if (false == $auth_info) {
			$this -> error('帐号或密码错误！');
		} else {
			session(C('USER_AUTH_KEY'), $auth_info['id']);
			session('emp_no', $auth_info['emp_no']);
			session('user_name', $auth_info['name']);
			session('user_pic', $auth_info['pic']);
			session('dept_id', $auth_info['dept_id']);

			//保存登录信息
			$User = M('User');
			$ip = get_client_ip();
			$time = time();
			$data = array();
			$data['id'] = $auth_info['id'];
			$data['last_login_time'] = $time;
			$data['login_count'] = array('exp', 'login_count+1');
			$data['last_login_ip'] = $ip;
			$User -> save($data);
			$this -> assign('jumpUrl', U("index/index"));
			header('Location: ' . U("index/index"));
		}
	}

	/* 退出登录 */
	public function logout() {
		$auth_id = session(C('USER_AUTH_KEY'));
		if (isset($auth_id)) {
			session(C('USER_AUTH_KEY'), null);

			session('user_pic', null);
			$this -> assign("jumpUrl", __APP__);
			$this -> success('退出成功！');
		} else {
			$this -> assign("jumpUrl", __APP__);
			$this -> error('退出成功！');
		}
	}

	public function register() {
		$this -> display();
	}

	// 登录检测
	public function check_register() {
		$is_verify_code = get_system_config("IS_VERIFY_CODE");
		if (!empty($is_verify_code)) {
			if (session('verify') != md5($_POST['verify'])) {
				$this -> error('验证码错误！');
			}
		}

		if (empty($_POST['emp_no'])) {
			$this -> error('帐号必须！');
		} elseif (empty($_POST['password'])) {
			$this -> error('密码必须！');
		} elseif ($_POST['password'] !== $_POST['check_password']) {
			$this -> error('密码不一致');
		}

		$map = array();
		// 支持使用绑定帐号登录
		$map['emp_no'] = $_POST['emp_no'];
		$count =M("User")  -> where($map) -> count();

		if ($count) {
			$this -> error('该账户已注册');
		} else {
			$model = D("User");
			if (false === $model -> create()) {
				$this -> error($model -> getError());
			}
			$list = $model -> add();
			if ($list !== false) {//保存成功
				$this -> assign('jumpUrl', get_return_url());
				$this -> success('注册成功!');
			} else {
				$this -> error('注册失败!');
				//失败提示
			}

		}
	}

	public function verify() {
		$config =    array(
		    'fontSize'    =>    15,    // 验证码字体大小
		    'length'      =>    4,     // 验证码位数
		    'useNoise'    =>    false, // 关闭验证码杂点
		);
		$verify = new \Think\Verify($config);
		$verify -> entry(1);
	}

}
