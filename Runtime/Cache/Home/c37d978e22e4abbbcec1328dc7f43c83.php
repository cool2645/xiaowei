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
						
<script type="text/javascript">
	function save() {
		$("#confirm_wrap,#consult_wrap,#refer_wrap", parent.document).hide();
		$("#confirm_wrap,#consult_wrap,#refer_wrap", parent.document).html("");

		$("#rc select option").each(function(i) {
			emp_no = $(this).val();
			name = jQuery.trim($(this).text());
			html_string = conv_inputbox_item(name, emp_no);
			$("#confirm_wrap", parent.document).append(html_string);
		});

		$("#cc select option").each(function() {
			emp_no = $(this).val();
			name = jQuery.trim($(this).text());
			html_string = conv_inputbox_item(name, emp_no);
			$("#consult_wrap", parent.document).append(html_string);
		});

		$("#bcc select option").each(function(i) {
			emp_no = $(this).val();
			name = jQuery.trim($(this).text());
			html_string = conv_inputbox_item(name, emp_no);
			$("#refer_wrap", parent.document).append(html_string);
		});

		$("#confirm_wrap span a", parent.document).remove();
		$("#confirm_wrap span", parent.document).append("<b><i class=\"fa fa-arrow-right\"></i></b>");

		$("#confirm_wrap span b:last", parent.document).remove();

		$("#consult_wrap span a", parent.document).remove();

		$("#consult_wrap span", parent.document).append("<b><i class=\"fa fa-arrow-right\"></i></b>");
		$("#consult_wrap span b:last", parent.document).remove();
		
		$("#refer_wrap span a", parent.document).remove();
		$("#refer_wrap span", parent.document).append("<b>;&nbsp;</b>");

		$("#confirm_wrap,#consult_wrap,#refer_wrap", parent.document).show();

		myclose();
	}

	// 显示AJAX 读取的数据
	function showdata(result) {
		$("#addr_list").html("");
		if ( type = $("input[name='type']:checked").val() == "company") {
			var id = "dept_" + $("#company a.active").attr("node");
			var dept_name = $("#company a.active span").text();
			var email = "dept@group";
			var name = dept_name + "&lt;" + email + "&gt;";
			var html_string = conv_address_item(id, name);
			$("#addr_list").html(html_string);
		}
		for (s in result.data) {
			var id = result.data[s].id;
			var position_name = result.data[s].position_name;
			var emp_no = result.data[s].emp_no;
			var email = result.data[s].email;
			var name = result.data[s].name;
			var name = name + "/" + position_name;
			var html_string = conv_address_item(emp_no, name);
			$("#addr_list").append(html_string);
		}
	}


	$(document).ready(function() {

		$("#rb_<?php echo ($type); ?>").prop('checked', true);
		// 选择用户默认选择的类型
		$("#<?php echo ($type); ?>").removeClass("display-none");

		$("input[name='type']").on('click', function() {
			$("input[name='type']").each(function() {
				$("#" + $(this).val()).addClass("display-none");
			});
			$("#" + $(this).val()).removeClass("display-none")
		})
		//点击节点时读取相应的数据
		$(".tree_menu  a").click(function() {
			$(".tree_menu a").removeClass("active");
			var type = $("input[name='type']:checked").val();
			$(this).addClass("active");
			sendAjax("<?php echo U('read');?>", "type=" + type + "&id=" + $(this).attr("node"), function(data) {
				showdata(data);
			})
			return false;
			//禁止连接生效
		});

		$(document).on("dblclick", "#addr_list label", function() {
			$text = $(this).find("span").text();
			$val = $(this).find("input").val();
			if ($("#rc select option[value='" + $val + "']").val() == undefined) {
				$("<option></option>").val($val).text($text).appendTo("#rc select");
				$("#rc_count").text("(" + $("#rc select option").length + ")");
			};
		});

		/* 双击添加到收件人 因后添加的数据 所以需要用live函数 */
		$("#rc select").on("dblclick", function() {
			$(this).find("option:selected").remove();
			$("#rc_count").text("(" + $("#rc select option").length + ")");
		});

		$("#cc select").on("dblclick", function() {
			$(this).find("option:selected").remove();
			$("#cc_count").text("(" + $("#cc select option").length + ")");
		});

		$("#bcc select").on("dblclick", function() {
			$(this).find("option:selected").remove();
			$("#bcc_count").text("(" + $("#bcc select option").length + ")");
		});

		$("#addr_list").on("mouseover", function() {
			$("#addr_list label").draggable({
				appendTo : "body",
				helper : "clone"
			});
		});

		$("#rc select").droppable({
			activeClass : "ui-state-default",
			hoverClass : "ui-state-hover",
			accept : ":not(.ui-sortable-helper)",
			drop : function(event, ui) {
				$text = ui.draggable.text();
				$val = ui.draggable.find("input").val();
				if ($("#rc select option[value='" + $val + "']").val() == undefined) {
					$("<option></option>").val($val).text($text).appendTo(this);
					$("#rc_count").text("(" + $("#rc select option").length + ")");
				};
			},
		}).sortable({
			items : "option:not(.placeholder)",
			sort : function() {
				// gets added unintentionally by droppable interacting with sortable
				// using connectWithSortable fixes this, but doesn't allow you to customize active/hoverClass options
				$(this).removeClass("ui-state-default");
			}
		});

		$("#cc select").droppable({
			activeClass : "ui-state-default",
			hoverClass : "ui-state-hover",
			accept : ":not(.ui-sortable-helper)",
			drop : function(event, ui) {
				$text = ui.draggable.text();
				$val = ui.draggable.find("input").val();
				if ($("#cc select option[value='" + $val + "']").val() == undefined) {
					$("<option></option>").val($val).text($text).appendTo(this);
					$("#cc_count").text("(" + $("#cc select option").length + ")");
				};
			},
		}).sortable({
			items : "li:not(.placeholder)",
			sort : function() {
				// gets added unintentionally by droppable interacting with sortable
				// using connectWithSortable fixes this, but doesn't allow you to customize active/hoverClass options
				$(this).removeClass("ui-state-default");
			}
		});

		$("#bcc select").droppable({
			activeClass : "ui-state-default",
			hoverClass : "ui-state-hover",
			accept : ":not(.ui-sortable-helper)",
			drop : function(event, ui) {
				$text = ui.draggable.text();
				$val = ui.draggable.find("input").val();
				if ($("#bcc select option[value='" + $val + "']").val() == undefined) {
					$("<option></option>").val($val).text($text).appendTo(this);
					$("#bcc_count").text("(" + $("#bcc select option").length + ")");
				};
			},
		}).sortable({
			items : "li:not(.placeholder)",
			sort : function() {
				$(this).removeClass("ui-state-default");
			}
		});
	})
	//最终确认

	function add_address(name) {
		$("input:checked[name='addr_id']").each(function() {
			$text = $(this).parents("label").find("span").text();
			$val = $(this).val();
			if ($("#" + name + " select option[value='" + $val + "']").val() == undefined) {
				$("<option></option>").val($val).text($text).appendTo("#" + name + " select");
				$("#" + name + "_count").text("(" + $("#" + name + " select option").length + ")");
			};
		})
	}

	//-->
