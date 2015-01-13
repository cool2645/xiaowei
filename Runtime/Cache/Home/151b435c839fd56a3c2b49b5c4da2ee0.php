<?php if (!defined('THINK_PATH')) exit();?><div class="uploader" style="position:relative;">
	<?php if(!empty($file_list)): ?><ul class="file_list">
			<?php if(is_array($file_list)): $i = 0; $__LIST__ = $file_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$file): $mod = ($i % 2 );++$i;?><li class="tbody" id="<?php echo (think_encrypt($file["id"])); ?>" add_file="<?php echo ($file["think_encrypt"]); ?>" size="<?php echo ($file["size"]); ?>" filename="<?php echo ($file["name"]); ?>">
					<div class="loading"></div>
					<div class="data">
						<span class="del text-center"> <a class="link down" target="_blank" href="<?php echo U('down?attach_id='.think_encrypt($file['id']));?>">下载</a> </span>
						<span class="size" ><?php echo (reunit($file["size"])); ?></span>
						<span class="auto autocut" title="<?php echo ($file["name"]); ?>"><?php echo ($file["name"]); ?>
						</span>
					</div>
				</li><?php endforeach; endif; else: echo "" ;endif; ?>
		</ul><?php endif; ?>
</div>