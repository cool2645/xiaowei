<?php if (!defined('THINK_PATH')) exit();?><div id="uploader">
	<a id="pickfiles" href="javascript:;" class="btn btn-sm btn-primary">添加附件</a>
		<ul id="file_list" new_upload="" >
			<?php if(!empty($file_list)): if(is_array($file_list)): $i = 0; $__LIST__ = $file_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$file): $mod = ($i % 2 );++$i;?><li class="tbody" id="<?php echo (think_encrypt($file["id"])); ?>" add_file="<?php echo (think_encrypt($file["id"])); ?>" size="<?php echo ($file["size"]); ?>" filename="<?php echo ($file["name"]); ?>">
						<div class="loading"></div>
						<div class="data">
							<span class="del text-center"><a class="link del">删除</a> </span>
							<span class="size" ><?php echo (reunit($file["size"])); ?></span>
							<span class="auto autocut" title="<?php echo ($file["name"]); ?>"> <a target="_blank" href="<?php echo U('down?attach_id='.think_encrypt($file['id']));?>"><?php echo ($file["name"]); ?></a>
								</span>
						</div>
					</li><?php endforeach; endif; else: echo "" ;endif; endif; ?>
		</ul>
</div>