</script>
<div class="panel panel-default ">
	<div class="panel-heading clearfix">
		<div class="pull-left">
			<label>
				<input class="ace"  type="radio" id="rb_company" name="type" value="company" >
				<span class="lbl">公司</span> </label>
			<label>
				<input  class="ace"  type="radio" id="rb_rank" name="type" value="rank">
				<span class="lbl">职级</span> </label>
			<label>
				<input  class="ace"  type="radio" id="rb_position" name="type" value="position">
				<span class="lbl">职位</span> </label>
		</div>
		<div class="pull-right">
			<a  onclick="save();" class="btn btn-sm btn-primary">确定</a>
			<a  onclick="myclose();" class="btn btn-sm btn-primary">关闭</a>
		</div>
	</div>
	<div class="panel-body">
		<div class="col-28 pull-left">
			<div class="">
				<b>地址簿</b>
			</div>
			<div class="popup_tree_menu" >
				<div id="company" class="display-none" style="height:200px;">
					<?php echo ($list_company); ?>
				</div>
				<div id="rank" class="display-none" style="height:200px;">
					<?php echo ($list_rank); ?>
				</div>
				<div id="position" class="display-none" style="height:200px;">
					<?php echo ($list_position); ?>
				</div>
				<div id="personal" class="display-none" style="height:200px;">
					<ul class="tree_menu">
						<?php if(is_array($list_personal)): $i = 0; $__LIST__ = $list_personal;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li>
								<a class="" node="<?php echo ($key); ?>"><i class="icon level1"></i><span><?php echo ($vo); ?></span></a>
							</li><?php endforeach; endif; else: echo "" ;endif; ?>
					</ul>
				</div>
			</div>
			<div>
				<div id="addr_list" style="width:100%;height:210px;"></div>
			</div>
		</div>
		<div class="col-34 pull-right">
			<div>
				<b style="padding-left: 60px;">审批</b><span id="rc_count"></span>
			</div>
			<div class="clearfix" style="margin-bottom: 15px;">
				<label class="col-4 pull-left text-right" ><a onclick="add_address('rc');" class="btn btn-sm btn-primary"> <i class="fa fa-angle-double-right"></i> </a> </label>
				<div class="col-28 pull-right">
					<div id="rc" style="width:100%;height:130px;overflow:hidden">
						<select size="6" style="height:100%;width:100%;"></select>
					</div>
				</div>
			</div>

			<div>
				<b  style="padding-left: 60px;">协商</b><span id="cc_count"></span>
			</div>
			<div class="clearfix" style="margin-bottom: 15px;">
				<label class="col-4 pull-left text-right" ><a onclick="add_address('cc');" class="btn btn-sm btn-primary"> <i class="fa fa-angle-double-right"></i></a></label>
				<div class="col-28 pull-right">
					<div id="cc" style="width:100%;height:130px;overflow:hidden">
						<select size="6" style="height:100%;width:100%;"></select>
					</div>
				</div>
			</div>
			<div>
				<b  style="padding-left: 60px;">抄送</b><span id="cc_count"></span>
			</div>
			<div class="clearfix">
				<label class="col-4 pull-left text-right" ><a onclick="add_address('bcc');" class="btn btn-sm btn-primary"> <i class="fa fa-angle-double-right"></i></a></label>
				<div class="col-28 pull-right">
					<div id="bcc" style="width:100%;height:95px;overflow:hidden">
						<select size="6" style="height:100%;width:100%;"></select>
					</div>
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
		

	</body>
</html>