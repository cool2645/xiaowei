<?php
/*---------------------------------------------------------------------------
 小微OA系统 - 让工作更轻松快乐

 Copyright (c) 2013 http://www.smeoa.com All rights reserved.

 Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )

 Author:  jinzhu.yin<smeoa@qq.com>

 Support: https://git.oschina.net/smeoa/smeoa
 -------------------------------------------------------------------------*/

// 用户模型
namespace Home\Model;
use Think\Model;

class  UdfFieldModel extends CommonModel {
	public function get_field_list($row_type,$controller=CONTROLLER_NAME){		
		$where['row_type']=array('eq',$row_type);
		$where['controller']=$controller;
		$where['is_del']=0;
		$list = $this -> where($where) -> order('sort asc') -> select();
		return $list;
	}

	public function get_data_list($row_id,$controller=CONTROLLER_NAME){		
		
		$where['row_id']=array('eq',$row_id);
		$where['field.controller']=$controller;	
		
		$model=M("UdfFieldData");
		$join = 'join ' . $this -> tablePrefix . 'udf_field field on field_id=field.id';
		$list = $model -> join($join) -> where($where) ->  order('sort asc') ->select();
		return $list;
	}

	function set_field($row_id,$controller=CONTROLLER_NAME){
		$where['row_id']=array('eq',$row_id);
		$where['controller']=$controller;	
		
		$model=M("UdfFieldData");
		$model->where($where)->delete();
		
		$udf_field = array_filter(array_keys($_REQUEST),"filter_udf_field");
		foreach ($udf_field as $field){
			$tmp=array_filter(explode("_",$field));			
			$val=$_REQUEST[$field];
			
			if(is_array($val)){
				$val=implode(",",$val);
			}
			$data['row_id']=$row_id;
			$data['field_id']=$tmp[2];	
			$data['val']=$val;
			$data['controller']=$controller;	
			$result=$model->add($data);
		}
		if ($result === false) {
			return false;
		} else {
			return true;
		}
	}
}
?>