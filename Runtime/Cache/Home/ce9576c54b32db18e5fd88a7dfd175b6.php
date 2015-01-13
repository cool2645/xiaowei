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
		<link rel="stylesheet" href="/Public/Static/jquery/plugin/css/jquery.gritter.css" />
		
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
		<div class="shade"></div>
		
			<nav class="navbar navbar-default " role="navigation">
	<!-- Brand and toggle get grouped for better mobile display -->
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-6">
			<span class="sr-only">Toggle navigation</span>
			<i class="fa fa-bars fa-lg"></i>
		</button>
		<div class="hidden-xs">
			&nbsp;
		</div>
		<a href="<?php echo U('index/index');?>" class="navbar-brand"><i class="fa fa-leaf"></i><?php echo get_system_config("SYSTEM_NAME");?></a>
	</div>
	<!-- Collect the nav links, forms, and other content for toggling -->
	<div class="collapse navbar-collapse" id="navbar-collapse-6">
		<ul class="nav navbar-nav navbar-right">
			<?php if(is_array($top_menu)): foreach($top_menu as $key=>$top_menu_vo): ?><a class="btn btn-app app-nav btn-xs nav-app"  href="#" url="<?php echo U($top_menu_vo['url']);?>" node="<?php echo ($top_menu_vo["id"]); ?>" onclick="click_top_menu(this)" > <i class="<?php echo ($top_menu_vo["icon"]); ?> bigger-100"></i><?php echo ($top_menu_vo["name"]); ?>
				<?php if(!empty($badge_count[$top_menu_vo['id']])){ $html=''; $html='<span class="badge badge-pink">'.$badge_count[$top_menu_vo['id']].'</span>'; echo $html; } ?></a>&nbsp;&nbsp;<?php endforeach; endif; ?><a class="btn btn-app btn-xs btn-danger" style="margin-top:15px;margin-bottom:20px;margin-left:7px;margin-right:10px;" href="<?php echo U('public/logout');?>" ><i class="fa fa-sign-out bigger-100"></i>退出</a>
		</ul>
	</div><!-- /.navbar-collapse -->
