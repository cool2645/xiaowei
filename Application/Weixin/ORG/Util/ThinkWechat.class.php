<?php
/*********************
 *	微信企业号 SDK
 *	@author Baykier
 *********************/
/*导入并实例化SDK*/
include 'WXBizMsgCrypt.php';
class ThinkWechat {

	/**
	 * 微信推送过来的数据或响应数据
	 * @var array
	 */
	private $data = array();

	/**
	 * 主动发送的数据
	 * @var array
	 */
	private $send = array();

	/*
	 *	配置信息和微信接口信息
	 */
	private $veryfy_msg = '';
	private $timestamp = '';
	private $nonce = '';
	private $msg_echostr = '';

	private $token = '';
	private $encoding_aes_key = '';
	private $corp_id = '';
	private $corp_secret = "";
	
	private $agent_id;

	private $wxcpt;
	/**
	 * 构造函数
	 *实例化后自动获取变量
	 */
	public function __construct($agent_id) {
		$this->agent_id=$agent_id;
		//验证URL会出现此参数
		$this -> msg_echostr = $_REQUEST["echostr"];

		//获取接口参数
		$this -> veryfy_msg = $_REQUEST["msg_signature"];
		$this -> timestamp = $_REQUEST["timestamp"];
		$this -> nonce = $_REQUEST["nonce"];

		//读取配置数据
		$this -> token = C('WECHAT_TOKEN');
		$this -> encoding_aes_key = C('WECHAT_ENCORDINGAESKEY');
		$this -> corp_id = C('WECHAT_CORPID');
		$this -> corp_secret = C('WECHAT_CORPSECRECT');

		$this -> wxcpt = new WXBizMsgCrypt($this -> token, $this -> encoding_aes_key, $this -> corp_id);
	}

	/*获取推送数据*/
	public function request() {

		if (!isset($_GET['echostr'])) {

			//接收到的xml包
			$postStr = file_get_contents('php://input');
			//解密
			$sMsg = "";
			// 解析之后的明文

			$errCode = $this -> wxcpt -> DecryptMsg($this -> veryfy_msg, $this -> timestamp, $this -> nonce, $postStr, $sMsg);

			//转换成数组
			$xml = new SimpleXMLElement($sMsg);
			$xml || exit ;

			foreach ($xml as $key => $value) {
				$this -> data[$key] = strval($value);
			}

			return $this -> data;

		} else {

			$sEchoStr = "";
			$errCode = $this -> wxcpt -> VerifyURL($this -> veryfy_msg, $this -> timestamp, $this -> nonce, $this -> msg_echostr, $sEchoStr);
			if ($errCode == 0) {
				echo $sEchoStr;
			} else {
				print("ERR: " . $errCode . "\n\n");
			}
			exit ;
		}
	}

	/**
	 * * 被动响应微信发送的信息（自动回复）
	 * @param  string $to      接收用户名
	 * @param  string $from    发送者用户名
	 * @param  array  $content 回复信息，文本信息为string类型
	 * @param  string $type    消息类型
	 * @param  string $flag    是否新标刚接受到的信息
	 * @return string          XML字符串
	 */
	public function response($content, $type = 'text', $flag = 0) {
		/* 基础数据 */
		$this -> data = array('ToUserName' => $this -> data['FromUserName'], 'FromUserName' => $this -> data['ToUserName'], 'CreateTime' => NOW_TIME, 'MsgType' => $type, );

		/* 添加类型数据 */
		$this -> $type($content);

		/* 添加状态 */
		$this -> data['FuncFlag'] = $flag;

		/* 转换数据为XML */
		$xml = new SimpleXMLElement('<xml></xml>');
		$this -> data2xml($xml, $this -> data);
		//exit($xml->asXML());

		//加密数据
		$sEncryptMsg = '';
		$errCode = $this -> wxcpt -> EncryptMsg($xml -> asXML(), $this -> timestamp, $this -> nonce, $sEncryptMsg);

		print $sEncryptMsg;
		exit ;

		//加密并发送数据
	}

