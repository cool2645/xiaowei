# Host: 127.0.0.1  (Version: 5.6.12-log)
# Date: 2015-01-14 16:11:20
# Generator: MySQL-Front 5.3  (Build 1.27)

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

#
# Source for table "think_contact"
#

DROP TABLE IF EXISTS `think_contact`;
CREATE TABLE `think_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '姓名',
  `letter` varchar(50) NOT NULL DEFAULT '' COMMENT '拼音',
  `company` varchar(30) NOT NULL DEFAULT '' COMMENT '公司',
  `dept` varchar(20) NOT NULL DEFAULT '' COMMENT '部门',
  `position` varchar(20) NOT NULL DEFAULT '' COMMENT '职位',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮件',
  `office_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '办公电话',
  `mobile_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '移动电话',
  `website` varchar(50) NOT NULL DEFAULT '' COMMENT '网站',
  `im` varchar(20) NOT NULL DEFAULT '' COMMENT '即时通讯',
  `address` varchar(50) NOT NULL DEFAULT '' COMMENT '地址',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `remark` text COMMENT '备注',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='think_user_info';

#
# Data for table "think_contact"
#

INSERT INTO `think_contact` VALUES (9,'马腾化','MTH','腾讯','CEO','CEO','pony@qq.com','公电话','手机','','','2',1,'',1),(10,'雷军','LJ','小米','CEO','CEO','yyyyy@yy.com','010-12341234','139-1234-1234','www.sohu.com','1234567','',1,'',1),(11,'张三','ZS','张三','IT','CEO','zhang@zhang.com','654','321','','12356','1',1,'',1),(21,'223e23','','','','','abc@sohu.com','23232','','','','',1,'',1),(22,'123151','','222222222222','1231','234','abc@sohu.com','231','234','1231231','234','2342342',1,'123123',1),(23,'1234124123','','123','1231','12','312@sohu.com','2312','312','312','123','11231231',1,'3123',1),(24,'132','','','','','123@13.com','21331','','','','',1,'',1),(25,'A','A','B','C','E','G@QQ.COM','E','F','I','H','J',1,'J',0);

#
# Source for table "think_customer"
#

DROP TABLE IF EXISTS `think_customer`;
CREATE TABLE `think_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '名称',
  `letter` varchar(50) NOT NULL DEFAULT '' COMMENT '拼音',
  `biz_license` varchar(30) NOT NULL DEFAULT '' COMMENT '营业许可',
  `short` varchar(20) NOT NULL DEFAULT '' COMMENT '简称',
  `contact` varchar(20) NOT NULL DEFAULT '' COMMENT '联系人姓名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮件地址',
  `office_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '办公电话',
  `mobile_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '移动电话',
  `fax` varchar(20) NOT NULL DEFAULT '' COMMENT '传真',
  `salesman` varchar(50) NOT NULL DEFAULT '' COMMENT '业务员',
  `im` varchar(20) NOT NULL DEFAULT '' COMMENT '即时通讯',
  `address` varchar(50) NOT NULL DEFAULT '' COMMENT '地址',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `remark` text,
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `payment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

#
# Data for table "think_customer"
#

INSERT INTO `think_customer` VALUES (29,'名称','MC','之间','教程','路线','已经','不敢','手机','重装','因为','聊天','定制',1,'杀杀杀杀杀杀杀杀杀',1,'是'),(30,'名称','MC','是','搜索','是','是','是','','','','','',0,'',0,'是');

#
# Source for table "think_dept"
#

DROP TABLE IF EXISTS `think_dept`;
CREATE TABLE `think_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父级ID',
  `dept_no` varchar(20) NOT NULL DEFAULT '' COMMENT '部门编号',
  `dept_grade_id` int(11) NOT NULL DEFAULT '0' COMMENT '部门等级ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `short` varchar(20) NOT NULL DEFAULT '' COMMENT '简称',
  `sort` varchar(20) NOT NULL DEFAULT '' COMMENT '排序',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

#
# Data for table "think_dept"
#

INSERT INTO `think_dept` VALUES (1,0,'A2',18,'小微企业','小微','','',0),(2,1,'YYB',18,'运营部','运营','5','',0),(3,1,'XXB',18,'IT部','IT','4','',0),(5,1,'ZJB',18,'总经办','总经','1','',0),(6,1,'GLB',18,'管理部','管理','2','',0),(7,1,'XSB',18,'销售部','销售','3','',0),(8,1,'CWB',18,'财务部','财务','2','',0),(21,1,'XSB',18,'采购部','采购','3','',0),(23,6,'HR',16,'人事科','人事','','',0),(24,6,'ZWK',16,'总务科','总务','','',0),(25,8,'KJK',16,'会计科','会计','','',0),(26,8,'JRK',16,'金融科','金融','','',0);

#
# Source for table "think_dept_grade"
#

DROP TABLE IF EXISTS `think_dept_grade`;
CREATE TABLE `think_dept_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grade_no` varchar(10) NOT NULL DEFAULT '' COMMENT '部门级别编码',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `sort` varchar(10) NOT NULL DEFAULT '' COMMENT '排序',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

#
# Data for table "think_dept_grade"
#

INSERT INTO `think_dept_grade` VALUES (13,'DG3','部门','3',0),(16,'DG1','科','1',0),(18,'DG2','部','2',0);

#
# Source for table "think_doc"
#

DROP TABLE IF EXISTS `think_doc`;
CREATE TABLE `think_doc` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `doc_no` varchar(20) NOT NULL DEFAULT '' COMMENT '文档编号',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `content` text NOT NULL COMMENT '内容',
  `folder` int(11) NOT NULL DEFAULT '0' COMMENT '文件夹',
  `add_file` varchar(200) NOT NULL DEFAULT '' COMMENT '附件',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `user_name` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名称',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

#
# Data for table "think_doc"
#

INSERT INTO `think_doc` VALUES (85,'2014-0001','1111111','11111111111111111111',48,'64dd83526bc113639b405d9317ebc2f4;8b2f6f392af9bb2eac66ce4f3532378b;',1,'管理员',1408968417,1415241046,0),(86,'2014-0002','222222222222222222222222','sssssssssssssssssss',48,'4bd485b02a2b6780f86614b48518da06;',1,'管理员',1415241072,0,0);

#
# Source for table "think_duty"
#

