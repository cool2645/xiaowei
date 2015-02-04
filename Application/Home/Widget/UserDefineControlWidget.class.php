<?php
namespace Home\Widget;
use Think\Controller;

class UserDefineControlWidget extends Controller {
	protected $config = array('app_type' => 'public');

	public function edit($data) {
				
		if (empty($data['va'])) {
			$data['val'] = null;
		}
		
		$data['control_data'] = $this -> conv_control_data($data['control_data']);
		$this -> assign($data);
		
		$control_type = $data['control_type'];		
		$this -> display("Widget:UserDefineControl/$control_type");
	}

	function conv_control_data($val) {
		$new = array();
		if (strpos($val, "|") !== false) {
			$arr_tmp = explode(",", $val);
			foreach ($arr_tmp as $item) {
				$tmp = explode("|", $item);
				$new[$tmp[0]] = $tmp[1];
			}
		} else {
			$new = $val;
		}
		return $new;
	}

}
?>