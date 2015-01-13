<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE  html>
<html lang="zh-cn">
	<head>
		<meta charset="utf-8" />
		
			<title><?php echo ((isset($title) && ($title !== ""))?($title):get_system_config("SYSTEM_NAME")); ?></title>
		

		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<!-- basic styles -->
		<link rel="stylesheet" href="/Public/Static/bootstrap/css/bootstrap.min.css"  />
		<link rel="stylesheet" href="/Public/Static/awesome/css/font-awesome.min.css" />

		<!--[if IE 7]>
		<link rel="stylesheet" href="/Public/Static/awesome/css/font-awesome-ie7.min.css" />
		<![endif]-->

		<!-- page specific plugin styles -->
		<link rel="stylesheet" href="/Public/Static/jquery/ui/css/jquery-ui-1.10.3.full.min.css" />
		<link rel="stylesheet" href="/Public/Static/css/idangerous.swiper.css" />
		<link rel="stylesheet" href="/Public/Static/jquery/plugin/css/jquery.gritter.css" />
		
			
		


		<!-- fonts -->
		<!-- ace styles -->

		<link rel="stylesheet" href="/Public/Static/ace/css/uncompressed/ace.css" />
		<link rel="stylesheet" href="/Public/Static/ace/css/uncompressed/ace-rtl.css" />
		<link rel="stylesheet" href="/Public/Static/ace/css/uncompressed/ace-skins.css" />

		<!--[if lte IE 8]>
		<link rel="stylesheet" href="/Public/Static/ace/css/uncompressed/ace-ie.css" />
		<![endif]-->

		<!-- inline styles related to this page -->
		<link rel="stylesheet" href="/Public/Static/css/style.css" />
		<!-- ace settings handler -->

		<script src="/Public/Static/ace/js/ace-extra.min.js"></script>

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

		<!--[if lt IE 9]>
		<script src="/Public/Static/js/html5shiv.js"></script>
		<script src="/Public/Static/js/respond.min.js"></script>
		<![endif]-->

	</head>
	
		<script type="text/javascript">
	var upload_url = "<?php echo U('upload');?>";
	var del_url = "<?php echo U('del_file');?>";
	var app_path = "";
	var cookie_prefix="<?php echo C('COOKIE_PREFIX');?>";
	var _hmt = _hmt || [];
	(function() {
		var hm = document.createElement("script");
		hm.src = "//hm.baidu.com/hm.js?2a935166b0c9b73fef3c8bae58b95fe4";
		var s = document.getElementsByTagName("script")[0];
		s.parentNode.insertBefore(hm, s);
	})();
