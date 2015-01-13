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
								
	<?php echo W('PageHeader/simple',array('name'=>'菜单管理','search'=>'N'));?>

	<form id="form_search" name="form_search" method="post" action="">
		<div class="operate panel panel-default">
			<div class="panel-body">
				<div class="pull-left">
					<select name="eq_pid" id="eq_pid" class="form-control col-10" onchange="submit_search();">
						<?php echo fill_option($groupList);?>
					</select>
				</div>
				<div class="pull-right">
					<a onclick="add();" class="btn btn-sm btn-primary">新增</a>
					<a onclick="save();"  class="btn btn-sm btn-primary">保存</a>
					|
					<a onclick="del();"  class="btn btn-sm btn-danger">删除</a>
				</div>
			</div>
		</div>
	</form>
	<!-- 功能操作区域结束 -->
	<!-- 列表显示区域  -->
	<div class="row">
		<div class="col-sm-4 sub_left_menu">
			<div class="well">
				<?php echo $menu ?>
			</div>
		</div>
		<div class="col-sm-8 sub_content">
			<form id="form_data" name="form_data" method="post" class="well form-horizontal clearfix">
				<input type="hidden" name="id" id="id">
				<input type="hidden" name="ajax" id="ajax" value="1">
				<input type="hidden" name="opmode" id="opmode" value="">
				<select name="node_list" id="node_list" class="display-none">
					<?php echo fill_option($node_list);?>
				</select>
				<div class="form-group col-xs-12">
					<label class="col-sm-4 control-label" for="name">名称*：</label>
					<div class="col-sm-8">
						<input class="form-control" type="text" id="name" name="name" check="require" msg="请输入名称">
					</div>
				</div>

				<div class="form-group col-xs-12">
					<label class="col-sm-4 control-label" for="url">地址：</label>
					<div class="col-sm-8">
						<input class="form-control" type="text" id="url" name="url">
					</div>
				</div>

				<div class="form-group col-xs-12">
					<label class="col-sm-4 control-label" for="url">父节点：</label>
					<div class="col-sm-8">
						<div class="input-group">
							<input name="node_name" class="form-control val" id="node_name" type="text"  readonly="readonly"/>
							<input name="pid"  id="pid" type="hidden" msg="请选择父节点" check="require"  />
							<span class="input-group-btn">
								<button class="btn btn-sm btn-primary" onclick="select_pid()" type="button">
									选择
								</button> </span>
						</div>
					</div>
				</div>
				<div class="form-group col-xs-12">
					<label class="col-sm-4 control-label" for="icon">图标：</label>
					<div class="col-sm-8">
						<input class="form-control" type="text" id="icon" name="icon" >
					</div>
				</div>
				<div class="form-group col-xs-12">
					<label class="col-sm-4 control-label" for="badge_function">统计函数：</label>
					<div class="col-sm-8">
						<input class="form-control" type="text" id="badge_function" name="badge_function" >
					</div>
				</div>				
				<div class="form-group col-xs-12">
					<label class="col-sm-4 control-label" for="sort">排序：</label>
					<div class="col-sm-8">
						<input class="form-control" type="text" id="sort" name="sort" >
					</div>
				</div>

				<div class="form-group col-xs-12">
					<label class="col-sm-4 control-label" for="is_del">状态*：</label>
					<div class="col-sm-8">
						<select   name="is_del" id="is_del" class="form-control">
							<option  value="0">启用</option>
							<option value="1">禁用</option>
						</select>
					</div>
				</div>

				<div class="form-group col-xs-12">
					<label class="col-sm-4 control-label" for="remark" >备注：</label>
					<div class="col-sm-8" >
						<textarea class="form-control" name="remark" rows="5" class="col-xs-12" ></textarea>
					</div>
				</div>
			</form>
		</div>
	</div>


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
		function add() {
			$("#opmode").val("add");
			$("#id").val("");
			if (check_form("form_data")) {
				sendForm("form_data", "<?php echo U('save');?>", "/index.php/Node");
			}
		};

		function del() {
			var vars = $("#form_data").serialize();
			ui_confirm('确定要删除吗?', function() {
				sendAjax("<?php echo U('del');?>", vars, function(data) {
					if (data.status) {
						ui_alert(data.info, function() {
							$("#form_search").submit();
						});
					} else {
						ui_alert(data.info, function() {
						});
					}
				});
			});
		}

		function save() {
			if (check_form("form_data")) {
				sendForm("form_data", "<?php echo U('node/save');?>", fix_url("<?php echo U('node/index');?>?eq_pid=" + $("#eq_pid").val()));
			}
		}

		function select_pid() {
			winopen("<?php echo U('winpop');?>", 730, 500);
		}

		function showdata(result) {
			for (var s in result.data) {
				set_val(s, result.data[s]);
			}
			$("#node_name").val($("#node_list option[value='" + $("#pid").val() + "']").text());
			$("#opmode").val("edit");
		}


		$(document).ready(function() {
			set_return_url();
			set_val('eq_pid', '<?php echo ($eq_pid); ?>');
			$(".sub_left_menu .tree_menu a").click(function() {
				$(".sub_left_menu .tree_menu  a").each(function() {
					$(this).attr("class", "");
				});
				$(this).attr("class", "active");
				sendAjax("<?php echo U('read');?>", "id=" + $(this).attr("node"), function(data) {
					showdata(data);
				});
				return false;
			});
			sendAjax("<?php echo U('read');?>", "id=<?php echo ($eq_pid); ?>", function(data) {
				showdata(data);
			});
		});

	</script>



	</body>
</html>