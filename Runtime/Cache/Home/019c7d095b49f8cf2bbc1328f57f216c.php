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
						
	<div id="uploader">
		<input type="hidden" id="avatarUpload" value="" />
		<input type="hidden" id="img" name="img" />
		<input type="hidden" id="id" name="id" value="<?php echo ($id); ?>"/>
		<input type="hidden" id="x" name="x" />
		<input type="hidden" id="y" name="y" />
		<input type="hidden" id="w" name="w" />
		<input type="hidden" id="h" name="h" />
		<div class="ul_table display-none">
			<ul id="file_list">
				<li class="thead">
					<span class="del">删除</span>
					<span class="size">大小</span>
					<span class="auto autocut">文件名</span>
				</li>
				<?php if(!empty($file_list)): if(is_array($file_list)): $i = 0; $__LIST__ = $file_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$file): $mod = ($i % 2 );++$i;?><li class="tbody" id="<?php echo ($file["id"]); ?>" add_file="<?php echo ($file["id"]); ?>" size="<?php echo ($file["size"]); ?>" filename="<?php echo ($file["name"]); ?>">
							<div class="loading"></div>
							<div class="data">
								<span class="del text-center"> <a class="link del">删除</a> </span>
								<span class="size" ><?php echo (reunit($file["size"])); ?></span>
								<span class="auto autocut" title="<?php echo ($file["name"]); ?>"> <a target="_blank" href="<?php echo U('down','attach_id='.f_encode($file['id']));?>"><?php echo ($file["name"]); ?></a> </span>
							</div>
						</li><?php endforeach; endif; else: echo "" ;endif; endif; ?>
			</ul>
		</div>
		<div class="well clearfix">
			<div class="imgchoose col-xs-9">
				编辑头像：
				<br />
				<img src="" id="target" style="max-width:440px;height:auto;"/>
			</div>
			<div class="col-xs-3" >
				<div class="text-center">
					<a onclick="save()"  class="btn btn-sm btn-primary">确定</a>
					<a onclick="myclose()"  class="btn btn-sm btn-primary">关闭</a>
				</div>
				<br>
				<div class="text-center">
					<a id="pickfiles" href="javascript:;" class="btn btn-sm btn-primary">上传头像</a>
				</div>
				<br>
				<div class="text-center display-none">
					当前头像：
					<br />
					<div><img class="current"  src="<?php echo get_save_url(); echo ($pic); ?>" />
					</div>
				</div>
				<div class="text-center">
					头像预览：
					<br />
					<div style="width:120px;height:120px;overflow:hidden;margin-left: auto;margin-right: auto;"><img class="preview" id="preview" src="" />
					</div>
				</div>
			</div>
		</div>
	</div>



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
		
	<script type="text/javascript" src="/Public/Static/plupload/plupload.full.min.js"></script>
	<script type="text/javascript" src="/Public/Static/jcrop/jquery.Jcrop.min.js"></script>
	<link rel="stylesheet" href="/Public/Static/jcrop/jquery.Jcrop.css" type="text/css" />
	<script>
	var SAVE_URL = "<?php echo get_save_url();?>";
	var uploader = new plupload.Uploader({
	runtimes : 'html5,flash,html4',
	browse_button : 'pickfiles', // you can pass in id...
	container: document.getElementById('uploader'), // ... or DOM Element itself
	url : upload_url,
	flash_swf_url : "/Public/Static/plupload/Moxie.swf",
	filters : {
	max_file_size : '10mb',
	mime_types: [
	{title : "Image files", extensions : "jpg,gif,png"},
	]
	},
	init: {
	PostInit: function(){
	},
	FilesAdded: function(up, files) {
	up.start();
	},
	FileUploaded: function(up,file,data) {
	var myObject = eval('(' + data.response + ')');
	if(myObject.status){
	$("#img").val(myObject.path);
	$("#target").attr("src",myObject.path);
	$(".preview").attr("src",myObject.path);
	$('#target').Jcrop({
	minSize : [60, 60],
	setSelect : [0, 0, 120, 120],
	onChange : updatePreview,
	onSelect : updatePreview,
	onSelect : updateCoords,
	aspectRatio : 1
	}, function(){
	// Use the API to get the real image size
	var bounds = this.getBounds();
	boundx = bounds[0];
	boundy = bounds[1];
	// Store the API in the jcrop_api variable
	jcrop_api = this;
	});
	$(".jcrop-holder img").attr("src", SAVE_URL + myObject.savename);
	$(".imgchoose").show(1000);
	}else{
	alert(myObject.message);
	}
	},
	}
	});

uploader.init();

//头像裁剪
	var jcrop_api, boundx, boundy;

function updateCoords(c) {
	$('#x').val(c.x);
	$('#y').val(c.y);
	$('#w').val(c.w);
	$('#h').val(c.h);
	};

function updatePreview(c) {
	if (parseInt(c.w) > 0) {
	var rx = 120 / c.w;
	var ry = 120 / c.h;
	$('#preview').css({
	width : Math.round(rx * boundx) + 'px',
	height : Math.round(ry * boundy) + 'px',
	marginLeft : '-' + Math.round(rx * c.x) + 'px',
	marginTop : '-' + Math.round(ry * c.y) + 'px',
	});
	}
	};

function checkCoords() {
	if (parseInt($('#w').val()))
	return true;
	alert('请选择图片上合适的区域');
	return false;
	};
	function save() {
		var img = $("#img").val();
		var x = $("#x").val();
		var y = $("#y").val();
		var w = $("#w").val();
		var h = $("#h").val();
		var id = $("#id").val();
		if (checkCoords()) {
			$.ajax({
				type : "POST",
				url : "<?php echo U('resize_img');?>",
				data : {
					"img" : img,
					"x" : x,
					"y" : y,
					"w" : w,
					"h" : h,
					"id" : id
				},
				dataType : "json",
				success : function(msg) {
					if (msg.result_code == 1) {
						$("#emp_pic", parent.document).attr("src", "<?php echo get_save_url();?>" + msg.result_des + '?t=' + Math.random());
						$("#pic", parent.document).val(msg.result_des);
					}
					myclose();
				}
			});
		}
	}
	</script>


	</body>
</html>