</script>
	

	<body class="<?php echo (CONTROLLER_NAME); ?>">
		<div class="swiper-container">
			<div class="swiper-scrollbar"></div>
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<div class="container popup">
						
	<?php echo W('PageHeader/simple',array('name'=>$vo['name'],'search'=>'N'));?>
	<div class="operate panel panel-default">
		<div class="panel-body">
			<div class="pull-left">
				<a onclick="prev();" class="btn btn-sm btn-primary">上一个</a>
				<a onclick="next();" class="btn btn-sm btn-primary">下一个</a>
			</div>
			<div class="pull-right">
				<a onclick="del();" class="btn btn-sm btn-danger">删除</a>
				<a onclick="edit();" class="btn btn-sm btn-primary">编辑</a>
				<a onclick="myclose();" class="btn btn-sm btn-primary">关闭</a>
			</div>
		</div>
	</div>
	<form class="form-horizontal well" method='post' id="form_data" name="form_data" enctype="multipart/form-data">
		<input type="hidden" id="ajax" name="ajax" value="0">
		<input type="hidden" id="add_file" name="add_file">
		<div class="form-group col-xs-6">
			<label class="col-xs-4 control-label" >开始:</label>
			<div class="col-xs-8">
				<p class="form-control-static">
					<?php echo ($vo["start_date"]); ?>&nbsp;<?php echo (fix_time($vo["start_time"])); ?>
				</p>
			</div>
		</div>
		<div class="form-group col-xs-6">
			<label class="col-xs-4 control-label" for="name">结束:</label>
			<div class="col-xs-8">
				<p class="form-control-static">
					<?php echo ($vo["end_date"]); ?>&nbsp;<?php echo (fix_time($vo["end_time"])); ?>
				</p>
			</div>
		</div>
		<div class="form-group col-xs-6">
			<label class="col-xs-4 control-label" for="name">地点:</label>
			<div class="col-xs-8">
				<p class="form-control-static">
					<?php echo ($vo["location"]); ?>
				</p>
			</div>
		</div>
		<div class="form-group col-xs-6">
			<label class="col-xs-4 control-label" for="name">优先级:</label>
			<div class="col-xs-8">
				<div class="form-control-static" >
					<input type="hidden" id="priority" name="priority"/>
					<div  class="slider_box" >
						<div class="left" >
							低
						</div>
						<div id="slider-range-priority"></div>
						<div class="right" >
							高
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label class="col-xs-2 control-label" for="name">参与人员:</label>
			<div class="col-xs-10">
				<p class="form-control-static">
					<?php echo (show_contact($vo["actor"])); ?>
				</p>
			</div>
		</div>
		<div class="form-group">
			<label class="col-xs-2 control-label" for="name">附件:</label>
			<div class="col-xs-10">
				<?php echo W('File',array('add_file'=>$vo['add_file'],'mode'=>'show'));?>
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="form-group">
			<div class="col-xs-12">
				<div class="content_wrap" >
					<iframe class="content_iframe"></iframe>
					<textarea  class="content" name="content" style="display:none;"><?php echo ($vo["content"]); ?></textarea>
				</div>
			</div>

		</div>
	</form>


					</div>
				</div>
			</div>
		</div>

		<!-- basic scripts -->

		<!--[if !IE]>
		-->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='/Public/Static/jquery/js/jquery-2.1.0.min.js'>" + "<" + "/script>");
		</script>
		<!-- <![endif]-->

		<!--[if IE]>
		<script type="text/javascript">
		window.jQuery || document.write("<script src='/Public/Static/jquery/js/jquery-1.11.0.min.js'>"+"<"+"/script>");</script>
		<![endif]-->

		<script type="text/javascript">
			if ("ontouchend" in document)
				document.write("<script src='/Public/Static/jquery/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
		</script>

		<script src="/Public/Static/js/idangerous.swiper-2.1.min.js"></script>
		<script src="/Public/Static/bootstrap/js/bootstrap.min.js"></script>
		<script src="/Public/Static/js/typeahead-bs2.min.js"></script>

		
			
<?php if(!empty($plugin["jquery-ui"])): ?><script src="/Public/Static/jquery/ui/js/jquery-ui-1.10.3.custom.min.js"></script>
	<script src="/Public/Static/jquery/ui/js/jquery.ui.touch-punch.min.js"></script><?php endif; ?>

<?php if(!empty($plugin["date"])): ?><script src="/Public/Static/js/date-time/bootstrap-datepicker.js"></script>
	<script src="/Public/Static/js/date-time/locales/bootstrap-datepicker.zh-CN.js"></script><?php endif; ?>

<?php if(!empty($plugin["uploader"])): ?><script type="text/javascript" src="/Public/Static/plupload/plupload.full.min.js"></script>
	<script type="text/javascript" src="/Public/Static/plupload/plupload.setting.js"></script><?php endif; ?>

<?php if(!empty($plugin["editor"])): ?><script type="text/javascript" src="/Public/Static/editor/kindeditor.js"></script>
	<script type="text/javascript" src="/Public/Static/editor/lang/zh_CN.js"></script>
	<script type="text/javascript" src="/Public/Static/editor/kindeditor.setting.js"></script><?php endif; ?>
<script src="/Public/Static/js/jquery.gritter.min.js"></script>
<script src="/Public/Static/js/bootbox.min.js"></script>

<script type="text/javascript">
		$(document).ready(function() {
			<?php if(!empty($plugin["date"])): ?>$('.input-date').datepicker({
					format: "yyyy-mm-dd",
					language:"zh-CN",
					autoclose : true
				});
				$(".input-daterange").datepicker({
					 format: "yyyy-mm-dd",
					 language:"zh-CN",
					 keyboardNavigation: false,
					 forceParse: false,
					 autoclose: true,
				});<?php endif; ?>

			<?php if(!empty($plugin["editor"])): ?>editor_init();<?php endif; ?>
	});
</script>
		


		<!-- ace scripts -->
		<script src="/Public/Static/ace/js/uncompressed/ace-elements.js"></script>
		<script src="/Public/Static/ace/js/uncompressed/ace.js"></script>
		<script src="/Public/Home/js/common.js"></script>

		<!-- inline scripts related to this page -->
		
	<script type="text/javascript">
		function edit() {
			parent.window.location.href = '<?php echo U("edit","id=".$vo["id"]);?>';
			myclose();
		}

		function del() {
			parent.window.location.href = '<?php echo U("del","id=".$vo["id"]);?>';
			myclose();
		}

		function next() {
			<?php if(empty($next)): ?>alert('没有下一个');
			<?php else: ?>
			window.location.href = "<?php echo U('read','id='.$next.'&list='.$list);?>";<?php endif; ?>
		}

		function prev() {
			<?php if(empty($prev)): ?>alert('没有上一个');
			<?php else: ?>
			window.location.href = "<?php echo U('read','id='.$prev.'&list='.$list);?>";<?php endif; ?>
		}

		$(function() {
			$("#slider-range-priority").slider({
				range : "min",
				min : 1,
				max : 5,
				value : "<?php echo ($vo["priority"]); ?>",
				slide : function(event, ui) {
					$("#priority").val(ui.value);
					$("div.slider_box div.ui-slider").css("background-color", schedule_bg(ui.value));
					$("div.slider_box div.ui-widget-header").css("background-color", schedule_bg(ui.value));
				}
			});
			$("div.slider_box div.ui-slider").css("background-color", schedule_bg("<?php echo ($vo["priority"]); ?>"));
			$("div.slider_box div.ui-widget-header").css("background-color", schedule_bg("<?php echo ($vo["priority"]); ?>"));
		});

		$(document).ready(function() {
			fill_time("start_time");
			fill_time("end_time");
			show_content();
		});
	</script>



	</body>
</html>