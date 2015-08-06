<?php

namespace Home\Controller;
use Think\Controller;

class PublicController extends Controller {
	protected $config = array('app_type' => 'public');
	/**
	 * 后台用户登录
	 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
	 */
	public function login() {

		$this -> assign("is_verify_code", get_system_config("IS_VERIFY_CODE"));
		$auth_id = session(C('USER_AUTH_KEY'));
		if (!isset($auth_id)) {
			$this -> display();
		} else {
			header('Location: ' . __APP__);
		}
	}

	// 检测输入的验证码是否正确，$code为用户输入的验证码字符串
	function check_verify($code, $id = '') {
		$verify = new \Think\Verify();
		return $verify -> check($code, $id);
	}

	// 登录检测
	public function check_login() {
		$is_verify_code = get_system_config("IS_VERIFY_CODE");
		if (!empty($is_verify_code)) {
			$check = $this -> check_verify($_POST['verify'], 1);
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
			session(null);
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
		$count = M("User") -> where($map) -> count();

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
		$config = array('fontSize' => 15, // 验证码字体大小
		'length' => 4, // 验证码位数
		'useNoise' => false, // 关闭验证码杂点
		);
		$verify = new \Think\Verify($config);
		$verify -> entry(1);
	}

	public function recevie_mail() {
		$client_ip = $_SERVER["REMOTE_ADDR"];
		$server_ip = gethostbyname(null);
		if ($client_ip != $server_ip) {
			set_time_limit(0);
			$where['is_del'] = array('eq', 0);
			$mail_account_list = D("MailAccountView") -> where($where) -> select();
			foreach ($mail_account_list as $account) {
				$this -> receve($account['id']);
				sleep(1);
			}
			sleep(1);
		}
		die ;
	}

	//--------------------------------------------------------------------
	//   接收邮件
	//--------------------------------------------------------------------
	private function receve($user_id) {
		$mail_account = $this -> _get_mail_account($user_id);

		$new = 0;
		import("@.ORG.Util.receve");
		$mail_list = array();
		$mail = new \receiveMail();
		$connect = $mail -> connect($mail_account['pop3svr'], '110', $mail_account['mail_id'], $mail_account['mail_pwd'], 'INBOX', 'pop3/novalidate-cert');
		if (!$connect) {
			$connect = $mail -> connect($mail_account['pop3svr'], '995', $mail_account['mail_id'], $mail_account['mail_pwd'], 'INBOX', 'pop3/ssl/novalidate-cert');
		}
		$mail_count = $mail -> mail_total_count();
		if ($connect) {
			for ($i = 1; $i <= $mail_count; $i++) {
				$mail_id = $mail_count - $i + 1;
				$item = $mail -> mail_list($mail_id);
				$where = array();
				$where['user_id'] = $user_id;
				if (empty($item[$mail_id])) {
					$temp_mail_header = $mail -> mail_header($mail_id);
					$where['mid'] = $temp_mail_header['mid'];
				} else {
					$where['mid'] = $item[$mail_id];
				}
				$count = M('Mail') -> where($where) -> count();

				if ($count == 0) {
					$model = M("Mail");
					$model -> create($mail -> mail_header($mail_id));
					if ($model -> create_time < strtotime(date('y-m-d H:i:s')) - 86400 * 30) {
						$mail -> close_mail();
						if ($new > 0) {
							$push_data['type'] = '邮件';
							$push_data['action'] = '';
							$push_data['title'] = '收到' . $new . '封邮件';
							$push_data['content'] = '';
							$push_data['url'] = U("Mail/folder?fid=inbox");

							send_push($push_data, $user_id);
						}
						return;
					}

					$new++;
					$model -> user_id = $user_id;
					$model -> read = 0;
					$model -> folder = 1;
					$model -> is_del = 0;
					$str = $mail -> get_attach($mail_id);

					$model -> add_file = $this -> _receive_file($str, $model);
					$this -> _organize($model,$user_id);
					$model -> add();

				} else {
					$mail -> close_mail();
				}
			}
			if ($new > 0) {
				$push_data['type'] = '邮件';
				$push_data['action'] = '';
				$push_data['title'] = '收到' . $new . '封邮件';
				$push_data['content'] = '';
				$push_data['url'] = U("Mail/folder?fid=inbox");

				send_push($push_data, $user_id);
			}
		}
		$mail -> close_mail();
	}

	//--------------------------------------------------------------------
	//   接收邮件附件
	//--------------------------------------------------------------------
	private function _receive_file($str, &$model) {

		$ar = array_filter(explode("?", $str));
		dump($ar);
		$files = array();
		if (!empty($ar)) {
			foreach ($ar as $key => $value) {
				$ar2 = explode("|", $value);
				$cid = $ar2[0];
				$inline = $ar2[1];
				$file_name = $ar2[2];
				$tmp_name = $ar2[3];

				$files[$key]['name'] = $file_name;
				$files[$key]['tmp_name'] = $tmp_name;
				$files[$key]['size'] = filesize($tmp_name);
				$files[$key]['is_move'] = true;
				if (!empty($files)) {
					$File = D('File');
					$file_driver = C('DOWNLOAD_UPLOAD_DRIVER');
					$info = $File -> upload($files, C('DOWNLOAD_UPLOAD'), C('DOWNLOAD_UPLOAD_DRIVER'), C("UPLOAD_{$file_driver}_CONFIG"));
					if ($inline == "INLINE") {
						$model -> content = str_replace("cid:" . $cid, $info[0]['path'], $model -> content);
					} else {
						$add_file = $add_file . think_encrypt($info[0]['id']) . ';';
					}
				}
			}
		}
		return $add_file;
	}

	private function _organize(&$model,$user_id) {
		$where['user_id'] = array('eq',$user_id);
		$where['is_del'] = array('eq',0);
		$list = M("MailOrganize") -> where($where) -> order('sort') -> select();

		foreach ($list as $val) {
			//包含

			if (($val['sender_check'] == 1) && ($val['sender_option'] == 1) && (strpos($model -> from, $val['sender_key']) !== false)) {
				$model -> folder = $val['to'];
				return;
			}
			//不包含
			if (($val['sender_check'] == 1) && ($val['sender_option'] == 0) && (strpos($model -> from, $val['sender_key']) == false)) {
				$model -> folder = $val['to'];
				return;
			}

			//包含
			if (($val['domain_check'] == 1) && ($val['domain_option'] == 1) && (strpos($model -> from, $val['domain_key']) !== false)) {
				$model -> folder = $val['to'];
				return;
			}

			//不包含
			if (($val['domain_check'] == 1) && ($val['domain_option'] == 0) && (strpos($model -> from, $val['domain_key']) == false)) {
				$model -> folder = $val['to'];
				return;
			}

			//包含
			if (($val['recever_check'] == 1) && ($val['recever_option'] == 1) && (strpos($model -> to, $val['recever_key']) !== false)) {
				$model -> folder = $val['to'];
				return;
			}
			//不包含
			if (($val['recever_check'] == 1) && ($val['recever_option'] == 0) && (strpos($model -> to, $val['recever_key']) == false)) {
				$model -> folder = $val['to'];
				return;
			}

			//包含
			if (($val['title_check'] == 1) && ($val['title_option'] == 1) && (strpos($model -> name, $val['title_key']) !== false)) {
				$model -> folder = $val['to'];
				return;
			}
			//不包含
			if (($val['title_check'] == 1) && ($val['title_option'] == 0) && (strpos($model -> name, $val['title_key']) == false)) {
				$model -> folder = $val['to'];
				return;
			}
		}
	}

	//--------------------------------------------------------------------
	//  读取邮箱用户数据
	//--------------------------------------------------------------------
	private function _get_mail_account($user_id = null) {
		if (empty($user_id)) {
			$user_id = get_user_id();
		}
		$model = M('MailAccount');
		$list = $model -> field('mail_name,email,pop3svr,smtpsvr,mail_id,mail_pwd') -> find($user_id);
		if (empty($list['mail_name']) || empty($list['email']) || empty($list['pop3svr']) || empty($list['smtpsvr']) || empty($list['mail_id']) || empty($list['mail_pwd'])) {
			$this -> assign('jumpUrl', U('MailAccount/index'));
			cookie('current_node', null);
			$this -> error("请设置邮箱帐号");
			die ;
		} else {
			return $list;
		}
	}

	function test() {
		echo 'yyyyy';
	}

}
