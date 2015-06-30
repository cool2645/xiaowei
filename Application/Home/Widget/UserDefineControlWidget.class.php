<?php
namespace Home\Widget;
use Think\Controller;

class UserDefineControlWidget extends Controller {
	protected $config = array('app_type' => 'public');

	public function edit($data) {
				
		if (empty($data['val'])) {
			$data['val'] = null;
		}
		
		$data['data'] = $this -> conv_data($data['data']);
		$this -> assign($data);
		//dump($data);
		$type = $data['type'];		
		$this -> display("Widget:UserDefineControl/$type");
	}

	function conv_data($val) {
		$new = array();
		if(strpos($val,'SYSTEM_CONFIG:')!==false){
			$new=get_system_config(substr($val,14));
			return $new;	
		}
		
		if (strpos($val, "|") !== false) {
			$arr_tmp = explode(",", $val);
			foreach ($arr_tmp as $item) {
				$tmp = explode("|", $item);
				$new[$tmp[0]] = $tmp[1];
			}
			return $new;
		} 
		
		$new = $val;
		
		return $new;
	}

}
?>