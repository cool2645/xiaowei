<?php
namespace Home\Widget;
use Think\Controller;
class FileUploadWidget extends Controller {
	protected $config = array('app_type' => 'public');

	public function add() {
		$this -> display('Widget:FileUpload\add');
	}

	public function edit($add_file) {

		if (!empty($add_file)) {
			$files = array_filter(explode(';', $add_file));
			$files = array_map(think_decrypt, $files);

			$where['id'] = array('in', $files);
			$model = M("File");
			$file_list = $model -> where($where) -> select();
		}
		$data['file_list'] = $file_list;
		$this -> display('Widget:FileUpload\edit');
	}

	public function show($add_file) {

		if (!empty($add_file)) {
			$files = array_filter(explode(';', $add_file));
			$files = array_map(think_decrypt, $files);

			$where['id'] = array('in', $files);
			$model = M("File");
			$file_list = $model -> where($where) -> select();
		}
		$this -> assign('file_list', $file_list);
		$this -> display('Widget:FileUpload\show');
	}

	public function link($add_file) {
		if (!empty($add_file)) {
			$files = array_filter(explode(';', $add_file));

			$files = array_map(think_decrypt, $files);

			$where['id'] = array('in', $files);
			$model = M("File");
			$file_list = $model -> where($where) -> select();
		}
		$this -> assign('file_list', $file_list);
		$this -> display('Widget:FileUpload\link');
	}

}
?>