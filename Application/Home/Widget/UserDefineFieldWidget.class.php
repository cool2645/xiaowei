<?php
namespace Home\Widget;
use Think\Controller;

class UserDefineFieldWidget extends Controller {
	protected $config = array('app_type' => 'public');

	public function edit($data) {
		$data['readonly'] = false;
		$this -> assign('data', $data);
		$layout = $data['layout'];
		switch ($layout) {
			case '1' :
				$content = $this -> display('Widget:UserDefineField/1');
				break;
			case '2' :
				$content = $this -> display('Widget:UserDefineField/2');
				break;
			case '3' :
				$content = $this -> display('Widget:UserDefineField/3');
				break;
			case '4' :
				$content = $this -> display('Widget:UserDefineField/4');
				break;
			default :
				$content = $this -> display('Widget:UserDefineField/1');
				break;
		}
	}

	public function edit2($udf_data) {				
		$field_data = json_decode($udf_data, true);
		$field_id = array_keys($field_data);
		
		
		if (!empty($field_id)) {
			$where_field['id'] = array('in', $field_id);
			$list_field = M("UdfField") -> where($where_field) -> select();
			foreach ($list_field as $key => $val) {
				$val['readonly'] = false;
				$val['val'] = $field_data[$val['id']];				
				$this -> assign('data', $val);
				$layout = $val['layout'];
				switch ($layout) {
					case '1' :
						$content = $this -> display('Widget:UserDefineField/1');
						break;
					case '2' :
						$content = $this -> display('Widget:UserDefineField/2');
						break;
					case '3' :
						$content = $this -> display('Widget:UserDefineField/3');
						break;
					case '4' :
						$content = $this -> display('Widget:UserDefineField/4');
						break;
					default :
						$content = $this -> display('Widget:UserDefineField/1');
						break;
				}
			}
		}
	}

	public function view($data) {
		//dump($data);
		$data['readonly'] = true;
		$this -> assign('data', $data);

		$layout = $data['layout'];
		switch ($layout) {
			case '1' :
				$content = $this -> display('Widget:UserDefineField/1');
				break;
			case '2' :
				$content = $this -> display('Widget:UserDefineField/2');
				break;
			case '3' :
				$content = $this -> display('Widget:UserDefineField/3');
				break;
			case '4' :
				$content = $this -> display('Widget:UserDefineField/4');
				break;
			default :
				$content = $this -> display('Widget:UserDefineField/1');
				break;
		}
	}

}
?>