	/**
	 * * 主动发送消息
	 *
	 * @param string $content   内容
	 * @param string $openid   	发送者用户名
	 * @param string $type   	类型
	 * @return array 返回的信息
	 */

	public function send_msg($content, $openid = '', $type = 'text') {
		/* 基础数据 */
		$this -> send['touser'] = $openid;
		$this -> send['msgtype'] = $type;
		$this -> send['agentid'] = $this->agent_id;

		/* 添加类型数据 */
		$sendtype = 'send_' . $type;
		$this -> $sendtype($content);

		/* 发送 */
		$sendjson = jsencode($this -> send);
		$restr = $this -> send($sendjson);
		return $restr;
	}

	/**
	 * * 获取微信用户的基本资料 不完善
	 *
	 * @param string $openid   	发送者用户名
	 * @return array 用户资料
	 */

	public function get_user_info($code = '') {
		if ($code) {
			header("Content-type: text/html; charset=utf-8");
			$url = 'https://qyapi.weixin.qq.com/cgi-bin/user/getuserinfo';
			$params = array();
			$params['access_token'] = $this -> get_acess_token();
			$params['code'] = $code;
			$params['agentid '] = $this->agent_id;
			$httpstr = http($url, $params, "POST");
			$harr = json_decode($httpstr, true);
			return $harr;
		} else {
			return false;
		}
	}

	public function get_user_id($code = '') {
		if ($code) {
			header("Content-type: text/html; charset=utf-8");
			$url = 'https://qyapi.weixin.qq.com/cgi-bin/user/getuserinfo';
			$params = array();
			$params['access_token'] = $this -> get_acess_token();
			$params['code'] = $code;
			$params['agentid '] = $this->agent_id;
			$httpstr = http($url, $params, 'POST');
			$harr = json_decode($httpstr, true);
			return $harr['UserId'];
		} else {
			return false;
		}
	}

	/**
	 * 生成菜单
	 * @param  string $data 菜单的str
	 * @return string  返回的结果；
	 */
	public function set_menu($data = NULL) {
		$access_token = $this -> get_token();
		$url = "https://qyapi.weixin.qq.com/cgi-bin/menu/create?access_token={$access_token}&agentid=".$this->agent_id;
		$menustr = http($url, $data, 'POST', array("Content-type: text/html; charset=utf-8"), true);
		return $menustr;
	}

	/**
	 * 发送文本消息
	 *
	 * @param string $content
	 *        	要发送的信息
	 */
	private function send_text($content) {
		$this -> send['text'] = array('content' => $content);
	}

	/**
	 * 发送图片消息
	 *
	 * @param string $content
	 *        	要发送的信息
	 */
	private function send_image($content) {
		$this -> send['image'] = array('media_id' => $content);
	}

	/**
	 * 发送视频消息
	 * @param  string $content 要发送的信息
	 */
	private function send_video($video) {
		list($video['media_id'], $video['title'], $video['description']) = $video;

		$this -> send['video'] = $video;
	}

	/**
	 * 发送语音消息
	 *
	 * @param string $content
	 *        	要发送的信息
	 */
	private function send_voice($content) {
		$this -> send['voice'] = array('media_id' => $content);
	}

	/**
	 * 发送音乐消息
	 *
	 * @param string $content
	 *        	要发送的信息
	 */
	private function send_music($music) {
		list($music['title'], $music['description'], $music['musicurl'], $music['hqmusicurl'], $music['thumb_media_id']) = $music;

		$this -> send['music'] = $music;
	}

	/**
	 * 发送图文消息
	 * @param  string $news 要回复的图文内容
	 */
	private function send_news($news) {
		$articles = array();
		foreach ($news as $key => $value) {
			list($articles[$key]['title'], $articles[$key]['description'], $articles[$key]['url'], $articles[$key]['picurl']) = $value;
			if ($key >= 9) {
				break;
			} //最多只允许10调新闻
		}
		$this -> send['articles'] = $articles;
	}

