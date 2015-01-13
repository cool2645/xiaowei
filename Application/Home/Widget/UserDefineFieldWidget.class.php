<?php
namespace Home\Widget;
use Think\Controller;

class UserDefineFieldWidget extends Controller {
	protected $config = array('app_type' => 'public');

	public function edit($data) {
		//dump($data);
		$this -> assign('data', $data);
		$control_layout = $data['control_layout'];
		switch ($control_layout) {
			case '1' :
				$content = $this -> display('Widget:UserDefineField\1');
				break;
			case '2' :
				$content = $this -> display('Widget:UserDefineField\2');
				break;
			case '3' :
				$content = $this -> display('Widget:UserDefineField\3');
				break;
			case '4' :
				$content = $this -> display('Widget:UserDefineField\4');
				break;
			default :
				$content = $this -> display('Widget:UserDefineField\1');
				break;
		}
	}

	public function show($data) {
		//dump($data);
		$data['readonly'] = true;
		$this -> assign('data', $data);

		$control_layout = $data['control_layout'];
		switch ($control_layout) {
			case '1' :
				$content = $this -> display('Widget:UserDefineField\1');
				break;
			case '2' :
				$content = $this -> display('Widget:UserDefineField\2');
				break;
			case '3' :
				$content = $this -> display('Widget:UserDefineField\3');
				break;
			case '4' :
				$content = $this -> display('Widget:UserDefineField\4');
				break;
			default :
				$content = $this -> display('Widget:UserDefineField\1');
				break;
		}
	}

}
?>