</nav>
		

		<div class="main-container" id="main-container" >
			<div class="main-container-inner">
				<div class="sidebar" id="sidebar">	
					<div id="user_info" class="text-center hidden-xs"  >
						<span >当前用户：<?php echo (session('user_name')); ?></span>
					</div>
					<div id="nav_head" class="text-center" onclick="toggle_left_menu()">
						<span class="menu-text"><?php echo ($top_menu_name); ?></span>
						<b id="left_menu_icon" class="fa fa-angle-down pull-right"></b>
					</div>
					<?php echo W('Sidebar/left',array('tree'=>$left_menu,'badge_count'=>$badge_count));?>
				</div>			
				<div class="main-content">
					<div class="breadcrumbs" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="fa fa-home home-icon"></i>
								<a href="/">Home</a>
							</li>
							<li>
								<?php echo ($top_menu_name); ?>
							</li>
						</ul><!-- .breadcrumb -->
					</div>					
					<div class="page-content">
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								
	<?php echo W('PageHeader',array('name'=>'写消息','search'=>'N'));?>
	<div class="operate panel panel-default">
		<div class="panel-body">
			<div class="pull-left">
				<a onclick="go_return_url();" class="btn btn-sm btn-primary">返回</a>
			</div>
			<div class="pull-right">
				<a onclick="save();"  class="btn btn-sm btn-primary">发送</a>
			</div>
		</div>
	</div>
	<form class="well form-horizontal" method='post' id="form_data" name="form_data" enctype="multipart/form-data">
		<input type="hidden" id="ajax" name="ajax" value="0">
		<input type="hidden" id="add_file" name="add_file">
		<input type="hidden" id="to" name="to"/>
		<input type="hidden" id="opmode" name="opmode" value="add"/>
		<input type="text" style="display:none">

		<div class="form-group">
			<label class="col-sm-2 control-label" for="recever">收信人*：</label>
			<div class="col-sm-10">
				<div id="recever" class="inputbox">
					<a class="pull-right btn btn-link text-center" onclick="popup_contact();"> <i class="fa fa-user"></i> </a>
					<div class="wrap" >
						<span class="address_list"></span>
						<span class="text" >
							<input class="letter" type="text"  >
						</span>
					</div>
					<div class="search dropdown ">
						<ul class="dropdown-menu"></ul>
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-xs-12">
				<textarea  class="simple" id="content" name="content" class="col-xs-12" check="require" msg="请输入内容"></textarea>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label" for="name">附件：</label>
			<div class="col-sm-10">
				<?php echo W('FileUpload/add');?>
			</div>
		</div>
	</form>


								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div><!-- /.main-content -->
			</div><!-- /#ace-settings-container -->
		</div><!-- /.main-container-inner -->

		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse"> <i class="fa fa-double-angle-up fa-only bigger-110"></i> </a>
		</div><!-- /.main-container -->

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

		<script src="/Public/Static/js/jquery.gritter.min.js"></script>
		
			
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
		$(document).ready(function() {

			/*单击删除已选联系人*/
			$(document).on("click", ".inputbox .address_list a.del", function() {
				$(this).parent().parent().remove();
			});

			/* 查找联系人input 功能*/
			$(document).on("click", ".inputbox .search li", function() {
				name = $(this).text().replace(/<.*>/, '');
				email = $(this).find("a").attr("title");
				id = $(this).find("a").attr("data");
				html = conv_inputbox_item(email, name, email, id);

				inputbox = $(this).parents(".inputbox");
				inputbox.find("span.address_list").append(html);
				inputbox.find("input.letter").val("");
				inputbox.find(".search ul").html("");
				inputbox.find(".search ul").hide();
				inputbox.find(".search").hide();
			});
			/* 查找联系人input 功能*/
			$(".inputbox .letter").keyup(function(e) {
				switch(e.keyCode) {
				case 40:
					var $curr = $(this).parents(".inputbox").find(".search li.active").next();
					if ($curr.html() != null) {
						$(this).parents(".inputbox").find(".search li").removeClass("active");
						$curr.addClass("active");
					}
					break;
					
				case 38:
					var $curr = $(this).parents(".inputbox").find(".search li.active").prev();
					if ($curr.html() != null) {
						$(this).parents(".inputbox").find(".search li").removeClass("active");
						$curr.addClass("active");
					}
					break;
					
				case 13:
					if ($(this).parents(".inputbox").find(".search ul").html() != "") {
						name = $(".search li.active").text().replace(/<.*>/, '');
						email = $(".search li.active a").attr("title");
						id = $(".search li.active a").attr("data");
						html = conv_inputbox_item(id, name, id, id);
						$(this).parents(".inputbox").find("span.address_list").append(html);
						$(this).parents(".inputbox").find(".search ul").html("");

						$(this).val("");
						$(this).parents(".inputbox").find(".search ul").hide();
					} else {
						email = $(this).val();
						if (validate(email, 'email')) {
							name = email;
							html = conv_inputbox_item(email, name, email, email);
							$(this).parents(".inputbox").find("span.address_list").append(html);
							$(this).val("");
						} else {
							ui_error("邮件格式错误");
							return false;
						}
					}
					break;
					
				default:
					var search = $(this).parents(".inputbox").find("div.search ul");
					if ($(this).val().length > 1) {
						$.getJSON("<?php echo U('popup/json');?>", {
							key : $(this).val()
						}, function(json) {
							if (json != "") {
								if (json.length > 0) {
									search.html("");
									$.each(json, function(i) {
										search.append('<li><a data="' + json[i].id + '" title="' + json[i].email + '">' + json[i].name + '&lt;' + json[i].email + '&gt;</a></li>');
									});
									search.children("li:first").addClass("active");
									search.show();
								}
							} else {
								search.html("");
								search.hide();
							}
						});
					} else {
						search.hide();
					}
				}
			});
		});
		function save() {
			window.onbeforeunload = null;
			$("#to").val("");
			$("#recever .address_list span").each(function() {
				$("#to").val($("#to").val() + $(this).find("b").text() + '|' + $(this).attr("data") + ";");
			});
			if ($("#to").val() == "") {
				ui_error("请选择收信人");
				$("#recever .letter").focus();
				return false;
			}
			if (check_form("form_data")) {
				sendForm("form_data", "<?php echo U('save');?>");
			}
		}

		function popup_contact() {
			winopen("<?php echo U('popup/message');?>", 730, 570);
		}
	</script>



	</body>
</html>