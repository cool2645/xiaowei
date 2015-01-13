<?php
    if (!defined('THINK_PATH')) exit();
    $array=array(    	
		
		'LOAD_EXT_CONFIG'	=>'auth,wechat',
		/* 模板相关配置 */
		'TMPL_PARSE_STRING' => array(
			'__STATIC__' => __ROOT__ . '/Public/Static',
			'__ADDONS__' => __ROOT__ . '/Public/' . MODULE_NAME . '/Addons',
			'__IMG__'    => __ROOT__ . '/Public/' . MODULE_NAME . '/images',
			'__CSS__'    => __ROOT__ . '/Public/' . MODULE_NAME . '/css',
			'__JS__'     => __ROOT__ . '/Public/' . MODULE_NAME . '/js',
		),
		
    /* 文件上传相关配置 */
    'DOWNLOAD_UPLOAD' => array(
        'mimes'    => '', //允许上传的文件MiMe类型
        'maxSize'  => 5*1024*1024, //上传的文件大小限制 (0-不做限制)
        'exts'     => 'jpg,gif,png,jpeg,zip,rar,tar,gz,7z,doc,docx,txt,xml', //允许上传的文件后缀
        'autoSub'  => true, //自动子目录保存文件
        'subName'  => 'test', //子目录创建方式，[0]-函数名，[1]-参数，多个参数使用数组
        'rootPath' => './Uploads/Download/', //保存根路径
        'savePath' => '', //保存路径
        'saveName' => array('uniqid', ''), //上传文件命名规则，[0]-函数名，[1]-参数，多个参数使用数组
        'saveExt'  => '', //文件保存后缀，空则使用原后缀
        'replace'  => false, //存在同名是否覆盖
        'hash'     => true, //是否生成hash编码
        'callback' => false, //检测文件是否存在回调函数，如果存在返回文件信息数组
    ), //下载模型上传配置（文件上传类配置）
    		
		'VAR_PAGE'	=>'p',
			
		'TMPL_CACHE_ON' => false,
		'TOKEN_ON'=>false, 
		'TMPL_STRIP_SPACE'=>false,
		'URL_HTML_SUFFIX' => '',
		'DB_FIELDS_CACHE'=>false,
        'SESSION_AUTO_START'=>true,
        'USER_AUTH_KEY'	=>'auth_id',	// 用户认证SESSION标记
        'ADMIN_AUTH_KEY'			=>'administrator',        
        'USER_AUTH_GATEWAY'=>'public/login',// 默认认证网关
        'DB_LIKE_FIELDS'            =>'content|remark',
		'SAVE_PATH'=>"Data/Files/",
        'SHOW_PAGE_TRACE'=>0, //显示调试信息
    );
    return $array;
?>