	/**
	 * 回复文本信息
	 * @param  string $content 要回复的信息
	 */
	private function text($content) {
		$this -> data['Content'] = $content;
	}

	/**
	 * 回复音乐信息
	 * @param  string $content 要回复的音乐
	 */
	private function music($music) {
		list($music['Title'], $music['Description'], $music['MusicUrl'], $music['HQMusicUrl']) = $music;
		$this -> data['Music'] = $music;
	}

	/**
	 * 回复图文信息
	 * @param  string $news 要回复的图文内容
	 */
	private function news($news) {
		$articles = array();
		foreach ($news as $key => $value) {
			list($articles[$key]['Title'], $articles[$key]['Description'], $articles[$key]['PicUrl'], $articles[$key]['Url']) = $value;
			if ($key >= 9) {
				break;
			} //最多只允许10调新闻
		}
		$this -> data['ArticleCount'] = count($articles);
		$this -> data['Articles'] = $articles;
	}

	/**
	 * 主动发送的信息
	 * @param  string $data    json数据
	 * @return string          微信返回信息
	 */
	private function send($data = NULL) {
		$access_token = $this -> get_token();
		$url = "https://qyapi.weixin.qq.com/cgi-bin/message/send?access_token={$access_token}";
		$restr = http($url, $data, 'POST', array("Content-type: text/html; charset=utf-8"), true);
		return $restr;
	}

	/**
	 * 数据XML编码
	 * @param  object $xml  XML对象
	 * @param  mixed  $data 数据
	 * @param  string $item 数字索引时的节点名称
	 * @return string
	 */
	private function data2xml($xml, $data, $item = 'item') {
		foreach ($data as $key => $value) {
			/* 指定默认的数字key */
			is_numeric($key) && $key = $item;

			/* 添加子元素 */
			if (is_array($value) || is_object($value)) {
				$child = $xml -> addChild($key);
				$this -> data2xml($child, $value, $item);
			} else {
				if (is_numeric($value)) {
					$child = $xml -> addChild($key, $value);
				} else {
					$child = $xml -> addChild($key);
					$node = dom_import_simplexml($child);
					$node -> appendChild($node -> ownerDocument -> createCDATASection($value));
				}
			}
		}
	}

	/**
	 * 获取保存的accesstoken
	 */
	private function get_token() {
		$stoken = array();
		$stoken = S('S_TOKEN');
		// 从缓存获取ACCESS_TOKEN

		if (is_array($stoken) && !empty($stoken['token'])) {
			$nowtime = time();
			$difftime = $nowtime - $stoken['tokentime'];
			// 判断缓存里面的TOKEN保存了多久；
			if ($difftime > 7000) {// TOKEN有效时间7200 判断超过7000就重新获取;
				$access_token = $this -> get_acess_token();
				// 去微信获取最新ACCESS_TOKEN
				$stoken['tokentime'] = time();
				$stoken['token'] = $access_token;
				S('S_TOKEN', $stoken, 300);
				// 放进缓存
			} else {
				$access_token = $stoken['token'];
			}
		} else {
			$access_token = $this -> get_acess_token();
			// 去微信获取最新ACCESS_TOKEN
			$stoken['tokentime'] = time();
			$stoken['token'] = $access_token;
			S('S_TOKEN', $stoken);
			// 放进缓存
		}

		return $access_token;
	}

	/**
	 * 重新从微信获取accesstoken
	 */

	private function get_acess_token() {
		$url = 'https://qyapi.weixin.qq.com/cgi-bin/gettoken';
		$params = array();
		$params['corpid'] = $this -> corp_id;
		$params['corpsecret'] = $this -> corp_secret;
		$httpstr = http($url, $params);
		//print_r($params);
		//die;
		$harr = json_decode($httpstr, true);
		return $harr['access_token'];
	}
}
