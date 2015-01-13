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
				<div class="main-content" style="margin-left:0px">
					<div class="page-content">
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								
	<div class="row">
		<div class="col-xs-12">
			<!-- PAGE CONTENT BEGINS -->
			<div class="row">
				<div class="col-xs-12 col-sm-6 widget-container-span" id="t1">
					<div class="widget-box display-none" ></div>
					<!-- 邮件开始 -->
					<div class="widget-box" sort="11">
						<div class="widget-header">
							<h5 class="smaller">邮件</h5>
							<div class="widget-toolbar no-border">
								<ul class="nav nav-tabs" id="myTab">
									<li class="active">
										<a data-toggle="tab" href="#mail-new">最新</a>
									</li>
									<li>
										<a data-toggle="tab" href="#mail-unread">未读</a>
									</li>
								</ul>
							</div>
						</div>
						<div class="widget-body">
							<div class="widget-main">
								<div class="tab-content">
									<div id="mail-new" class="tab-pane in active ul_table">
										<ul>
											<?php if(is_array($new_mail_list)): $i = 0; $__LIST__ = $new_mail_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li>
													<span class="pull-right hidden-phone"><?php echo (to_date($vo["create_time"],'m-d')); ?></span>
													<span  class="auto autocut"> <a url="<?php echo U('mail/read','id='.$vo['id']);?>" node="85" return_url="<?php echo U('mail/folder/','fid=inbox');?>" onclick="click_home_list(this)"><?php echo ($vo["name"]); ?></a> </span>
												</li><?php endforeach; endif; else: echo "" ;endif; ?>
										</ul>
									</div>
									<div id="mail-unread" class="tab-pane ul_table">
										<ul>
											<?php if(is_array($unread_mail_list)): $i = 0; $__LIST__ = $unread_mail_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li>
													<span class="pull-right hidden-phone"><?php echo (to_date($vo["create_time"],'m-d ')); ?></span>
													<span  class="auto autocut"> <a href="<?php echo U('mail/read','id='.$vo['id']);?>" node="85" return_url="<?php echo U('mail/folder/','fid=inbox');?>" onclick="click_home_list(this)"><?php echo ($vo["name"]); ?></a> </span>
												</li><?php endforeach; endif; else: echo "" ;endif; ?>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 日程开始 -->
					<div class="widget-box" sort="12">
						<div class="widget-header">
							<h5 class="smaller">日程</h5>
							<div class="widget-toolbar no-border">
								<ul class="nav nav-tabs" id="myTab">
									<li class="active">
										<a data-toggle="tab" href="#calendar-todo">待办</a>
									</li>									
									<li >
										<a data-toggle="tab" href="#calendar-schedule">日程</a>
									</li>

								</ul>
							</div>
						</div>
						<div class="widget-body">
							<div class="widget-main">
								<div class="tab-content">
									<div id="calendar-schedule" class=" ul_table tab-pane in active">
										<ul>
											<?php if(is_array($schedule_list)): $i = 0; $__LIST__ = $schedule_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li>
													<span class="pull-right hidden-phone"><?php echo ($vo["start_date"]); ?></span>
													<span  class="auto autocut"> <a url="<?php echo U('schedule/read2','id='.$vo['id']);?>" node="91" return_url="<?php echo U('schedule/index');?>" onclick="click_home_list(this)"><?php echo ($vo["name"]); ?></a></span>
												</li><?php endforeach; endif; else: echo "" ;endif; ?>
										</ul>
									</div>
									<div id="calendar-todo" class=" ul_table tab-pane">
										<ul>
											<?php if(is_array($todo_list)): $i = 0; $__LIST__ = $todo_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li>
													<span class="pull-right hidden-phone"><?php echo ($vo["start_date"]); ?></span>
													<span  class="auto autocut"> <a url="<?php echo U('todo/edit','id='.$vo['id']);?>" node="152" return_url="<?php echo U('todo/index');?>" onclick="click_home_list(this)"><?php echo ($vo["name"]); ?></a> </span>
												</li><?php endforeach; endif; else: echo "" ;endif; ?>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- 公告开始 -->
					<div class="widget-box" sort="13">
						<div class="widget-header">
							<h5 class="smaller">信息</h5>
						</div>
						<div class="widget-body">
							<div class="ul_table widget-main">
								<ul>
									<?php if(is_array($new_notice_list)): $i = 0; $__LIST__ = $new_notice_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li>
											<span class="pull-right hidden-phone"><?php echo ($vo["start_date"]); ?></span>
											<span  class="auto autocut"><a url="<?php echo U('notice/read','id='.$vo['id']);?>" node="83" return_url="<?php echo U('notice/index');?>" onclick="click_home_list(this)"><?php echo ($vo["name"]); ?></a> </span>
										</li><?php endforeach; endif; else: echo "" ;endif; ?>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 widget-container-span" id="t2">
					<div class="widget-box display-none" ></div>
					<!-- 审批开始 -->
					<div class="widget-box" sort="21">
						<div class="widget-header">
							<h5 class="smaller">审批</h5>
							<div class="widget-toolbar no-border">
								<ul class="nav nav-tabs" id="myTab">
									<li class="active">
										<a data-toggle="tab" href="#flow-todo">待办</a>
									</li>
									<li>
										<a data-toggle="tab" href="#flow-submit">已提交</a>
									</li>
								</ul>
							</div>
						</div>

						<div class="widget-body">
							<div class="widget-main">
								<div class="tab-content">
									<div id="flow-todo" class="tab-pane in active ul_table">
										<ul>
											<?php if(is_array($todo_flow_list)): $i = 0; $__LIST__ = $todo_flow_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li>
													<span class="pull-right hidden-phone"><?php echo (to_date($vo["create_time"],'m-d')); ?></span>
													<span  class="auto autocut"> <a url="<?php echo U('flow/read','id='.$vo['id'].'&fid=confirm');?>" node="87" return_url="<?php echo U('flow/folder','fid=confirm');?>" onclick="click_home_list(this)"><?php echo ($vo["name"]); ?></a> </span>
												</li><?php endforeach; endif; else: echo "" ;endif; ?>
										</ul>
									</div>
									<div id="flow-submit" class="tab-pane ul_table">
										<ul>
											<?php if(is_array($submit_flow_list)): $i = 0; $__LIST__ = $submit_flow_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li>
													<span class="pull-right hidden-phone"><?php echo (to_date($vo["create_time"],'m-d')); ?></span>
													<span  class="auto autocut"> <a href="<?php echo U('flow/read','id='.$vo['id'].'&fid='.$vo['fid'].'&fid=submit');?>" node="87" return_url="<?php echo U('flow/folder','fid=submit');?>" onclick="click_home_list(this)"><?php echo ($vo["name"]); ?></a> </span>
												</li><?php endforeach; endif; else: echo "" ;endif; ?>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
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
		
	<script src="/Public/Static/js/min/modernizr-custom-v2.7.1.min.js" type="text/javascript"></script>
	<script src="/Public/Static/js/min/jquery-finger-v0.1.0.min.js" type="text/javascript"></script>

	<!--Include flickerplate-->
	<link href="/Public/Static/css/flickerplate.css"  type="text/css" rel="stylesheet">
	<script src="/Public/Static/js/min/flickerplate.min.js" type="text/javascript"></script>

	<script type="text/javascript">
		$(function() {
			if (!is_mobile()) {
				$('.widget-container-span').sortable({
					connectWith : '.widget-container-span',
					cancel : ".widget-body,.nav-tabs",
					stop : function(event, ui) {
						set_sort();
					},
					items : '> .widget-box',
					opacity : 0.8,
					revert : true,
					forceHelperSize : true,
					placeholder : 'widget-placeholder',
					forcePlaceholderSize : true,
					tolerance : 'pointer'
				});
			}
			init_sort("<?php echo ($home_sort); ?>");
		});

		function init_sort(sort_string) {
			if (sort_string == "") {
				sort_string = "11,12,13|21,22,23";
			}
			array_sort_string = sort_string.split("|");
			sort_string_1 = array_sort_string[0];
			sort_string_2 = array_sort_string[1];

			array_sort = sort_string_1.split(",");

			for (x in array_sort) {
				index = array_sort[x];
				last = $("#t1 .widget-box:last");
				current = $(".widget-box[sort='" + index + "']");
				if (index !== last.attr("sort")) {
					current.insertAfter(last);
				}
			}

			array_sort = sort_string_2.split(",");
			for (x in array_sort) {
				index = array_sort[x];
				last = $("#t2 .widget-box:last");
				current = $(".widget-box[sort='" + index + "']");
				if (index !== last.attr("sort")) {
					current.insertAfter(last);
				}
			}
		};

		function set_sort() {
			var sort_string = "";
			t1_count = $("#t1 .widget-box:not(.display-none)").length;
			t2_count = $("#t2 .widget-box:not(.display-none)").length;

			if ((t1_count == 0) || (t2_count == 0)) {
				ui_error("至少保留一个");
				location.reload();
				return false;
			}
			$("#t1 .widget-box").each(function() {
				sort_string = sort_string + $(this).attr("sort") + ",";
			});
			sort_string = sort_string + "|";
			$("#t2 .widget-box").each(function() {
				sort_string = sort_string + $(this).attr("sort") + ",";
			});
			sendAjax("<?php echo U('set_sort');?>", "val=" + sort_string);
		}

		$(function() {
			$('.flicker-example').flicker({
				auto_flick : true,
				dot_alignment : "right",
				auto_flick_delay : 5,
				flick_animation : "transform-slide",
				theme : "dark"
			});
		});

	</script>


	</body>
</html>