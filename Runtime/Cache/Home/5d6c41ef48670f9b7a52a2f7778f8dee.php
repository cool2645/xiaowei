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
								
<div class="page-header clearfix">
	<div class="dropdown col-sm-8">
		<span class="title">全部</span>
		<b class="dropdown-toggle" data-toggle="dropdown"><span class="fa fa-caret-down"></span></b>
		<ul class="dropdown-menu">
			<li gid="">
				<a>全部</a>
			</li>
			<?php if(is_array($tag_list)): foreach($tag_list as $key=>$vo): ?><li gid="<?php echo ($key); ?>">
					<a><?php echo ($vo); ?></a>
				</li><?php endforeach; endif; ?>
		</ul>
	</div>
	<div class="col-sm-4 pull-right">
		<div class="search_box">
			<div class="input-group ">
				<input type="hidden" value="abc" >
				<input  class="form-control" type="text"  name="keyword" id="keyword" onkeydown="key_local_search();"/>
				<div class="input-group-btn">
					<a class="btn btn-sm btn-info" onclick="btn_local_search();"><i class="fa fa-search" ></i> </a>
				</div>
			</div>
		</div>
	</div>
</div>
<?php if(is_array($tag_list)): foreach($tag_list as $key=>$tag): ?><div class="list" >
			<?php $var = $key; ?>
			<div class="widget-box" gid="<?php echo ($key); ?>">
				<div class="widget-header widget-header-flat">
					<h4 class="smaller">
						<?php echo ($tag); ?>
					</h4>
					<div class="widget-toolbar">
						<a href="#" data-action="collapse">
							<i class="fa fa-chevron-up"></i>
						</a>
					</div>
				</div>
				<div class="widget-body">
					<div class="widget-main clearfix">
					<div class="space-8"></div>
						<?php if(is_array($list)): foreach($list as $key=>$vo): if(($var) == $vo["tag"]): ?><div class="col-sm-3 col-xs-6 text-center">
									<a class="btn btn-info btn-block" href="<?php echo U('add','type='.$vo['id']);?>"><?php echo ($vo["name"]); ?></a>
									<div class="space-8"></div>
								</div><?php endif; endforeach; endif; ?>
					</div>
				</div>
			</div>
		<div class="space-20"></div>
	</div><?php endforeach; endif; ?>


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

	function key_local_search(){
		if (event.keyCode == 13){
			$(".list div.col-sm-3").hide();
			val = $("#keyword").val().toUpperCase();
			if (val.length == 0) {
				$(".page-header .title").html("全部");
			} else {
				$(".page-header .title").html("搜索结果");
			}
			count = 0;
			$(".list a.btn").each(function() {
				if ($(this).text().indexOf(val) >= 0) {
					count++;
					$(this).parent().show();
				};
			});
		}			
	}

	function btn_local_search() {
		$(".list div.col-sm-3").hide();
		val = $("#keyword").val().toUpperCase();
		if (val.length == 0) {
			$(".page-header .title").html("全部");
		} else {
			$(".page-header .title").html("搜索结果");
		}
		count = 0;
		$(".list a.btn").each(function() {
			if ($(this).text().indexOf(val) >= 0) {
				count++;
				$(this).parent().show();
			};
		});
	}

	$(document).ready(function() {
		set_return_url();
		$(".page-header .dropdown-menu li").click(function() {
			$(".list").hide();
			gid = $(this).attr("gid");
			$(".title").html($(this).text());
			count = 0;
			$(".list .widget-box").each(function() {
				if ($(this).attr("gid").indexOf(gid) >= 0) {
					count++;
					$(this).parent().show();
				};
			});
		});
	});
</script>


	</body>
</html>