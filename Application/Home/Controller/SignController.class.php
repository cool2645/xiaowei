<?php
/*--------------------------------------------------------------------
 小微OA系统 - 让工作更轻松快乐

 Copyright (c) 2013 http://www.smeoa.com All rights reserved.

 Author:  jinzhu.yin<smeoa@qq.com>

 Support: https://git.oschina.net/smeoa/xiaowei
--------------------------------------------------------------*/

namespace Home\Controller;

class SignController extends HomeController {
	protected $config = array('app_type' => 'personal');
	//过滤查询字段
	function _search_filter(&$map) {
		if (!empty($_POST["name"])) {
			$map['name'] = array('like', "%" . $_POST['name'] . "%");
		}
		$map['is_real_time'] = array('eq',0);
	}

	public function upload() {
		$this -> _upload();
	}

	function read($id) {
		$plugin['baidu_map'] = true;
		$this -> assign("plugin", $plugin);
		
		$model = M('Sign');
		$vo = $model  -> find($id);

		conv_baidu_map($vo['latitude'],$vo['longitude']);
	 
		$this -> assign('vo', $vo);
				
		$user_info=M("User")->find($vo['user_id']);		
		$this->assign('user_info',$user_info);

		$this -> display();
	}

	public function report(){
		
		$plugin['date'] = true;
		$this -> assign("plugin", $plugin);
		
		$this->assign('user_id',get_user_id());	

		$auth=$this -> config['auth'];
		$this->assign('auth',$auth);		
		if($auth['admin']){
			$node = D("Dept");
			$dept_id=get_dept_id();	
			$dept_name=get_dept_name();
			$menu = array();
			$dept_menu = $node -> field('id,pid,name') ->where("is_del=0")-> order('sort asc') -> select();
			$dept_tree = list_to_tree($dept_menu,$dept_id);			
			$count=count($dept_tree);
			if(empty($count)){
				/*获取部门列表*/				
				$html ='';
				$html = $html . "<option value='{$dept_id}'>{$dept_name}</option>";
				$this -> assign('dept_list',$html);			
				/*获取人员列表*/
				$where['dept_id']=array('eq',$dept_id);
				$emp_list=D("User")->where($where)->getField('id,name');
				$this->assign('emp_list',$emp_list);			
			}else{
				/*获取部门列表*/								
				$this -> assign('dept_list', select_tree_menu($dept_tree));
				$dept_list=tree_to_list($dept_tree);
				$dept_list=rotate($dept_list);
				$dept_list=$dept_list['id'];
				
				/*获取人员列表*/
				$where['dept_id']=array('in',$dept_list);
				$emp_list=D("User")->where($where)->getField('id,name');
				$this->assign('emp_list',$emp_list);				
			}
		}
				
		$map = $this -> _search();
		if($auth['admin']){
			if(empty($map['dept_id'])){
				if(!empty($dept_list)){
					$map['dept_id']=array('in',array_merge($dept_list,array($dept_id)));
				}else{
					$map['dept_id']=array('eq',$dept_id);
				}		
			}
		}else{
			$map['user_id']=get_user_id();
		}

		if (method_exists($this, '_search_filter')) {
			$this -> _search_filter($map);
		}
		$model=D("SignView");			
		if (!empty($model)) {
			$list=$this -> _list($model,$map);
		}
		$this -> display();
	}

	public function add() {
		$plugin['jquery-ui'] = true;
		$plugin['date'] = true;	
		$plugin['uploader'] = true;
		$plugin['editor'] = true;
		$this -> assign("plugin", $plugin);

		$this -> display();
	}

	public function day_view() {
		$this -> index();
	}
	
	function json() {
		header("Cache-Control: no-cache, must-revalidate");
		header("Content-Type:text/html; charset=utf-8");

		$start_date = $_REQUEST["start_date"];
		$end_date = $_REQUEST["end_date"];

		$where['user_id'] = get_user_id();
		$where['sign_date'] = array( array('egt',$start_date), array('elt',$end_date));
				
		$list = M("Sign") -> where($where) -> order('sign_date') -> select();
		exit(json_encode($list));
	}

}
?>