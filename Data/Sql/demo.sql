# Host: 127.0.0.1  (Version: 5.6.12-log)
# Date: 2015-05-22 11:48:19
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
  `request_duty` int(11) DEFAULT NULL COMMENT '申请权限',
  `report_duty` int(11) DEFAULT NULL COMMENT '报告权限',
  `udf_tpl` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

#
# Data for table "think_flow_type"
#

INSERT INTO `think_flow_type` VALUES (19,'72','{YYYY}-{M}-{D}','招待费用报销单','招待','<table border=\"1\">\r\n\t<tbody>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t姓    名\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"4\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t职务\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"4\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"4\" rowspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t招待事由\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"9\" rowspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td rowspan=\"11\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t附件\r\n\t\t\t\t</p>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t张\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t部   门\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"10\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t招待对象\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"5\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t招待人数\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"7\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t客人   人，陪同   人\r\n\t\t\t\t</p>%0','emp_1001|','<span id=\"emp_1001\" data=\"emp_1001\"><nobr><b title=\"尹瑾柱/总经理<>\">尹瑾柱/总经理&lt;&gt;</b></nobr></span>','','','emp_1002|','<span id=\"emp_1002\" data=\"emp_1002\"><nobr><b title=\"崔美花/部长<>\">崔美花/部长&lt;&gt;</b><a title=\"删除\" class=\"del\"><i class=\"fa fa-times\"></i></a></nobr></span>',1391698060,1432191286,1,1,0,0,14,14,NULL),(33,'69','{YYYY}-{M}-{D}','离职申请单','LZ','<p>\r\n\t<br />\r\n</p>','emp_1001|','<span id=\"emp_1001\" data=\"emp_1001\"><nobr><b title=\"尹瑾柱/总经理<>\">尹瑾柱/总经理&lt;&gt;</b></nobr></span>','','','emp_1002|','<span id=\"emp_1002\" data=\"emp_1002\"><nobr><b title=\"崔美花/部长<>\">崔美花/部长&lt;&gt;</b><a title=\"删除\" class=\"del\"><i class=\"fa fa-times\"></i></a></nobr></span>',1399709992,1432191193,0,11,1,0,14,14,NULL),(34,'82','{YYYY}-{M}-{D}','个人请假单','QJ','请假申请样式','emp_1001|','<span id=\"emp_1001\" data=\"emp_1001\"><nobr><b title=\"尹瑾柱/总经理<>\">尹瑾柱/总经理&lt;&gt;</b></nobr></span>','','','emp_1002|','<span id=\"emp_1002\" data=\"emp_1002\"><nobr><b title=\"崔美花/部长<>\">崔美花/部长&lt;&gt;</b><a title=\"删除\" class=\"del\"><i class=\"fa fa-times\"></i></a></nobr></span>',1401288825,1428632816,1,10,1,0,14,14,NULL),(35,'82','{YYYY}-{M}-{D}','调薪申请单','TX','<p>\r\n\t调薪理由\r\n</p>','emp_1001|','<span id=\"emp_1001\" data=\"emp_1001\"><nobr><b title=\"尹瑾柱/总经理<>\">尹瑾柱/总经理&lt;&gt;</b></nobr></span>','','','emp_1002|','<span id=\"emp_1002\" data=\"emp_1002\"><nobr><b title=\"崔美花/部长<>\">崔美花/部长&lt;&gt;</b><a title=\"删除\" class=\"del\"><i class=\"fa fa-times\"></i></a></nobr></span>',1408251287,1428633864,3,10,0,0,15,14,NULL),(36,'82','{YYYY}-{M}-{D}','外出申请','WC','<p>\r\n\t外出申请目的：\r\n</p>\r\n<p>\r\n\t外出申请事由：\r\n</p>','emp_1001|','<span id=\"emp_1001\" data=\"emp_1001\"><nobr><b title=\"尹瑾柱/总经理<>\">尹瑾柱/总经理&lt;&gt;</b></nobr></span>','','','emp_1002|','<span id=\"emp_1002\" data=\"emp_1002\"><nobr><b title=\"崔美花/部长<>\">崔美花/部长&lt;&gt;</b><a title=\"删除\" class=\"del\"><i class=\"fa fa-times\"></i></a></nobr></span>',1412777631,1428641269,2,11,0,0,14,14,NULL),(37,'69','20150312601','系统变更申请','运营维护部','好好使用xxxxxxxxxxxxxx&nbsp;','emp_1002|emp_1001|','<span data=\"emp_1002\" id=\"emp_1002\"><nobr><b title=\"李白/副总<>\">李白/副总&lt;&gt;</b></nobr><b><i class=\"fa fa-arrow-right\"></i></b></span><span data=\"emp_1001\" id=\"emp_1001\"><nobr><b title=\"总经理1001/总经理<>\">总经理1001/总经理&lt;&gt;</b></nobr></span>','','','','',1426127753,1432264209,0,11,0,0,14,14,NULL),(38,'82','{YYYY}-{M}-{D}','离职申请单','离职','离职','emp_1001|','<span id=\"emp_1001\" data=\"emp_1001\"><nobr><b title=\"尹瑾柱/总经理<>\">尹瑾柱/总经理&lt;&gt;</b></nobr></span>','','','emp_1002|','<span id=\"emp_1002\" data=\"emp_1002\"><nobr><b title=\"崔美花/部长<>\">崔美花/部长&lt;&gt;</b><a title=\"删除\" class=\"del\"><i class=\"fa fa-times\"></i></a></nobr></span>',1427940431,1428633879,4,11,0,0,14,14,NULL),(39,'71','{YYYY}-{M}-{D}','原材料采购申请单','采购','采购申请单','emp_1001|','<span id=\"emp_1001\" data=\"emp_1001\"><nobr><b title=\"尹瑾柱/总经理<>\">尹瑾柱/总经理&lt;&gt;</b></nobr></span>','','','emp_1002|','<span id=\"emp_1002\" data=\"emp_1002\"><nobr><b title=\"崔美花/部长<>\">崔美花/部长&lt;&gt;</b><a title=\"删除\" class=\"del\"><i class=\"fa fa-times\"></i></a></nobr></span>',1427942142,1430806363,1,1,0,0,14,14,NULL),(40,'88','{YYYY}-{M}-{D}','个人请假单','个人请假单','巅峰时代','','','','','','',1428649355,1430715743,1,1,0,0,20,17,NULL),(41,'88','{YYYY}-{M}-{D}','出差申请','差旅','出差申请','','','','','','',1430201444,1430709554,2,1,0,0,20,18,NULL),(42,'70','{YYYY}-{M}-{D}','办公用品申请','办公用品','办公用品申请','','','','','','',1430202319,1432191240,3,1,0,0,14,14,NULL),(43,'80','{YYYY}-{M}-{D}','轿车使用申请','轿车','轿车使用申请','','','','','','',1430203160,1432191262,0,1,0,0,14,14,NULL),(44,'88','{YYYY}-{M}-{D}','离职申请单','离职申请','<p>\r\n\t<br />\r\n</p>','dgp_16_2|dgp_18_8|','<span id=\"dgp_16_2\" data=\"dgp_16_2\"><nobr><b title=\"科-经理\">科-经理</b></nobr><b><i class=\"fa fa-arrow-right\"></i></b></span><span id=\"dgp_18_8\" data=\"dgp_18_8\"><nobr><b title=\"部-部长\">部-部长</b></nobr></span>','emp_2001|','<span id=\"emp_2001\" data=\"emp_2001\"><nobr><b title=\"张三/部长<>\">张三/部长&lt;&gt;</b></nobr></span>','','',1430285006,1430707786,4,1,1,0,20,17,NULL),(45,'72','{YYYY}-{M}-{D}','差旅费用报销申请','差旅报销','出差费用报销申请','','','','','','',1430286645,1432191277,2,1,0,0,14,14,NULL),(46,'70','{YYYY}-{M}-{D}','通讯费用报销申请','通讯费报销','通讯费用报销','','','','','','',1430286713,1432191250,4,1,0,0,14,14,NULL),(47,'70','{YYYY}-{M}-{D}','交通费用报销申请','交通费报销','交通费用报销申请','','','','','','',1430286784,1432191325,5,11,0,0,14,14,NULL),(48,'70','{YYYY}-{M}-{D}','餐费报销申请','餐费报销','餐费报销申请','','','','','','',1430286877,1432191310,6,1,0,0,14,14,NULL),(49,'70','{YYYY}-{M}-{D}','会议室使用申请','会议室使用申请','会议室使用申请单','','','','','','',1430286961,1432191227,2,1,0,0,14,14,NULL),(50,'70','{YYYY}-{M}-{D}','机票预订申请','机票预订申请','机票预订申请','','','','','','',1430287073,1432191212,1,1,0,0,14,14,NULL),(51,'71','{YYYY}-{M}-{D}','设备采购申请','设备采购','设备采购申请单','','','','','','',1430287359,1430795702,3,1,0,0,14,17,NULL),(52,'71','{YYYY}-{M}-{D}','辅助材料采购申请单','辅材申请','辅材采购申请单','','','','','','',1430287428,1430804969,2,1,0,0,14,17,NULL),(53,'71','{YYYY}-{M}-{D}','辅助设备采购申请','设备零件采购申请','辅助设备采购申请','','','','','','',1430287546,1430795115,4,1,0,0,14,17,NULL),(54,'88','{YYYY}-{M}-{D}','员工培训/教育申请','培训申请','员工培训教育申请','','','','','','',1430288450,1430708546,3,1,0,0,18,17,NULL),(55,'72','{YYYY}-{M}-{D}','年度预算申请','年度预算申请','年度预算申请','','','','','','',1430289142,1432191269,3,1,0,0,14,14,NULL);

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
