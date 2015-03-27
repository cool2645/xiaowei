<?php
/*---------------------------------------------------------------------------
  小微OA系统 - 让工作更轻松快乐 

  Copyright (c) 2013 http://www.smeoa.com All rights reserved.                                             

  Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )  

  Author:  jinzhu.yin<smeoa@qq.com>                         

  Support: https://git.oschina.net/smeoa/smeoa               
 -------------------------------------------------------------------------*/

namespace Home\Model;
use Think\Model\ViewModel;

class  FormViewModel extends ViewModel {
	public $viewFields=array(
		'Form'=>array('*'),
		'SystemFolder'=>array('name'=>'folder_name','_on'=>'Form.folder=SystemFolder.id')
		);
}
?>