<?php
/*---------------------------------------------------------------------------
 小微OA系统 - 让工作更轻松快乐

 Copyright (c) 2013 http://www.smeoa.com All rights reserved.

 Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )

 Author:  jinzhu.yin<smeoa@qq.com>

 Support: https://git.oschina.net/smeoa/smeoa
 -------------------------------------------------------------------------*/

namespace Weixin\Controller;

class OauthController extends WeixinController {

	protected $config = array('app_type' => 'public');
	protected $agent_id=2;

	public function login($code) {
		$openid = $this->weixin -> get_user_id($code);

		$model = M("User");
		$where['openid'] = array('eq', $openid);
		$where['westatus'] = array('eq', 1);
		$where['is_del'] = array('eq', 0);
		$auth_info = $model -> where($where) -> find();
		// 查到userid
		if ($auth_info) {
			session(C('USER_AUTH_KEY'), $auth_info['id']);
			session('emp_no', $auth_info['emp_no']);
			session('email', $auth_info['email']);
			session('user_name', $auth_info['name']);
			session('user_pic', $auth_info['pic']);
			session('dept_id', $auth_info['dept_id']);
			if ($auth_info['emp_no'] == 'admin') {
				session(C('ADMIN_AUTH_KEY'), true);
			}
			redirect(U('Home/index/index', array('openid' => $openid)));
		} else {
			redirect(U('Weixin/oauth/bind', array('openid' => $openid)));
		}
	}

	/**
	 * 跳出页面-绑定帐号
	 */
	public function bind() {
		if (IS_POST) {
			if (empty($_POST['emp_no'])) {
				$this -> error('帐号必须！');
			} elseif (empty($_POST['password'])) {
				$this -> error('密码必须！');
			}
			//生成认证条件
			$map = array();
			// 支持使用绑定帐号登录
			$map['emp_no'] = $_POST['emp_no'];
			$map["is_del"] = array('eq', 0);
			$model = D("User");
			$auth_info = $model -> where($map) -> find();

			//使用用户名、密码和状态的方式进行认证
			if (false === $auth_info) {
				$this -> error('帐号或密码错误！');
			} else {
				if ($auth_info['password'] != md5($_POST['password'])) {
					$this -> error('帐号或密码错误！');
				}
				session(C('USER_AUTH_KEY'), $auth_info['id']);
				session('emp_no', $auth_info['emp_no']);
				session('email', $auth_info['email']);
				session('user_name', $auth_info['name']);
				session('user_pic', $auth_info['pic']);
				session('dept_id', $auth_info['dept_id']);

				if ($auth_info['emp_no'] == 'admin') {
					session(C('ADMIN_AUTH_KEY'), true);
				}

				//保存登录信息
				$User = M('User');
				$ip = get_client_ip();
				$data = array();
				$data['id'] = $auth_info['id'];
				$data['last_login_time'] = time();
				$data['login_count'] = array('exp', 'login_count+1');
				$data['last_login_ip'] = $ip;
				$data['openid'] = I('post.openid');
				$data['westatus'] = 1;
				$result = $User -> save($data);
				if ($result) {
					$this -> send("恭喜您验证成功！您可以使用自定义菜单或直接回复信息查询想要了解的内容!", $openid, 'text');

					$tmp = explode('@', $username);
					$username = substr($tmp[0], 0, strlen($tmp[0]) - 4) . '****@' . $tmp[1];
					$msg = '';
					$msg .= '恭喜，绑定成功！你可以直接在微信回复“解除绑定”解除微信绑定。';
					$msg .= '当前绑定的账户为“' . $auth_info['emp_no'] . '”';
					$msg .= '如果您不希望收到微信提醒信息，可在帮助》信息推送设置中进行设置。';
					$this -> message($msg);
				} else {
					$this -> message('绑定失败');
				}
			}
		} else {
			echo $_REQUEST["code"];
			$this -> assign('openid', I('request.openid'));
			$this -> meta_title = "帐号绑定";
			$this -> display();
		}
	}

	/**
	 * 跳出页面-绑定帐号
	 */
	public function unbind() {
		if (IS_POST) {
			if (empty($_POST['emp_no'])) {
				$this -> error('帐号必须！');
			} elseif (empty($_POST['password'])) {
				$this -> error('密码必须！');
			}
			//生成认证条件
			$map = array();
			// 支持使用绑定帐号登录
			$map['emp_no'] = $_POST['emp_no'];
			$map["is_del"] = array('eq', 0);
			$model = D("User");
			$auth_info = $model -> where($map) -> find();

			//使用用户名、密码和状态的方式进行认证
			if (false === $auth_info) {
				$this -> error('帐号或密码错误！');
			} else {
				if ($auth_info['password'] != md5($_POST['password'])) {
					$this -> error('帐号或密码错误！');
				}
				session(C('USER_AUTH_KEY'), $auth_info['id']);
				session('emp_no', $auth_info['emp_no']);
				session('email', $auth_info['email']);
				session('user_name', $auth_info['name']);
				session('user_pic', $auth_info['pic']);
				session('dept_id', $auth_info['dept_id']);

				if ($auth_info['emp_no'] == 'admin') {
					session(C('ADMIN_AUTH_KEY'), true);
				}

				//保存登录信息
				$User = M('User');
				$ip = get_client_ip();
				$data = array();
				$data['id'] = $auth_info['id'];
				$data['last_login_time'] = time();
				$data['login_count'] = array('exp', 'login_count+1');
				$data['last_login_ip'] = $ip;
				$data['openid'] ='';
				$data['westatus'] = 0;
				$result = $User -> save($data);
				if ($result) {
					$this -> send("恭喜您验证成功！您可以使用自定义菜单或直接回复信息查询想要了解的内容!", $openid, 'text');

					$tmp = explode('@', $username);
					$username = substr($tmp[0], 0, strlen($tmp[0]) - 4) . '****@' . $tmp[1];
					$msg = '';
					$msg .= '成功解除绑定';
					$msg .= '当前解除绑定的账户为“' . $auth_info['emp_no'] . '”';
					$this -> message($msg);
				} else {
					$this -> message('绑定失败');
				}
			}
		} else {
			echo $_REQUEST["code"];
			$this -> assign('openid', I('request.openid'));
			$this -> meta_title = "帐号绑定";
			$this -> display();
		}
	}
}