DROP TABLE IF EXISTS `think_duty`;
CREATE TABLE `think_duty` (
  `id` smallint(3) NOT NULL AUTO_INCREMENT,
  `duty_no` varchar(10) NOT NULL DEFAULT '' COMMENT '职责编号',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `sort` varchar(20) NOT NULL DEFAULT '' COMMENT '排序',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

#
# Data for table "think_duty"
#

INSERT INTO `think_duty` VALUES (14,'P001','采购员','',0,'采购员'),(15,'S001','业务员','',0,''),(16,'W001','文员','',0,'');

#
# Source for table "think_file"
#

DROP TABLE IF EXISTS `think_file`;
CREATE TABLE `think_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '远程地址',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='文件表';

#
# Data for table "think_file"
#

INSERT INTO `think_file` VALUES (9,'1亟待解决的问题10.30.docx','547c841a224a9.docx','test/','docx','application/vnd.openxmlformats-officedoc',729540,'a3c4db1b9167234ff9556b7ecb332cb8','fcd4ae63816089a83892d5e77ff192d44fd5518b',0,'',1417446425);

#
# Source for table "think_flow"
#

DROP TABLE IF EXISTS `think_flow`;
CREATE TABLE `think_flow` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `doc_no` varchar(20) NOT NULL DEFAULT '' COMMENT '文档编号',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `content` text NOT NULL COMMENT '内容',
  `confirm` varchar(200) NOT NULL DEFAULT '' COMMENT '裁决数据',
  `confirm_name` text NOT NULL COMMENT '裁决显示内容',
  `consult` varchar(200) NOT NULL DEFAULT '' COMMENT '协商数据',
  `consult_name` text NOT NULL COMMENT '协商显示内容',
  `refer` varchar(200) NOT NULL DEFAULT '' COMMENT '抄送数据',
  `refer_name` text NOT NULL COMMENT '抄送显示内容',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '流程类型',
  `add_file` varchar(200) NOT NULL DEFAULT '' COMMENT '附件',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `emp_no` varchar(20) DEFAULT NULL COMMENT '员工编号',
  `user_name` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名称',
  `dept_id` int(11) NOT NULL DEFAULT '0' COMMENT '部门ID',
  `dept_name` varchar(20) NOT NULL DEFAULT '' COMMENT '部门名称',
  `create_date` varchar(10) NOT NULL DEFAULT '' COMMENT '创建日期',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `step` int(11) NOT NULL DEFAULT '0' COMMENT '目前阶段状态',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  FULLTEXT KEY `refer_name` (`refer_name`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8;

#
# Data for table "think_flow"
#

INSERT INTO `think_flow` VALUES (230,'','1111111111111111111111','笑嘻嘻笑嘻嘻系','2001|','\r\n\t\t\t\t\t&lt;span data=&quot;emp_2001&quot; id=&quot;emp_2001&quot;&gt;&lt;nobr&gt;&lt;b title=&quot;总监2001/总监&lt;&gt;&quot;&gt;总监2001/总监&amp;lt;&amp;gt;&lt;/b&gt;&lt;/nobr&gt;&lt;/span&gt;\t\t\t\t','2001|','\r\n\t\t\t\t\t&lt;span data=&quot;emp_2001&quot; id=&quot;emp_2001&quot;&gt;&lt;nobr&gt;&lt;b title=&quot;总监2001/总监&lt;&gt;&quot;&gt;总监2001/总监&amp;lt;&amp;gt;&lt;/b&gt;&lt;/nobr&gt;&lt;/span&gt;\t\t\t\t','2001|','\r\n\t\t\t\t\t&lt;span data=&quot;emp_2001&quot; id=&quot;emp_2001&quot;&gt;&lt;nobr&gt;&lt;b title=&quot;总监2001/总监&lt;&gt;&quot;&gt;总监2001/总监&amp;lt;&amp;gt;&lt;/b&gt;&lt;a class=&quot;del&quot; title=&quot;删除&quot;&gt;&lt;i class=&quot;fa fa-times&quot;&gt;&lt;/i&gt;&lt;/a&gt;&lt;/nobr&gt;&lt;/span&gt;\t\t\t\t','35','',1,NULL,'管理员',0,'小微企业','',1417018157,0,20,0),(231,'2014-11-27','111111111111111','笑嘻嘻笑嘻嘻系','2001|','\r\n\t\t\t\t\t&lt;span data=&quot;emp_2001&quot; id=&quot;emp_2001&quot;&gt;&lt;nobr&gt;&lt;b title=&quot;总监2001/总监&lt;&gt;&quot;&gt;总监2001/总监&amp;lt;&amp;gt;&lt;/b&gt;&lt;/nobr&gt;&lt;/span&gt;\t\t\t\t','2001|','\r\n\t\t\t\t\t&lt;span data=&quot;emp_2001&quot; id=&quot;emp_2001&quot;&gt;&lt;nobr&gt;&lt;b title=&quot;总监2001/总监&lt;&gt;&quot;&gt;总监2001/总监&amp;lt;&amp;gt;&lt;/b&gt;&lt;/nobr&gt;&lt;/span&gt;\t\t\t\t','2001|','\r\n\t\t\t\t\t&lt;span data=&quot;emp_2001&quot; id=&quot;emp_2001&quot;&gt;&lt;nobr&gt;&lt;b title=&quot;总监2001/总监&lt;&gt;&quot;&gt;总监2001/总监&amp;lt;&amp;gt;&lt;/b&gt;&lt;a class=&quot;del&quot; title=&quot;删除&quot;&gt;&lt;i class=&quot;fa fa-times&quot;&gt;&lt;/i&gt;&lt;/a&gt;&lt;/nobr&gt;&lt;/span&gt;\t\t\t\t','35','',1,'admin','管理员',1,'小微企业','',1417018506,0,20,0),(232,'2014-11-27','2222222222222222222','笑嘻嘻笑嘻嘻系','2001|','\r\n\t\t\t\t\t&lt;span data=&quot;emp_2001&quot; id=&quot;emp_2001&quot;&gt;&lt;nobr&gt;&lt;b title=&quot;总监2001/总监&lt;&gt;&quot;&gt;总监2001/总监&amp;lt;&amp;gt;&lt;/b&gt;&lt;/nobr&gt;&lt;/span&gt;\t\t\t\t','2001|','\r\n\t\t\t\t\t&lt;span data=&quot;emp_2001&quot; id=&quot;emp_2001&quot;&gt;&lt;nobr&gt;&lt;b title=&quot;总监2001/总监&lt;&gt;&quot;&gt;总监2001/总监&amp;lt;&amp;gt;&lt;/b&gt;&lt;/nobr&gt;&lt;/span&gt;\t\t\t\t','2001|','\r\n\t\t\t\t\t&lt;span data=&quot;emp_2001&quot; id=&quot;emp_2001&quot;&gt;&lt;nobr&gt;&lt;b title=&quot;总监2001/总监&lt;&gt;&quot;&gt;总监2001/总监&amp;lt;&amp;gt;&lt;/b&gt;&lt;a class=&quot;del&quot; title=&quot;删除&quot;&gt;&lt;i class=&quot;fa fa-times&quot;&gt;&lt;/i&gt;&lt;/a&gt;&lt;/nobr&gt;&lt;/span&gt;\t\t\t\t','35','',1,'admin','管理员',1,'小微企业','',1417018552,0,20,0),(233,'2014-11-27','111111111111111','笑嘻嘻笑嘻嘻系1111111','2001|','\r\n\t\t\t\t\t&lt;span data=&quot;emp_2001&quot; id=&quot;emp_2001&quot;&gt;&lt;nobr&gt;&lt;b title=&quot;总监2001/总监&lt;&gt;&quot;&gt;总监2001/总监&amp;lt;&amp;gt;&lt;/b&gt;&lt;/nobr&gt;&lt;/span&gt;\t\t\t\t','2001|','\r\n\t\t\t\t\t&lt;span data=&quot;emp_2001&quot; id=&quot;emp_2001&quot;&gt;&lt;nobr&gt;&lt;b title=&quot;总监2001/总监&lt;&gt;&quot;&gt;总监2001/总监&amp;lt;&amp;gt;&lt;/b&gt;&lt;/nobr&gt;&lt;/span&gt;\t\t\t\t','2001|','\r\n\t\t\t\t\t&lt;span data=&quot;emp_2001&quot; id=&quot;emp_2001&quot;&gt;&lt;nobr&gt;&lt;b title=&quot;总监2001/总监&lt;&gt;&quot;&gt;总监2001/总监&amp;lt;&amp;gt;&lt;/b&gt;&lt;a class=&quot;del&quot; title=&quot;删除&quot;&gt;&lt;i class=&quot;fa fa-times&quot;&gt;&lt;/i&gt;&lt;/a&gt;&lt;/nobr&gt;&lt;/span&gt;\t\t\t\t','35','',1,'admin','管理员',1,'小微企业','',1417098111,0,20,0),(234,'2014-11-27','2222222222222222222222','笑嘻嘻笑嘻嘻系','2001|','\r\n\t\t\t\t\t<span data=\"emp_2001\" id=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b></nobr></span>\t\t\t\t','2001|','\r\n\t\t\t\t\t<span data=\"emp_2001\" id=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b></nobr></span>\t\t\t\t','2001|','\r\n\t\t\t\t\t<span data=\"emp_2001\" id=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b><a class=\"del\" title=\"删除\"><i class=\"fa fa-times\"></i></a></nobr></span>\t\t\t\t','35','',1,'admin','管理员',1,'小微企业','',1417099018,0,20,0),(235,'2014-11-29','AAAAAAAAAAAAAAAAAAAAAAA','1笑嘻嘻笑嘻嘻系AAAAAAAAA','2001|','\r\n\t\t\t\t\t<span data=\"emp_2001\" id=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b></nobr></span>\t\t\t\t','2001|','\r\n\t\t\t\t\t<span data=\"emp_2001\" id=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b></nobr></span>\t\t\t\t','2001|','\r\n\t\t\t\t\t<span data=\"emp_2001\" id=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b><a class=\"del\" title=\"删除\"><i class=\"fa fa-times\"></i></a></nobr></span>\t\t\t\t','35','',1,'admin','管理员',1,'小微企业','',1417269430,0,20,0),(236,'2014-11-29','11111','笑嘻嘻笑嘻嘻系','2001|','\r\n\t\t\t\t\t<span data=\"emp_2001\" id=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b></nobr></span>\t\t\t\t','2001|','\r\n\t\t\t\t\t<span data=\"emp_2001\" id=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b></nobr></span>\t\t\t\t','2001|','\r\n\t\t\t\t\t<span data=\"emp_2001\" id=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b><a class=\"del\" title=\"删除\"><i class=\"fa fa-times\"></i></a></nobr></span>\t\t\t\t','35','',1,'admin','管理员',1,'小微企业','',1417269860,0,20,0),(237,'2014-11-29','11111','笑嘻嘻笑嘻嘻系','2001|','\r\n\t\t\t\t\t<span data=\"emp_2001\" id=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b></nobr></span>\t\t\t\t','2001|','\r\n\t\t\t\t\t<span data=\"emp_2001\" id=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b></nobr></span>\t\t\t\t','2001|','\r\n\t\t\t\t\t<span data=\"emp_2001\" id=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b><a class=\"del\" title=\"删除\"><i class=\"fa fa-times\"></i></a></nobr></span>\t\t\t\t','35','',1,'admin','管理员',1,'小微企业','',1417270751,0,20,0),(238,'2014-11-30','A1','请假人员，需经过！','2001|','\r\n\t\t\t\t\t<span id=\"emp_2001\" data=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b></nobr></span>\t\t\t\t','2001|','\r\n\t\t\t\t\t<span id=\"emp_2001\" data=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b></nobr></span>\t\t\t\t','2001|','\r\n\t\t\t\t\t<span id=\"emp_2001\" data=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b><a title=\"删除\" class=\"del\"><i class=\"fa fa-times\"></i></a></nobr></span>\t\t\t\t','33','',1,'admin','管理员',1,'小微企业','',1417307295,0,20,0),(239,'2014-11-30','A2','请假人员，需经过！','2001|','\r\n\t\t\t\t\t<span id=\"emp_2001\" data=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b></nobr></span>\t\t\t\t','2001|','\r\n\t\t\t\t\t<span id=\"emp_2001\" data=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b></nobr></span>\t\t\t\t','2001|','\r\n\t\t\t\t\t<span id=\"emp_2001\" data=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b><a title=\"删除\" class=\"del\"><i class=\"fa fa-times\"></i></a></nobr></span>\t\t\t\t','33','',1,'admin','管理员',1,'小微企业','',1417307374,0,20,0),(240,'2014-11-30','A3','请假人员，需经过！','emp_2001|','\r\n\t\t\t\t\t<span id=\"emp_2001\" data=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b></nobr></span>\t\t\t\t','emp_2001|','\r\n\t\t\t\t\t<span id=\"emp_2001\" data=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b></nobr></span>\t\t\t\t','emp_2001|','\r\n\t\t\t\t\t<span id=\"emp_2001\" data=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b><a title=\"删除\" class=\"del\"><i class=\"fa fa-times\"></i></a></nobr></span>\t\t\t\t','33','',1,'admin','管理员',1,'小微企业','',1417307448,0,20,0),(241,'2014-11-30','A3','请假人员，需经过！','2001|','\r\n\t\t\t\t\t<span id=\"emp_2001\" data=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b></nobr></span>\t\t\t\t','2001|','\r\n\t\t\t\t\t<span id=\"emp_2001\" data=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b></nobr></span>\t\t\t\t','2001|','\r\n\t\t\t\t\t<span id=\"emp_2001\" data=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b><a title=\"删除\" class=\"del\"><i class=\"fa fa-times\"></i></a></nobr></span>\t\t\t\t','33','',1,'admin','管理员',1,'小微企业','',1417307457,0,20,0),(242,'2014-11-30','A4','请假人员，需经过！','2001|','\r\n\t\t\t\t\t<span id=\"emp_2001\" data=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b></nobr></span>\t\t\t\t','2001|','\r\n\t\t\t\t\t<span id=\"emp_2001\" data=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b></nobr></span>\t\t\t\t','2001|','\r\n\t\t\t\t\t<span id=\"emp_2001\" data=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b><a title=\"删除\" class=\"del\"><i class=\"fa fa-times\"></i></a></nobr></span>\t\t\t\t','33','',1,'admin','管理员',1,'小微企业','',1417308077,0,20,0),(243,'2014-11-30','a5','请假人员，需经过！','2001|','\r\n\t\t\t\t\t\r\n\t\t\t\t\t\r\n\t\t\t\t\t<span id=\"emp_2001\" data=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b></nobr></span>\t\t\t\t\t\t\t\t\t\t\t\t','2001|','\r\n\t\t\t\t\t\r\n\t\t\t\t\t\r\n\t\t\t\t\t<span id=\"emp_2001\" data=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b></nobr></span>\t\t\t\t\t\t\t\t\t\t\t\t','2001|','\r\n\t\t\t\t\t\r\n\t\t\t\t\t\r\n\t\t\t\t\t<span id=\"emp_2001\" data=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b></nobr></span>\t\t\t\t\t\t\t\t\t\t\t\t','33','',1,'admin','管理员',1,'小微企业','',1417308866,1417309037,20,0);

#
# Source for table "think_flow_log"
#

DROP TABLE IF EXISTS `think_flow_log`;
CREATE TABLE `think_flow_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flow_id` int(11) NOT NULL DEFAULT '0' COMMENT '流程ID',
  `emp_no` varchar(20) NOT NULL DEFAULT '' COMMENT '员工编号',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(20) DEFAULT '' COMMENT '用户名称',
  `step` int(11) NOT NULL DEFAULT '0' COMMENT '当前步骤',
  `result` int(11) DEFAULT NULL COMMENT '审批结果',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `comment` text COMMENT '意见',
  `is_read` tinyint(3) NOT NULL DEFAULT '0' COMMENT '已读',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=325 DEFAULT CHARSET=utf8;

#
# Data for table "think_flow_log"
#

INSERT INTO `think_flow_log` VALUES (312,230,'2001',42,'总监2001',21,NULL,1417018157,0,NULL,0),(313,231,'2001',42,'总监2001',21,NULL,1417018506,0,NULL,0),(314,232,'2001',42,'总监2001',21,NULL,1417018552,0,NULL,0),(315,233,'2001',42,'总监2001',21,NULL,1417098111,0,NULL,0),(316,234,'2001',42,'总监2001',21,NULL,1417099018,0,NULL,0),(317,235,'2001',42,'总监2001',21,NULL,1417269430,0,NULL,0),(318,236,'2001',42,'总监2001',21,NULL,1417269861,0,NULL,0),(319,237,'2001',42,'总监2001',21,NULL,1417270751,0,NULL,0),(320,238,'2001',42,'总监2001',21,NULL,1417307295,0,NULL,0),(321,239,'2001',42,'总监2001',21,NULL,1417307374,0,NULL,0),(322,241,'2001',42,'总监2001',21,NULL,1417307457,0,NULL,0),(323,242,'2001',42,'总监2001',21,NULL,1417308077,0,NULL,0),(324,243,'2001',42,'总监2001',21,NULL,1417309037,0,NULL,0);

#
# Source for table "think_flow_type"
#

DROP TABLE IF EXISTS `think_flow_type`;
CREATE TABLE `think_flow_type` (
  `id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(20) NOT NULL DEFAULT '' COMMENT '分组',
  `doc_no_format` varchar(50) NOT NULL DEFAULT '' COMMENT '文档编码格式',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `short` varchar(20) NOT NULL DEFAULT '' COMMENT '简称',
  `content` text NOT NULL COMMENT '内容',
  `confirm` varchar(100) NOT NULL DEFAULT '' COMMENT '裁决数据',
  `confirm_name` text NOT NULL COMMENT '裁决显示内容',
  `consult` varchar(100) NOT NULL DEFAULT '' COMMENT '协商数据',
  `consult_name` text NOT NULL COMMENT '协商显示内容',
  `refer` varchar(100) NOT NULL DEFAULT '' COMMENT '抄送数据',
  `refer_name` text NOT NULL COMMENT '抄送显示内容',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_edit` tinyint(3) NOT NULL DEFAULT '0' COMMENT '可编辑标记',
  `is_lock` tinyint(3) NOT NULL DEFAULT '0' COMMENT '锁定标记',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `request_duty` int(11) DEFAULT NULL,
  `report_duty` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

#
# Data for table "think_flow_type"
#

INSERT INTO `think_flow_type` VALUES (8,'69','{DEPT}{SHORT}{YYYY}-{###}','费用报销单','FY','<table border=\"1\" style=\"width:100%;\">\r\n\t<tbody>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<span>部????门</span> \r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t{DEPT}<span><br />\r\n</span> \r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<span>使用人</span> \r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<span>12312 </span>\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<span>通讯工具类别</span> \r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<span>（?）固定电话??（?）移动电话??（?）其他</span> \r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<span>号??码</span> \r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<span>1231231123 </span>\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<span>费用（合计）</span> \r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<span>123123 </span>\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<span>人民币（大写）123123</span>\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<span>123123 </span>\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<span>费用明细</span> \r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"5\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<span><br />\r\n</span> \r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t</tbody>\r\n</table>','emp_2001|','<span data=\"emp_2001\" id=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b></nobr></span>','emp_2001|','<span data=\"emp_2001\" id=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b></nobr></span>','emp_2001|','<span data=\"emp_2001\" id=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b><a class=\"del\" title=\"删除\"><i class=\"fa fa-times\"></i></a></nobr></span>',1391697983,1413296677,1,1,0,0,14,15),(18,'72','{DEPT}{SHORT}{YYYY}-{###}','通讯费用报销单','通讯','<table border=\"1\" style=\"width:100%;\">\r\n\t<tbody>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<span>部&nbsp;&nbsp;&nbsp;&nbsp;门</span>\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t{DEPT}<span><br />\r\n</span>\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<span>使用人</span>\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<span><br />\r\n</span>\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<span>通讯工具类别</span>\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<span>（&nbsp;）固定电话&nbsp;&nbsp;（&nbsp;）移动电话&nbsp;&nbsp;（&nbsp;）其他</span>\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<span>号&nbsp;&nbsp;码</span>\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<span><br />\r\n</span>\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<span>费用（合计）</span>\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<span><br />\r\n</span>\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<span>人民币（大写）</span>\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<span><br />\r\n</span>\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<span>费用明细</span>\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"5\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<span><br />\r\n</span>\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t</tbody>\r\n</table>','','','dept_10|','<span data=\"dept_10\" id=\"dept_10\"><nobr><b title=\"会计科\">会计科</b></nobr></span>','emp_2001|emp_2003|emp_1001|','<span data=\"emp_2001\" id=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b><a class=\"del\" title=\"删除\"><i class=\"icon-remove\"></i></a></nobr></span><span data=\"emp_2003\" id=\"emp_2003\"><nobr><b title=\"总监2003/总监<>\">总监2003/总监&lt;&gt;</b><a class=\"del\" title=\"删除\"><i class=\"icon-remove\"></i></a></nobr></span><span data=\"emp_1001\" id=\"emp_1001\"><nobr><b title=\"总经理1001/总经理<>\">总经理1001/总经理&lt;&gt;</b><a class=\"del\" title=\"删除\"><i class=\"icon-remove\"></i></a></nobr></span>',1391697983,1401184122,1,1,0,0,NULL,NULL),(19,'72','{DEPT}{SHORT}{YYYY}-{###}','招待费用报销单','招待','<table border=\"1\">\r\n\t<tbody>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t姓&nbsp;&nbsp;&nbsp;&nbsp;名\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"4\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t职务\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"4\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"4\" rowspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t招待事由\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"9\" rowspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td rowspan=\"11\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t附件\r\n\t\t\t\t</p>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t张\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t部&nbsp;&nbsp;&nbsp;门\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"10\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t招待对象\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"5\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t招待人数\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"7\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t客人&nbsp;&nbsp;&nbsp;人，陪同&nbsp;&nbsp;&nbsp;人\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t备注\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"6\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td rowspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t日&nbsp;&nbsp;&nbsp;期\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\" rowspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t招待地点\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\" rowspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t餐饮费\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\" rowspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t住宿费\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\" rowspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t礼品礼金\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\" rowspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t其他费用\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"12\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t金额合计\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t十\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t万\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t千\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t百\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t十\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t元\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t角\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t分\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"3\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t金额\r\n\t\t\t\t</p>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t（大写）\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"9\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t合计\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t财务审批\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t部门主管审批\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"5\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t财务复核\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"4\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t部门经理审核\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"7\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t经办人签名\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"4\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t报销人签名\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"5\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"4\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"7\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"4\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t</tbody>\r\n</table>','dgp_9_2|dgp_7_3|','<span data=\"dgp_9_2\" id=\"dgp_9_2\"><nobr><b title=\"科-经理\">科-经理</b></nobr><b><i class=\"icon-arrow-right\"></i></b></span><span data=\"dgp_7_3\" id=\"dgp_7_3\"><nobr><b title=\"部-总监\">部-总监</b></nobr></span>','dept_10|','<span data=\"dept_10\" id=\"dept_10\"><nobr><b title=\"会计科\">会计科</b></nobr></span>','','',1391698060,1391699220,1,1,0,0,NULL,NULL),(33,'69','{YYYY}-{M}-{D}','离职申请单','LZ','请假人员，需经过！','dgp_16_8|','<span data=\"dgp_16_8\"><nobr><b title=\"科-A2 - dgp_16_8\">科-A2</b></nobr></span>','','','','',1399709992,1417397463,0,0,0,0,14,15),(34,'69','{YYYY}-{M}-{D}','个人请假单','QJ','请假申请样式','emp_2001|','<span data=\"emp_2001\" id=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b></nobr></span>','emp_2001|','<span data=\"emp_2001\" id=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b></nobr></span>','emp_2001|','<span data=\"emp_2001\" id=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b><a class=\"del\" title=\"删除\"><i class=\"fa fa-times\"></i></a></nobr></span>',1401288825,1413296655,1,1,0,0,14,14),(35,'69','{YYYY}-{M}-{D}','调薪申请单','TX','笑嘻嘻笑嘻嘻系','emp_2001|','<span data=\"emp_2001\" id=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b></nobr></span>','emp_2001|','<span data=\"emp_2001\" id=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b></nobr></span>','emp_2001|','<span data=\"emp_2001\" id=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b><a class=\"del\" title=\"删除\"><i class=\"fa fa-times\"></i></a></nobr></span>',1408251287,1412776203,0,1,0,0,15,14),(36,'69','{YYYY}-{M}-{D}','外出申请','WC','123','emp_2001|','<span data=\"emp_2001\" id=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b></nobr></span>','emp_2001|','<span data=\"emp_2001\" id=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b></nobr></span>','emp_2001|','<span data=\"emp_2001\" id=\"emp_2001\"><nobr><b title=\"总监2001/总监<>\">总监2001/总监&lt;&gt;</b><a class=\"del\" title=\"删除\"><i class=\"fa fa-times\"></i></a></nobr></span>',1412777631,1413296642,0,1,0,0,14,14),(37,'69','BUG','表格测试BUG','BUG','<p>\r\n\t你在干什么那？\r\n</p>\r\n<p>\r\n\t你在干什么那？\r\n</p>\r\n<p>\r\n\t你在干什么那？\r\n</p>\r\n<p>\r\n\t你在干什么那？\r\n</p>\r\n<p>\r\n\t你在干什么那？\r\n</p>\r\n<p>\r\n\t<br />\r\n</p>','','','','','','',1413531766,0,0,0,0,0,14,14);

#
# Source for table "think_info"
#

DROP TABLE IF EXISTS `think_info`;
CREATE TABLE `think_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_no` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `folder` int(11) NOT NULL DEFAULT '0',
  `is_sign` tinyint(3) DEFAULT '0',
  `is_public` tinyint(3) DEFAULT NULL,
  `scope_user_id` text,
  `scope_user_name` text,
  `add_file` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `dept_name` varchar(20) DEFAULT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;

#
# Data for table "think_info"
#

INSERT INTO `think_info` VALUES (109,'2014-0001','白斑病白斑病白斑病白斑病吧','1111111111AAAAAAAAAA',66,1,NULL,'dept_1,','小微企业|dept_1;','MDAwMDAwMDAwMIO3j2expKJu;MDAwMDAwMDAwMIW0c3M;',1,'管理员',1,'小微企业',1417403209,1417533507,0),(110,'2014-0002','滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答答','1111111111111111111',66,1,NULL,'','','',1,'管理员',1,'小微企业',1417527929,0,0),(111,'2014-0003','滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答答','1111111111111111111',66,1,NULL,'','','',1,'管理员',1,'小微企业',1417528069,0,0),(112,'2014-0004','烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦','水水水水水水水水水水水水水水水水水水水',66,0,NULL,'','','',1,'管理员',1,'小微企业',1417528389,0,0),(113,'2014-0005','烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦','水水水水水水水水水水水水水水水水水水水',66,0,NULL,'','','',1,'管理员',1,'小微企业',1417528412,0,0),(114,'2014-0006','水水水水水水水水水水水水水水水水水水水','水水水水水水水水',66,0,NULL,'','','',1,'管理员',1,'小微企业',1417528621,0,0),(115,'2014-0007','踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩','踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩',66,1,1,'','','',1,'管理员',1,'小微企业',1417529442,1417530214,0);

#
# Source for table "think_info_scope"
#

DROP TABLE IF EXISTS `think_info_scope`;
CREATE TABLE `think_info_scope` (
  `info_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `info_id` (`info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_info_scope"
#

INSERT INTO `think_info_scope` VALUES (109,1),(109,42),(109,43),(109,44),(109,48),(109,49),(109,50),(109,51),(109,52),(109,55),(109,56),(109,57),(109,58),(109,59),(109,60),(109,61),(109,62),(109,65),(109,66),(109,67);

#
# Source for table "think_info_sign"
#

DROP TABLE IF EXISTS `think_info_sign`;
CREATE TABLE `think_info_sign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `info_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(20) NOT NULL,
  `is_sign` tinyint(3) NOT NULL DEFAULT '0',
  `sign_time` int(11) unsigned DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `dept_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

#
# Data for table "think_info_sign"
#

INSERT INTO `think_info_sign` VALUES (71,109,1,'管理员',1,1417533958,NULL,NULL);

#
# Source for table "think_mail"
#

DROP TABLE IF EXISTS `think_mail`;
CREATE TABLE `think_mail` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `folder` int(11) NOT NULL,
  `mid` varchar(200) DEFAULT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `add_file` varchar(200) DEFAULT NULL,
  `from` varchar(2000) DEFAULT NULL,
  `to` varchar(2000) DEFAULT NULL,
  `reply_to` varchar(2000) DEFAULT NULL,
  `cc` varchar(2000) DEFAULT NULL,
  `read` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=2054 DEFAULT CHARSET=utf8;

#
# Data for table "think_mail"
#


#
# Source for table "think_mail_account"
#

DROP TABLE IF EXISTS `think_mail_account`;
CREATE TABLE `think_mail_account` (
  `id` mediumint(6) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mail_name` varchar(50) NOT NULL,
  `pop3svr` varchar(50) NOT NULL,
  `smtpsvr` varchar(50) NOT NULL,
  `mail_id` varchar(50) NOT NULL,
  `mail_pwd` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='think_user_info';

#
# Data for table "think_mail_account"
#


#
# Source for table "think_mail_organize"
#

DROP TABLE IF EXISTS `think_mail_organize`;
CREATE TABLE `think_mail_organize` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `sender_check` int(11) NOT NULL,
  `sender_option` int(11) NOT NULL,
  `sender_key` varchar(50) NOT NULL,
  `domain_check` int(11) NOT NULL DEFAULT '0',
  `domain_option` int(11) NOT NULL,
  `domain_key` varchar(50) NOT NULL,
  `recever_check` int(11) NOT NULL,
  `recever_option` int(11) NOT NULL,
  `recever_key` varchar(50) NOT NULL,
  `title_check` int(11) NOT NULL,
  `title_option` int(11) NOT NULL,
  `title_key` varchar(50) NOT NULL,
  `to` int(11) NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

#
# Data for table "think_mail_organize"
#

INSERT INTO `think_mail_organize` VALUES (18,0,0,1,1,'小微',0,1,'',0,1,'',0,1,'',0,0),(19,1,0,1,1,'1111',0,1,'',0,1,'',0,1,'',31,0);

#
# Source for table "think_message"
#

DROP TABLE IF EXISTS `think_message`;
CREATE TABLE `think_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `add_file` varchar(200) DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `sender_name` varchar(20) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `receiver_name` varchar(20) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `is_del` tinyint(3) DEFAULT '0',
  `is_read` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_message"
#


#
# Source for table "think_node"
#

DROP TABLE IF EXISTS `think_node`;
CREATE TABLE `think_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `url` varchar(200) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `sub_folder` varchar(20) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `sort` varchar(20) DEFAULT NULL,
  `pid` smallint(6) unsigned NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  `badge_function` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`is_del`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8;

#
# Data for table "think_node"
#

INSERT INTO `think_node` VALUES (84,'管理','User/index','fa fa-cogs','','','999',0,0,NULL),(85,'邮件','Mail/index','fa fa-envelope-o bc-mail','','','1',0,0,NULL),(87,'审批','Flow/index','fa fa-pencil bc-flow','','','2',0,0,NULL),(88,'信息','Info/index##','fa fa-file-o','InfoFolder','','4',0,0,NULL),(91,'日程','Schedule/index','fa fa-calendar bc-personal-schedule','','','9',198,0,NULL),(94,'职位','Position/index',NULL,NULL,'','',1,0,NULL),(100,'写信','Mail/add',NULL,'','','1',85,0,NULL),(101,'收件箱','Mail/folder?fid=inbox','bc-mail-inbox','','','3',85,0,NULL),(102,'邮件设置','',NULL,NULL,NULL,'9',85,0,NULL),(104,'垃圾箱','Mail/folder?fid=spambox','','','','5',85,0,NULL),(105,'发件箱','Mail/folder?fid=outbox','','','','6',85,0,NULL),(106,'已删除','Mail/folder?fid=delbox','','','','4',85,0,NULL),(107,'草稿箱','Mail/folder?fid=darftbox','','','','7',85,0,NULL),(108,'邮件帐户设置','MailAccount/index',NULL,'','','1',102,0,NULL),(110,'公司信息管理','',NULL,NULL,'','1',84,0,NULL),(112,'权限管理','',NULL,NULL,'','3',84,0,NULL),(113,'系统设定','',NULL,NULL,'','4',84,0,NULL),(114,'系统参数设置','SystemConfig/index','','','','1',113,0,NULL),(115,'组织图','Dept/index','','','','1',110,0,NULL),(116,'员工登记','User/index',NULL,'','','5',110,0,NULL),(118,'权限组管理','Role/index','','','','1',112,0,NULL),(119,'权限设置','Role/node','','','','2',112,0,NULL),(120,'权限分配','Role/user','','','','3',112,0,NULL),(121,'菜单管理','Node/index','','','','1',113,0,NULL),(122,'职级','Rank/index',NULL,'','','3',110,0,NULL),(123,'职位','Position/index',NULL,'','','2',110,0,NULL),(124,'文件夹设置','MailFolder/index',NULL,'','','2',102,0,NULL),(125,'联系人','Contact/index','','','','1',198,0,NULL),(126,'信息搜索','Info/index','','','','1',88,0,NULL),(143,'邮件分类','MailOrganize/index',NULL,'','','',102,0,NULL),(144,'发起','Flow/index','','','','1',87,0,NULL),(146,'流程管理','FlowType/index','','','','9',87,0,NULL),(147,'待办','Flow/folder?fid=confirm','bc-flow-confirm','','','2',87,0,NULL),(148,'办理','Flow/folder?fid=finish','','','','5',87,0,NULL),(149,'草稿','Flow/folder?fid=darft','','','','6',87,0,NULL),(150,'提交','Flow/folder?fid=submit','','','','4',87,0,NULL),(152,'待办','Todo/index','fa fa-tasks bc-personal-todo','','','9',198,0,NULL),(153,'部门级别','DeptGrade/index','','','','4',110,0,NULL),(156,'客户','Customer/index',NULL,'','','2',157,0,NULL),(157,'通讯录','Staff/index','fa fa-group','','','7',0,0,NULL),(158,'供应商','Supplier/index',NULL,'','','3',157,0,NULL),(169,'职员','Staff/index',NULL,'','','',157,0,NULL),(177,'我的文件夹','##mail','bc-mail-myfolder','MailFolder','','8',85,0,NULL),(184,'流程分组','FlowType/tag_manage','','','','8',87,0,NULL),(185,'收到','Flow/folder?fid=receive','bc-flow-receive','','','2',87,0,NULL),(189,'信息分类','InfoFolder/index','','','','C1',88,0,NULL),(190,'消息','Message/index','fa fa-inbox bc-message','','','99',198,0,NULL),(191,'用户设置','','','','','',198,0,NULL),(192,'用户资料','Profile/index','','','','',191,0,NULL),(193,'修改密码','Profile/password','','','','',191,0,NULL),(194,'用户设置','UserConfig/index','','','','999',191,0,NULL),(198,'个人','Contact/index','fa fa-user bc-personal','','','9',0,0,NULL),(205,'业务角色管理','Duty/index','','','','1',112,0,NULL),(206,'业务权限分配','Role/duty','','','','3',112,0,NULL),(214,'记账','Finance/index','fa fa-jpy','','','A1',217,0,NULL),(216,'日报','WorkLog/index','fa fa-book','','','6',217,0,NULL),(217,'工作','WorkLog/index','fa fa-book','','','6',0,0,NULL),(219,'我的信息','Info/my_info','','','','B1',88,0,NULL),(220,'我的签收','Info/my_sign','','','','B2',88,0,NULL);

#
# Source for table "think_position"
#

DROP TABLE IF EXISTS `think_position`;
CREATE TABLE `think_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position_no` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `sort` varchar(10) NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

#
# Data for table "think_position"
#

INSERT INTO `think_position` VALUES (1,'011','主管','5',0),(2,'04','经理','4',0),(3,'03','总监','3',0),(4,'02','副总','2',0),(5,'01','总经理','1',0),(6,'06','助理','6',0),(8,'A1','A2','',0);

#
# Source for table "think_push"
#

DROP TABLE IF EXISTS `think_push`;
CREATE TABLE `think_push` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `data` text NOT NULL,
  `status` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2680 DEFAULT CHARSET=utf8;

#
# Data for table "think_push"
#

INSERT INTO `think_push` VALUES (2667,42,'',1,1417018157,'收到新的流程'),(2668,42,'',1,1417018506,'收到新的流程'),(2669,42,'',1,1417018552,'收到新的流程'),(2670,42,'',1,1417098111,'收到新的流程'),(2671,42,'',1,1417099018,'收到新的流程'),(2672,42,'',1,1417269430,'收到新的流程'),(2673,42,'',1,1417269861,'收到新的流程'),(2674,42,'',1,1417270751,'收到新的流程'),(2675,42,'',1,1417307295,'收到新的流程'),(2676,42,'',1,1417307374,'收到新的流程'),(2677,42,'',1,1417307457,'收到新的流程'),(2678,42,'',1,1417308077,'收到新的流程'),(2679,42,'',1,1417309037,'收到新的流程');

#
# Source for table "think_rank"
#

DROP TABLE IF EXISTS `think_rank`;
CREATE TABLE `think_rank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rank_no` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `sort` varchar(10) NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Data for table "think_rank"
#

INSERT INTO `think_rank` VALUES (1,'RG40','部长','1',0),(2,'RG30','科长','2',0),(3,'RG20','主管','3',0),(4,'RG10','助理','4',0),(5,'RG00','总经理','0',0),(6,'RG401','部长1','1',0);

#
# Source for table "think_role"
#

DROP TABLE IF EXISTS `think_role`;
CREATE TABLE `think_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `pid` smallint(6) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `sort` varchar(20) DEFAULT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `ename` (`sort`),
  KEY `status` (`is_del`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

#
# Data for table "think_role"
#

INSERT INTO `think_role` VALUES (1,'公司管理员',0,'','1',1208784792,1368507168,0),(2,'基本权限',0,'','2',1215496283,1368507164,0),(7,'领导',0,'','2',1254325787,1401288337,0);

#
# Source for table "think_role_duty"
#

DROP TABLE IF EXISTS `think_role_duty`;
CREATE TABLE `think_role_duty` (
  `role_id` smallint(6) unsigned NOT NULL,
  `duty_id` smallint(6) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_role_duty"
#

INSERT INTO `think_role_duty` VALUES (1,15),(7,14),(1,14),(7,15),(2,14),(2,15);

#
# Source for table "think_role_node"
#

DROP TABLE IF EXISTS `think_role_node`;
CREATE TABLE `think_role_node` (
  `role_id` int(11) NOT NULL,
  `node_id` int(11) NOT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `read` tinyint(1) DEFAULT NULL,
  `write` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_role_node"
#

INSERT INTO `think_role_node` VALUES (2,136,NULL,NULL,NULL),(2,135,NULL,NULL,NULL),(1,94,NULL,NULL,NULL),(1,97,NULL,NULL,NULL),(1,98,NULL,NULL,NULL),(1,99,NULL,NULL,NULL),(1,69,NULL,NULL,NULL),(1,6,NULL,NULL,NULL),(1,2,NULL,NULL,NULL),(1,7,NULL,NULL,NULL),(1,131,1,1,1),(1,130,NULL,NULL,NULL),(1,133,NULL,NULL,NULL),(1,132,NULL,NULL,NULL),(1,189,1,1,1),(2,125,1,1,1),(1,135,NULL,NULL,NULL),(1,136,NULL,NULL,NULL),(1,117,NULL,NULL,NULL),(1,134,NULL,NULL,NULL),(2,194,1,1,1),(2,103,NULL,NULL,NULL),(2,126,1,1,1),(2,88,1,1,1),(2,133,NULL,NULL,NULL),(2,130,NULL,NULL,NULL),(2,158,1,1,1),(7,124,NULL,NULL,NULL),(7,108,NULL,NULL,NULL),(7,104,NULL,NULL,NULL),(7,107,NULL,NULL,NULL),(7,106,NULL,NULL,NULL),(7,105,NULL,NULL,NULL),(7,101,NULL,NULL,NULL),(7,100,NULL,NULL,NULL),(7,125,NULL,NULL,NULL),(1,152,1,1,1),(2,134,NULL,NULL,NULL),(2,156,1,1,1),(2,169,1,1,1),(2,132,NULL,NULL,NULL),(2,148,NULL,NULL,NULL),(2,143,1,1,1),(2,102,NULL,NULL,NULL),(2,103,NULL,NULL,NULL),(2,157,1,1,1),(1,91,1,1,1),(2,177,1,1,1),(2,107,NULL,NULL,NULL),(2,105,NULL,NULL,NULL),(2,104,NULL,NULL,NULL),(2,106,NULL,NULL,NULL),(2,103,NULL,NULL,NULL),(2,109,NULL,NULL,NULL),(2,101,NULL,NULL,NULL),(2,100,NULL,NULL,NULL),(2,85,1,1,1),(2,150,NULL,NULL,NULL),(2,185,NULL,NULL,NULL),(2,147,NULL,NULL,NULL),(2,144,1,1,1),(2,87,1,1,1),(2,192,1,1,1),(2,193,NULL,NULL,NULL),(2,191,NULL,NULL,NULL),(2,198,1,1,1),(1,117,NULL,NULL,NULL),(1,117,NULL,NULL,NULL),(1,117,NULL,NULL,NULL),(1,117,NULL,NULL,NULL),(1,103,NULL,NULL,NULL),(1,109,NULL,NULL,NULL),(1,117,NULL,NULL,NULL),(1,117,NULL,NULL,NULL),(1,163,NULL,NULL,NULL),(1,158,1,1,1),(1,170,NULL,NULL,NULL),(1,164,NULL,NULL,NULL),(1,121,1,1,1),(1,146,1,1,1),(1,114,1,1,1),(1,108,1,1,1),(1,113,NULL,NULL,NULL),(1,155,NULL,NULL,NULL),(1,154,1,1,1),(1,206,NULL,NULL,NULL),(1,120,NULL,NULL,NULL),(1,119,NULL,NULL,NULL),(1,118,1,1,1),(1,205,1,1,1),(1,111,NULL,NULL,NULL),(1,112,NULL,NULL,NULL),(1,116,1,1,1),(1,153,1,1,1),(1,122,1,1,1),(1,150,NULL,NULL,NULL),(1,149,NULL,NULL,NULL),(1,148,NULL,NULL,NULL),(1,147,NULL,NULL,NULL),(1,144,1,1,1),(1,143,1,1,1),(1,102,NULL,NULL,NULL),(1,177,1,1,1),(1,107,NULL,NULL,NULL),(1,105,NULL,NULL,NULL),(1,104,NULL,NULL,NULL),(1,106,NULL,NULL,NULL),(1,101,NULL,NULL,NULL),(1,156,1,1,1),(1,168,NULL,NULL,NULL),(1,162,NULL,NULL,NULL),(1,166,NULL,NULL,NULL),(1,161,NULL,NULL,NULL),(1,171,NULL,NULL,NULL),(1,125,1,1,1),(1,165,NULL,NULL,NULL),(1,174,NULL,NULL,NULL),(1,172,NULL,NULL,NULL),(1,173,NULL,NULL,NULL),(1,160,NULL,NULL,NULL),(1,175,NULL,NULL,NULL),(1,169,1,1,1),(1,185,NULL,NULL,NULL),(1,184,NULL,NULL,NULL),(1,176,NULL,NULL,NULL),(1,123,1,1,1),(1,194,NULL,NULL,NULL),(1,193,NULL,NULL,NULL),(1,100,NULL,NULL,NULL),(1,85,1,1,1),(1,87,1,1,1),(1,126,1,1,1),(1,157,1,1,1),(1,167,NULL,NULL,NULL),(1,128,NULL,NULL,NULL),(1,192,NULL,NULL,NULL),(1,191,NULL,NULL,NULL),(1,190,NULL,NULL,NULL),(1,88,1,1,1),(1,115,1,1,1),(1,198,NULL,NULL,NULL),(1,229,NULL,NULL,NULL),(1,228,NULL,NULL,NULL),(1,227,NULL,NULL,NULL),(1,226,NULL,NULL,NULL),(1,225,NULL,NULL,NULL),(1,224,NULL,NULL,NULL),(1,223,NULL,NULL,NULL),(1,222,NULL,NULL,NULL),(1,221,NULL,NULL,NULL),(1,220,NULL,NULL,NULL),(1,219,NULL,NULL,NULL),(1,217,NULL,NULL,NULL),(1,216,1,1,1),(1,214,1,1,1),(1,110,NULL,NULL,NULL),(1,84,1,1,1),(1,124,1,1,1),(2,108,1,1,1),(2,124,1,1,1),(2,149,NULL,NULL,NULL),(2,91,1,1,1),(2,152,1,1,1),(2,190,1,1,1);

#
# Source for table "think_role_user"
#

DROP TABLE IF EXISTS `think_role_user`;
CREATE TABLE `think_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_role_user"
#

INSERT INTO `think_role_user` VALUES (4,'27'),(4,'26'),(5,'31'),(3,'22'),(2,'67'),(1,'4'),(1,'3'),(1,'35'),(1,'36'),(1,'54'),(2,'3'),(1,'53'),(7,'36'),(1,'2'),(2,'66'),(2,'65'),(2,'62'),(2,'2'),(7,'2'),(2,'61'),(2,'60'),(2,'59'),(2,'58'),(2,'57'),(2,'55'),(1,'56'),(2,'52'),(2,'51'),(2,'50'),(2,'49'),(2,'48'),(2,'44'),(2,'43'),(2,'1'),(2,'42'),(1,'1'),(1,'63'),(1,'64'),(2,'41'),(2,'68'),(7,'44'),(7,'42'),(1,'55'),(2,'56');

#
# Source for table "think_schedule"
#

DROP TABLE IF EXISTS `think_schedule`;
CREATE TABLE `think_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '',
  `content` text,
  `location` varchar(50) DEFAULT '',
  `priority` int(11) DEFAULT NULL,
  `actor` varchar(200) DEFAULT '',
  `user_id` int(11) DEFAULT '0',
  `start_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_date` date NOT NULL,
  `end_time` time NOT NULL,
  `add_file` varchar(200) DEFAULT '',
  `is_del` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

#
# Data for table "think_schedule"
#

INSERT INTO `think_schedule` VALUES (70,'111111','22222222222','11111111',3,'',1,'2014-06-02','05:00:00','2014-06-09','05:00:00','',0),(71,'FFFFFFFFFFFFFFFFFFFF','FFFFFFFFFF','',3,'',1,'2014-06-14','05:00:00','2014-06-14','05:00:00','',0),(72,'3333333333333333','3333','333333',3,'',1,'2014-06-02','05:00:00','2014-06-18','05:00:00','',0),(73,'22222222222','111111111111','dd',3,'总监2002/总监|;副总1003/副总|;经理3001/经理|;经理3002/经理|;',1,'2014-07-08','05:00:00','2014-07-01','05:00:00','',0);

#
# Source for table "think_supplier"
#

DROP TABLE IF EXISTS `think_supplier`;
CREATE TABLE `think_supplier` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `letter` varchar(50) DEFAULT '',
  `short` varchar(30) DEFAULT '',
  `account` varchar(20) DEFAULT '',
  `tax_no` varchar(20) DEFAULT '',
  `payment` varchar(20) DEFAULT NULL,
  `contact` varchar(20) NOT NULL DEFAULT '',
  `office_tel` varchar(20) DEFAULT NULL,
  `mobile_tel` varchar(20) DEFAULT '',
  `email` varchar(50) DEFAULT '',
  `im` varchar(20) DEFAULT '',
  `address` varchar(50) DEFAULT '',
  `user_id` int(11) NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  `remark` text,
  `fax` varchar(255) DEFAULT NULL,
  `user_name` varchar(21) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

#
# Data for table "think_supplier"
#

INSERT INTO `think_supplier` VALUES (21,'11111111','','111111111111','1111111111','11111111111','1111111111111111','1111111',NULL,'1111111111111','11111111111','','111111111',1,1,'11111111111111','11111111111',NULL),(22,'1','','2','3','4','5','7','1231231','10','9','12','6',1,1,'13','11',NULL),(23,'234234','','112','312','3123','3123','12',NULL,'312','31','12','3123',1,0,'3123','231',NULL);

#
# Source for table "think_system_config"
#

DROP TABLE IF EXISTS `think_system_config`;
CREATE TABLE `think_system_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `val` varchar(255) DEFAULT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  `sort` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

#
# Data for table "think_system_config"
#

INSERT INTO `think_system_config` VALUES (1,'SYSTEM_NAME','系统名称','小微企业信息化',1,''),(7,'UPLOAD_FILE_TYPE','上传文件类型','doc,docx,xls,xlsx,ppt,pptx,pdf,gif,png,tif,zip,rar,jpg,jpeg,txt',0,NULL),(8,'IS_VERIFY_CODE','验证码','0',0,NULL),(9,'XMK_LEVEL','项目级别1','1',0,'1'),(10,'XMK_LEVEL','项目级别2','2',0,'2'),(11,'XMK_LEVEL','项目级别3','3',0,'3'),(12,'XMK_STATUS','项目状态1','1',0,'1'),(13,'XMK_STATUS','2','2',0,'2'),(14,'XMK_STATUS','3','3',0,'3'),(15,'FINANCE_INCOME_TYPE','办公费','办公费',0,'1'),(16,'FINANCE_INCOME_TYPE','通讯费','通讯费',0,'2'),(17,'FINANCE_PAYMENT_TYPE','办公费','办公费',0,''),(18,'FINANCE_PAYMENT_TYPE','通讯费','通讯费',0,'');

#
# Source for table "think_system_folder"
#

DROP TABLE IF EXISTS `think_system_folder`;
CREATE TABLE `think_system_folder` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `folder` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `admin` varchar(200) NOT NULL,
  `write` varchar(200) NOT NULL,
  `read` varchar(200) NOT NULL,
  `sort` varchar(20) NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  `remark` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

#
# Data for table "think_system_folder"
#

INSERT INTO `think_system_folder` VALUES (44,0,'XmkFolder','1111111111111','微澜企业|dept_1;','','','',0,''),(45,0,'NoticeFolder','公司公告2','总经办|dept_5;总经理1001/总经理|1001;小微企业|dept_1;','','小微企业|dept_1;','',0,''),(46,0,'NoticeFolder','培训通知','人事科|dept_23;','','小微企业|dept_1;','',0,''),(47,0,'NoticeFolder','人事通知','人事科|dept_23;','','小微企业|dept_1;','',0,''),(48,0,'DocFolder','公司规定','总经办|dept_5;小微企业|dept_1;','','小微企业|dept_1;','',0,''),(49,0,'DocFolder','合同管理','总经办|dept_5;','','小微企业|dept_1;','',0,''),(50,0,'DocFolder','财务报表','财务部|dept_8;','','小微企业|dept_1;总监2002/总监|2002;总监2001/总监|2001;总监2003/总监|2003;副总1003/副总|1003;test1/总经理|test1;李白/副总|1002;','',0,''),(51,0,'DocFolder','常用表格','总经办|dept_5;','','小微企业|dept_1;','',0,''),(52,0,'ForumFolder','公司动态','总经办|dept_5;小微企业|dept_1;','小微企业|dept_1;','','',0,''),(53,0,'ForumFolder','兴趣小组','总经办|dept_5;','小微企业|dept_1;','','',0,''),(54,0,'ProductFolder','2014年','','','','1',0,''),(55,0,'ProductFolder','2015年','','','','2',0,''),(56,54,'ProductFolder','2014春装','','','','',0,''),(57,54,'ProductFolder','2014夏装','','','','',0,''),(58,54,'ProductFolder','2014秋装','','','','',0,''),(59,54,'ProductFolder','2014冬装','小微企业|dept_1;','','','',0,''),(60,55,'ProductFolder','2015春装','','','','',0,''),(61,55,'ProductFolder','2015夏装','','','','',0,''),(62,55,'ProductFolder','2015秋装','','','','',0,''),(63,55,'ProductFolder','2015冬装','','','','',0,''),(64,0,'NewsFolder','111111111111','管理员/主管|admin;','','','',0,''),(65,0,'NoticeFolder','公司公告1','总经理1001/总经理|1001;小微企业|dept_1;','','小微企业|dept_1;','',0,''),(66,0,'InfoFolder','公告','管理员/主管|admin;','','','',0,''),(67,0,'InfoFolder','通知','管理员/主管|admin;','','','',0,'');

#
# Source for table "think_system_tag"
#

DROP TABLE IF EXISTS `think_system_tag`;
CREATE TABLE `think_system_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `controller` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sort` varchar(20) NOT NULL,
  `remark` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

#
# Data for table "think_system_tag"
#

INSERT INTO `think_system_tag` VALUES (11,0,'Video','所属科室','11',''),(12,11,'Video','外科系统','12',''),(13,11,'Video','内科系统','13',''),(14,12,'Video','普通外科','14',''),(15,12,'Video','肛肠科','15',''),(16,11,'Video','专科中心','16',''),(17,11,'Video','医技辅助','17',''),(18,12,'Video','肝胆外科','18',''),(19,12,'Video','器官移植','19',''),(20,12,'Video','心血管外科','20',''),(21,12,'Video','显微外科','21',''),(22,12,'Video','胸外科','22',''),(23,12,'Video','泌尿生殖','23',''),(24,12,'Video','神经外科','24',''),(25,12,'Video','烧伤外科','25',''),(26,13,'Video','普通内科','26',''),(27,13,'Video','心血管内科','27',''),(28,13,'Video','呼吸内科','28',''),(29,13,'Video','消化内科','29',''),(30,13,'Video','肾内科','30',''),(31,13,'Video','血液科','31',''),(32,13,'Video','神经内科','32',''),(33,13,'Video','心理、精神科','33',''),(34,13,'Video','内分泌科','34',''),(35,13,'Video','感染传染','35',''),(36,16,'Video','妇产科','36',''),(37,16,'Video','儿科','37',''),(38,16,'Video','口腔科','38',''),(39,16,'Video','骨科','39',''),(40,16,'Video','皮肤病与性病科','40',''),(41,16,'Video','眼科','41',''),(42,16,'Video','耳鼻咽喉科','42',''),(43,16,'Video','肿瘤及核医学','43',''),(44,16,'Video','中医及中西医结合','44',''),(45,16,'Video','麻醉科','45',''),(46,16,'Video','美容整形','46',''),(47,17,'Video','门、急诊，ICU','47',''),(48,17,'Video','医学影像','48',''),(49,17,'Video','护理','49',''),(50,17,'Video','检验科','50',''),(51,17,'Video','康复理疗科','51',''),(52,17,'Video','药剂科','52',''),(53,17,'Video','信息科','53',''),(54,17,'Video','医院管理','54',''),(55,17,'Video','基础教学','55',''),(56,17,'Video','其他','56',''),(57,0,'Customer','123','',''),(58,0,'Supplier','123','',''),(59,0,'Doc','123123','123123',''),(60,0,'Doc','123123','',''),(61,0,'Doc','abc','',''),(62,0,'Customer','2345','',''),(63,0,'Customer','qqqqqq','',''),(64,0,'Customer','22222','',''),(65,0,'Customer','22222','',''),(66,0,'Flow','人事','',''),(67,0,'Flow','IT','',''),(68,0,'Flow','公告','',''),(69,0,'FlowType','人事','1',''),(70,0,'FlowType','行政','2',''),(71,0,'FlowType','采购','3',''),(72,0,'FlowType','出差','4',''),(74,75,'ProductType','红色','',''),(75,0,'ProductType','颜色','',''),(76,75,'ProductType','蓝色','',''),(77,0,'ProductType','面料','',''),(78,77,'ProductType','A','',''),(79,77,'ProductType','B','',''),(80,0,'FlowType','车辆管理','5','');

#
# Source for table "think_system_tag_data"
#

DROP TABLE IF EXISTS `think_system_tag_data`;
CREATE TABLE `think_system_tag_data` (
  `row_id` int(11) NOT NULL DEFAULT '0',
  `tag_id` int(11) NOT NULL DEFAULT '0',
  `controller` varchar(20) NOT NULL DEFAULT '',
  KEY `row_id` (`row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_system_tag_data"
#

INSERT INTO `think_system_tag_data` VALUES (18,58,'Supplier'),(29,14,'Video'),(18,57,'Customer'),(29,46,'Video'),(30,46,'Video'),(30,47,'Video'),(30,56,'Video'),(64,59,'Doc'),(64,60,'Doc'),(64,61,'Doc'),(65,61,'Doc'),(33,14,'Video'),(18,62,'Customer'),(17,66,'Flow'),(18,66,'Flow'),(19,66,'Flow'),(20,66,'Flow'),(21,66,'Flow'),(22,66,'Flow'),(23,66,'Flow'),(17,66,'Flow'),(18,66,'Flow'),(19,66,'Flow'),(20,66,'Flow'),(21,66,'Flow'),(22,66,'Flow'),(23,66,'Flow'),(17,70,'FlowType'),(23,72,'FlowType'),(22,72,'FlowType'),(21,72,'FlowType'),(20,72,'FlowType'),(19,71,'FlowType'),(18,71,'FlowType'),(24,70,'FlowType');

#
# Source for table "think_todo"
#

DROP TABLE IF EXISTS `think_todo`;
CREATE TABLE `think_todo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `end_date` varchar(10) DEFAULT NULL,
  `priority` int(11) NOT NULL,
  `add_file` varchar(200) NOT NULL,
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

#
# Data for table "think_todo"
#

INSERT INTO `think_todo` VALUES (11,'邮件整理时显示名称错误','',1,'2014-05-08',2,'',3,3),(12,'日历今天样式颜色','日历今天样式颜色',1,'2014-05-08',3,'',2,1),(13,'12312','123123',2,'3123123',3,'',1,1),(14,'12312','123123123123123123',2,'3123123',3,'',0,NULL),(15,'待办事项确认','待办事项确认',2,'',3,'',0,NULL),(16,'新建待办事项','123',2,'',3,'',2,3),(17,'新建待办事项1','新建待办事项',2,'2013-09-19',3,'',1,2),(18,'新建待办事项','123',2,'2013-09-19',3,'',1,NULL),(21,'事项优先级低','',1,'2014-05-08',5,'',2,1),(22,'查看服务器是否正常','查看服务器是否正常',1,'2014-05-10',3,'',3,2),(23,'22222222','ssssssss',1,'2014-08-20',3,'8d1f3251d40bc4132d9bd4646eec4ee7;',1,NULL);

#
# Source for table "think_udf_field"
#

DROP TABLE IF EXISTS `think_udf_field`;
CREATE TABLE `think_udf_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `row_type` int(11) NOT NULL,
  `sort` varchar(20) NOT NULL,
  `msg` varchar(50) DEFAULT NULL,
  `control_type` varchar(255) DEFAULT NULL,
  `control_layout` varchar(255) DEFAULT NULL,
  `control_data` varchar(255) DEFAULT NULL,
  `validate` varchar(20) DEFAULT NULL,
  `controller` varchar(20) DEFAULT NULL,
  `is_del` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

#
# Data for table "think_udf_field"
#

INSERT INTO `think_udf_field` VALUES (56,'A11',1,'','','text','3','','','Flow',0),(57,'A2',1,'','','select','4','','','Flow',0),(58,'呵 3 ',1,'','','select','1','','','Flow',0),(59,'A1',33,'','','text','1','','','Flow',0);

#
# Source for table "think_udf_field_data"
#

DROP TABLE IF EXISTS `think_udf_field_data`;
CREATE TABLE `think_udf_field_data` (
  `row_id` int(11) NOT NULL,
  `field_id` varchar(50) NOT NULL,
  `val` varchar(50) DEFAULT NULL,
  `controller` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_udf_field_data"
#

INSERT INTO `think_udf_field_data` VALUES (0,'59','A1','Flow'),(0,'59','A2','Flow'),(0,'59','A3','Flow'),(242,'59','A4','Flow'),(243,'59','a6','Flow');

#
# Source for table "think_user"
#

DROP TABLE IF EXISTS `think_user`;
CREATE TABLE `think_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `emp_no` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(20) NOT NULL,
  `letter` varchar(10) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `rank_id` int(11) NOT NULL,
  `sex` varchar(50) NOT NULL,
  `birthday` date DEFAULT NULL,
  `last_login_ip` varchar(40) DEFAULT NULL,
  `login_count` int(8) DEFAULT NULL,
  `pic` varchar(200) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `duty` varchar(2000) NOT NULL,
  `office_tel` varchar(20) NOT NULL,
  `mobile_tel` varchar(20) NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  `openid` varchar(50) DEFAULT NULL,
  `westatus` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`emp_no`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

#
# Data for table "think_user"
#

INSERT INTO `think_user` VALUES (1,'admin','管理员','GLY','21232f297a57a5a743894a0e4a801fc3',1,1,2,'male','2013-09-18','127.0.0.1',2814,'emp_pic/1.jpeg','smeoa@qq.com','1231254123123','5086-2222-2222','12123123',1222907803,1404047349,0,'1231512315123',1),(41,'2002','总监2002','ZJ','4ba29b9f9e5732ed33761840f4ba6c53',6,3,1,'male','2013-10-30','0.0.0.0',NULL,'','','行政，财务','','',1376896154,1407565312,1,NULL,1),(42,'2001','总监2001','ZJ','d0fb963ff976f9c37fc81fe03c21ea7b',8,3,1,'male','2013-10-10','127.0.0.1',NULL,'emp_pic/42.jpeg','','开发','123','12312312',1380970837,1401287019,0,'12312541231251243123',1),(43,'2003','总监2003','ZJ','a591024321c5e2bdbd23ed35f0574dde',7,3,1,'male','0000-00-00','127.0.0.1',NULL,'emp_pic/43.jpeg','','销售','','',1381035116,1401287063,0,NULL,1),(44,'1001','总经理1001','ZJL','b8c37e33defde51cf91e1e03e51657da',1,5,5,'male','0000-00-00','127.0.0.1',NULL,'','','全面管理','','',1381502796,1401288611,0,NULL,1),(48,'1003','副总1003','FZ','aa68c75c4a77c87f97fb686b2f068676',6,4,1,'female','0000-00-00','0.0.0.0',NULL,'','','销售，运营','','',1381503490,1401286413,0,NULL,1),(49,'3001','经理3001','JL','908c9a564a86426585b29f5335b619bc',24,2,2,'male','2013-10-10','14.104.59.86',NULL,'','','财务','123','12312312',1391694170,1401287097,0,NULL,1),(50,'3002','经理3002','JL','d806ca13ca3449af72a1ea5aedbed26a',23,2,2,'male','2013-10-10','124.127.209.138',NULL,'','','人事','123','12312312',1391694193,1401287121,0,NULL,NULL),(51,'3003','经理3003','JL','a4380923dd651c195b1631af7c829187',25,2,2,'male','2013-10-10','127.0.0.1',NULL,'','','销售-南方区域','123','12312312',1391694198,1401287147,0,NULL,NULL),(52,'3004','经理3004','JL','20479c788fb27378c2c99eadcf207e7f',26,2,2,'male','2013-10-10',NULL,NULL,'','','新产品研发','123','12312312',1391694202,1401287170,0,NULL,NULL),(55,'5001','员工5001','YG','03b264c595403666634ac75d828439bc',24,1,3,'male','2013-10-10','121.10.236.201',NULL,'','','会计','123','12312312',1391694320,1401287296,0,NULL,NULL),(56,'5007','员工5007','YG','351869bde8b9d6ad1e3090bd173f600d',26,1,3,'male','2013-10-10',NULL,NULL,'','','程序员3','123','12312312',1391694335,1401287430,0,NULL,NULL),(57,'5002','员工5002','YG','415585bd389b69659223807d77a96791',24,1,3,'male','2013-10-10',NULL,NULL,'','','出纳','123','12312312',1391694413,1401287322,0,NULL,NULL),(58,'5003','员工5003','YG','240ac9371ec2671ae99847c3ae2e6384',23,1,3,'male','2013-10-10','127.0.0.1',NULL,'','','招聘，薪资管理','123','12312312',1391694420,1401287339,0,NULL,NULL),(59,'5004','员工5004','YG','3202111cf90e7c816a472aaceb72b0df',23,1,3,'male','2013-10-10','127.0.0.1',NULL,'','','负责公司日常采购','123','12312312',1391694427,1401287371,0,NULL,NULL),(60,'5005','员工5005','YG','1d6408264d31d453d556c60fe7d0459e',25,1,3,'male','2013-10-10','127.0.0.1',NULL,'','','程序员1','123','12312312',1391694435,1401287390,0,NULL,NULL),(61,'5006','员工5006','YG','2c27a260f16ad3098393cc529f391f4a',25,1,3,'male','2013-10-10','127.0.0.1',NULL,'','','程序员2','123','12312312',1391694478,1401287410,0,NULL,NULL),(62,'5008','员工5008','YG','b3848d61bbbc6207c6668a8a9e2730ed',26,1,3,'male','2013-10-10','127.0.0.1',NULL,'','','网站编辑，SEO','123','12312312',1391694489,1401287450,0,NULL,NULL),(65,'test1','test1','TEST','db03fa33c1e2ca35794adbb14aebb153',7,5,1,'male','2014-05-07','0.0.0.0',NULL,'','','','','',1399618939,0,0,NULL,0),(66,'test2','test2','TEST','261d684f6b7d9af996a5691e7106075e',2,2,2,'male','2014-05-09','0.0.0.0',NULL,'','','','','',1399618964,0,0,NULL,0),(67,'1002','李白','LB','fba9d88164f3e2d9109ee770223212a0',5,4,1,'male','0000-00-00','0.0.0.0',NULL,'','','','','',1399712207,1401286925,0,NULL,0);

#
# Source for table "think_user_config"
#

DROP TABLE IF EXISTS `think_user_config`;
CREATE TABLE `think_user_config` (
  `id` int(11) NOT NULL DEFAULT '0',
  `home_sort` varchar(255) DEFAULT NULL,
  `list_rows` int(11) DEFAULT '20',
  `readed_info` text,
  `push_web` varchar(255) DEFAULT NULL,
  `push_wechat` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_user_config"
#

INSERT INTO `think_user_config` VALUES (1,'undefined,11,13,|undefined,21,12,',5,'109,112,113,114',NULL,NULL),(49,NULL,20,'54,55,56',NULL,NULL),(50,NULL,20,'54,55,56',NULL,NULL),(51,NULL,20,'54,55,56',NULL,NULL),(52,NULL,20,'54,55,56',NULL,NULL),(53,NULL,20,'54,55,56',NULL,NULL),(54,NULL,20,'54,55,56',NULL,NULL),(55,NULL,20,'54,55,56',NULL,NULL),(56,NULL,20,'54,55,56',NULL,NULL),(57,NULL,20,'54,55,56',NULL,NULL),(58,NULL,20,'54,55,56',NULL,NULL),(59,NULL,20,'54,55,56',NULL,NULL),(60,'undefined,22,13,23,|undefined,12,21,11,',20,'54,55,56',NULL,NULL),(61,NULL,20,'54,55,56',NULL,NULL),(62,NULL,20,'54,55,56',NULL,NULL),(63,NULL,20,'54,55,56',NULL,NULL),(64,NULL,20,'54,55,56',NULL,NULL),(65,NULL,20,'54,55,56',NULL,NULL),(66,'11,12,13,|21,22,23,',20,'54,55,56',NULL,NULL),(67,NULL,20,'54,55,56',NULL,NULL),(68,NULL,20,'54,55,56',NULL,NULL);

#
# Source for table "think_user_folder"
#

DROP TABLE IF EXISTS `think_user_folder`;
CREATE TABLE `think_user_folder` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `folder` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sort` varchar(20) NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  `remark` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

#
# Data for table "think_user_folder"
#

INSERT INTO `think_user_folder` VALUES (31,0,'MailFolder',1,'自定义文件夹1','',0,''),(32,0,'MailFolder',1,'自定义文件夹2','',0,''),(33,0,'MailFolder',1,'自定义文件夹3','',0,'');

#
# Source for table "think_user_tag"
#

DROP TABLE IF EXISTS `think_user_tag`;
CREATE TABLE `think_user_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `controller` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sort` varchar(20) NOT NULL,
  `remark` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

#
# Data for table "think_user_tag"
#

INSERT INTO `think_user_tag` VALUES (21,0,'Contact',1,'123','','');

#
# Source for table "think_user_tag_data"
#

DROP TABLE IF EXISTS `think_user_tag_data`;
CREATE TABLE `think_user_tag_data` (
  `row_id` int(11) NOT NULL DEFAULT '0',
  `tag_id` int(11) NOT NULL DEFAULT '0',
  `controller` varchar(20) NOT NULL DEFAULT '',
  KEY `row_id` (`row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_user_tag_data"
#


#
# Source for table "think_work_log"
#

DROP TABLE IF EXISTS `think_work_log`;
CREATE TABLE `think_work_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(20) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `dept_name` varchar(20) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `content` text,
  `plan` text,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  `add_file` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_work_log"
#


/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
