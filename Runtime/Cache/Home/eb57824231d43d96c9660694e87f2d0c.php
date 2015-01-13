<?php if (!defined('THINK_PATH')) exit();?><div class="page-header clearfix">
	<h1 class="col-sm-8"><?php echo ($name); ?></h1>
	<div class="col-sm-4 pull-right search_box">
		<form name="form_local_search" id="form_local_search" method="post">
			<div class="input-group">
				<input type="text" class="display-none">
				<input  class="form-control" type="text" name="keyword" id="keyword" onkeydown="key_local_search();"/>
				<div class="input-group-btn">
					<a class="btn btn-sm btn-info" onclick="btn_local_search();"><i class="fa fa-search" ></i></a>					
				</div>
			</div>
		</form>
	</div>
</div>