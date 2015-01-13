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
		
			<?php if(!empty($plugin["jquery-ui"])): ?><link rel="stylesheet" href="/Public/Static/jquery/ui/css/jquery-ui-1.10.3.full.min.css" /><?php endif; ?>
<?php if(!empty($plugin["date"])): ?><link rel="stylesheet" href="/Public/Static/css/datepicker.css" /><?php endif; ?>

		


		<!-- fonts -->
		<!-- ace styles -->

		<link rel="stylesheet" href="/Public/Static/ace/css/uncompressed/ace.css" />
		<link rel="stylesheet" href="/Public/Static/ace/css/uncompressed/ace-rtl.css" />
		<link rel="stylesheet" href="/Public/Static/ace/css/uncompressed/ace-skins.css" />

		<!--[if lte IE 8]>
		<link rel="stylesheet" href="/Public/Static/ace/css/uncompressed/ace-ie.css" />
		<![endif]-->

		<!-- inline styles related to this page -->
		<link rel="stylesheet" href="/Public/Home/css/style.css" />
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
		
	<div class="container">
		<!-- /container -->
		<div class="row">
			<div class="col-xs-12 hidden-xs" style="margin-top:120px;"></div>
		</div>
		<div class="row">
			<div class="col-sm-8 hidden-xs">
				<div class="img"></div>
			</div>
			<div class="col-sm-4 well">
				<div style="margin-bottom:44px;margin-top:20px;">
					<h1 class="text-center"><?php echo get_system_config("SYSTEM_NAME");?></h1>
				</div>
				<form method="post" id="form_login" class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-3  control-label" for="emp_no">帐号：</label>
						<div class="col-sm-9">
							<input class="form-control" id="emp_no" name="emp_no" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3  control-label" for="password">密码：</label>
						<div class="col-sm-9">
							<input class="form-control" id="password" type="password" name="password" />
						</div>
					</div>
					<?php if(!empty($is_verify_code)): ?><div class="form-group">
							<label class="col-sm-3  control-label" for="verify">验证码：</label>
							<div class="col-sm-9 row">
								<div class="col-xs-8">
									<input class="form-control" id="verify" name="verify" />
								</div>
								<div class="col-xs-4">
									<img src='/index.php/Public/verify' / style='cursor:pointer' title='刷新验证码' id='verifyImg' onclick='freshVerify()'>
								</div>
							</div>
						</div><?php endif; ?>
					<div class="form-group display-none">
						<span class="col-sm-3  control-label"> </span>
						<div class="col-sm-9">
							<label class="inline pull-left col-3">
								<input class="ace" type="checkbox" name="remember" value="1" />
								<span class="lbl"> </span> </label>
							<label for="remember-me">记住我的登录状态</label>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-9">
							<input type="button" value="登录" onclick="login();" class="btn btn-sm btn-primary col-10">						
						</div>
					</div>
				</form>
				<p>
					用户名：admin 密码：admin
				</p>
				<p>
					&nbsp;
				</p>
				<p>
					&nbsp;
				</p>
			</div>
		</div>
		<div class="row">
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
		function login() {
			if (check_form("form_login")) {
				sendForm("form_login", "<?php echo U('public/check_login');?>");
			}
		}

		$(document).ready(function() {
			var $dom = "#password";
			<?php if(!empty($is_verify_code)): ?>$dom="#verify";<?php endif; ?>
			$($dom).keydown(function(event) {
				if (event.keyCode == 13) {
					if (check_form("form_login")) {
						sendForm("form_login", "<?php echo U('public/check_login');?>");
						return false;
					}
				}
			});
		});
	</script>


	</body>
</html>