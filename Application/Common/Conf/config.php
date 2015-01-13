<?php
return array(
	//'配置项'=>'配置值'	
	'MULTI_MODULE' => false, // 单模块访问
	'DEFAULT_MODULE' => 'Home', // 默认访问模块

    /* 数据库配置 */
    'DB_TYPE'   => 'mysql', // 数据库类型
    'DB_HOST'   => '127.0.0.1', // 服务器地址
    'DB_NAME'   => 'xiaowei', // 数据库名
    'DB_USER'   => 'root', // 用户名
    'DB_PWD'    => 'test',  // 密码
    'DB_PORT'   => '3306', // 端口
    'DB_PREFIX' => 'think_', // 数据库表前缀
    
    'DEFAULT_FILTER' => '',
     
    /* 模板相关配置 */
    'TMPL_PARSE_STRING' => array(
        '__STATIC__' => __ROOT__ . '/Public/Static',
        '__ADDONS__' => __ROOT__ . '/Public/' . MODULE_NAME . '/Addons',
        '__IMG__'    => __ROOT__ . '/Public/' . MODULE_NAME . '/images',
        '__CSS__'    => __ROOT__ . '/Public/' . MODULE_NAME . '/css',
        '__JS__'     => __ROOT__ . '/Public/' . MODULE_NAME . '/js',
    ),    
    
    /* URL配置 */
    'URL_CASE_INSENSITIVE' => false, //默认false 表示URL区分大小写 true则表示不区分大小写
    'URL_MODEL'            => 0, //URL模式
    'VAR_URL_PARAMS'       => '', // PATHINFO URL参数变量
    'URL_PATHINFO_DEPR'    => '/', //PATHINFO URL分割符
    
    /* 认证相关 */
    'USER_AUTH_KEY'	=>'auth_id',
	'USER_AUTH_GATEWAY'=>'public/login',
	
	'TMPL_NO_HAVE_AUTH'=>APP_PATH.'/Tpl/Public/no_have_auth.html',
    /* 系统数据加密设置 */
    'DATA_AUTH_KEY' => '1*NX+Jds|p!IFqltgD)"?4;ic<{,wuya239Ax^]-', //默认数据加密KEY        
);