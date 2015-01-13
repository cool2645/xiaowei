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
								
	<div id="cal" class="day">
		<div id="top" class="operate panel panel-default">
			<div class="panel-body">
				<div class="pull-left">
					<a id="panel" class="btn btn-sm btn-primary"> </a>
					<a onclick="pushBtm('MU');" class="btn btn-sm btn-primary"><i class="fa fa-chevron-left"></i></a>
					<a onclick="pushBtm('MD');" class="btn btn-sm btn-primary"><i class="fa fa-chevron-right"></i></a>
					<a onclick="pushBtm('');" class="btn btn-sm btn-primary"> 今天 </a>
					<input type="text" name="start_date" id="start_date" style="display:none">
					<input type="text" name="end_date" id="end_date" style="display:none">
				</div>
				<div class="pull-right">
					<a onclick="month_view();" class="btn btn-sm btn-primary"> 月视图 </a>					
					<a onclick="add();" class="btn btn-sm btn-primary"> 新建 </a>
				</div>
			</div>
		</div>
		<form method="post" action="" name="CLD">
			<div style="display:none">
				<font> 公历
					<select id="year" onchange="changeCld()" name="SY">
						<script language=JavaScript>
							for ( i = 1900; i < 2050; i++)
								document.write('<option>' + i)
						</script>
					</select> 年
					<select id="month" onchange="changeCld()" name="SM">
						<script language=JavaScript>
							for ( i = 1; i < 13; i++)
								document.write('<option>' + i)
						</script>
					</select> 月 </font>
				<font id="GZ"> </font>
			</div>
			<div class="row">
				<div class="col-sm-4" style="height:260px;">
					<div class="mv-container" style="height:250px;min-height:250px;">
						<table class="mv-daynames-table" cellspacing="0" cellpadding="0">
							<tbody>
								<tr>
									<th title="周日" class="mv-dayname"> 周日 </th>
									<th title="周一" class="mv-dayname"> 周一 </th>
									<th title="周二" class="mv-dayname"> 周二 </th>
									<th title="周三" class="mv-dayname"> 周三 </th>
									<th title="周四" class="mv-dayname"> 周四 </th>
									<th title="周五" class="mv-dayname"> 周五 </th>
									<th title="周六" class="mv-dayname"> 周六 </th>
								</tr>
							</tbody>
						</table>
						<div class="mv-event-container" id="mvEventContainer" style="height:225px;">
							<div class="month-row" style="top:0%; height:36px;">
								<table class="st-bg-table" cellspacing="0" cellpadding="0">
									<tbody>
										<tr>
											<td class="st-bg "> &nbsp; </td>
											<td class="st-bg"> &nbsp; </td>
											<td class="st-bg"> &nbsp; </td>
											<td class="st-bg"> &nbsp; </td>
											<td class="st-bg"> &nbsp; </td>
											<td class="st-bg"> &nbsp; </td>
											<td class="st-bg"> &nbsp; </td>
										</tr>
									</tbody>
								</table>
								<table class="st-grid" cellspacing="0" cellpadding="0">
									<tbody>
										<tr>
											<td class="st-dtitle"><span class="left" id="SD0"> </span><span class="right" id="LD0"> </span></td>
											<td class="st-dtitle  "><span class="left" id="SD1"> </span><span class="right" id="LD1"> </span></td>
											<td class="st-dtitle  "><span class="left" id="SD2"> </span><span class="right" id="LD2"> </span></td>
											<td class="st-dtitle  "><span class="left" id="SD3"> </span><span class="right" id="LD3"> </span></td>
											<td class="st-dtitle "><span class="left" id="SD4"> </span><span class="right" id="LD4"> </span></td>
											<td class="st-dtitle "><span class="left" id="SD5"> </span><span class="right" id="LD5"> </span></td>
											<td class="st-dtitle "><span class="left" id="SD6"> </span><span class="right" id="LD6"> </span></td>
										</tr>
										<tr>
											<td class="st-c "><ul id="UL0"></ul></td>
											<td class="st-c "><ul id="UL1"></ul></td>
											<td class="st-c "><ul id="UL2"></ul></td>
											<td class="st-c "><ul id="UL3"></ul></td>
											<td class="st-c "><ul id="UL4"></ul></td>
											<td class="st-c "><ul id="UL5"></ul></td>
											<td class="st-c "><ul id="UL6"></ul></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="month-row" style="top:37px;height:36px;">
								<table class="st-bg-table" cellspacing="0" cellpadding="0">
									<tbody>
										<tr>
											<td class="st-bg "> &nbsp; </td>
											<td class="st-bg"> &nbsp; </td>
											<td class="st-bg"> &nbsp; </td>
											<td class="st-bg"> &nbsp; </td>
											<td class="st-bg"> &nbsp; </td>
											<td class="st-bg"> &nbsp; </td>
											<td class="st-bg"> &nbsp; </td>
										</tr>
									</tbody>
								</table>
								<table class="st-grid" cellspacing="0" cellpadding="0">
									<tbody>
										<tr>
											<td class="st-dtitle "><span class="left" id="SD7"> </span><span class="right" id="LD7"> </span></td>
											<td class="st-dtitle"><span class="left" id="SD8"> </span><span class="right" id="LD8"> </span></td>
											<td class="st-dtitle"><span class="left" id="SD9"> </span><span class="right" id="LD9"> </span></td>
											<td class="st-dtitle"><span class="left" id="SD10"> </span><span class="right" id="LD10"> </span></td>
											<td class="st-dtitle"><span class="left" id="SD11"> </span><span class="right" id="LD11"> </span></td>
											<td class="st-dtitle"><span class="left" id="SD12"> </span><span class="right" id="LD12"> </span></td>
											<td class="st-dtitle"><span class="left" id="SD13"> </span><span class="right" id="LD13"> </span></td>
										</tr>
										<tr>
											<td class="st-c "><ul id="UL7"></ul></td>
											<td class="st-c "><ul id="UL8"></ul></td>
											<td class="st-c "><ul id="UL9"></ul></td>
											<td class="st-c "><ul id="UL10"></ul></td>
											<td class="st-c "><ul id="UL11"></ul></td>
											<td class="st-c "><ul id="UL12"></ul></td>
											<td class="st-c "><ul id="UL13"></ul></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="month-row" style="top:74px; height:36px;">
								<table class="st-bg-table" cellspacing="0" cellpadding="0">
									<tbody>
										<tr>
											<td class="st-bg "> &nbsp; </td>
											<td class="st-bg"> &nbsp; </td>
											<td class="st-bg"> &nbsp; </td>
											<td class="st-bg"> &nbsp; </td>
											<td class="st-bg"> &nbsp; </td>
											<td class="st-bg"> &nbsp; </td>
											<td class="st-bg"> &nbsp; </td>
										</tr>
									</tbody>
								</table>
								<table class="st-grid" cellspacing="0" cellpadding="0">
									<tbody>
										<tr>
											<td class="st-dtitle "><span class="left" id="SD14"> </span><span class="right" id="LD14"> </span></td>
											<td class="st-dtitle"><span class="left" id="SD15"> </span><span class="right" id="LD15"> </span></td>
											<td class="st-dtitle"><span class="left" id="SD16"> </span><span class="right" id="LD16"> </span></td>
											<td class="st-dtitle"><span class="left" id="SD17"> </span><span class="right" id="LD17"> </span></td>
											<td class="st-dtitle"><span class="left" id="SD18"> </span><span class="right" id="LD18"> </span></td>
											<td class="st-dtitle"><span class="left" id="SD19"> </span><span class="right" id="LD19"> </span></td>
											<td class="st-dtitle"><span class="left" id="SD20"> </span><span class="right" id="LD20"> </span></td>
										</tr>
										<tr>
											<td class="st-c "><ul id="UL14"></ul></td>
											<td class="st-c "><ul id="UL15"></ul></td>
											<td class="st-c "><ul id="UL16"></ul></td>
											<td class="st-c "><ul id="UL17"></ul></td>
											<td class="st-c "><ul id="UL18"></ul></td>
											<td class="st-c "><ul id="UL19"></ul></td>
											<td class="st-c "><ul id="UL20"></ul></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="month-row" style="top:111px; height:36px;">
								<table class="st-bg-table" cellspacing="0" cellpadding="0">
									<tbody>
										<tr>
											<td class="st-bg "> &nbsp; </td>
											<td class="st-bg"> &nbsp; </td>
											<td class="st-bg"> &nbsp; </td>
											<td class="st-bg"> &nbsp; </td>
											<td class="st-bg"> &nbsp; </td>
											<td class="st-bg"> &nbsp; </td>
											<td class="st-bg"> &nbsp; </td>
										</tr>
									</tbody>
								</table>
								<table class="st-grid" cellspacing="0" cellpadding="0">
									<tbody>
										<tr>
											<td class="st-dtitle "><span class="left" id="SD21"> </span><span class="right" id="LD21"> </span></td>
											<td class="st-dtitle"><span class="left" id="SD22"> </span><span class="right" id="LD22"> </span></td>
											<td class="st-dtitle"><span class="left" id="SD23"> </span><span class="right" id="LD23"> </span></td>
											<td class="st-dtitle"><span class="left" id="SD24"> </span><span class="right" id="LD24"> </span></td>
											<td class="st-dtitle"><span class="left" id="SD25"> </span><span class="right" id="LD25"> </span></td>
											<td class="st-dtitle"><span class="left" id="SD26"> </span><span class="right" id="LD26"> </span></td>
											<td class="st-dtitle"><span class="left" id="SD27"> </span><span class="right" id="LD27"> </span></td>
										</tr>
										<tr>
											<td class="st-c "><ul id="UL21"></ul></td>
											<td class="st-c "><ul id="UL22"></ul></td>
											<td class="st-c "><ul id="UL23"></ul></td>
											<td class="st-c "><ul id="UL24"></ul></td>
											<td class="st-c "><ul id="UL25"></ul></td>
											<td class="st-c "><ul id="UL26"></ul></td>
											<td class="st-c "><ul id="UL27"></ul></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="month-row" style="top:148px;height:36px;">
								<table class="st-bg-table" cellspacing="0" cellpadding="0">
									<tbody>
										<tr>
											<td class="st-bg "> &nbsp; </td>
											<td class="st-bg"> &nbsp; </td>
											<td class="st-bg"> &nbsp; </td>
											<td class="st-bg"> &nbsp; </td>
											<td class="st-bg"> &nbsp; </td>
											<td class="st-bg"> &nbsp; </td>
											<td class="st-bg"> &nbsp; </td>
										</tr>
									</tbody>
								</table>
								<table class="st-grid" cellspacing="0" cellpadding="0">
									<tbody>
										<tr>
											<td class="st-dtitle "><span class="left" id="SD28"> </span><span class="right" id="LD28"> </span></td>
											<td class="st-dtitle"><span class="left" id="SD29"> </span><span class="right" id="LD29"> </span></td>
											<td class="st-dtitle"><span class="left" id="SD30"> </span><span class="right" id="LD30"> </span></td>
											<td class="st-dtitle"><span class="left" id="SD31"> </span><span class="right" id="LD31"> </span></td>
											<td class="st-dtitle"><span class="left" id="SD32"> </span><span class="right" id="LD32"> </span></td>
											<td class="st-dtitle"><span class="left" id="SD33"> </span><span class="right" id="LD33"> </span></td>
											<td class="st-dtitle"><span class="left" id="SD34"> </span><span class="right" id="LD34"> </span></td>
										</tr>
										<tr>
											<td class="st-c "><ul id="UL28"></ul></td>
											<td class="st-c "><ul id="UL29"></ul></td>
											<td class="st-c "><ul id="UL30"></ul></td>
											<td class="st-c "><ul id="UL31"></ul></td>
											<td class="st-c "><ul id="UL32"></ul></td>
											<td class="st-c "><ul id="UL33"></ul></td>
											<td class="st-c "><ul id="UL34"></ul></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="month-row" style="top:185px;bottom:0;">
								<table class="st-bg-table" cellspacing="0" cellpadding="0">
									<tbody>
										<tr>
											<td class="st-bg "> &nbsp; </td>
											<td class="st-bg"> &nbsp; </td>
											<td class="st-bg"> &nbsp; </td>
											<td class="st-bg"> &nbsp; </td>
											<td class="st-bg"> &nbsp; </td>
											<td class="st-bg"> &nbsp; </td>
											<td class="st-bg"> &nbsp; </td>
										</tr>
									</tbody>
								</table>
								<table class="st-grid" cellspacing="0" cellpadding="0">
									<tbody>
										<tr>
											<td class="st-dtitle "><span class="left" id="SD35"></span><span class="right" id="LD35"> </span></td>
											<td class="st-dtitle"><span class="left" id="SD36"> </span><span class="right" id="LD36"> </span></td>
											<td class="st-dtitle"><span class="left" id="SD37"> </span><span class="right" id="LD37"> </span></td>
											<td class="st-dtitle"><span class="left" id="SD38"> </span><span class="right" id="LD38"> </span></td>
											<td class="st-dtitle"><span class="left" id="SD39"> </span><span class="right" id="LD39"> </span></td>
											<td class="st-dtitle"><span class="left" id="SD40"> </span><span class="right" id="LD40"> </span></td>
											<td class="st-dtitle"><span class="left" id="SD41"> </span><span class="right" id="LD41"> </span></td>
										</tr>
										<tr>
											<td class="st-c "><ul id="UL35"></ul></td>
											<td class="st-c "><ul id="UL36"></ul></td>
											<td class="st-c "><ul id="UL37"></ul></td>
											<td class="st-c "><ul id="UL38"></ul></td>
											<td class="st-c "><ul id="UL39"></ul></td>
											<td class="st-c "><ul id="UL40"></ul></td>
											<td class="st-c "><ul id="UL41"></ul></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-8">
					<ul class="event_list clearfix"></ul>
				</div>
			</div>
		</form><div id="dialog2"></div>
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
		
	<script type="text/javascript" src="/Public/Home/js/calendar.js"></script>
	<script type="text/javascript">
		function showdata() {
			$("ul.event_list").html("");
			y = $("#year").val();
			m = $("#month").val();
			$("#panel").html(y + "年" + m + "月");
			start_date1 = $("#UL0").attr("class").substr(4);
			end_date1 = $("#UL41").attr("class").substr(4);
			$.getJSON("<?php echo U('json');?>", {
				start_date : start_date1,
				end_date : end_date1
			}, function(data) {
				count = 0;
				prev_date = '';
				if (data != null) {
					$.each(data, function(i) {
						html = '<li id=li_' + data[i].id + ' style=background-color:' + schedule_bg(data[i].priority) + ">";
						html += '<i class="ico_square"></i>';
						html += '<span class="event_time">' + data[i].start_date + '</span>';
						html += ' <p id=' + data[i].id + ' class="event_msg" title="' + data[i].name + '">';
						html += data[i].name;
						html += ' </p>';
						html += "</li>";
						prev_date = data[i].start_date;
						$("ul.event_list").append(html);
					});
				}
			});
		}

		function add() {
			window.open("<?php echo U('add');?>", "_self");
		}

		function month_view() {
			window.open("/index.php/Schedule", "_self");
		}

		function day_view() {
			window.open("<?php echo U('day_view');?>", "_self");
		}


		$(document).ready(function() {
			set_return_url();
			initial();
			$("#cm div").click(function() {
				$("#cm div.active").removeClass("active");
				$(this).addClass("active");
			});

			$(document).on("click", "p.event_msg", function() {
				var msg_list = "";
				current = $(this).attr('id');
				$("p#" + current).parent().parent().find('p.event_msg').each(function() {
					msg_list += $(this).attr("id") + "|";
				});
				winopen("<?php echo U('read');?>?id=" + $(this).attr('id') + "&list=" + msg_list, 730, 490);
			});
		});
		//-->
	</script>


	</body>
</html>