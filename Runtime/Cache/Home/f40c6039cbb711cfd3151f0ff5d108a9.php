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
								

<?php echo W('PageHeader',array('name'=>'待办事项','search'=>'L'));?>
<div class="operate panel panel-default">
	<div class="panel-body">
		<div class="pull-left"></div>
		<div class="pull-right">
			<a  onclick="add();" class="btn btn-sm btn-primary" >新建</a>
		</div>
	</div>
</div>
<form id="form_data" name="form_data" method='post' >
	<div>
		<div class="ul_table border-bottom">
			<ul>
				<li class="thead">
					<span class="col-9 pull-right text-center">操作</span>
					<span class="col-10 pull-right text-center">状态</span>
					<span class="col-9 pull-right text-center">截至日期</span>
					<div class="auto autocut text-left">
						待办事项
					</div>
				</li>
				<?php if(is_array($list)): foreach($list as $key=>$vo): ?><li class="tbody" node="<?php echo ($vo["id"]); ?>">
						<input class="node" type="hidden" name="node[]" value="<?php echo ($vo["id"]); ?>">
						<input class="priority" type="hidden" name="priority[]" value="<?php echo ($vo["priority"]); ?>">
						<input class="sort" type="hidden" name="sort[]">
						<span class="col-3 pull-right text-center"> <a title="删除" class="del" onclick="del(this);"><i class="fa fa fa-times"></i></a> </span>
						<span class="col-3 pull-right text-center"> <a title="调低优先级" class="down"><i class="fa fa-arrow-down"></i></a> </span>
						<span class="col-3 pull-right text-center"> <a title="调高优先级" class="up"><i class="fa fa-arrow-up"></i></a> </span>
						<span class="col-10 pull-right text-center"> <a class="status"><?php echo (todo_status($vo["status"])); ?></a> </span>
						<span class="col-9 pull-right text-center"><?php echo ($vo["end_date"]); ?></span>
						<span class="auto"> <a href="<?php echo U('edit','id='.$vo['id']);?>"><?php echo ($vo["name"]); ?></a> </span>
					</li><?php endforeach; endif; ?>
			</ul>
			<br>
			<ul>
				<li class="thead">
					<span class="col-9 pull-right text-center">操作</span>
					<span class="col-10 pull-right text-center">状态</span>
					<span class="col-9 pull-right text-center">完成日期</span>
					<div class="auto autocut text-left">
						已完成事项
					</div>
				</li>
				<?php if(is_array($list2)): foreach($list2 as $key=>$vo): ?><li class="tbody" node="<?php echo ($vo["id"]); ?>">
						<input class="node" type="hidden" name="node[]" value="<?php echo ($vo["id"]); ?>">
						<input class="priority" type="hidden" name="priority[]" value="<?php echo ($vo["priority"]); ?>">
						<input class="sort" type="hidden" name="sort[]">
						<span class="col-3 pull-right text-center"> <a title="删除" class="del" onclick="del(this);"><i class="fa fa fa-times"></i></a> </span>
						<span class="col-3 pull-right text-center"> <a title="低" class="down"><i class="fa fa-arrow-down"></i></a> </span>
						<span class="col-3 pull-right text-center"> <a title="高" class="up"><i class="fa fa-arrow-up"></i></a> </span>
						<span class="col-10 pull-right text-center"><a class="status"><?php echo (todo_status($vo["status"])); ?></a> </span>
						<span class="col-9 pull-right text-center"><?php echo ($vo["end_date"]); ?></span>
						<span class="auto"> <a href="<?php echo U('edit','id='.$vo['id']);?>"><?php echo ($vo["name"]); ?></a> </span>
					</li><?php endforeach; endif; ?>
			</ul>
		</div>
	</div>
</form>
<div id="dialog2" class="dropdown">
	<ul class="dropdown-menu">
		<li>
			<a onclick="mark_status(1);">尚未开始</a>
		</li>
		<li>
			<a onclick="mark_status(2);">正在进行</a>
		</li>
		<li>
			<a onclick="mark_status(3);">完成</a>
		</li>
	</ul>
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
		window.open("<?php echo U('add');?>", "_self");
	}

	function del(obj) {
		ui_confirm('确定要删除吗?',function(){
			id = $(obj).parent().parent().find("input.node").val();
			sendAjax("<?php echo U('del');?>", "id=" + id, function(data) {
				if (data.status) {
					ui_alert(data.info,function(){
						$(obj).parent().parent().remove();
					});	
				}
			});
		});
	}


	$(document).ready(function() {
		set_return_url();
		$("#dialog2").mouseleave(function() {
			//$("#dialog2").hide();
		});

		$("li a.status").on("click", (function() {
			$("#dialog2").css("left", $(this).parents("span").offset().left - $(".Todo").offset().left);
			$("#dialog2").css("top", $(this).parents("span").offset().top - $(".Todo").offset().top);
			$("#dialog2").show();
			node = $(this).parents("li").find("input.node").val();
			$("#dialog2").attr("node", node);
		}));

		$("li").each(function() {
			$(this).css("background-color", schedule_bg($(this).find("input.priority").val()));
		});
		
		$("a.up").click(function() {
			moveUp($(this));
		});
		
		$("a.down").click(function() {
			moveDown($(this));
		});
	});
	function moveUp(obj) {
		var current = $(obj).parent().parent();
		var prev = current.prev();
		if (current.index() > 1) {
			current.insertBefore(prev);
		}
		set_sort();
	}

	function moveDown(obj) {
		var current = $(obj).parent().parent();
		var next = current.next();
		if (next) {
			current.insertAfter(next);
		}
		set_sort();
	}

	function mark_status(val) {
		node = $("#dialog2").attr("node");
		if (node) {
			sendAjax("<?php echo U('mark_status');?>", "id=" + node + "&val=" + val, function(data) {
				location.reload();
			});
		}
	}

	function set_sort() {
		$("li.tbody").each(function() {
			$(this).find("input.sort").val($(this).index());
		});
		var vars = $("#form_data").serialize();
		sendAjax("<?php echo U('set_sort');?>", vars);
	}

</script>


	</body>
</html>