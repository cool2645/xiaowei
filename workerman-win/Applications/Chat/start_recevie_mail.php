<?php
/**
 * This file is part of workerman.
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the MIT-LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @author walkor<walkor@workerman.net>
 * @copyright walkor<walkor@workerman.net>
 * @link http://www.workerman.net/
 * @license http://www.opensource.org/licenses/mit-license.php MIT License
 */
use \Workerman\Worker;
use \Workerman\WebServer;
use \GatewayWorker\Gateway;
use \GatewayWorker\BusinessWorker;
use \Workerman\Autoloader;

// 自动加载类
require_once __DIR__ . '/../../Workerman/Autoloader.php';

Autoloader::setRootPath(__DIR__);

function http_get($url) {
	$curl = curl_init();
	curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
	curl_setopt($curl, CURLOPT_TIMEOUT, 500);
	curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
	curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
	curl_setopt($curl, CURLOPT_URL, $url);

	$res = curl_exec($curl);
	if($res===false){
		echo curl_error($curl);
	}
	curl_close($curl);
	return $res;
}

$task = new Worker();
// 开启多少个进程运行定时任务，注意多进程并发问题
$task -> count = 1;
$task -> onWorkerStart = function($task) {

	$time_interval = 2.5;
	\Workerman\Lib\Timer::add($time_interval, function() {
		//include_once __DIR__ . '/../../index.php';
		$url="http://xiaowei.test.com//index.php?m=&c=public&a=recevie_mail";
		echo http_get($url);
		//echo 'yyy';
	});
};



// 运行worker
Worker::runAll();
