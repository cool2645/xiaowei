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
		  <div class="hidden-xs">&nbsp;</div>
          <a href="<?php echo U('index/index');?>" class="navbar-brand"><i class="fa fa-leaf"></i><?php echo get_system_config("SYSTEM_NAME");?></a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="navbar-collapse-6">
          <ul class="nav navbar-nav navbar-right">
				<?php if(is_array($top_menu)): foreach($top_menu as $key=>$top_menu_vo): ?><a class="btn btn-app app-nav btn-xs nav-app"  href="#" url="<?php echo U($top_menu_vo['url']);?>" node="<?php echo ($top_menu_vo["id"]); ?>" onclick="click_top_menu(this)" >
					<i class="<?php echo ($top_menu_vo["icon"]); ?> bigger-100"></i><?php echo ($top_menu_vo["name"]); ?>
					<?php $bc_class=""; $controller_count=0; $icon_class=$top_menu_vo['icon']; if(strpos($icon_class,"bc-")!==false){ $bc_class=get_bc_class($icon_class); $controller_count=array_sum($badge_count[$bc_class]); if($controller_count>99){ $controller_count="99+"; } if($controller_count==0){ $controller_count=null; } } ?>
						<?php if(!empty($controller_count)): ?><span class="badge badge-pink"><?php echo ($controller_count); ?></span><?php endif; ?>					
				</a>&nbsp;&nbsp;<?php endforeach; endif; ?><a class="btn btn-app btn-xs btn-danger" style="margin-top:15px;margin-bottom:20px;margin-left:7px;margin-right:10px;" href="<?php echo U('public/logout');?>" ><i class="fa fa-sign-out bigger-100"></i>退出</a>
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
								
	<?php echo W('PageHeader/simple',array('name'=>'编辑日历事项','search'=>'N'));?>
	<form method='post' id="form_data" name="form_data" enctype="multipart/form-data"  class="well form-horizontal">
		<input type="hidden" id="id" name="id" value="<?php echo ($vo["id"]); ?>">
		<input type="hidden" id="ajax" name="ajax" value="0">
		<input type="hidden" id="add_file" name="add_file" value="<?php echo ($vo["add_file"]); ?>">
		<input type="hidden" id="opmode" name="opmode" value="edit">
		<input type="hidden" name="actor" id="actor" >
		<div class="form-group">
			<label class="col-sm-2 control-label" for="name">标题*：</label>
			<div class="col-sm-10">
				<input value="<?php echo ($vo["name"]); ?>" class="form-control" type="text" id="name" name="name" check="require" msg="请输入标题">
			</div>
		</div>

		<div class="form-group col-sm-6">
			<label class="col-sm-4 control-label" for="name">开始时间*：</label>
			<div class="col-sm-8">
				<input data-date-format="yyyy-mm-dd" value="<?php echo ($vo["start_date"]); ?>" type="text" id="start_date" name="start_date" readonly="readonly" class="form-control input-date"   check="require" msg="请输入开始日期">
				<select id="start_time" name="start_time" class="form-control"></select>
			</div>
		</div>

		<div class="form-group col-sm-6">
			<label class="col-sm-4 control-label" for="name">结束时间*：</label>
			<div class="col-sm-8">
				<input data-date-format="yyyy-mm-dd" value="<?php echo ($vo["end_date"]); ?>" type="text" id="end_date" name="end_date" readonly="readonly"
				class="form-control input-date" check="eqt|start_date" msg="请输入结束日期">
				<select id="end_time" name="end_time" class="form-control"></select>
			</div>
		</div>

		<div class="form-group col-sm-6">
			<label class="col-sm-4 control-label" for="location">地点：</label>
			<div class="col-sm-8">
				<input class="form-control" value="<?php echo ($vo["location"]); ?>" type="text" id="location" name="location">
			</div>
		</div>

		<div class="form-group col-sm-6">
			<label class="col-sm-4 control-label" for="location">优先级：</label>
			<div class="col-sm-8">
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
		<div class="clearfix"></div>
		<div class="form-group">
			<label class="col-sm-2 control-label" for="location">参与人员：</label>
			<div class="col-sm-10">
				<div id="actor_wrap" class="inputbox">
					<a class="pull-right btn btn-link text-center" onclick="popup_actor();"> <i class="fa fa-user"></i> </a>
					<div class="wrap" >
						<span class="address_list"><?php echo (show_contact($vo["actor"],"edit")); ?></span>
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
			<label class="col-sm-2 control-label" >附件：</label>
			<div class="col-sm-10">
				<?php echo W('FileUpload/edit',array('add_file'=>$vo['add_file'],'mode'=>'edit'));?>
			</div>
		</div>
		<div class="form-group">
			<div class="col-xs-12">
				<textarea  class="editor" id="content" name="content" style="width:100%;height:300px;"><?php echo ($vo["content"]); ?></textarea>
			</div>
		</div>
		<div class="action form-actions">
			<input class="btn btn-sm btn-primary" type="button" value="保存" onclick="save();">
			<input  class="btn btn-sm btn-default" type="button" value="取消" onclick="go_return_url();">
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
		function popup_actor() {
			winopen("<?php echo U('popup/actor');?>", 730, 574);
		}

		function save() {
			window.onbeforeunload = null;
			$("#actor").val("");
			$("#actor_wrap span.address_list span").each(function() {
				$("#actor").val($("#actor").val() + $(this).text().replace(';', '') + '|' + $(this).attr("title") + ";");
			});
			if (check_form("form_data")) {
				sendForm("form_data", "<?php echo U('save');?>");
			}
		}


		$(document).ready(function() {
			$(document).on("click", ".inputbox .address_list a.del", function() {
				$(this).parent().parent().remove();
			});
			fill_time("start_time");
			fill_time("end_time");

			$("#start_time option[value='<?php echo ($vo["start_time"]); ?>']").attr("selected", "selected");
			$("#end_time option[value='<?php echo ($vo["end_time"]); ?>']").attr("selected", "selected");

			$("#priority").val("<?php echo ($vo["priority"]); ?>");
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
	</script>


	</body>
</html>