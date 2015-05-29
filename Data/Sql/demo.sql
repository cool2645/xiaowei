# Host: 127.0.0.1  (Version: 5.6.12-log)
# Date: 2015-05-28 15:22:50
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='think_user_info';

#
# Data for table "think_contact"
#

INSERT INTO `think_contact` VALUES (1,'张三','ZS','百度','新事业推进部','高级总监','zhangsan@baidu.com','1234-5678','','','','',1,'',1),(2,'李四','LS','腾讯','物联网事业部','副总裁','lisi@qq.com','1234-5678','','','','',1,'',1),(3,'BBbbbb','BBBBBB','bbbbbbbbbbbbbbbbbbbbbbbbbbbbbb','bbbbbbbbbbbbbbb','bbbbbbbbbbbbbbbbbbbb','jzyin@sohu.com','bbbbbbbbbbbbbbbbbbbb','bbbbbbbbbbbbbbbbbbbb','bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb','bbbbbbbbbbbbbbbbbbbb','',1,'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb',1);

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
  `remark` text COMMENT '备注',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `payment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

#
# Data for table "think_customer"
#

INSERT INTO `think_customer` VALUES (29,'名称','MC','之间','教程','路线','已经','不敢','手机','重装','因为','聊天','定制',1,'杀杀杀杀杀杀杀杀杀',1,'是'),(30,'名称','MC','是','搜索','是','是','是','','','','','',0,'',1,'是'),(31,'22','','222','22','222','2222','2222','','','','','',0,'',1,'22'),(32,'A','A','A','A','A','A','A','A','A','A','A','A',0,'A',0,'A'),(33,'B','B','B','B','B','B','B','B','B','B','B','B',0,'B',0,'B'),(34,'C','C','C','C','C','C','C','C','C','C','C','C',0,'C',0,'C'),(35,'D','D','D','D','D','D','D','D','D','D','D','D',0,'D',0,'D');

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
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

#
# Data for table "think_doc"
#

INSERT INTO `think_doc` VALUES (85,'2014-0001','人事规定','人事规定',48,'64dd83526bc113639b405d9317ebc2f4;8b2f6f392af9bb2eac66ce4f3532378b;',1,'管理员',1408968417,1421878712,1),(86,'2014-0002','信息安全管理规定','sssssssssssssssssss',49,'4bd485b02a2b6780f86614b48518da06;',1,'管理员',1415241072,1421878759,0),(87,'2015-0001','办公用品采购合同','办公用品采购合同',50,'',1,'管理员',1421878820,0,0),(88,'2015-0002','打印机租赁合同','打印机租赁合同',49,'',1,'管理员',1421878839,0,1),(89,'2015-0003','小微OA系统实施合同','小微OA系统实施合同',49,'',1,'管理员',1421878860,0,1),(90,'2015-0004','11','11111111111111111',68,'',1,'管理员',1425526846,0,1),(91,'2015-0005','1111111','1111111111111111111sssss',70,'MDAwMDAwMDAwMA;MDAwMDAwMDAwMA;MDAwMDAwMDAwMA;MDAwMDAwMDAwMIO3oXM;',1,'管理员',1427619376,1428401481,0),(92,'2015-0006','员工信息','员工信息',69,'',1,'管理员',1431486506,0,0),(93,'2015-0007','调薪相关文档','与全体员工一起分享调薪相关文档',69,'',1,'管理员',1431496031,0,0);

#
# Source for table "think_duty"
#

DROP TABLE IF EXISTS `think_duty`;
CREATE TABLE `think_duty` (
  `id` smallint(3) NOT NULL AUTO_INCREMENT,
  `duty_no` varchar(20) NOT NULL DEFAULT '' COMMENT '职责编号',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `sort` varchar(20) NOT NULL DEFAULT '' COMMENT '排序',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

#
# Data for table "think_duty"
#

INSERT INTO `think_duty` VALUES (14,'P001','普通员工','',0,''),(15,'S001','业务员','',0,''),(16,'W001','文员','',0,''),(17,'TASK_ASSIGN','任务分配','',0,''),(18,'SHOW_LOG','日志查看','',0,''),(19,'','xxxx','',0,''),(20,'','bbbbb','',0,'');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COMMENT='文件表';

#
# Data for table "think_file"
#

INSERT INTO `think_file` VALUES (12,'1.jpg','54ba0d2544834.jpg','test/','jpg','image/jpeg',7213,'ee829bfdd877adc970fb0e30c77124d6','4d6505c72a73482f5c6eb948e0e7d3efe21bc2f9',0,'',1421479205),(13,'日报模块修改需求整理.docx','54e8402a4d25c.docx','form/2015-02/','docx','application/vnd.openxmlformats-officedoc',712336,'e399dba646aa3946140682535ff238aa','720cb82f3d11d6f334dd9e91b9a4f4cf4925390e',0,'',1424506921),(14,'IMG_0165.JPG','551b9d4893a8f.JPG','popup/2015-04/','JPG','image/jpeg',1927540,'dd1ca92d5b7d330253fc2ef8f7519ec5','5a58e4646035502c2ec5bd2c1e80b13f040bd5fa',0,'',1427873096),(15,'3.PNG','552248a48e581.PNG','doc/2015-04/','PNG','image/png',58521,'5853c1eccff50c3c8ca82fc7052f62f3','255c8450553dc4cd3a5238afb67a1dfe62fc1d89',0,'',1428310180),(19,'IMG_0177.PNG','5523ad435e430.PNG','doc/2015-04/','PNG','image/png',170409,'24f675efc82716b88c259d8949fde606','f6c3bac6add9c733cc71a87986fb6b3253113ed2',0,'',1428401475),(20,'餐饮行业是如何做微信营销的.pptx','5524b383eed62.pptx','info/2015-04/','pptx','application/vnd.openxmlformats-officedoc',5093889,'9178449046cda44ffc9ba9a6510822b7','4c593331fad6845df839995ae37ae617aef96d4b',0,'',1428468611),(21,'公众号自定义菜单的设计.pptx','552a00450ce59.pptx','info/2015-04/','pptx','application/vnd.openxmlformats-officedoc',1260979,'f24f4cc31d93bd5e535df6a9fe3577ec','7bc2cc4dbbfa633b3dda1ef5735fca9c2f245aa1',0,'',1428815940),(22,'1.jpg','552a0529972d8.jpg','info/2015-04/','jpg','image/jpeg',308603,'463cece467065c8b6d0d30db2608ff1b','194502953dafe836f23dd4a84eae98380501f4b1',0,'',1428817193),(23,'7.jpg','552a06b3d3e9b.jpg','info/2015-04/','jpg','image/jpeg',474204,'9b96ae41c32a18be631391c47043d917','95af8f640e1069d1e9b022d584179880c886daf5',0,'',1428817587),(24,'8.jpg','552a077481298.jpg','info/2015-04/','jpg','image/jpeg',421344,'6077bc0b7a90aaa8b54f743acb82dc79','87ae5db09ae6b7b4fcb34ec518a82d6c20dcc266',0,'',1428817780),(25,'8.jpg','552a0a18cb436.jpg','info/2015-04/','jpg','image/jpeg',421344,'6077bc0b7a90aaa8b54f743acb82dc79','87ae5db09ae6b7b4fcb34ec518a82d6c20dcc266',0,'',1428818456),(26,'12.jpg','552a0aa5902b9.jpg','info/2015-04/','jpg','image/jpeg',423173,'36f1edfdc667a9ac30292ed35dd605ac','6739c727cc5bf6f36cc27f533d228f2679a855fc',0,'',1428818597),(27,'10.jpg','552a0af27a851.jpg','info/2015-04/','jpg','image/jpeg',465102,'f0c907b7c10544fa149be49ca927119d','66cdda1458bdcc407bbb0f93a1dc4cb4ab0e4a35',0,'',1428818674),(28,'11.jpg','552a0b59463f5.jpg','info/2015-04/','jpg','image/jpeg',242862,'fed85a150d40b00422bcf223385a32cd','bcf9a148387dc08a45a25fefbdcdef753edc1044',0,'',1428818777),(29,'9.jpg','552a0b7f71ca7.jpg','info/2015-04/','jpg','image/jpeg',331542,'5bdf0773d077a15c7f29b427b9ec6466','35ec52d49642aea8413d870da73956d04b4b9562',0,'',1428818815),(30,'1.jpg','552a0bab1f04c.jpg','info/2015-04/','jpg','image/jpeg',308603,'463cece467065c8b6d0d30db2608ff1b','194502953dafe836f23dd4a84eae98380501f4b1',0,'',1428818858),(31,'2.jpg','552a0e2f03f99.jpg','info/2015-04/','jpg','image/jpeg',259704,'478ec0d2a8680726f60c1a096343acd4','79495c9480ce50b0967791a1f476477731acfbb9',0,'',1428819502),(32,'1.jpg','552a0e4f38ae8.jpg','info/2015-04/','jpg','application/octet-stream',308603,'463cece467065c8b6d0d30db2608ff1b','194502953dafe836f23dd4a84eae98380501f4b1',0,'',1428819535),(33,'2.jpg','552a0e5000347.jpg','info/2015-04/','jpg','application/octet-stream',259704,'478ec0d2a8680726f60c1a096343acd4','79495c9480ce50b0967791a1f476477731acfbb9',0,'',1428819535),(34,'3.jpg','552a0e50b68b0.jpg','info/2015-04/','jpg','application/octet-stream',185449,'cfa0e110ea8e6c627cc8597220282f2f','e8f688da75c48a92304ee904a4b503cad5d62371',0,'',1428819536),(35,'4.jpg','552a0e5194775.jpg','info/2015-04/','jpg','application/octet-stream',299906,'fdc66483174d57dd92c4a8dbc505f997','bfd5032447cf4b74ce5eacefa77555ae9e746b63',0,'',1428819537),(36,'8.jpg','552a0ec885939.jpg','popup/2015-04/','jpg','image/jpeg',421344,'6077bc0b7a90aaa8b54f743acb82dc79','87ae5db09ae6b7b4fcb34ec518a82d6c20dcc266',0,'',1428819656),(37,'8.jpg','552a0f4f71fca.jpg','popup/2015-04/','jpg','image/jpeg',421344,'6077bc0b7a90aaa8b54f743acb82dc79','87ae5db09ae6b7b4fcb34ec518a82d6c20dcc266',0,'',1428819791),(38,'7.jpg','552a108ede8fc.jpg','popup/2015-04/','jpg','image/jpeg',474204,'9b96ae41c32a18be631391c47043d917','95af8f640e1069d1e9b022d584179880c886daf5',0,'',1428820110),(39,'3.jpg','552a1113d0a4d.jpg','popup/2015-04/','jpg','image/jpeg',185449,'cfa0e110ea8e6c627cc8597220282f2f','e8f688da75c48a92304ee904a4b503cad5d62371',0,'',1428820243),(40,'3.jpg','552a16c657d52.jpg','popup/2015-04/','jpg','image/jpeg',185449,'cfa0e110ea8e6c627cc8597220282f2f','e8f688da75c48a92304ee904a4b503cad5d62371',0,'',1428821702),(41,'3.jpg','552a16ff77e5e.jpg','popup/2015-04/','jpg','image/jpeg',185449,'cfa0e110ea8e6c627cc8597220282f2f','e8f688da75c48a92304ee904a4b503cad5d62371',0,'',1428821759),(42,'4.jpg','552a1721a9d6a.jpg','popup/2015-04/','jpg','image/jpeg',299906,'fdc66483174d57dd92c4a8dbc505f997','bfd5032447cf4b74ce5eacefa77555ae9e746b63',0,'',1428821793),(43,'7.jpg','552a177ab6bfc.jpg','popup/2015-04/','jpg','image/jpeg',474204,'9b96ae41c32a18be631391c47043d917','95af8f640e1069d1e9b022d584179880c886daf5',0,'',1428821882),(44,'','552a178045282.','popup/2015-04/','','',2137,'ac8e7570294b6a041f9b7c7548b73ebc','6d4d91de9c5941c8a5c487be9e34e073db68d53b',0,'',1428821886),(45,'9.jpg','552a187969a84.jpg','popup/2015-04/','jpg','image/jpeg',331542,'5bdf0773d077a15c7f29b427b9ec6466','35ec52d49642aea8413d870da73956d04b4b9562',0,'',1428822137),(46,'','552a187f45346.','popup/2015-04/','','',3124,'3bc5cf97edad76d5bb54357e55118135','1a46235301acc3c839b34262352970e5dfbd3ff9',0,'',1428822141),(47,'','552a18a77a5d0.','popup/2015-04/','','',3124,'3bc5cf97edad76d5bb54357e55118135','1a46235301acc3c839b34262352970e5dfbd3ff9',0,'',1428822181),(48,'552a187969a84.jpg','552a1aad531ad.jpg','popup/2015-04/','jpg','',3124,'3bc5cf97edad76d5bb54357e55118135','1a46235301acc3c839b34262352970e5dfbd3ff9',0,'',1428822699),(49,'552a187969a84.jpg','552a1b026e3ba.jpg','popup/2015-04/','jpg','',3124,'3bc5cf97edad76d5bb54357e55118135','1a46235301acc3c839b34262352970e5dfbd3ff9',0,'',1428822784),(50,'552a187969a84.jpg','552a1b1eb4c23.jpg','popup/2015-04/','jpg','',3124,'3bc5cf97edad76d5bb54357e55118135','1a46235301acc3c839b34262352970e5dfbd3ff9',0,'',1428822812),(51,'552a187969a84.jpg','552a1b224fc0a.jpg','popup/2015-04/','jpg','',3124,'3bc5cf97edad76d5bb54357e55118135','1a46235301acc3c839b34262352970e5dfbd3ff9',0,'',1428822816),(52,'552a187969a84.jpg','552a1b33bd435.jpg','popup/2015-04/','jpg','',3124,'3bc5cf97edad76d5bb54357e55118135','1a46235301acc3c839b34262352970e5dfbd3ff9',0,'',1428822833),(53,'552a187969a84.jpg','552a1bc9280b6.jpg','popup/2015-04/','jpg','',3124,'3bc5cf97edad76d5bb54357e55118135','1a46235301acc3c839b34262352970e5dfbd3ff9',0,'',1428822982),(54,'552a187969a84.jpg','552a1be107159.jpg','popup/2015-04/','jpg','',3124,'3bc5cf97edad76d5bb54357e55118135','1a46235301acc3c839b34262352970e5dfbd3ff9',0,'',1428823006),(55,'8.jpg','552a1c45c997d.jpg','popup/2015-04/','jpg','image/jpeg',421344,'6077bc0b7a90aaa8b54f743acb82dc79','87ae5db09ae6b7b4fcb34ec518a82d6c20dcc266',0,'',1428823109),(56,'552a1c45c997d.jpg','552a1c4ba8627.jpg','popup/2015-04/','jpg','',2660,'c89fcb7b7661e81a1a01bcd590d98bf6','ad8a1b8c674f51e2d844a0575e3230adb1d490b8',0,'',1428823113),(57,'3.jpg','552f869cc3a0c.jpg','flowtype/2015-04/','jpg','image/jpeg',185449,'cfa0e110ea8e6c627cc8597220282f2f','e8f688da75c48a92304ee904a4b503cad5d62371',0,'',1429178012),(58,'customer.xlsx','5530f51eb221e.xlsx','customer/2015-04/','xlsx','application/vnd.openxmlformats-officedoc',10581,'3db87888acc3be6a6b8879e6a931c3c0','fe53eaae239afc5e08117439c85cc1cf34a311d6',0,'',1429271838),(59,'user.xls','553602304017e.xls','user/2015-04/','xls','application/vnd.ms-excel',30208,'d0b5ffb7a2bfb9fd33838551fe5ed327','c01b749ecf31cc10aa4b24f586fc5a0b3b3a216c',0,'',1429602863),(60,'生涯规划师认证班课程内容.pdf','5550745cb2f5a.pdf','mail/2015-05/','pdf','',725135,'180b4271feea3f74d0e5af7d15c6952b','848c842f80a8c6d760e7cc177b708048aac821eb',0,'',1431336022),(61,'','5550745dbd769.','mail/2015-05/','','',242259,'898e85494ae1ce4783567a5b52bb1419','0b99f9d6cec6771c13e6c8c181712a73042c1294',0,'',1431336022),(62,'授权书.doc','5550745f6f44a.doc','mail/2015-05/','doc','',19968,'3fd2086b95fab3103abb50b97349f6ca','48908df617fb63d38f012c4fb1c6df7cc9025b25',0,'',1431336022),(63,'Catch.jpg','555074636c41a.jpg','mail/2015-05/','jpg','',117713,'3bbeb3879ded641c9c11fc5e554c60ae','e87f6a03e634c7133e16a548418bbcbed01523b2',0,'',1431336022),(64,'MDS_3549.JPG','555182b5108ca.JPG','popup/2015-05/','JPG','image/jpeg',7480110,'3b7e5453b3ace6786d6f71ee6a287236','9884e62024c621737453e091347518a846d4adb2',0,'',1431405236),(65,'MDS_3549.JPG','555184f69d796.JPG','popup/2015-05/','JPG','image/jpeg',7480110,'3b7e5453b3ace6786d6f71ee6a287236','9884e62024c621737453e091347518a846d4adb2',0,'',1431405814),(66,'新建 Microsoft PowerPoint 演示文稿.p','5552f65e2f506.pptx','worklog/2015-05/','pptx','application/vnd.openxmlformats-officedoc',31527,'05ace4d3c18204b4f27c5515e2080525','6203098f230bd18fc7676b9599319af2ea29c157',0,'',1431500381),(67,'使用手册.doc','5552f66d35aeb.doc','worklog/2015-05/','doc','application/msword',5130240,'38e2492c08abe5cb0e4f393afa708373','78f7d750f6ff4de809283f0426b327fed4767a0d',0,'',1431500394),(68,'小微OA测试用.xlsx','5552f67a9c8cd.xlsx','worklog/2015-05/','xlsx','application/vnd.openxmlformats-officedoc',9657,'a068fe369fb81a6f1da866192497f90a','9866b0bf02d689cc843c42e324a21470472bff58',0,'',1431500410),(69,'psb.jpg','5552f74946408.jpg','popup/2015-05/','jpg','image/jpeg',129465,'45bada077caf74fa9e8c791761b0bde3','b58c3e99f8378ae949b16d913e1b1b19106f26e8',0,'',1431500616),(70,'psb.jpg','5552f76b3fc4a.jpg','popup/2015-05/','jpg','image/jpeg',129465,'45bada077caf74fa9e8c791761b0bde3','b58c3e99f8378ae949b16d913e1b1b19106f26e8',0,'',1431500650),(71,'OA改版2(2015-4-17 16.33.13 3118)','555c296da46f4.docx','flow/2015-05/','docx','application/vnd.openxmlformats-officedoc',216185,'6794783d2128bd10a7742d529865ed21','60512c3ee4dcbb254567fea79d61b1d3185ab038',0,'',1432103277),(72,'OA改版.docx','555c297e4d6ed.docx','flow/2015-05/','docx','application/vnd.openxmlformats-officedoc',121620,'be1f8f1f5a8c1aec2a758da1c8d1bc19','bbf0ad26457c335c7c50b145aabc7b2c30a208f8',0,'',1432103294),(73,'OA改版2(2015-4-17 16.33.13 3118)','555c29f4c79a8.docx','flow/2015-05/','docx','application/vnd.openxmlformats-officedoc',216185,'6794783d2128bd10a7742d529865ed21','60512c3ee4dcbb254567fea79d61b1d3185ab038',0,'',1432103412),(74,'MDS_3549.JPG','555c3806df916.JPG','popup/2015-05/','JPG','image/jpeg',7480110,'3b7e5453b3ace6786d6f71ee6a287236','9884e62024c621737453e091347518a846d4adb2',0,'',1432107014),(75,'计算机软件著作权.doc','555d81a24c8ba.doc','flow/2015-05/','doc','application/msword',64000,'2a2d154504a8dbd79139f8eab2876bf5','25e74db604a0fdc8c992bf41f3f6fa10e5ab8f69',0,'',1432191394),(76,'小微企业信息化创业画布.xlsx','555d81e8c5a8f.xlsx','flow/2015-05/','xlsx','application/vnd.openxmlformats-officedoc',12294,'61dd688c9388db3efb6849e3656fc63d','c53e9f13b78434167e2db08dc682c49d4ed2fab1',0,'',1432191464),(77,'LOGO.JPG','555d8217e5bfb.JPG','flow/2015-05/','JPG','image/jpeg',3042,'e332fe2475cd8746f2db1f2e62102e95','5a0a68f4af4960d276b1104a7c4aabedd3b643d4',0,'',1432191511),(78,'计算机软件著作权.doc','555d88b25b0c7.doc','flow/2015-05/','doc','application/msword',64000,'2a2d154504a8dbd79139f8eab2876bf5','25e74db604a0fdc8c992bf41f3f6fa10e5ab8f69',0,'',1432193202),(79,'LOGO.JPG','555e9ee1c6aef.JPG','flow/2015-05/','JPG','image/jpeg',3042,'e332fe2475cd8746f2db1f2e62102e95','5a0a68f4af4960d276b1104a7c4aabedd3b643d4',0,'',1432264417);

#
# Source for table "think_finance"
#

DROP TABLE IF EXISTS `think_finance`;
CREATE TABLE `think_finance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_no` varchar(10) DEFAULT NULL COMMENT '单据编号',
  `remark` varchar(255) DEFAULT NULL,
  `input_date` date DEFAULT NULL COMMENT '录入日期',
  `account_id` int(11) DEFAULT NULL COMMENT '帐号ID',
  `account_name` varchar(20) DEFAULT NULL COMMENT '帐号名',
  `income` int(11) DEFAULT NULL COMMENT '收入',
  `payment` int(11) DEFAULT NULL COMMENT '支出',
  `amount` int(11) DEFAULT NULL COMMENT '合计',
  `type` varchar(20) DEFAULT NULL COMMENT '类型',
  `partner` varchar(50) DEFAULT NULL COMMENT '来往处',
  `actor_name` varchar(10) DEFAULT NULL COMMENT '经办人',
  `user_id` int(11) DEFAULT NULL COMMENT '登陆人',
  `user_name` varchar(10) DEFAULT NULL COMMENT '登录名',
  `create_time` int(11) DEFAULT NULL COMMENT '创建日期',
  `update_time` int(11) DEFAULT NULL COMMENT '更新日期',
  `add_file` varchar(255) DEFAULT NULL COMMENT '附件',
  `doc_type` tinyint(3) DEFAULT NULL COMMENT '类型',
  `is_del` tinyint(3) DEFAULT '0' COMMENT '删除标记',
  `related_account_id` int(11) DEFAULT NULL COMMENT '相关帐号ID',
  `related_account_name` varchar(20) DEFAULT NULL COMMENT '相关帐号名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

#
# Data for table "think_finance"
#

INSERT INTO `think_finance` VALUES (16,'2015-0001','向[招商]转出[100]','2015-01-14',5,'农行',NULL,100,NULL,'转账',NULL,'111',1,'管理员',1422690164,NULL,'',3,0,6,'招商'),(17,'2015-0002','由[农行]转入[100]','2015-01-14',6,'招商',100,NULL,NULL,'转账',NULL,'111',1,'管理员',1422690164,NULL,'',3,0,5,'农行'),(18,'2015-0003','向[招商]转出[100]','2015-01-01',5,'农行',NULL,100,NULL,'转账',NULL,'123',1,'管理员',1422690361,NULL,'',3,0,6,'招商'),(19,'2015-0004','由[农行]转入[100]','2015-01-01',6,'招商',100,NULL,NULL,'转账',NULL,'123',1,'管理员',1422690361,NULL,'',3,0,5,'农行'),(20,'2015-0005','1000','2014-12-31',5,NULL,100,NULL,NULL,'办公费','其他','000',1,'管理员',1422690453,NULL,'',1,0,NULL,NULL),(21,'2015-0006','1111','2015-01-07',6,NULL,111,NULL,NULL,'办公费','其他','11',1,'管理员',1422690528,NULL,'',1,0,NULL,NULL),(22,'2015-0007','1111','2015-01-07',6,NULL,111,NULL,NULL,'办公费','其他','11',1,'管理员',1422690628,NULL,'',1,0,NULL,NULL),(23,'2015-0008','2000','2015-01-21',5,'农行',NULL,200,NULL,'通讯费','其他','222',1,'管理员',1422690783,NULL,'',2,0,NULL,NULL),(24,'2015-0009','向[招商]转出[111]','2015-01-02',5,'农行',NULL,111,NULL,'转账',NULL,'经办人',1,'管理员',1422690822,NULL,'',3,0,6,'招商'),(25,'2015-0010','由[农行]转入[111]','2015-01-02',6,'招商',111,NULL,NULL,'转账',NULL,'经办人',1,'管理员',1422690822,NULL,'',3,0,5,'农行'),(26,'2015-0011','向[招商]转出[88]','2015-01-09',5,'农行',NULL,88,NULL,'转账',NULL,'55',1,'管理员',1422690886,NULL,'',3,0,6,'招商'),(27,'2015-0012','由[农行]转入[88]','2015-01-09',6,'招商',88,NULL,NULL,'转账',NULL,'55',1,'管理员',1422690886,NULL,'',3,0,5,'农行'),(28,'2015-0013','向[招商]转出[99]','2015-01-30',5,'农行',NULL,99,NULL,'转账',NULL,'444',1,'管理员',1422690937,NULL,'',3,0,6,'招商'),(29,'2015-0014','向[招商]转出[99]','2015-01-30',5,'农行',NULL,99,NULL,'转账',NULL,'444',1,'管理员',1422691060,NULL,'',3,0,6,'招商'),(30,'2015-0015','向[招商]转出[99]','2015-01-30',5,'农行',NULL,99,NULL,'转账',NULL,'444',1,'管理员',1422691096,NULL,'',3,0,6,'招商'),(31,'2015-0016','由[农行]转入[99]','2015-01-30',6,'招商',99,NULL,NULL,'转账',NULL,'444',1,'管理员',1422691096,NULL,'',3,0,5,'农行'),(32,'2015-0017','向[招商]转出[1111]','2015-05-14',5,'农行',NULL,1111,NULL,'转账',NULL,'111',1,'管理员',1431585497,NULL,'',3,0,6,'招商'),(33,'2015-0018','由[农行]转入[1111]','2015-05-14',6,'招商',1111,NULL,NULL,'转账',NULL,'111',1,'管理员',1431585497,NULL,'',3,0,5,'农行');

#
# Source for table "think_finance_account"
#

DROP TABLE IF EXISTS `think_finance_account`;
CREATE TABLE `think_finance_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '帐号名称',
  `bank` varchar(20) DEFAULT NULL COMMENT '银行',
  `no` varchar(50) DEFAULT NULL COMMENT '银行帐号',
  `init` int(11) DEFAULT NULL COMMENT '初始帐号',
  `balance` int(11) DEFAULT NULL COMMENT '余额',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `is_del` tinyint(3) DEFAULT '0' COMMENT '删除标记',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

#
# Data for table "think_finance_account"
#

INSERT INTO `think_finance_account` VALUES (5,'农行','农行','1111',500,-1009,'农行',0,1422690709,NULL),(6,'招商','招商','招商',1000,2321,'招商',0,1422690709,NULL),(7,'华夏','华夏','888',8888,8888,'888',1,1422690709,NULL);

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
  `udf_data` text COMMENT '用户自定义数据',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

#
# Data for table "think_flow"
#

INSERT INTO `think_flow` VALUES (41,'20150312601','sssssssssss','好好使用xxxxxxxxxxxxxx sssssssssssssssssssssss','1002|1001|','\r\n\t\t\t\t\t\t\r\n\t\t\t\t\t<span data=\"emp_1002\" id=\"emp_1002\"><nobr><b title=\"李白/副总<>\">李白/副总&lt;&gt;</b></nobr><b><i class=\"fa fa-arrow-right\"></i></b></span><span data=\"emp_1001\" id=\"emp_1001\"><nobr><b title=\"总经理1001/总经理<>\">总经理1001/总经理&lt;&gt;</b></nobr></span>\t\t\t\t\t\t\t\t\t','','\r\n\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t','','\r\n\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t','37','',1,'admin','管理员',1,'小微企业','',1432266986,1432267044,20,0,NULL);

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
  `from` varchar(20) DEFAULT NULL COMMENT '传阅人',
  `is_del` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

#
# Data for table "think_flow_log"
#

INSERT INTO `think_flow_log` VALUES (53,41,'1002',67,'李白',21,1,1432266986,1432705621,'',0,NULL,NULL),(54,41,'1001',44,'总经理1001',22,NULL,1432705621,0,NULL,0,NULL,NULL);

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
  `is_show` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

#
# Data for table "think_flow_type"
#

INSERT INTO `think_flow_type` VALUES (19,'72','{YYYY}-{M}-{D}','招待费用报销单','招待','<table border=\"1\">\r\n\t<tbody>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t姓    名\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"4\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t职务\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"4\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"4\" rowspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t招待事由\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"9\" rowspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td rowspan=\"11\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t附件\r\n\t\t\t\t</p>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t张\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t部   门\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"10\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<p>\r\n\t\t\t\t\t招待对象\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"2\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t<br />\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"5\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t招待人数\r\n\t\t\t\t</p>\r\n\t\t\t</td>\r\n\t\t\t<td colspan=\"7\">\r\n\t\t\t\t<p>\r\n\t\t\t\t\t客人   人，陪同   人\r\n\t\t\t\t</p>%0','emp_1001|','<span id=\"emp_1001\" data=\"emp_1001\"><nobr><b title=\"尹瑾柱/总经理<>\">尹瑾柱/总经理&lt;&gt;</b></nobr></span>','','','emp_1002|','<span id=\"emp_1002\" data=\"emp_1002\"><nobr><b title=\"崔美花/部长<>\">崔美花/部长&lt;&gt;</b><a title=\"删除\" class=\"del\"><i class=\"fa fa-times\"></i></a></nobr></span>',1391698060,1432191286,1,1,0,0,14,14,NULL,NULL),(33,'69','{YYYY}-{M}-{D}','离职申请单','LZ','<p>\r\n\t<br />\r\n</p>','emp_1001|','<span id=\"emp_1001\" data=\"emp_1001\"><nobr><b title=\"尹瑾柱/总经理<>\">尹瑾柱/总经理&lt;&gt;</b></nobr></span>','','','emp_1002|','<span id=\"emp_1002\" data=\"emp_1002\"><nobr><b title=\"崔美花/部长<>\">崔美花/部长&lt;&gt;</b><a title=\"删除\" class=\"del\"><i class=\"fa fa-times\"></i></a></nobr></span>',1399709992,1432537291,0,0,1,0,14,14,'',NULL),(34,'82','{YYYY}-{M}-{D}','个人请假单','QJ','请假申请样式','emp_1001|','<span id=\"emp_1001\" data=\"emp_1001\"><nobr><b title=\"尹瑾柱/总经理<>\">尹瑾柱/总经理&lt;&gt;</b></nobr></span>','','','emp_1002|','<span id=\"emp_1002\" data=\"emp_1002\"><nobr><b title=\"崔美花/部长<>\">崔美花/部长&lt;&gt;</b><a title=\"删除\" class=\"del\"><i class=\"fa fa-times\"></i></a></nobr></span>',1401288825,1428632816,1,10,1,0,14,14,NULL,NULL),(35,'82','{YYYY}-{M}-{D}','调薪申请单','TX','<p>\r\n\t调薪理由\r\n</p>','emp_1001|','<span id=\"emp_1001\" data=\"emp_1001\"><nobr><b title=\"尹瑾柱/总经理<>\">尹瑾柱/总经理&lt;&gt;</b></nobr></span>','','','emp_1002|','<span id=\"emp_1002\" data=\"emp_1002\"><nobr><b title=\"崔美花/部长<>\">崔美花/部长&lt;&gt;</b><a title=\"删除\" class=\"del\"><i class=\"fa fa-times\"></i></a></nobr></span>',1408251287,1428633864,3,10,0,0,15,14,NULL,NULL),(36,'82','{YYYY}-{M}-{D}','外出申请','WC','<p>\r\n\t外出申请目的：\r\n</p>\r\n<p>\r\n\t外出申请事由：\r\n</p>','emp_1001|','<span id=\"emp_1001\" data=\"emp_1001\"><nobr><b title=\"尹瑾柱/总经理<>\">尹瑾柱/总经理&lt;&gt;</b></nobr></span>','','','emp_1002|','<span id=\"emp_1002\" data=\"emp_1002\"><nobr><b title=\"崔美花/部长<>\">崔美花/部长&lt;&gt;</b><a title=\"删除\" class=\"del\"><i class=\"fa fa-times\"></i></a></nobr></span>',1412777631,1428641269,2,11,0,0,14,14,NULL,NULL),(37,'69','20150312601','系统变更申请','运营维护部','好好使用xxxxxxxxxxxxxx ','emp_1002|emp_1001|','<span id=\"emp_1002\" data=\"emp_1002\"><nobr><b title=\"李白/副总<>\">李白/副总&lt;&gt;</b></nobr><b><i class=\"fa fa-arrow-right\"></i></b></span><span id=\"emp_1001\" data=\"emp_1001\"><nobr><b title=\"总经理1001/总经理<>\">总经理1001/总经理&lt;&gt;</b></nobr></span>','','','','',1426127753,1432707586,0,1,0,0,14,14,'',1),(38,'82','{YYYY}-{M}-{D}','离职申请单','离职','离职','emp_1001|','<span id=\"emp_1001\" data=\"emp_1001\"><nobr><b title=\"尹瑾柱/总经理<>\">尹瑾柱/总经理&lt;&gt;</b></nobr></span>','','','emp_1002|','<span id=\"emp_1002\" data=\"emp_1002\"><nobr><b title=\"崔美花/部长<>\">崔美花/部长&lt;&gt;</b><a title=\"删除\" class=\"del\"><i class=\"fa fa-times\"></i></a></nobr></span>',1427940431,1428633879,4,11,0,0,14,14,NULL,NULL),(39,'71','{YYYY}-{M}-{D}','原材料采购申请单','采购','采购申请单','emp_1001|','<span id=\"emp_1001\" data=\"emp_1001\"><nobr><b title=\"尹瑾柱/总经理<>\">尹瑾柱/总经理&lt;&gt;</b></nobr></span>','','','emp_1002|','<span id=\"emp_1002\" data=\"emp_1002\"><nobr><b title=\"崔美花/部长<>\">崔美花/部长&lt;&gt;</b><a title=\"删除\" class=\"del\"><i class=\"fa fa-times\"></i></a></nobr></span>',1427942142,1430806363,1,1,0,0,14,14,NULL,NULL),(40,'88','{YYYY}-{M}-{D}','个人请假单','个人请假单','巅峰时代','','','','','','',1428649355,1430715743,1,1,0,0,20,17,NULL,NULL),(41,'88','{YYYY}-{M}-{D}','出差申请','差旅','出差申请','','','','','','',1430201444,1430709554,2,1,0,0,20,18,NULL,NULL),(42,'70','{YYYY}-{M}-{D}','办公用品申请','办公用品','办公用品申请','','','','','','',1430202319,1432191240,3,1,0,0,14,14,NULL,NULL),(43,'80','{YYYY}-{M}-{D}','轿车使用申请','轿车','轿车使用申请','','','','','','',1430203160,1432191262,0,1,0,0,14,14,NULL,NULL),(44,'88','{YYYY}-{M}-{D}','离职申请单','离职申请','<p>\r\n\t<br />\r\n</p>','dgp_16_2|dgp_18_8|','<span id=\"dgp_16_2\" data=\"dgp_16_2\"><nobr><b title=\"科-经理\">科-经理</b></nobr><b><i class=\"fa fa-arrow-right\"></i></b></span><span id=\"dgp_18_8\" data=\"dgp_18_8\"><nobr><b title=\"部-部长\">部-部长</b></nobr></span>','emp_2001|','<span id=\"emp_2001\" data=\"emp_2001\"><nobr><b title=\"张三/部长<>\">张三/部长&lt;&gt;</b></nobr></span>','','',1430285006,1430707786,4,1,1,0,20,17,NULL,NULL),(45,'72','{YYYY}-{M}-{D}','差旅费用报销申请','差旅报销','出差费用报销申请','','','','','','',1430286645,1432191277,2,1,0,0,14,14,NULL,NULL),(46,'70','{YYYY}-{M}-{D}','通讯费用报销申请','通讯费报销','通讯费用报销','','','','','','',1430286713,1432191250,4,1,0,0,14,14,NULL,NULL),(47,'70','{YYYY}-{M}-{D}','交通费用报销申请','交通费报销','交通费用报销申请','','','','','','',1430286784,1432191325,5,11,0,0,14,14,NULL,NULL),(48,'70','{YYYY}-{M}-{D}','餐费报销申请','餐费报销','餐费报销申请','','','','','','',1430286877,1432191310,6,1,0,0,14,14,NULL,NULL),(49,'70','{YYYY}-{M}-{D}','会议室使用申请','会议室使用申请','会议室使用申请单','','','','','','',1430286961,1432191227,2,1,0,0,14,14,NULL,NULL),(50,'70','{YYYY}-{M}-{D}','机票预订申请','机票预订申请','机票预订申请','','','','','','',1430287073,1432191212,1,1,0,0,14,14,NULL,NULL),(51,'71','{YYYY}-{M}-{D}','设备采购申请','设备采购','设备采购申请单','','','','','','',1430287359,1430795702,3,1,0,0,14,17,NULL,NULL),(52,'71','{YYYY}-{M}-{D}','辅助材料采购申请单','辅材申请','辅材采购申请单','','','','','','',1430287428,1430804969,2,1,0,0,14,17,NULL,NULL),(53,'71','{YYYY}-{M}-{D}','辅助设备采购申请','设备零件采购申请','辅助设备采购申请','','','','','','',1430287546,1430795115,4,1,0,0,14,17,NULL,NULL),(54,'88','{YYYY}-{M}-{D}','员工培训/教育申请','培训申请','员工培训教育申请','','','','','','',1430288450,1430708546,3,1,0,0,18,17,NULL,NULL),(55,'72','{YYYY}-{M}-{D}','年度预算申请','年度预算申请','年度预算申请','','','','','','',1430289142,1432191269,3,1,0,0,14,14,NULL,NULL);

#
# Source for table "think_form"
#

DROP TABLE IF EXISTS `think_form`;
CREATE TABLE `think_form` (
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
  `udf_data` text COMMENT '自定义字段数据',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

#
# Data for table "think_form"
#

INSERT INTO `think_form` VALUES (90,'','22222','22222222222222222',76,'',0,'',0,0,1,NULL),(91,'2015-0001','ss','ssssssssssssssssssssss',76,'',1,'管理员',1424501594,0,1,NULL),(92,'2015-0002','A1','B2',76,'',1,'管理员',1424503167,0,1,NULL),(93,'2015-0003','AAAAAAAAAAAAAAAAA','AAAAAAAAAAAAAAAAAAAAAAAA',76,'MDAwMDAwMDAwMIO3g3M;',1,'管理员',1424505219,1424506924,0,'{\"66\":\"AAAAA\",\"67\":\"AAAAAAAAAA\"}'),(94,'2015-0004','333333333333333333333333333333','333333333333333333',76,'',1,'管理员',1424507128,1424507143,0,'{\"66\":\"33333333333333333\",\"67\":\"3333333333333\"}');

#
# Source for table "think_group"
#

DROP TABLE IF EXISTS `think_group`;
CREATE TABLE `think_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `is_public` tinyint(3) DEFAULT NULL COMMENT '是否公开',
  `remark` text COMMENT '备注',
  `user_id` int(11) DEFAULT NULL COMMENT '登陆人ID',
  `user_name` varchar(20) DEFAULT NULL COMMENT '登录用户名称',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `sort` varchar(10) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "think_group"
#

INSERT INTO `think_group` VALUES (1,'111111',NULL,'123123',1,'管理员',1427355264,1427426906,0,'13123'),(2,'2222222222',NULL,'',1,'管理员',1427426895,0,0,'');

#
# Source for table "think_group_user"
#

DROP TABLE IF EXISTS `think_group_user`;
CREATE TABLE `think_group_user` (
  `group_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_group_user"
#

INSERT INTO `think_group_user` VALUES (1,44),(1,67),(1,49),(1,50),(1,51),(1,52),(1,55),(1,57),(1,58),(1,59),(1,60),(1,61),(1,56),(1,62),(1,1),(1,66),(2,1);

#
# Source for table "think_info"
#

DROP TABLE IF EXISTS `think_info`;
CREATE TABLE `think_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_no` varchar(20) NOT NULL DEFAULT '' COMMENT '文档编号',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `content` text NOT NULL COMMENT '内容',
  `folder` int(11) NOT NULL DEFAULT '0' COMMENT '分类',
  `is_sign` tinyint(3) DEFAULT '0' COMMENT '是否需要签收',
  `is_public` tinyint(3) DEFAULT NULL COMMENT '是否公开',
  `scope_user_id` text COMMENT '发布范围ID',
  `scope_user_name` text COMMENT '发布范围名称',
  `add_file` varchar(200) NOT NULL DEFAULT '' COMMENT '附件',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '登陆人ID',
  `user_name` varchar(20) NOT NULL DEFAULT '' COMMENT '登陆人名称',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `dept_name` varchar(20) DEFAULT NULL COMMENT '部门名称',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;

#
# Data for table "think_info"
#

INSERT INTO `think_info` VALUES (109,'2014-0001','白斑病白斑病白斑病白斑病吧','1111111111AAAAAAAAAA',66,1,NULL,'dept_1,','小微企业|dept_1;','MDAwMDAwMDAwMIO3j2expKJu;MDAwMDAwMDAwMIW0c3M;',1,'管理员',1,'小微企业',1417403209,1417533507,1),(110,'2014-0002','滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答答','1111111111111111111',66,1,NULL,'','','',1,'管理员',1,'小微企业',1417527929,0,1),(111,'2014-0003','滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答滴答答','1111111111111111111',66,1,NULL,'','','',1,'管理员',1,'小微企业',1417528069,0,1),(112,'2014-0004','烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦','水水水水水水水水水水水水水水水水水水水',66,0,NULL,'','','',1,'管理员',1,'小微企业',1417528389,0,1),(113,'2014-0005','烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦','水水水水水水水水水水水水水水水水水水水',66,0,NULL,'','','',1,'管理员',1,'小微企业',1417528412,0,1),(114,'2014-0006','水水水水水水水水水水水水水水水水水水水','水水水水水水水水',66,0,NULL,'','','',1,'管理员',1,'小微企业',1417528621,0,1),(115,'2014-0007','踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩','踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩',66,1,1,'','','',1,'管理员',1,'小微企业',1417529442,1417530214,1),(116,'2015-0001','春节放假通知','春节放假通知',66,0,1,'dept_1,','小微企业|dept_1;','',1,'管理员',1,'小微企业',1421878587,0,0),(117,'2015-0002','2015年晋升及工资调整方案','2015年晋升及工资调整方案',66,0,NULL,'','','',1,'管理员',1,'小微企业',1421878634,0,0),(118,'2015-0003','关于实行公司业务改善提案制度通知','关于实行公司业务改善提案制度通知',67,0,NULL,'','','',1,'管理员',1,'小微企业',1421878681,0,0),(119,'2015-0004','111111111111111111111111','11111111111111111111111111',67,0,NULL,'','','',1,'管理员',1,'小微企业',1422536684,0,1),(120,'2015-0005','111111111111111111111111','sssssssssssss',67,0,NULL,'','','',1,'管理员',1,'小微企业',1422536887,0,1),(121,'2015-0006','ddddddddddddddddd','dddddddddddd',67,0,NULL,'','','',1,'管理员',1,'小微企业',1422537084,0,1),(122,'2015-0007','ssssssssssssssssssssssssss','ssssssssssssssssssssssssssssssssss',67,0,NULL,'','','',1,'管理员',1,'小微企业',1422537187,0,1),(123,'2015-0008','2222222222','2222222222222222222222',66,0,NULL,'','','',1,'管理员',1,'小微企业',1422542927,0,0),(124,'2015-0009','新建:公告','<h1 style=\"font-size:24px;font-family:\'Microsoft YaHei\', simsun, Arial, sans-serif;font-weight:lighter;color:#2679B5;background-color:#FFFFFF;\">\r\n\t新建:公告\r\n</h1>',74,1,1,'dept_1,','小微企业|dept_1;','MDAwMDAwMDAwMIPNd3M;',1,'管理员',1,'小微企业',1422804336,1428468644,1),(125,'2015-0010','saas','<img src=\"http://img.smeoa.com/info/2015-04/552a0e4f38ae8.jpg\" alt=\"\" /><img src=\"http://img.smeoa.com/info/2015-04/552a0e5000347.jpg\" alt=\"\" /><img src=\"http://img.smeoa.com/info/2015-04/552a0e50b68b0.jpg\" alt=\"\" /><img src=\"http://img.smeoa.com/info/2015-04/552a0e5194775.jpg\" alt=\"\" /><img src=\"http://saas.localhost/Public/Static/editor/plugins/emoticons/images/13.gif\" border=\"0\" alt=\"\" /><img src=\"http://img.smeoa.com/info/2015-04/552a0e2f03f99.jpg\" alt=\"\" />',75,0,NULL,'dept_1,','小微企业|dept_1;','MDAwMDAwMDAwMIPNe3M;',1,'管理员',1,'小微企业',1428815946,1428819557,0),(126,'2015-0011','1111111111111111111','2222222222222222',75,0,NULL,'44,','总经理1001/总经理|44;','',1,'管理员',1,'小微企业',1429771792,0,0),(127,'2015-0012','111111111111111111111','122222222222222222222222222',75,0,NULL,'44,','总经理1001/总经理|44;','',1,'管理员',1,'小微企业',1429771915,0,0),(128,'2015-0013','1111111111111','22222222222222',75,0,NULL,'44,','总经理1001/总经理|44;','',1,'管理员',1,'小微企业',1429772013,0,0),(129,'2015-0014','信息模块微信开通通知功能','<table border=\"1\" cellspacing=\"0\" cellpadding=\"4\" align=\"center\" width=\"640px\" style=\"font-size:14px;color:#000000;font-family:\'Helvetica Neue\', \'Hiragino Sans GB\', \'Microsoft YaHei\', 微软雅黑, 黑体, Arial, sans-serif;background-color:#FFFFFF;\">\r\n\t<tbody>\r\n\t\t<tr>\r\n\t\t\t<th>\r\n\t\t\t\t参数\r\n\t\t\t</th>\r\n\t\t\t<th>\r\n\t\t\t\t必须\r\n\t\t\t</th>\r\n\t\t\t<th>\r\n\t\t\t\t说明\r\n\t\t\t</th>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\ttouser\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t否\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t成员ID列表（消息接收者，多个接收者用‘|’分隔，最多支持1000个）。特殊情况：指定为@all，则向关注该企业应用的全部成员发送\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\ttoparty\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t否\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t部门ID列表，多个接收者用‘|’分隔，最多支持100个。当touser为@all时忽略本参数\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\ttotag\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t否\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t标签ID列表，多个接收者用‘|’分隔。当touser为@all时忽略本参数\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\tmsgtype\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t是\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t消息类型，此时固定为：text\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\tagentid\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t是\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t企业应用的id，整型。可在应用的设置页面查看\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\tcontent\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t是\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t消息内容\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\tsafe\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t否\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t\t表示是否是保密消息，0表示否，1表示是，默认0\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t</tbody>\r\n</table>',75,0,NULL,'44,','总经理1001/总经理|44;','',1,'管理员',1,'小微企业',1429772077,1429774534,1),(130,'2015-0015','管理部全体员工开会通知','本周六上午九点在第一会议室召开会议。请大家准时参加',75,1,NULL,'dept_6,','管理部|dept_6;','',1,'管理员',1,'小微企业',1431412576,0,1),(131,'2015-0016','财务部全体开会','财务部本周星期五上午9点开始在第一会议室开会，请大家准时参会。',75,1,NULL,'dept_8,','财务部|dept_8;','',1,'管理员',1,'小微企业',1431414957,0,0),(132,'2015-0017','管理部开会时间变更','管理部全体员工开会时间从本周星期六变更为本周星期五下午2点在第一会议室开会。请大家准时参会。',75,1,NULL,'dept_6,','管理部|dept_6;','',1,'管理员',1,'小微企业',1431415094,0,1),(133,'2015-0018','就你的不行','就你的不行，怎么回事。',75,1,NULL,'48,','副总1003/副总|48;','',1,'管理员',1,'小微企业',1431415690,0,1),(134,'2015-0019','111111111111111111111111111','11111111111111111111111',74,1,NULL,'dept_1,1,55,56,57,58,59,60,61,62,49,50,51,52,66,42,43,48,67,44,65,','小微企业|dept_1;管理员/主管|1;员工5001/主管|55;员工5007/主管|56;员工5002/主管|57;员工5003/主管|58;员工5004/主管|59;员工5005/主管|60;员工5006/主管|61;员工5008/主管|62;经理3001/经理|49;经理3002/经理|50;经理3003/经理|51;经理3004/经理|52;test2/经理|66;总监2001/总监|42;总监2003/总监|43;副总1003/副总|48;李白/副总|67;总经理1001/总经理|44;test1/总经理|65;','',48,'副总1003',6,'管理部',1431415892,0,1),(135,'2015-0020','32222222222222222','2222222222222',74,0,NULL,'48,','副总1003/副总|48;','',48,'副总1003',6,'管理部',1431416121,0,0),(136,'2015-0021','XXXXXXXXXXXXXX','XXXXXXXXXXXXXXXXXXXX',74,1,NULL,'48,','副总1003/副总|48;','',48,'副总1003',6,'管理部',1431416152,0,0),(137,'2015-0022','你那边现在可以了么','<p>\r\n\t你那边现在可以了么？\r\n</p>\r\n<p>\r\n\t<br />\r\n</p>',75,1,NULL,'dept_1,','小微企业|dept_1;','',1,'管理员',1,'小微企业',1431484481,1432016907,0),(138,'2015-0023','聚餐通知','周末聚餐',75,1,NULL,'dept_1,','小微企业|dept_1;','',1,'管理员',1,'小微企业',1431495092,1432017204,0);

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

INSERT INTO `think_info_scope` VALUES (109,1),(109,42),(109,43),(109,44),(109,48),(109,49),(109,50),(109,51),(109,52),(109,55),(109,56),(109,57),(109,58),(109,59),(109,60),(109,61),(109,62),(109,65),(109,66),(109,67),(116,44),(116,67),(116,48),(116,42),(116,43),(116,49),(116,50),(116,51),(116,52),(116,55),(116,57),(116,58),(116,59),(116,60),(116,61),(116,56),(116,62),(116,1),(116,65),(116,66),(124,44),(124,67),(124,48),(124,42),(124,43),(124,49),(124,50),(124,51),(124,52),(124,55),(124,57),(124,58),(124,59),(124,60),(124,61),(124,56),(124,62),(124,1),(124,65),(124,66),(125,44),(125,67),(125,48),(125,42),(125,43),(125,49),(125,50),(125,51),(125,52),(125,55),(125,57),(125,58),(125,59),(125,60),(125,61),(125,56),(125,62),(125,1),(125,65),(125,66),(126,44),(127,44),(128,44),(129,44),(130,48),(130,49),(130,50),(130,55),(130,57),(130,58),(130,59),(131,42),(131,51),(131,52),(131,56),(131,60),(131,61),(131,62),(132,48),(132,49),(132,50),(132,55),(132,57),(132,58),(132,59),(133,48),(134,44),(134,67),(134,48),(134,42),(134,43),(134,49),(134,50),(134,51),(134,52),(134,55),(134,57),(134,58),(134,59),(134,60),(134,61),(134,56),(134,62),(134,1),(134,65),(134,66),(135,48),(136,48),(137,44),(137,67),(137,48),(137,42),(137,43),(137,49),(137,50),(137,51),(137,52),(137,55),(137,57),(137,58),(137,59),(137,60),(137,61),(137,56),(137,62),(137,1),(137,65),(137,66);

#
# Source for table "think_info_sign"
#

DROP TABLE IF EXISTS `think_info_sign`;
CREATE TABLE `think_info_sign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `info_id` int(11) NOT NULL DEFAULT '0' COMMENT '信息ID',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '登录用户ID',
  `user_name` varchar(20) NOT NULL DEFAULT '' COMMENT '登录用户名称',
  `is_sign` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否签收',
  `sign_time` int(11) unsigned DEFAULT NULL COMMENT '签收时间',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `dept_name` varchar(20) DEFAULT NULL COMMENT '部门名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

#
# Data for table "think_info_sign"
#

INSERT INTO `think_info_sign` VALUES (71,109,1,'管理员',1,1417533958,NULL,NULL),(72,124,1,'管理员',1,1422806114,1,'小微企业'),(73,124,42,'总监2001',1,1424448156,8,'财务部'),(74,130,55,'员工5001',1,1431412695,24,'总务科'),(75,130,48,'副总1003',1,1431412995,6,'管理部'),(76,130,50,'经理3002',1,1431413642,23,'人事科'),(77,130,49,'经理3001',1,1431413670,24,'总务科'),(78,130,57,'员工5002',1,1431413882,24,'总务科'),(79,131,42,'总监2001',1,1431414980,8,'财务部'),(80,132,48,'副总1003',1,1431415121,6,'管理部'),(81,132,49,'经理3001',1,1431415624,24,'总务科'),(82,133,48,'副总1003',1,1431415712,6,'管理部'),(83,133,48,'副总1003',1,1431415716,6,'管理部'),(84,133,48,'副总1003',1,1431415721,6,'管理部'),(85,133,48,'副总1003',1,1431415729,6,'管理部'),(86,133,48,'副总1003',1,1431415732,6,'管理部'),(87,133,48,'副总1003',1,1431415733,6,'管理部'),(88,133,48,'副总1003',1,1431415733,6,'管理部'),(89,134,48,'副总1003',1,1431415924,6,'管理部'),(90,136,48,'副总1003',1,1431416157,6,'管理部'),(91,134,1,'管理员',1,1431416214,1,'小微企业'),(92,137,48,'副总1003',1,1431484511,6,'管理部'),(93,138,48,'副总1003',1,1431495132,6,'管理部');

#
# Source for table "think_mail"
#

DROP TABLE IF EXISTS `think_mail`;
CREATE TABLE `think_mail` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `folder` int(11) NOT NULL DEFAULT '0' COMMENT '文件夹',
  `mid` varchar(200) DEFAULT NULL COMMENT '邮件唯一id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `content` text NOT NULL COMMENT '内容',
  `add_file` varchar(200) DEFAULT NULL COMMENT '附件',
  `from` varchar(255) DEFAULT NULL COMMENT '发件人',
  `to` varchar(255) DEFAULT NULL COMMENT '收件人',
  `reply_to` varchar(255) DEFAULT NULL COMMENT '回复到',
  `cc` varchar(255) DEFAULT NULL COMMENT '抄送',
  `read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '已读',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `user_name` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名称',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_mail"
#


#
# Source for table "think_mail_account"
#

DROP TABLE IF EXISTS `think_mail_account`;
CREATE TABLE `think_mail_account` (
  `id` mediumint(6) NOT NULL,
  `email` varchar(50) DEFAULT NULL COMMENT '邮件地址',
  `mail_name` varchar(50) NOT NULL DEFAULT '' COMMENT '邮件显示名称',
  `pop3svr` varchar(50) NOT NULL DEFAULT '' COMMENT 'pop服务器',
  `smtpsvr` varchar(50) NOT NULL DEFAULT '' COMMENT 'smtp服务器',
  `mail_id` varchar(50) NOT NULL DEFAULT '' COMMENT '邮件ID',
  `mail_pwd` varchar(50) NOT NULL DEFAULT '' COMMENT '邮件密码',
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
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `sender_check` int(11) NOT NULL DEFAULT '0' COMMENT '是否确认发件人',
  `sender_option` int(11) NOT NULL DEFAULT '0' COMMENT '发件人选项',
  `sender_key` varchar(50) NOT NULL DEFAULT '' COMMENT '确认发件人值',
  `domain_check` int(11) NOT NULL DEFAULT '0' COMMENT '是否确认域名',
  `domain_option` int(11) NOT NULL DEFAULT '0' COMMENT '域名选项',
  `domain_key` varchar(50) NOT NULL DEFAULT '' COMMENT '确认域名值',
  `recever_check` int(11) NOT NULL DEFAULT '0' COMMENT '是否确认收件人',
  `recever_option` int(11) NOT NULL DEFAULT '0' COMMENT '收件人选项',
  `recever_key` varchar(50) NOT NULL DEFAULT '' COMMENT '确认收信人值',
  `title_check` int(11) NOT NULL DEFAULT '0' COMMENT '是否确认标题',
  `title_option` int(11) NOT NULL DEFAULT '0' COMMENT '确认标题选项',
  `title_key` varchar(50) NOT NULL DEFAULT '' COMMENT '确认标题值',
  `to` int(11) NOT NULL DEFAULT '0' COMMENT '移动到',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
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
  `content` text COMMENT '内容',
  `add_file` varchar(200) DEFAULT NULL COMMENT '附件',
  `sender_id` int(11) DEFAULT NULL COMMENT '发送人',
  `sender_name` varchar(20) DEFAULT NULL COMMENT '发送人名称',
  `receiver_id` int(11) DEFAULT NULL COMMENT '接收人',
  `receiver_name` varchar(20) DEFAULT NULL COMMENT '接收人名称',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `owner_id` int(11) DEFAULT NULL COMMENT '拥有者',
  `is_del` tinyint(3) DEFAULT '0' COMMENT '删除标记',
  `is_read` tinyint(3) DEFAULT '0' COMMENT '是否已读',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8;

#
# Data for table "think_message"
#

INSERT INTO `think_message` VALUES (25,'111111111111','',49,'经理3001',1,'管理员/主管',1419867485,49,0,1),(27,'222222222','',49,'经理3001',1,'管理员/主管',1419867647,49,0,1),(30,'333333333333','',1,'管理员',49,'经理3001',1419867696,49,0,0),(32,'4444444444444444','',1,'管理员',49,'经理3001',1419867736,49,0,0),(34,'5555555555555','',1,'管理员',49,'经理3001',1419867753,49,0,0),(36,'6666666666666666','',1,'管理员',49,'经理3001',1419867815,49,0,0),(38,'77777777777777777777777','MDAwMDAwMDAwMIO3e3M;',1,'管理员',49,'经理3001',1419867833,49,0,0),(40,NULL,NULL,1,'管理员',NULL,NULL,1421418908,NULL,0,0),(42,NULL,NULL,1,'管理员',NULL,NULL,1421419910,NULL,0,0),(44,NULL,NULL,1,'管理员',NULL,NULL,1421419966,NULL,0,0),(46,NULL,NULL,1,'管理员',NULL,NULL,1421419996,NULL,0,0),(48,'1111111111111','',1,'管理员',42,'总监2001/总监',1421420069,42,0,1),(50,'1111111111111','',1,'管理员',51,'经理3003/经理',1421420069,51,0,0),(52,'22222222222','',1,'管理员',42,'总监2001/总监',1421420144,42,0,1),(54,'11111111111111','',1,'管理员',0,'总经办',1421420213,0,0,0),(56,'11111111111111','',1,'管理员',67,'李白/副总',1421420213,67,0,0),(57,'11111111111','',1,'管理员',67,'李白/副总',1421421250,1,0,0),(58,'11111111111','',1,'管理员',67,'李白/副总',1421421250,67,0,0),(60,'sssssssssssssssss','',1,'管理员',49,'经理3001/经理',1421421283,49,0,0),(61,'sssssssssssssssss','',1,'管理员',50,'经理3002/经理',1421421283,1,0,1),(62,'sssssssssssssssss','',1,'管理员',50,'经理3002/经理',1421421283,50,0,0),(63,'sssssssssssssssss','',1,'管理员',55,'员工5001/主管',1421421283,1,0,0),(64,'sssssssssssssssss','',1,'管理员',55,'员工5001/主管',1421421283,55,0,0),(71,'222222222222222','',1,'管理员',50,'经理3002/经理',1421423012,1,0,1),(72,'222222222222222','',1,'管理员',50,'经理3002/经理',1421423012,50,0,0),(73,'222222222222222','',1,'管理员',50,'经理3002/经理',1421423017,1,0,1),(74,'222222222222222','',1,'管理员',50,'经理3002/经理',1421423017,50,0,0),(75,'2222222222','',1,'管理员',50,'经理3002/经理',1421423129,1,0,1),(76,'2222222222','',1,'管理员',50,'经理3002/经理',1421423129,50,0,0),(77,'2222222222','',1,'管理员',50,'经理3002/经理',1421423171,1,0,0),(78,'2222222222','',1,'管理员',50,'经理3002/经理',1421423171,50,0,0),(79,'1111111111','',1,'管理员',44,'总经理1001/总经理',1421477721,1,0,1),(80,'1111111111','',1,'管理员',44,'总经理1001/总经理',1421477721,44,0,1),(81,'xxxxxxxxxxxxxx','',1,'管理员',44,'总经理1001',1421477954,1,0,1),(82,'xxxxxxxxxxxxxx','',1,'管理员',44,'总经理1001',1421477954,44,0,1),(83,'333333333333333333','',42,'总监2001',1,'管理员',1422543413,42,0,1),(84,'333333333333333333','',42,'总监2001',1,'管理员',1422543413,1,0,1),(85,'444444444444444444','',42,'总监2001',1,'管理员',1422543422,42,0,1),(86,'444444444444444444','',42,'总监2001',1,'管理员',1422543422,1,0,1),(87,'阿巴斯擦掉散发的额12312125123151231阿巴达斯科菲卡上的','',1,'管理员',44,'总经理1001',1429237150,1,0,1),(88,'阿巴斯擦掉散发的额12312125123151231阿巴达斯科菲卡上的','',1,'管理员',44,'总经理1001',1429237150,44,0,1),(89,'发送测试1','',1,'管理员',44,'总经理1001',1429237278,1,0,1),(90,'发送测试1','',1,'管理员',44,'总经理1001',1429237278,44,0,1),(91,'sssssssssssssss','',1,'管理员',1,'管理员/主管',1431330392,1,0,1),(92,'sssssssssssssss','',1,'管理员',1,'管理员/主管',1431330392,1,0,1),(93,'xxxxxxxxxxxxxxx','',1,'管理员',1,'管理员',1431333003,1,0,1),(94,'xxxxxxxxxxxxxxx','',1,'管理员',1,'管理员',1431333003,1,0,1),(95,'xxxxxxxxxxxxxxxxxxxx','',44,'总经理1001',1,'管理员',1431333948,44,0,1),(96,'xxxxxxxxxxxxxxxxxxxx','',44,'总经理1001',1,'管理员',1431333948,1,0,1),(97,'XXXXXXXXXXXXXXXXXXXX','',44,'总经理1001',1,'管理员',1431333979,44,0,1),(98,'XXXXXXXXXXXXXXXXXXXX','',44,'总经理1001',1,'管理员',1431333979,1,0,1),(99,'111111111111111','',1,'管理员',44,'总经理1001',1431334092,1,0,1),(100,'111111111111111','',1,'管理员',44,'总经理1001',1431334092,44,0,1),(101,'1111111111111111111111111','',44,'总经理1001',1,'管理员',1431334110,44,0,1),(102,'1111111111111111111111111','',44,'总经理1001',1,'管理员',1431334110,1,0,1),(103,'BBBBBBBBBBBBBBBB','',1,'管理员',44,'总经理1001',1431334179,1,0,1),(104,'BBBBBBBBBBBBBBBB','',1,'管理员',44,'总经理1001',1431334179,44,0,1),(105,'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX','',1,'管理员',44,'总经理1001',1431334188,1,0,1),(106,'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX','',1,'管理员',44,'总经理1001',1431334188,44,0,1),(107,'BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB','',44,'总经理1001',1,'管理员',1431334207,44,0,1),(108,'BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB','',44,'总经理1001',1,'管理员',1431334207,1,0,1),(109,'11111111111111111111111','',44,'总经理1001',1,'管理员',1431334267,44,0,1),(110,'11111111111111111111111','',44,'总经理1001',1,'管理员',1431334267,1,0,1),(111,'33333333333333333333','',1,'管理员',44,'总经理1001',1431334294,1,0,1),(112,'33333333333333333333','',1,'管理员',44,'总经理1001',1431334294,44,0,1),(113,'笑嘻嘻笑嘻嘻笑嘻嘻笑嘻嘻系','',44,'总经理1001',1,'管理员',1431335239,44,0,1),(114,'笑嘻嘻笑嘻嘻笑嘻嘻笑嘻嘻系','',44,'总经理1001',1,'管理员',1431335239,1,0,1),(115,'笑嘻嘻笑嘻嘻笑嘻嘻笑嘻嘻系','',44,'总经理1001',1,'管理员',1431335259,44,0,1),(116,'笑嘻嘻笑嘻嘻笑嘻嘻笑嘻嘻系','',44,'总经理1001',1,'管理员',1431335259,1,0,1),(117,'笑嘻嘻笑嘻嘻笑嘻嘻笑嘻嘻系','',44,'总经理1001',1,'管理员',1431335269,44,0,1),(118,'笑嘻嘻笑嘻嘻笑嘻嘻笑嘻嘻系','',44,'总经理1001',1,'管理员',1431335269,1,0,1),(119,'xxxxxxxxxxxxxx','',44,'总经理1001',1,'管理员',1431335338,44,0,1),(120,'xxxxxxxxxxxxxx','',44,'总经理1001',1,'管理员',1431335338,1,0,1),(121,'bbbbbbbbbbbbbbbbbbbb','',44,'总经理1001',1,'管理员',1431335368,44,0,1),(122,'bbbbbbbbbbbbbbbbbbbb','',44,'总经理1001',1,'管理员',1431335368,1,0,1),(123,'xxxxxxxxxxxxxxxxxxxx','',1,'管理员',44,'总经理1001',1431335407,1,0,1),(124,'xxxxxxxxxxxxxxxxxxxx','',1,'管理员',44,'总经理1001',1431335407,44,0,1),(125,'bbbbbbbbbbbbbbbb','',1,'管理员',44,'总经理1001',1431335505,1,0,1),(126,'bbbbbbbbbbbbbbbb','',1,'管理员',44,'总经理1001',1431335505,44,0,1),(127,'bbbbbbbbbbbbbbbbbbbbbbbb','',1,'管理员',44,'总经理1001',1431335522,1,0,1),(128,'bbbbbbbbbbbbbbbbbbbbbbbb','',1,'管理员',44,'总经理1001',1431335522,44,0,1),(129,'xxxxxxxxxxxxxxxxxxxxx','',44,'总经理1001',1,'管理员',1431335548,44,0,1),(130,'xxxxxxxxxxxxxxxxxxxxx','',44,'总经理1001',1,'管理员',1431335548,1,0,1),(131,'bbbbbbbbbbbbbbbbbbbb','',44,'总经理1001',1,'管理员',1431335558,44,0,1),(132,'bbbbbbbbbbbbbbbbbbbb','',44,'总经理1001',1,'管理员',1431335558,1,0,1),(133,'eeeeeeeeeeeeeeeeeeeeeeee','',44,'总经理1001',1,'管理员',1431335576,44,0,1),(134,'eeeeeeeeeeeeeeeeeeeeeeee','',44,'总经理1001',1,'管理员',1431335576,1,0,1),(135,'bbbbbbbbbbbbbbbbbbbbb','',44,'总经理1001',1,'管理员',1431335594,44,0,1),(136,'bbbbbbbbbbbbbbbbbbbbb','',44,'总经理1001',1,'管理员',1431335594,1,0,1),(137,'笑嘻嘻笑嘻嘻笑嘻嘻笑嘻嘻','',1,'管理员',44,'总经理1001',1432784095,1,0,1),(138,'笑嘻嘻笑嘻嘻笑嘻嘻笑嘻嘻','',1,'管理员',44,'总经理1001',1432784095,44,0,1),(139,'笑嘻嘻笑嘻嘻笑嘻嘻信息','',1,'管理员',44,'总经理1001',1432784130,1,0,1),(140,'笑嘻嘻笑嘻嘻笑嘻嘻信息','',1,'管理员',44,'总经理1001',1432784130,44,0,1),(141,'冰冰冰冰冰冰冰冰冰冰冰冰冰冰','',1,'管理员',44,'总经理1001',1432784157,1,0,1),(142,'冰冰冰冰冰冰冰冰冰冰冰冰冰冰','',1,'管理员',44,'总经理1001',1432784157,44,0,1),(143,'少时诵诗书','',1,'管理员',44,'总经理1001',1432784746,1,0,1),(144,'少时诵诗书','',1,'管理员',44,'总经理1001',1432784746,44,0,1),(145,'少时诵诗书','',1,'管理员',44,'总经理1001',1432784769,1,0,1),(146,'少时诵诗书','',1,'管理员',44,'总经理1001',1432784769,44,0,1),(147,'XXXXXXXXXXXXX','',1,'管理员',44,'总经理1001',1432784781,1,0,1),(148,'XXXXXXXXXXXXX','',1,'管理员',44,'总经理1001',1432784781,44,0,1),(149,'你好 消息测试','',1,'管理员',44,'总经理1001',1432784795,1,0,1),(150,'你好 消息测试','',1,'管理员',44,'总经理1001',1432784795,44,0,1),(151,'XXXXXXXXXXXX','',1,'管理员',44,'总经理1001',1432789038,1,0,1),(152,'XXXXXXXXXXXX','',1,'管理员',44,'总经理1001',1432789038,44,0,1),(153,'笑嘻嘻笑嘻嘻笑嘻嘻信息','',1,'管理员',44,'总经理1001',1432789200,1,0,1),(154,'笑嘻嘻笑嘻嘻笑嘻嘻信息','',1,'管理员',44,'总经理1001',1432789200,44,0,1),(155,'XXXXXXXXXXXXXXXXXXXXXXXXX','',1,'管理员',44,'总经理1001',1432789250,1,0,1),(156,'XXXXXXXXXXXXXXXXXXXXXXXXX','',1,'管理员',44,'总经理1001',1432789250,44,0,1),(157,'BBBBBBBBBBBBBBBBBBB','',1,'管理员',44,'总经理1001',1432789325,1,0,1),(158,'BBBBBBBBBBBBBBBBBBB','',1,'管理员',44,'总经理1001',1432789325,44,0,1),(159,'草草草草草草草草草草草','',1,'管理员',44,'总经理1001',1432789375,1,0,1),(160,'草草草草草草草草草草草','',1,'管理员',44,'总经理1001',1432789375,44,0,1),(161,'XXXXXXXXXXXXXXXXXXX','',1,'管理员',44,'总经理1001',1432789469,1,0,1),(162,'XXXXXXXXXXXXXXXXXXX','',1,'管理员',44,'总经理1001',1432789469,44,0,1),(163,'ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ&nbsp;','',1,'管理员',44,'总经理1001',1432789746,1,0,0),(164,'ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ&nbsp;','',1,'管理员',44,'总经理1001',1432789746,44,0,1),(165,'XXXXXXXXXXXXXXXXXX','',44,'总经理1001',1,'管理员',1432790553,44,0,1),(166,'XXXXXXXXXXXXXXXXXX','',44,'总经理1001',1,'管理员',1432790553,1,0,0),(167,'白冰冰冰冰冰冰冰冰冰冰','',44,'总经理1001',1,'管理员',1432790933,44,0,1),(168,'白冰冰冰冰冰冰冰冰冰冰','',44,'总经理1001',1,'管理员',1432790933,1,0,0),(169,'草草草草草草草草草草草','',44,'总经理1001',1,'管理员',1432790989,44,0,1),(170,'草草草草草草草草草草草','',44,'总经理1001',1,'管理员',1432790989,1,0,0),(171,'白斑病白斑病白斑病白斑病','',44,'总经理1001',1,'管理员',1432791115,44,0,1),(172,'白斑病白斑病白斑病白斑病','',44,'总经理1001',1,'管理员',1432791115,1,0,0),(173,'BBBBBBBBBBBB','',44,'总经理1001',1,'管理员',1432791443,44,0,1),(174,'BBBBBBBBBBBB','',44,'总经理1001',1,'管理员',1432791443,1,0,0),(175,'白冰冰冰冰冰冰冰冰','',44,'总经理1001',1,'管理员',1432791522,44,0,1),(176,'白冰冰冰冰冰冰冰冰','',44,'总经理1001',1,'管理员',1432791522,1,0,0),(177,'BBBBBBBBBBBB','',44,'总经理1001',1,'管理员',1432791632,44,0,1),(178,'BBBBBBBBBBBB','',44,'总经理1001',1,'管理员',1432791632,1,0,0),(179,'啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊','',44,'总经理1001',1,'管理员',1432792143,44,0,1),(180,'啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊','',44,'总经理1001',1,'管理员',1432792143,1,0,0),(181,'白冰冰冰冰冰冰冰冰冰冰冰冰冰冰冰冰','',44,'总经理1001',1,'管理员',1432792152,44,0,1),(182,'白冰冰冰冰冰冰冰冰冰冰冰冰冰冰冰冰','',44,'总经理1001',1,'管理员',1432792152,1,0,0),(183,'BBBBBBBBBBBBBB','',44,'总经理1001',1,'管理员',1432793029,44,0,0),(184,'BBBBBBBBBBBBBB','',44,'总经理1001',1,'管理员',1432793029,1,0,0);

#
# Source for table "think_node"
#

DROP TABLE IF EXISTS `think_node`;
CREATE TABLE `think_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT 'URL地址',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `sub_folder` varchar(20) DEFAULT NULL COMMENT '子文件夹',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `sort` varchar(20) DEFAULT NULL COMMENT '排序',
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `badge_function` varchar(50) DEFAULT NULL COMMENT '统计函数',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`is_del`)
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8;

#
# Data for table "think_node"
#

INSERT INTO `think_node` VALUES (84,'管理','User/index','fa fa-cogs','','','999',0,0,NULL),(85,'邮件','Mail/index','fa fa-envelope-o bc-mail','','','1',0,0,'badge_sum'),(87,'审批','Flow/index','fa fa-pencil bc-flow','','','2',0,0,'badge_sum'),(88,'信息','Info/index##','fa fa-file-o','InfoFolder','','4',0,0,'badge_sum'),(91,'日程','Schedule/index','fa fa-calendar bc-personal-schedule','','','9',198,0,'badge_count_schedule'),(94,'职位','Position/index',NULL,NULL,'','',1,0,NULL),(100,'写信','Mail/add',NULL,'','','1',85,0,NULL),(101,'收件箱','Mail/folder?fid=inbox','bc-mail-inbox','','','3',85,0,'badge_count_mail_inbox'),(102,'邮件设置','',NULL,NULL,NULL,'9',85,0,NULL),(104,'垃圾箱','Mail/folder?fid=spambox','','','','5',85,0,NULL),(105,'发件箱','Mail/folder?fid=outbox','','','','6',85,0,NULL),(106,'已删除','Mail/folder?fid=delbox','','','','4',85,0,NULL),(107,'草稿箱','Mail/folder?fid=darftbox','','','','7',85,0,NULL),(108,'邮件帐户设置','MailAccount/index',NULL,'','','1',102,0,NULL),(110,'公司信息管理','',NULL,NULL,'','1',84,0,NULL),(112,'权限管理','',NULL,NULL,'','3',84,0,NULL),(113,'系统设定','',NULL,NULL,'','4',84,0,NULL),(114,'系统参数设置','SystemConfig/index','','','','2',113,0,''),(115,'组织图','Dept/index','','','','1',110,0,NULL),(116,'员工登记','User/index',NULL,'','','5',110,0,NULL),(118,'权限组管理','Role/index','','','','1',112,0,NULL),(119,'权限设置','Role/node','','','','2',112,0,NULL),(120,'权限分配','Role/user','','','','3',112,0,NULL),(121,'菜单管理','Node/index','','','','1',113,0,NULL),(123,'职位','Position/index',NULL,'','','2',110,0,NULL),(124,'文件夹设置','Mail/folder_manage','','','','2',102,0,''),(125,'联系人','Contact/index','','','','1',198,0,NULL),(126,'信息搜索','Info/index','','','','1',88,0,NULL),(143,'邮件分类','MailOrganize/index',NULL,'','','',102,0,NULL),(144,'发起','Flow/index','','','','1',87,0,NULL),(146,'流程管理','FlowType/index','','','','9',87,0,NULL),(147,'待审批','Flow/folder?fid=confirm','bc-flow-confirm','','','4',87,0,'badge_count_flow_todo'),(148,'已审批','Flow/folder?fid=finish','','','','5',87,0,''),(149,'草稿箱','Flow/folder?fid=darft','','','','2',87,0,''),(150,'已提交','Flow/folder?fid=submit','','','','3',87,0,''),(152,'待办','Todo/index','fa fa-tasks bc-personal-todo','','','9',198,0,'badge_count_todo'),(153,'部门级别','DeptGrade/index','','','','4',110,0,NULL),(156,'客户','Customer/index',NULL,'','','2',157,0,NULL),(157,'通讯录','Staff/index','fa fa-group','','','7',0,0,'badge_sum'),(158,'供应商','Supplier/index',NULL,'','','3',157,0,NULL),(169,'职员','Staff/index',NULL,'','','',157,0,NULL),(177,'我的文件夹','##mail','bc-mail-myfolder','MailFolder','','8',85,0,'badge_count_mail_user_folder'),(184,'流程分组','FlowType/tag_manage','','','','8',87,0,NULL),(185,'审批统计','Flow/folder?fid=report','bc-flow-receive','','','6',87,0,'badge_count_flow_receive'),(189,'信息分类','Info/folder_manage','','','','C1',88,0,''),(190,'消息','Message/index','fa fa-inbox bc-message','','','99',198,0,'badge_count_message'),(191,'用户设置','','','','','',198,0,NULL),(192,'用户资料','Profile/index','','','','',191,0,NULL),(193,'修改密码','Profile/password','','','','',191,0,NULL),(194,'用户设置','UserConfig/index','','','','999',191,0,NULL),(198,'个人','Contact/index','fa fa-user bc-personal','','','9',0,0,'badge_sum'),(205,'业务角色管理','Duty/index','','','','4',112,0,''),(206,'业务权限分配','Role/duty','','','','5',112,0,''),(214,'记账','Finance/index','fa fa-jpy','','','3',217,0,''),(216,'日报','WorkLog/index','fa fa-book','','','1',217,0,''),(217,'工作','WorkLog/index','fa fa-book','','','6',0,0,'badge_sum'),(219,'我的信息','Info/my_info','','','','B1',88,0,NULL),(220,'我的签收','Info/my_sign','','','','B2',88,0,NULL),(221,'文档','Doc/index##','fa fa-inbox','DocFolder','','4',0,0,'badge_sum'),(222,'文档管理','Doc/folder_manage','fa fa-inbox','','','4',221,0,'badge_sum'),(224,'任务','Task/index','fa fa-book','','','2',217,0,'badge_count_task'),(226,'报表','Form/index##','fa fa-table','FormFolder','','5',0,0,'badge_sum'),(227,'报表管理','Form/folder_manage','fa fa-inbox','','','4',226,0,'badge_sum'),(228,'报表字段类型','Form/field_type','fa fa-inbox','','','4',226,0,'badge_sum'),(229,'群组','Group/index','fa fa-group','','','7',157,0,'badge_sum'),(230,'考勤查看','Sign/index','fa fa-book','','','4',217,0,'badge_sum'),(231,'考勤统计','Sign/report','fa fa-book','','','5',217,0,'badge_sum'),(232,'工单','WorkOrder/index','fa fa-book','','','60',217,0,'badge_count_work_order'),(233,'工单统计','WorkOrder/report','fa fa-book','','','61',217,0,''),(234,'参阅箱','Flow/folder?fid=receive','bc-flow-receive','','','6',87,0,'badge_count_flow_receive');

#
# Source for table "think_position"
#

DROP TABLE IF EXISTS `think_position`;
CREATE TABLE `think_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position_no` varchar(10) NOT NULL DEFAULT '' COMMENT '编号',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `sort` varchar(10) NOT NULL DEFAULT '' COMMENT '排序',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Data for table "think_position"
#

INSERT INTO `think_position` VALUES (1,'011','主管','5',0),(2,'04','经理','4',0),(3,'03','总监','3',0),(4,'02','副总','2',0),(5,'01','总经理','1',0),(6,'06','助理','6',0);

#
# Source for table "think_push"
#

DROP TABLE IF EXISTS `think_push`;
CREATE TABLE `think_push` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `data` text NOT NULL,
  `status` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3048 DEFAULT CHARSET=utf8;

#
# Data for table "think_push"
#


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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

#
# Data for table "think_role"
#

INSERT INTO `think_role` VALUES (1,'公司管理员',0,'','1',1208784792,1368507168,0),(2,'基本权限',0,'','2',1215496283,1368507164,0),(7,'领导',0,'','2',1254325787,1401288337,0),(8,'测试权限',NULL,'','',1421876018,0,0),(9,'测试权限',NULL,'','',1432192986,0,0);

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

INSERT INTO `think_role_node` VALUES (2,136,NULL,NULL,NULL),(2,135,NULL,NULL,NULL),(1,94,NULL,NULL,NULL),(1,97,NULL,NULL,NULL),(1,98,NULL,NULL,NULL),(1,99,NULL,NULL,NULL),(1,69,NULL,NULL,NULL),(1,6,NULL,NULL,NULL),(1,2,NULL,NULL,NULL),(1,7,NULL,NULL,NULL),(1,131,1,1,1),(1,130,NULL,NULL,NULL),(1,133,NULL,NULL,NULL),(1,132,NULL,NULL,NULL),(1,135,NULL,NULL,NULL),(1,136,NULL,NULL,NULL),(1,117,NULL,NULL,NULL),(1,134,NULL,NULL,NULL),(2,103,NULL,NULL,NULL),(2,133,NULL,NULL,NULL),(2,130,NULL,NULL,NULL),(7,124,NULL,NULL,NULL),(7,108,NULL,NULL,NULL),(7,104,NULL,NULL,NULL),(7,107,NULL,NULL,NULL),(7,106,NULL,NULL,NULL),(7,105,NULL,NULL,NULL),(7,101,NULL,NULL,NULL),(7,100,NULL,NULL,NULL),(7,125,NULL,NULL,NULL),(2,134,NULL,NULL,NULL),(2,132,NULL,NULL,NULL),(2,103,NULL,NULL,NULL),(2,103,NULL,NULL,NULL),(2,109,NULL,NULL,NULL),(1,117,NULL,NULL,NULL),(1,117,NULL,NULL,NULL),(1,117,NULL,NULL,NULL),(1,117,NULL,NULL,NULL),(1,103,NULL,NULL,NULL),(1,109,NULL,NULL,NULL),(1,117,NULL,NULL,NULL),(1,117,NULL,NULL,NULL),(1,163,NULL,NULL,NULL),(1,170,NULL,NULL,NULL),(1,164,NULL,NULL,NULL),(1,155,NULL,NULL,NULL),(1,154,1,1,1),(1,111,NULL,NULL,NULL),(1,168,NULL,NULL,NULL),(1,162,NULL,NULL,NULL),(1,166,NULL,NULL,NULL),(1,161,NULL,NULL,NULL),(1,171,NULL,NULL,NULL),(1,165,NULL,NULL,NULL),(1,174,NULL,NULL,NULL),(1,172,NULL,NULL,NULL),(1,173,NULL,NULL,NULL),(1,160,NULL,NULL,NULL),(1,175,NULL,NULL,NULL),(1,176,NULL,NULL,NULL),(1,167,NULL,NULL,NULL),(1,128,NULL,NULL,NULL),(8,226,1,1,1),(8,85,NULL,NULL,NULL),(8,100,NULL,NULL,NULL),(8,101,NULL,NULL,NULL),(8,106,NULL,NULL,NULL),(8,104,NULL,NULL,NULL),(8,105,NULL,NULL,NULL),(8,107,NULL,NULL,NULL),(8,177,NULL,NULL,NULL),(8,102,NULL,NULL,NULL),(8,143,NULL,NULL,NULL),(8,108,NULL,NULL,NULL),(8,124,NULL,NULL,NULL),(1,85,1,1,1),(1,100,NULL,NULL,NULL),(1,101,NULL,NULL,NULL),(1,106,NULL,NULL,NULL),(1,104,NULL,NULL,NULL),(1,105,NULL,NULL,NULL),(1,107,NULL,NULL,NULL),(1,177,1,1,1),(1,102,NULL,NULL,NULL),(1,143,1,1,1),(1,108,1,1,1),(1,124,NULL,NULL,NULL),(1,88,1,1,1),(1,126,1,1,1),(1,219,NULL,NULL,NULL),(1,220,NULL,NULL,NULL),(1,189,NULL,NULL,NULL),(1,221,1,1,1),(1,222,NULL,NULL,NULL),(1,226,1,1,1),(1,228,NULL,NULL,NULL),(1,227,NULL,NULL,NULL),(1,217,1,1,1),(1,216,1,1,1),(1,224,1,1,1),(1,230,1,1,1),(1,231,NULL,NULL,NULL),(1,232,1,1,1),(1,233,NULL,NULL,NULL),(1,214,1,1,1),(1,157,1,1,1),(1,169,1,1,1),(1,156,1,1,1),(1,158,1,1,1),(1,229,1,1,1),(1,198,1,1,1),(1,191,NULL,NULL,NULL),(1,193,NULL,NULL,NULL),(1,192,1,1,1),(1,194,1,1,1),(1,125,1,1,1),(1,91,1,1,1),(1,152,1,1,1),(1,190,1,1,1),(1,84,1,1,1),(1,110,NULL,NULL,NULL),(1,115,1,1,1),(1,123,1,1,1),(1,153,1,1,1),(1,116,1,1,1),(1,112,NULL,NULL,NULL),(1,118,1,1,1),(1,119,NULL,NULL,NULL),(1,120,NULL,NULL,NULL),(1,205,1,1,1),(1,206,NULL,NULL,NULL),(1,113,NULL,NULL,NULL),(1,121,1,1,1),(1,114,1,1,1),(2,85,1,1,1),(2,100,NULL,NULL,NULL),(2,101,NULL,NULL,NULL),(2,106,NULL,NULL,NULL),(2,104,NULL,NULL,NULL),(2,105,NULL,NULL,NULL),(2,107,NULL,NULL,NULL),(2,177,1,1,1),(2,102,NULL,NULL,NULL),(2,143,1,1,1),(2,108,1,1,1),(2,124,NULL,NULL,NULL),(2,88,NULL,1,1),(2,126,NULL,1,1),(2,219,NULL,NULL,NULL),(2,220,NULL,NULL,NULL),(2,226,NULL,1,1),(2,217,NULL,1,1),(2,216,NULL,1,1),(2,224,NULL,1,1),(2,230,NULL,1,1),(2,232,NULL,1,1),(2,157,1,1,1),(2,169,1,1,1),(2,156,1,1,1),(2,158,1,1,1),(2,229,NULL,1,1),(2,198,1,1,1),(2,191,NULL,NULL,NULL),(2,193,NULL,NULL,NULL),(2,192,1,1,1),(2,194,1,1,1),(2,125,1,1,1),(2,91,1,1,1),(2,152,1,1,1),(2,190,1,1,1),(2,87,1,1,1),(2,144,1,1,1),(2,149,NULL,NULL,NULL),(2,150,NULL,NULL,NULL),(2,147,NULL,NULL,NULL),(2,148,NULL,NULL,NULL),(2,185,NULL,NULL,NULL),(2,221,NULL,1,NULL),(1,87,1,1,1),(1,144,1,1,1),(1,149,NULL,NULL,NULL),(1,150,NULL,NULL,NULL),(1,147,NULL,NULL,NULL),(1,148,NULL,NULL,NULL),(1,185,NULL,NULL,NULL),(1,234,NULL,NULL,NULL),(1,184,NULL,NULL,NULL),(1,146,1,1,1);

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

INSERT INTO `think_role_user` VALUES (4,'27'),(4,'26'),(5,'31'),(3,'22'),(2,'67'),(1,'4'),(1,'3'),(1,'35'),(1,'36'),(1,'54'),(2,'3'),(1,'53'),(7,'36'),(1,'2'),(2,'66'),(2,'65'),(2,'62'),(2,'2'),(7,'2'),(2,'61'),(2,'60'),(2,'59'),(2,'58'),(2,'57'),(2,'55'),(1,'56'),(2,'52'),(2,'51'),(2,'50'),(2,'49'),(2,'48'),(2,'44'),(2,'43'),(2,'1'),(1,'1'),(1,'63'),(1,'64'),(2,'41'),(2,'68'),(7,'44'),(1,'55'),(2,'56'),(1,'42'),(2,'42'),(7,'42');

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
  `start_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `add_file` varchar(200) DEFAULT '',
  `is_del` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

#
# Data for table "think_schedule"
#

INSERT INTO `think_schedule` VALUES (70,'111111','22222222222','11111111',3,'',1,'2014-06-02 00:00:00','2015-01-18 05:00:00','',0),(71,'FFFFFFFFFFFFFFFFFFFF','FFFFFFFFFF','',3,'',1,'2014-06-14 00:00:00','2015-01-18 05:00:00','',0),(72,'3333333333333333','3333','333333',3,'',1,'2014-06-02 00:00:00','2015-01-18 05:00:00','',0),(73,'22222222222','111111111111','dd',3,'总监2002/总监|;副总1003/副总|;经理3001/经理|;经理3002/经理|;',1,'2014-07-08 00:00:00','2015-01-18 05:00:00','',0),(74,'SSSSSSSS','SSSSSSSSSSSSSSSSSSSSS','',3,'总经办|dept_5;李白/副总|1002;',1,'2014-12-31 00:00:00','2015-01-18 05:00:00','',0),(75,'1111111111111111','111111111111','11111111111',3,'',1,'2015-01-08 09:20:00','2015-03-06 08:50:00','',0),(76,'111111111111111','111111111111111111111111','',3,'',1,'2015-01-30 21:34:12','0000-00-00 00:00:00','',0),(77,'ssssssssssssssssssssssssssss','sssssssssssssssss','',3,'',1,'2015-01-30 21:38:38','2015-01-22 21:20:00','',0),(78,'11111111111111111111','1111111111111111111111111111111','',3,'',1,'2015-04-25 02:10:00','2015-04-30 15:50:00','',0),(79,'444444444444444444444','444444444444444444','',3,'',1,'2015-04-10 13:01:49','2015-04-10 04:20:00','',0),(80,'22222222222222222','巍峨噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩','',3,'',42,'2015-04-16 14:03:28','2015-04-16 09:20:00','',0),(81,'#','AAAAAAAAAAAAAAAAAAAAAAA','',3,'',1,'2015-04-17 20:12:03','2015-04-17 20:20:00','',0),(82,'其他','1111111111111111111','',3,'',1,'2015-04-17 20:30:09','2015-04-17 03:10:00','',0),(83,'A','aaaaaaaaaaaa','',3,'',1,'2015-04-17 21:20:34','2015-04-17 03:20:00','',0),(84,'B','ssssssssssss','',3,'',1,'2015-04-17 21:23:33','2015-04-03 04:20:00','',0),(85,'C','ssssssssss','',3,'',1,'2015-04-17 21:28:49','2015-04-02 03:20:00','',0),(86,'A','11111111111111','',3,'',1,'2015-04-19 14:47:35','2015-04-02 13:10:00','',0),(87,'C','BBBBBBBBBBBBBBBBB','',3,'',1,'2015-04-19 15:52:55','0000-00-00 00:00:00','',0),(88,'B','<p>\r\n\tBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB\r\n</p>\r\n<p>\r\n\tBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB\r\n</p>\r\n<p>\r\n\tBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB\r\n</p>\r\n<p>\r\n\t<br />\r\n</p>','',3,'',1,'2015-05-12 10:50:02','0000-00-00 00:00:00','',0),(89,'1111111111111111111','1111111111111111111111','',3,'',1,'2015-05-12 10:50:34','1899-12-21 09:50:00','',0),(90,'관리부서 및 재무부  미팅 ','<p>\r\n\t내일 출근 전으로 미팅 소집하여 관리 및 재무 관련서류 준비 완료 바람.\r\n</p>\r\n<p>\r\n\t이상\r\n</p>','',3,'',48,'2015-05-13 14:22:45','2015-05-14 09:00:00','',0),(91,'관리부서 및 재무부  미팅 ','<p>\r\n\t내일 출근 전으로 미팅 소집하여 관리 및 재무 관련서류 준비 완료 바람.\r\n</p>\r\n<p>\r\n\t이상\r\n</p>','',3,'',49,'2015-05-13 14:26:53','2015-05-14 09:00:00','',0),(92,'관리부서 및 재무부  미팅 ','<p>\r\n\t내일 출근 전으로 미팅 소집하여 관리 및 재무 관련서류 준비 완료 바람.\r\n</p>\r\n<p>\r\n\t이상\r\n</p>','',3,'',50,'2015-05-13 14:29:39','2015-05-14 09:00:00','',0),(93,'관리부서 및 재무부  미팅 ','<p>\r\n\t내일 출근 전으로 미팅 소집하여 관리 및 재무 관련서류 준비 완료 바람.\r\n</p>\r\n<p>\r\n\t이상\r\n</p>','',3,'',42,'2015-05-13 14:42:39','2015-05-14 09:00:00','',0),(94,'ssssssssssssssssssss','sssssssssssssssss','',3,'',1,'2015-05-27 18:01:57','2015-05-14 09:20:00','',0);

#
# Source for table "think_sign"
#

DROP TABLE IF EXISTS `think_sign`;
CREATE TABLE `think_sign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `emp_no` varchar(10) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `latitude` varchar(10) DEFAULT NULL,
  `longitude` varchar(10) DEFAULT NULL,
  `precision` varchar(10) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `is_real_time` tinyint(3) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `sign_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

#
# Data for table "think_sign"
#

INSERT INTO `think_sign` VALUES (20,1,NULL,1428049692,'35.953373','120.179726','71.821709','1','sign_in',1,NULL,'2015-04-01 00:00:00'),(21,1,NULL,1428044714,'35.953487','120.179741','55.000000','2','sign_in',0,NULL,'2015-04-02 00:00:00'),(22,1,NULL,1428044804,'35.953247','120.179565','72.007156','3','sign_out',0,NULL,'2015-04-03 00:00:00'),(23,1,NULL,1428045046,'35.953285','120.179642','65.000000','4','sign_in',0,NULL,'2015-04-04 00:00:00'),(24,1,NULL,1428045138,'35.953259','120.179527','79.133011','5','sign_out',0,NULL,'2015-04-05 00:00:00'),(25,1,NULL,1428045153,'35.953117','120.179520','69.714981','6','outside',0,NULL,'2015-04-06 00:00:00'),(26,1,NULL,1428048182,'35.953434','120.179649','65.000000','7','sign_in',0,'113.120.96.161','2015-04-07 00:00:00'),(27,1,NULL,1428049616,'35.953381','120.179688','77.405350','9','sign_in',0,'113.120.96.161','2015-04-08 00:00:00'),(28,1,NULL,1428049656,'35.953400','120.179688','70.592880','89','sign_out',0,'113.120.96.161','2015-04-09 00:00:00'),(29,1,NULL,1428049672,'35.953457','120.179741','74.530617','0','outside',0,'113.120.96.161','2015-04-10 00:00:00');

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

INSERT INTO `think_supplier` VALUES (21,'11111111','','111111111111','1111111111','11111111111','1111111111111111','1111111',NULL,'1111111111111','11111111111','','111111111',1,1,'11111111111111','11111111111',NULL),(22,'1','','2','3','4','5','7','1231231','10','9','12','6',1,1,'13','11',NULL),(23,'234234','','112','312','3123','3123','12',NULL,'312','31','12','3123',1,1,'3123','231',NULL);

#
# Source for table "think_system_config"
#

DROP TABLE IF EXISTS `think_system_config`;
CREATE TABLE `think_system_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `val` varchar(255) DEFAULT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  `sort` varchar(20) DEFAULT NULL,
  `pid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

#
# Data for table "think_system_config"
#

INSERT INTO `think_system_config` VALUES (1,'SYSTEM_NAME','系统名称','小微OA',0,'',0),(7,'UPLOAD_FILE_TYPE','上传文件类型','doc,docx,xls,xlsx,ppt,pptx,pdf,gif,png,tif,zip,rar,jpg,jpeg,txt',0,NULL,0),(8,'IS_VERIFY_CODE','验证码','0',0,'',0),(15,'FINANCE_INCOME_TYPE','办公费','办公费',0,'1',28),(16,'FINANCE_INCOME_TYPE','通讯费','通讯费',0,'2',28),(17,'FINANCE_PAYMENT_TYPE','办公费','办公费',0,'',29),(18,'FINANCE_PAYMENT_TYPE','通讯费','通讯费',0,'',29),(19,'WEIXIN_CORP_ID','WEIXIN_CORP_ID','wx4124a601419ba115',0,'',27),(20,'WEIXIN_SECRET','WEIXIN_SECRET','TlnidZYom5z8T-pE0y_O7IXm7dSPgPDtI3nQ7RyqLQePiyUXzWo8F-qum1n4i_QM',0,'',27),(21,'WEIXIN_TOKEN','WEIXIN_TOKEN','xiaowei',0,'',27),(22,'WEIXIN_ENCODING_AES_KEY','WEIXIN_ENCODING_AES_KEY','lsBzWprOjjdbkMatbg54wwMC2H9ZXmi1aEdDmUQ2nPq',0,'',27),(23,'WEIXIN_SITE_URL','WEIXIN_SITE_URL','http://xiaowei.smeoa.com',0,'',27),(24,'FINANCE_PAYMENT_TYPE','餐费','餐费',0,'',29),(25,'OA_AGENT_ID','OA_AGENT_ID','5',0,'',27),(26,'WEIXIN_SUBSCRIBE_MSG','WEIXIN_SUBSCRIBE_MSG','欢迎使用微信办公系统。',0,'',27),(27,'微信设置','微信设置','微信设置',0,'',0),(28,'记账-收入','记账-收入','记账-收入',0,'',0),(29,'记账-支出','记账-支出','记账-支出',0,'',0),(30,'SMS_PUSH_CONFIG','SMS_PUSH_CONFIG','信息,邮件,消息,审批',0,'',0),(31,'WS_PUSH_CONFIG','WS_PUSH_CONFIG','消息',0,'',0);

#
# Source for table "think_system_folder"
#

DROP TABLE IF EXISTS `think_system_folder`;
CREATE TABLE `think_system_folder` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `controller` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `admin` varchar(200) NOT NULL,
  `write` varchar(200) NOT NULL,
  `read` varchar(200) NOT NULL,
  `sort` varchar(20) NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  `remark` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

#
# Data for table "think_system_folder"
#

INSERT INTO `think_system_folder` VALUES (68,0,'Doc','总务科','','','','',0,''),(69,0,'Doc','人事科','管理员/主管|admin;','管理员/主管|admin;','小微企业|dept_1;','',0,''),(70,68,'Doc','车辆管理','','总经办|dept_5;','','',0,''),(74,0,'Info','公告','小微企业|dept_1;','','','',0,''),(75,0,'Info','通知','小微企业|dept_1;','','','',0,''),(76,0,'Form','登记表','小微企业|dept_1;','','','',0,'');

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

INSERT INTO `think_system_tag` VALUES (11,0,'Video','所属科室','11',''),(12,11,'Video','外科系统','12',''),(13,11,'Video','内科系统','13',''),(14,12,'Video','普通外科','14',''),(15,12,'Video','肛肠科','15',''),(16,11,'Video','专科中心','16',''),(17,11,'Video','医技辅助','17',''),(18,12,'Video','肝胆外科','18',''),(19,12,'Video','器官移植','19',''),(20,12,'Video','心血管外科','20',''),(21,12,'Video','显微外科','21',''),(22,12,'Video','胸外科','22',''),(23,12,'Video','泌尿生殖','23',''),(24,12,'Video','神经外科','24',''),(25,12,'Video','烧伤外科','25',''),(26,13,'Video','普通内科','26',''),(27,13,'Video','心血管内科','27',''),(28,13,'Video','呼吸内科','28',''),(29,13,'Video','消化内科','29',''),(30,13,'Video','肾内科','30',''),(31,13,'Video','血液科','31',''),(32,13,'Video','神经内科','32',''),(33,13,'Video','心理、精神科','33',''),(34,13,'Video','内分泌科','34',''),(35,13,'Video','感染传染','35',''),(36,16,'Video','妇产科','36',''),(37,16,'Video','儿科','37',''),(38,16,'Video','口腔科','38',''),(39,16,'Video','骨科','39',''),(40,16,'Video','皮肤病与性病科','40',''),(41,16,'Video','眼科','41',''),(42,16,'Video','耳鼻咽喉科','42',''),(43,16,'Video','肿瘤及核医学','43',''),(44,16,'Video','中医及中西医结合','44',''),(45,16,'Video','麻醉科','45',''),(46,16,'Video','美容整形','46',''),(47,17,'Video','门、急诊，ICU','47',''),(48,17,'Video','医学影像','48',''),(49,17,'Video','护理','49',''),(50,17,'Video','检验科','50',''),(51,17,'Video','康复理疗科','51',''),(52,17,'Video','药剂科','52',''),(53,17,'Video','信息科','53',''),(54,17,'Video','医院管理','54',''),(55,17,'Video','基础教学','55',''),(56,17,'Video','其他','56',''),(58,0,'Supplier','123','',''),(59,0,'Doc','123123','123123',''),(60,0,'Doc','123123','',''),(61,0,'Doc','abc','',''),(65,0,'Customer','22222','',''),(66,0,'Flow','人事','',''),(67,0,'Flow','IT','',''),(68,0,'Flow','公告','',''),(69,0,'FlowType','人事','1',''),(70,0,'FlowType','行政','2',''),(71,0,'FlowType','采购','3',''),(72,0,'FlowType','出差','4',''),(74,75,'ProductType','红色','',''),(75,0,'ProductType','颜色','',''),(76,75,'ProductType','蓝色','',''),(77,0,'ProductType','面料','',''),(78,77,'ProductType','A','',''),(79,77,'ProductType','B','',''),(80,0,'FlowType','车辆管理','5','');

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

INSERT INTO `think_system_tag_data` VALUES (18,58,'Supplier'),(29,14,'Video'),(29,46,'Video'),(30,46,'Video'),(30,47,'Video'),(30,56,'Video'),(64,59,'Doc'),(64,60,'Doc'),(64,61,'Doc'),(65,61,'Doc'),(33,14,'Video'),(17,66,'Flow'),(18,66,'Flow'),(19,66,'Flow'),(20,66,'Flow'),(21,66,'Flow'),(22,66,'Flow'),(23,66,'Flow'),(17,66,'Flow'),(18,66,'Flow'),(19,66,'Flow'),(20,66,'Flow'),(21,66,'Flow'),(22,66,'Flow'),(23,66,'Flow'),(17,70,'FlowType'),(23,72,'FlowType'),(22,72,'FlowType'),(21,72,'FlowType'),(20,72,'FlowType'),(24,70,'FlowType'),(32,65,'Customer'),(18,71,'FlowType'),(19,71,'FlowType'),(33,71,'FlowType'),(34,71,'FlowType'),(35,71,'FlowType'),(36,71,'FlowType'),(42,70,'FlowType'),(46,70,'FlowType'),(47,70,'FlowType'),(48,70,'FlowType'),(49,70,'FlowType'),(50,70,'FlowType');

#
# Source for table "think_task"
#

DROP TABLE IF EXISTS `think_task`;
CREATE TABLE `think_task` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `task_no` varchar(20) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text COMMENT '内容',
  `executor` varchar(200) DEFAULT NULL,
  `add_file` varchar(255) DEFAULT NULL,
  `expected_time` datetime DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT '0',
  `user_name` varchar(20) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `dept_name` varchar(20) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  `update_user_name` varchar(20) DEFAULT NULL,
  `status` tinyint(3) DEFAULT '0',
  `is_del` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8;

#
# Data for table "think_task"
#

INSERT INTO `think_task` VALUES (203,'2015-0001',NULL,'11111111111111','111111111','管理员|1','','2015-01-15 03:20:00',1,'管理员',1,'小微企业',1421501421,NULL,NULL,NULL,3,NULL),(204,'2015-0002',NULL,'2222222222222222','1111111111111','总务科|dept_24;','','2015-01-07 07:10:00',1,'管理员',1,'小微企业',1421501662,NULL,NULL,NULL,0,NULL),(205,'2015-0003',NULL,'1111111','111111111111111111111','','','0000-00-00 00:00:00',1,'管理员',1,'小微企业',1422624619,NULL,NULL,NULL,0,1),(206,'2015-0004',NULL,'111111111111111','111111111111111111111111','管理员|1','','0000-00-00 00:00:00',1,'管理员',1,'小微企业',1422624653,NULL,NULL,NULL,3,0),(207,'2015-0005',NULL,'ssssssssssssssssssssssssssss','sssssssssssssssss','管理员|1','','2015-01-22 21:20:00',1,'管理员',1,'小微企业',1422625111,NULL,NULL,NULL,3,0),(208,'2015-0006',NULL,'1111111111111111111','1111111111111111111111','管理员|1','','1899-12-21 09:50:00',1,'管理员',1,'小微企业',1425524603,NULL,NULL,NULL,1,0),(209,'2015-0007',NULL,'11111111111111111','1111111111111111','总监2001|42;','','2015-03-19 09:20:00',1,'管理员',1,'小微企业',1427441995,NULL,NULL,NULL,0,0),(210,'2015-0008',NULL,'1111111111111','ssssssssssssss','管理员|1;','','2015-03-07 04:20:00',42,'总监2001',8,'财务部',1427444991,NULL,NULL,NULL,5,0),(211,'2015-0009',NULL,'11111111111111111111','1111111111111111111111111111111','管理员|1;','','2015-04-10 03:00:00',1,'管理员',1,'小微企业',1428640664,NULL,NULL,NULL,3,0),(212,'2015-0010',NULL,'444444444444444444444','444444444444444444','管理员|1;','','2015-04-10 04:20:00',1,'管理员',1,'小微企业',1428642094,NULL,NULL,NULL,2,0),(213,'2015-0011',NULL,'22222222222222222','巍峨噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩','总监2001|42;','','2015-04-16 09:20:00',1,'管理员',1,'小微企业',1429164178,NULL,NULL,NULL,3,0),(214,'2015-0012',NULL,'관리부서 및 재무부  미팅 ','<p>\r\n\t내일 출근 전으로 미팅 소집하여 관리 및 재무 관련서류 준비 완료 바람.\r\n</p>\r\n<p>\r\n\t이상\r\n</p>','副总1003|48;经理3001|49;经理3002|50;总监2001|42;经理3003|51;经理3004|52;','','2015-05-14 09:00:00',1,'管理员',1,'小微企业',1431498098,NULL,NULL,NULL,1,0),(215,'2015-0013',NULL,'dddddddddddddd','ddddddddddddddddddd','管理员|1;员工5001|55;','','2015-05-14 09:20:00',1,'管理员',1,'小微企业',1431590886,NULL,NULL,NULL,0,0),(216,'2015-0014',NULL,'ssssssssssssssssssss','sssssssssssssssss','管理员|1;员工5001|55;','','2015-05-14 09:20:00',1,'管理员',1,'小微企业',1431591125,NULL,NULL,NULL,2,0);

#
# Source for table "think_task_log"
#

DROP TABLE IF EXISTS `think_task_log`;
CREATE TABLE `think_task_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `type` tinyint(3) DEFAULT NULL,
  `assigner` int(11) DEFAULT NULL COMMENT '分配任务的人',
  `executor` varchar(20) DEFAULT NULL COMMENT '执行人',
  `executor_name` varchar(20) DEFAULT NULL,
  `status` tinyint(3) DEFAULT '0',
  `plan_time` datetime DEFAULT NULL,
  `transactor_name` varchar(20) DEFAULT NULL,
  `transactor` int(11) DEFAULT NULL COMMENT '由谁处理的',
  `finish_rate` tinyint(3) DEFAULT NULL,
  `finish_time` datetime DEFAULT NULL,
  `feed_back` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8;

#
# Data for table "think_task_log"
#

INSERT INTO `think_task_log` VALUES (200,203,NULL,NULL,'1','管理员',3,NULL,'管理员',1,NULL,'2015-01-15 03:20:00','11111111111'),(201,204,2,1,'24','总务科',0,NULL,NULL,NULL,NULL,NULL,NULL),(202,206,NULL,NULL,'1','管理员',3,'2015-01-15 03:20:00','管理员',1,100,'2015-01-14 02:10:00','1111111111111111'),(203,207,NULL,NULL,'1','管理员',3,'2015-01-15 09:20:00','管理员',1,0,'2015-01-08 03:20:00','sssssssssssssssssssss'),(204,209,1,1,'42','总监2001',5,NULL,'总监2001',42,NULL,'2015-03-27 16:23:50','wwwwwwwwwwwwwww'),(205,NULL,NULL,NULL,NULL,NULL,5,NULL,'总监2001',42,NULL,'2015-03-27 16:19:42','111111111111'),(206,210,1,42,'1','管理员',5,NULL,'管理员',1,NULL,'2015-03-27 16:33:42','222222222222222'),(207,211,1,1,'1','管理员',3,'2015-04-10 04:00:00','管理员',1,100,'2015-04-10 10:40:00','111111111111111111111'),(208,212,1,1,'1','管理员',2,'2015-05-12 08:10:00','管理员',1,79,NULL,'11111111111111111'),(209,213,1,1,'42','总监2001',3,NULL,'总监2001',42,NULL,'2015-04-17 04:20:00','wrewerqwerqwerqer'),(210,208,NULL,NULL,'1','管理员',1,NULL,'管理员',1,NULL,NULL,NULL),(211,214,1,1,'48','副总1003',1,NULL,'副总1003',48,NULL,NULL,NULL),(212,214,1,1,'49','经理3001',1,NULL,'经理3001',49,NULL,NULL,NULL),(213,214,1,1,'50','经理3002',2,'2015-05-13 13:50:00','经理3002',50,100,NULL,'已完成'),(214,214,1,1,'42','总监2001',3,NULL,'总监2001',42,NULL,'2015-05-13 11:40:00','已完成'),(215,214,1,1,'51','经理3003',0,NULL,NULL,NULL,NULL,NULL,NULL),(216,214,1,1,'52','经理3004',0,NULL,NULL,NULL,NULL,NULL,NULL),(217,215,1,1,'1','管理员',0,NULL,NULL,NULL,NULL,NULL,NULL),(218,215,1,1,'55','员工5001',0,NULL,NULL,NULL,NULL,NULL,NULL),(219,216,1,1,'1','管理员',2,'2015-05-27 18:02:00','管理员',1,100,NULL,'11111111111111111'),(220,216,1,1,'55','员工5001',0,NULL,NULL,NULL,NULL,NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

#
# Data for table "think_todo"
#

INSERT INTO `think_todo` VALUES (11,'邮件整理时显示名称错误','',1,'2014-05-08',2,'',3,3),(12,'日历今天样式颜色','日历今天样式颜色',1,'2015-05-12',3,'',3,1),(13,'12312','123123',2,'3123123',3,'',1,1),(14,'12312','123123123123123123',2,'3123123',3,'',0,NULL),(15,'待办事项确认','待办事项确认',2,'',3,'',0,NULL),(16,'新建待办事项','123',2,'',3,'',2,3),(17,'新建待办事项1','新建待办事项',2,'2013-09-19',3,'',1,2),(18,'新建待办事项','123',2,'2013-09-19',3,'',1,NULL),(21,'事项优先级低','',1,'2014-05-08',5,'',1,1),(22,'查看服务器是否正常','查看服务器是否正常',1,'2014-05-10',3,'',3,2),(23,'22222222','ssssssss',1,'2014-08-20',3,'8d1f3251d40bc4132d9bd4646eec4ee7;',2,3),(24,'sssssssssssssssss','ssssssssssssssssssssssssss',1,'2015-05-13',4,'',1,2);

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
  `type` varchar(255) DEFAULT NULL,
  `layout` varchar(255) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  `validate` varchar(20) DEFAULT NULL,
  `controller` varchar(20) DEFAULT NULL,
  `is_del` tinyint(3) DEFAULT '0',
  `config` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8;

#
# Data for table "think_udf_field"
#

INSERT INTO `think_udf_field` VALUES (56,'A11',1,'','','text','3','','','Flow',0,NULL),(57,'A2',1,'','','select','4','','','Flow',0,NULL),(58,'呵 3 ',1,'','','select','1','','','Flow',0,NULL),(59,'姓名',33,'','','text','1','','','Flow',0,''),(60,'申请日期',33,'','','date','1','','','Flow',0,''),(61,'所属部门',33,'','','text','1','','','Flow',0,''),(62,'所属科室',33,'','','text','1','','','Flow',0,''),(64,'B1',76,'','','text','1','','','Flow',0,NULL),(65,'B2',76,'','','text','1','','','Flow',0,NULL),(66,'职别',76,'','','text','1','','','Form',0,'show|col-10'),(67,'姓名',76,'','','text','1','','','Form',0,'show|col-10'),(68,'最高学历',76,'','','radio','2','1111|2222,,33333|.444444','','Form',0,''),(69,'姓名',34,'','请填写姓名','datetime','1','','require','Flow',0,''),(71,'申请日期',34,'','请填写联系电话','text','1','','require','Flow',0,''),(72,'请假开始时间',34,'','请选择开始时间','datetime','1','','require','Flow',0,''),(73,'请假结束时间',34,'','请选择束时间','datetime','1','','require','Flow',0,''),(74,'请假原因',34,'','请填写请假原因','textarea','2','','require','Flow',0,''),(76,'姓名',38,'','','text','1','','','Flow',0,''),(77,'申请日期',38,'','','date','1','','','Flow',0,''),(78,'所属部门',38,'','','text','1','','','Flow',0,''),(79,'所属科室',38,'','','text','1','','','Flow',0,''),(80,'姓名',36,'','','text','1','','','Flow',0,''),(82,'申请日期',36,'','','date','1','','','Flow',0,''),(83,'所属部门、科室',36,'','','text','1','','','Flow',0,''),(85,'姓名',44,'','','text','1','','','Flow',0,''),(86,'部门/科室',44,'','','text','1','','','Flow',0,''),(87,'离职申请日期',44,'','','date','2','','','Flow',0,''),(88,'离职理由',44,'','','editor','2','','','Flow',0,''),(89,'培训申请人',54,'1','','text','1','','','Flow',0,''),(90,'部门/科室',54,'2','','text','1','','','Flow',0,''),(91,'培训地点',54,'3','','text','1','','','Flow',0,''),(92,'培训开始时间',54,'4','','datetime','1','','','Flow',0,''),(93,'培训目的',54,'6','','editor','2','','','Flow',0,''),(94,'培训内容',54,'7','','editor','2','','','Flow',0,''),(95,'姓名',41,'1','','text','1','','','Flow',0,''),(96,'部门/科室',41,'2','','text','1','','','Flow',0,''),(97,'出差地点',41,'3','','text','1','','','Flow',0,''),(98,'出差开始时间',41,'5','','datetime','1','','','Flow',0,''),(99,'预计费用',41,'4','','text','1','','','Flow',0,''),(100,'出差事由/目的',41,'7','','editor','2','','','Flow',0,''),(103,'姓名',40,'','','text','1','','','Flow',0,''),(104,'部门/科室',40,'','','text','1','','','Flow',0,''),(105,'请假开始时间',40,'','','datetime','1','','','Flow',0,''),(106,'请假结束时间',40,'','','datetime','1','','','Flow',0,''),(107,'请假事由',40,'','','editor','2','','','Flow',0,''),(108,'培训结束时间',54,'5','','datetime','2','','','Flow',0,''),(109,'出差结束时间',41,'6','','datetime','1','','','Flow',0,''),(110,'申请人',43,'','','text','1','','','Flow',0,''),(112,'部门/科室',43,'2','','text','1','','','Flow',0,''),(114,'用途',43,'3','','editor','2','','','Flow',0,''),(115,'申请人',55,'1','','text','1','','','Flow',0,''),(116,'部门/科室',55,'2','','text','1','','','Flow',0,''),(117,'预算依据',55,'4','','editor','2','','','Flow',0,''),(118,'预算用途',55,'3','','editor','2','','','Flow',0,''),(119,'预算明细请参考附件',55,'5','','text','2','','','Flow',0,''),(120,'申请人',45,'1','','text','1','','','Flow',0,''),(121,'部门/科室',45,'2','','text','1','','','Flow',0,''),(122,'出差地点',45,'4','','text','1','','','Flow',0,''),(123,'出差开始时间',45,'5','','datetime','1','','','Flow',0,''),(124,'出差结束时间',45,'6','','datetime','1','','','Flow',0,''),(125,'住宿费用',45,'7','','text','1','','','Flow',0,''),(126,'交通费用',45,'8','','text','1','','','Flow',0,''),(127,'餐费',45,'9','','text','1','','','Flow',0,''),(128,'补贴',45,'91','','text','1','','','Flow',0,''),(129,'申请人',19,'1','','text','1','','','Flow',0,''),(130,'部门/科室',19,'2','','text','1','','','Flow',0,''),(131,'招待地点',19,'4','','text','1','','','Flow',0,''),(132,'招待时间',19,'5','','datetime','1','','','Flow',0,''),(133,'招待费用',19,'7','','text','2','','','Flow',0,''),(134,'招待目的',19,'8','','editor','2','','','Flow',0,''),(135,'招待对象',19,'3','','text','1','','','Flow',0,''),(136,'参加人员',19,'6','','text','1','','','Flow',0,''),(137,'出差目的',45,'3','','text','1','','','Flow',0,''),(138,'申请人',53,'1','','text','1','','','Flow',0,''),(139,'部门/科室',53,'2','','text','1','','','Flow',0,''),(140,'辅设备名',53,'3','','text','1','','','Flow',0,''),(141,'数量',53,'4','','text','1','','','Flow',0,''),(142,'型号规格',53,'5','','text','1','','','Flow',0,''),(143,'预计费用',53,'6','','text','1','','','Flow',0,''),(144,'申请理由',53,'7','','editor','2','','','Flow',0,''),(145,'申请人',51,'1','','text','1','','','Flow',0,''),(146,'部门/科室',51,'2','','text','1','','','Flow',0,''),(147,'设备名称',51,'3','','text','1','','','Flow',0,''),(148,'数量',51,'4','','text','1','','','Flow',0,''),(149,'型号规格',51,'5','','text','1','','','Flow',0,''),(150,'预计费用',51,'6','','text','1','','','Flow',0,''),(151,'申请理由',51,'7','','editor','2','','','Flow',0,''),(152,'申请人',52,'1','','text','1','','','Flow',0,''),(153,'部门/科室',52,'2','','text','1','','','Flow',0,''),(154,'辅材名称',52,'3','','text','1','','','Flow',0,''),(155,'数量',52,'4','','text','1','','','Flow',0,''),(156,'型号规格',52,'5','','text','1','','','Flow',0,''),(157,'预计费用',52,'6','','text','1','','','Flow',0,''),(158,'申请理由',52,'7','','editor','2','','','Flow',0,''),(159,'申请人',39,'1','','text','1','','','Flow',0,''),(160,'部门/科室',39,'2','','text','1','','','Flow',0,''),(161,'原材料名称',39,'3','','text','1','','','Flow',0,''),(162,'数量',39,'4','','text','1','','','Flow',0,''),(163,'型号规格',39,'5','','text','1','','','Flow',0,''),(164,'预计费用',39,'6','','text','1','','','Flow',0,''),(165,'申请理由',39,'7','','editor','2','','','Flow',0,''),(166,'申请人',50,'1','','text','1','','','Flow',0,''),(167,'部门/科室',50,'2','','text','1','','','Flow',0,''),(168,'申请时间',50,'3','','datetime','1','','','Flow',0,''),(169,'出差地点',50,'4','','text','1','','','Flow',0,''),(170,'出差事由',50,'9','','editor','2','','','Flow',0,''),(171,'去程',50,'6','','text','1','','','Flow',0,''),(172,'回程',50,'7','','text','1','','','Flow',0,''),(173,'出差开始时间',50,'51','','datetime','1','','','Flow',0,''),(176,'出差结束时间',50,'52','','datetime','1','','','Flow',0,''),(177,'申请人',49,'1','','text','1','','','Flow',0,''),(178,'部门/科室',49,'2','','text','1','','','Flow',0,''),(179,'目的/用途',49,'3','','text','1','','','Flow',0,''),(180,'使用开始时间',49,'4','','datetime','1','','','Flow',0,''),(181,'使用结束时间',49,'5','','datetime','1','','','Flow',0,''),(182,'申请时间',49,'21','','datetime','1','','','Flow',0,''),(183,'参会人',49,'6','','text','2','','','Flow',0,''),(184,'申请人',42,'1','','text','1','','','Flow',0,''),(185,'部门/科室',42,'2','','text','1','','','Flow',0,''),(186,'申请理由',42,'3','','text','1','','','Flow',0,''),(187,'办公用品名称以及数量',42,'4','','editor','2','','','Flow',0,''),(189,'申请时间',42,'21','','text','1','','','Flow',0,''),(190,'申请人',46,'1','','text','1','','','Flow',0,''),(191,'部门/科室',46,'2','','text','1','','','Flow',0,''),(192,'申请时间',46,'3','','datetime','1','','','Flow',0,''),(193,'申请事由',46,'5','','text','2','','','Flow',0,''),(194,'通讯报销金额',46,'4','','text','1','','','Flow',0,''),(195,'申请人',47,'1','','text','1','','','Flow',0,''),(196,'部门/科室',47,'2','','text','1','','','Flow',0,''),(197,'申请日期',47,'3','','datetime','1','','','Flow',0,''),(199,'出差开始时间',47,'4','','datetime','1','','','Flow',0,''),(200,'出差结束时间',47,'5','','datetime','1','','','Flow',0,''),(201,'出差事由',47,'31','','text','1','','','Flow',0,''),(202,'实际使用费用',47,'6','','text','1','','','Flow',0,''),(203,'标准费用',47,'7','','text','1','','','Flow',0,''),(204,'交通费用明细',47,'8','','editor','2','','','Flow',0,''),(205,'申请人',48,'1','','text','1','','','Flow',0,''),(206,'部门/科室',48,'2','','text','1','','','Flow',0,''),(207,'申请时间',48,'3','','datetime','1','','','Flow',0,''),(208,'实际费用',48,'4','','text','1','','','Flow',0,''),(209,'参加人员',48,'5','','text','2','','','Flow',0,''),(210,'申请事由',48,'41','','text','2','','','Flow',0,'');

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
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

#
# Data for table "think_user"
#

INSERT INTO `think_user` VALUES (1,'admin','管理员','GLY','21232f297a57a5a743894a0e4a801fc3',1,1,2,'male','2013-09-18','127.0.0.1',2998,'Uploads/emp_pic/1.jpeg','smeoa@qq.com','1231254123123','5086-2222-2222','12123123',1222907803,1431500668,0,'',1),(41,'2002','总监2002','ZJ','4ba29b9f9e5732ed33761840f4ba6c53',6,3,1,'male','2013-10-30','0.0.0.0',NULL,'','','行政，财务','','',1376896154,1407565312,1,NULL,1),(42,'2001','总监2001','ZJ','d0fb963ff976f9c37fc81fe03c21ea7b',8,3,1,'male','2013-10-10','192.168.1.106',NULL,'emp_pic/42.jpeg','','开发','123','12312312',1380970837,1401287019,0,'12312541231251243123',1),(43,'2003','总监2003','ZJ','a591024321c5e2bdbd23ed35f0574dde',7,3,1,'male','0000-00-00','127.0.0.1',NULL,'Uploads/emp_pic/43.jpeg','','销售','','',1381035116,1432107034,0,NULL,1),(44,'1001','总经理1001','ZJL','b8c37e33defde51cf91e1e03e51657da',1,5,5,'male','0000-00-00','127.0.0.1',NULL,'http://img.smeoa.com/popup/2015-04/552a1c4ba8627.jpg','','全面管理','','18560630025',1381502796,1432260033,0,'',1),(48,'1003','副总1003','FZ','aa68c75c4a77c87f97fb686b2f068676',6,4,1,'female','0000-00-00','192.168.1.106',NULL,'','','销售，运营','','',1381503490,1401286413,0,NULL,1),(49,'3001','经理3001','JL','908c9a564a86426585b29f5335b619bc',24,2,2,'male','2013-10-10','192.168.1.106',NULL,'','','财务','123','12312312',1391694170,1401287097,0,NULL,1),(50,'3002','经理3002','JL','d806ca13ca3449af72a1ea5aedbed26a',23,2,2,'male','2013-10-10','192.168.1.110',NULL,'','','人事','123','12312312',1391694193,1401287121,0,NULL,NULL),(51,'3003','经理3003','JL','a4380923dd651c195b1631af7c829187',25,2,2,'male','2013-10-10','192.168.1.106',NULL,'','','销售-南方区域','123','12312312',1391694198,1401287147,0,NULL,NULL),(52,'3004','经理3004','JL','20479c788fb27378c2c99eadcf207e7f',26,2,2,'male','2013-10-10',NULL,NULL,'','','新产品研发','123','12312312',1391694202,1401287170,0,NULL,NULL),(55,'5001','员工5001','YG','03b264c595403666634ac75d828439bc',24,1,3,'male','2013-10-10','192.168.1.106',NULL,'','','会计','123','12312312',1391694320,1401287296,0,NULL,NULL),(56,'5007','员工5007','YG','351869bde8b9d6ad1e3090bd173f600d',26,1,3,'male','2013-10-10',NULL,NULL,'','','程序员3','123','12312312',1391694335,1401287430,0,NULL,NULL),(57,'5002','员工5002','YG','415585bd389b69659223807d77a96791',24,1,3,'male','2013-10-10','192.168.1.106',NULL,'','','出纳','123','12312312',1391694413,1401287322,0,NULL,NULL),(58,'5003','员工5003','YG','240ac9371ec2671ae99847c3ae2e6384',23,1,3,'male','2013-10-10','127.0.0.1',NULL,'','','招聘，薪资管理','123','12312312',1391694420,1401287339,0,NULL,NULL),(59,'5004','员工5004','YG','3202111cf90e7c816a472aaceb72b0df',23,1,3,'male','2013-10-10','127.0.0.1',NULL,'','','负责公司日常采购','123','12312312',1391694427,1401287371,0,NULL,NULL),(60,'5005','员工5005','YG','1d6408264d31d453d556c60fe7d0459e',25,1,3,'male','2013-10-10','127.0.0.1',NULL,'','','程序员1','123','12312312',1391694435,1401287390,0,NULL,NULL),(61,'5006','员工5006','YG','2c27a260f16ad3098393cc529f391f4a',25,1,3,'male','2013-10-10','127.0.0.1',NULL,'','','程序员2','123','12312312',1391694478,1401287410,0,NULL,NULL),(62,'5008','员工5008','YG','b3848d61bbbc6207c6668a8a9e2730ed',26,1,3,'male','2013-10-10','127.0.0.1',NULL,'','','网站编辑，SEO','123','12312312',1391694489,1401287450,0,NULL,NULL),(65,'test1','test1','TEST','db03fa33c1e2ca35794adbb14aebb153',7,5,1,'male','2014-05-07','0.0.0.0',NULL,'','','','','',1399618939,0,0,NULL,0),(66,'test2','test2','TEST','261d684f6b7d9af996a5691e7106075e',2,2,2,'male','2014-05-09','0.0.0.0',NULL,'','','','','',1399618964,0,0,NULL,0),(67,'1002','李白','LB','fba9d88164f3e2d9109ee770223212a0',5,4,1,'male','0000-00-00','192.168.10.101',NULL,'','','','','',1399712207,1401286925,0,NULL,0),(68,'smeoa','','','202cb962ac59075b964b07152d234b70',0,0,0,'',NULL,'127.0.0.1',NULL,NULL,'email','','','',1428919541,0,0,NULL,0),(69,'9001','导入测试1','','',0,0,0,'male','1980-10-15',NULL,NULL,NULL,'','1231254123123','010-1234-5678','13812345678',0,0,0,NULL,0),(70,'9002','导入测试2','','',0,0,0,'male','1980-10-16',NULL,NULL,NULL,'','行政，财务','010-1234-5679','13812345679',0,0,0,NULL,0),(71,'9003','导入测试3','','',0,0,0,'male','1980-10-17',NULL,NULL,NULL,'','开发','010-1234-5680','13812345680',0,0,0,NULL,0),(72,'9004','导入测试4','','',0,0,0,'male','1980-10-18',NULL,NULL,NULL,'','销售','010-1234-5681','13812345681',0,0,0,NULL,0),(73,'9005','导入测试5','','',0,0,0,'male','1980-10-19',NULL,NULL,NULL,'','全面管理','010-1234-5682','13812345682',0,0,0,NULL,0),(74,'9006','导入测试6','','',0,0,0,'female','1980-10-20',NULL,NULL,NULL,'','销售，运营','010-1234-5683','13812345683',0,0,0,NULL,0),(75,'9007','导入测试7','','',0,0,0,'male','1980-10-21',NULL,NULL,NULL,'','财务','010-1234-5684','13812345684',0,0,0,NULL,0),(76,'9008','导入测试8','','',0,0,0,'male','1980-10-22',NULL,NULL,NULL,'','人事','010-1234-5685','13812345685',0,0,0,NULL,0),(77,'9009','导入测试9','','',0,0,0,'male','1980-10-23',NULL,NULL,NULL,'','销售-南方区域','010-1234-5686','13812345686',0,0,0,NULL,0),(78,'9010','导入测试10','','',0,0,0,'male','1980-10-24',NULL,NULL,NULL,'','新产品研发','010-1234-5687','13812345687',0,0,0,NULL,0),(79,'9011','导入测试11','','',0,0,0,'male','1980-10-25',NULL,NULL,NULL,'','会计','010-1234-5688','13812345688',0,0,0,NULL,0),(80,'9012','导入测试12','','',0,0,0,'male','1980-10-26',NULL,NULL,NULL,'','程序员3','010-1234-5689','13812345689',0,0,0,NULL,0),(81,'9013','导入测试13','','',0,0,0,'male','1980-10-27',NULL,NULL,NULL,'','出纳','010-1234-5690','13812345690',0,0,0,NULL,0),(82,'9014','导入测试14','','',0,0,0,'male','1980-10-28',NULL,NULL,NULL,'','招聘，薪资管理','010-1234-5691','13812345691',0,0,0,NULL,0);

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

INSERT INTO `think_user_config` VALUES (1,'undefined11,12,|22,21,',10,'129,131,134,137,138','mail,flow,message','mail,flow,message'),(42,'undefined,11,12,|undefined,21,13,',20,'131',NULL,NULL),(43,'undefined,11,12,|undefined,21,13,',20,NULL,NULL,NULL),(44,'undefined12,11,|21,22,',20,NULL,NULL,NULL),(48,NULL,20,'135,136,137,138',NULL,NULL),(49,'undefined,11,12,|13,undefined,21,',20,'130,132',NULL,NULL),(50,NULL,20,'130',NULL,NULL),(51,NULL,20,'54,55,56',NULL,NULL),(52,NULL,20,'54,55,56',NULL,NULL),(53,NULL,20,'54,55,56',NULL,NULL),(54,NULL,20,'54,55,56',NULL,NULL),(55,NULL,20,'130',NULL,NULL),(56,NULL,20,'54,55,56',NULL,NULL),(57,NULL,20,'130',NULL,NULL),(58,NULL,20,'54,55,56',NULL,NULL),(59,NULL,20,'54,55,56',NULL,NULL),(60,'undefined,22,13,23,|undefined,12,21,11,',20,'54,55,56',NULL,NULL),(61,NULL,20,'54,55,56',NULL,NULL),(62,NULL,20,'54,55,56',NULL,NULL),(63,NULL,20,'54,55,56',NULL,NULL),(64,NULL,20,'54,55,56',NULL,NULL),(65,NULL,20,'54,55,56',NULL,NULL),(66,'11,12,13,|21,22,23,',20,'54,55,56',NULL,NULL),(67,NULL,20,'54,55,56',NULL,NULL),(68,'undefined,11,13,|undefined,21,12,',20,'54,55,56',NULL,NULL);

#
# Source for table "think_user_folder"
#

DROP TABLE IF EXISTS `think_user_folder`;
CREATE TABLE `think_user_folder` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `controller` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sort` varchar(20) NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  `remark` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

#
# Data for table "think_user_folder"
#

INSERT INTO `think_user_folder` VALUES (34,0,'Mail',1,'1','1',0,''),(35,0,'Mail',1,'2','2',0,''),(36,0,'Mail',1,'3','3',0,''),(37,0,'Mail',1,'1','1',0,'');

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
# Source for table "think_weixin_config"
#

DROP TABLE IF EXISTS `think_weixin_config`;
CREATE TABLE `think_weixin_config` (
  `corp_id` varchar(20) NOT NULL DEFAULT '',
  `secret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`corp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "think_weixin_config"
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "think_work_log"
#

INSERT INTO `think_work_log` VALUES (1,1,'管理员',1,'小微企业',1421878993,'<p>\r\n\t1. 主要事项\r\n</p>\r\n<p>\r\n\t&nbsp; &nbsp; 1.1 详细内容\r\n</p>\r\n<p>\r\n\t<span>&nbsp; &nbsp; 1.2 详细内容</span>\r\n</p>\r\n<p>\r\n\t<span>&nbsp; &nbsp; 1.3 详细内容</span>\r\n</p>\r\n<p>\r\n\t2.主要事项2\r\n</p>\r\n<p>\r\n\t&nbsp; &nbsp; 2.1&nbsp;<span>&nbsp;详细内容</span>\r\n</p>\r\n<p>\r\n\t<span>&nbsp; &nbsp; 2.2&nbsp;</span><span>&nbsp;详细内容</span>\r\n</p>\r\n<p>\r\n\t<span>&nbsp; &nbsp; 2.3&nbsp;</span><span>&nbsp;详细内容</span>\r\n</p>','<p>\r\n\t1. 主要事项\r\n</p>\r\n<p>\r\n\t&nbsp; &nbsp; 1.1 详细内容\r\n</p>\r\n<p>\r\n\t&nbsp; &nbsp; 1.2 详细内容\r\n</p>\r\n<p>\r\n\t&nbsp; &nbsp; 1.3 详细内容\r\n</p>\r\n<p>\r\n\t2.主要事项2\r\n</p>\r\n<p>\r\n\t&nbsp; &nbsp; 2.1&nbsp;&nbsp;详细内容\r\n</p>\r\n<p>\r\n\t&nbsp; &nbsp; 2.2&nbsp;&nbsp;详细内容\r\n</p>\r\n<p>\r\n\t&nbsp; &nbsp; 2.3&nbsp;&nbsp;详细内容\r\n</p>','2015-01-06','2015-01-06',0,''),(2,1,'管理员',1,'小微企业',1427528629,'sghkjhv','sdfasd fasdfasdfasdf','2015-03-05','2015-03-21',0,''),(3,42,'总监2001',8,'财务部',1431500422,'<p>\r\n\t今天主要完成了用手机测试小微OA.\r\n</p>','<p>\r\n\t明天首先完成老大分配的工作。\r\n</p>\r\n<p>\r\n\t有时间时继续学习会计基本知识。\r\n</p>','2015-05-13','2015-05-14',0,'MDAwMDAwMDAwMITNj3M;MDAwMDAwMDAwMITNmXM;MDAwMDAwMDAwMITNnXM;'),(4,1,'管理员',1,'小微企业',1431584213,'ss','ssssssssssssssssssssss','2015-05-07','2015-05-15',0,'');

#
# Source for table "think_work_order"
#

DROP TABLE IF EXISTS `think_work_order`;
CREATE TABLE `think_work_order` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `task_no` varchar(20) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text COMMENT '内容',
  `executor` varchar(200) DEFAULT NULL,
  `actor` varchar(200) DEFAULT '',
  `add_file` varchar(255) DEFAULT NULL,
  `request_arrive_time` datetime DEFAULT NULL,
  `request_finish_time` datetime DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT '0',
  `user_name` varchar(20) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `dept_name` varchar(20) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  `update_user_name` varchar(20) DEFAULT NULL,
  `status` tinyint(3) DEFAULT '0',
  `is_del` tinyint(3) DEFAULT '0',
  `other` varchar(20) DEFAULT NULL,
  `arrive_time` int(11) DEFAULT NULL,
  `finish_time` int(11) DEFAULT NULL,
  `arrive_lat` varchar(10) DEFAULT NULL,
  `arrive_lng` varchar(10) DEFAULT NULL,
  `finish_lat` varchar(10) DEFAULT NULL,
  `finish_lng` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8;

#
# Data for table "think_work_order"
#

INSERT INTO `think_work_order` VALUES (224,'2015-0012',NULL,'A','AAAAAAAAAAAAAAAAAAA','管理员|1;总监2001|42;总监2003|43;总经理1001|44;','总监2001|42;总监2003|43;总经理1001|44;','','2015-04-21 13:10:00','0000-00-00 00:00:00',1,'管理员',1,'小微企业',1429423173,1431225516,NULL,NULL,1,0,'',NULL,NULL,NULL,NULL,NULL,NULL),(225,'2015-0012',NULL,'B','<p>\r\n\tBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB\r\n</p>\r\n<p>\r\n\tBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB\r\n</p>\r\n<p>\r\n\tBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB\r\n</p>\r\n<p>\r\n\t<br />\r\n</p>','管理员|1;','总监2001|42;总监2003|43;总经理1001|44;','','2015-04-22 09:20:00','2015-04-19 21:50:00',1,'管理员',1,'小微企业',1429429403,NULL,NULL,NULL,1,0,'',NULL,NULL,NULL,NULL,NULL,NULL),(226,'2015-0012',NULL,'C','CCCCCCCCCCCCCCCCCCCCC','管理员|1;','总监2001|42;总监2003|43;总经理1001|44;副总1003|48;','','2015-04-23 15:10:00','2015-04-20 09:50:00',1,'管理员',1,'小微企业',1429429501,NULL,NULL,NULL,1,0,'',NULL,NULL,NULL,NULL,NULL,NULL);

#
# Source for table "think_work_order_log"
#

DROP TABLE IF EXISTS `think_work_order_log`;
CREATE TABLE `think_work_order_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `type` tinyint(3) DEFAULT NULL,
  `assigner` int(11) DEFAULT NULL COMMENT '分配任务的人',
  `executor` varchar(20) DEFAULT NULL COMMENT '执行人',
  `executor_name` varchar(20) DEFAULT NULL,
  `status` tinyint(3) DEFAULT '0',
  `arrive_time` int(11) DEFAULT NULL,
  `transactor_name` varchar(20) DEFAULT NULL,
  `transactor` int(11) DEFAULT NULL COMMENT '由谁处理的',
  `finish_rate` tinyint(3) DEFAULT NULL,
  `finish_time` int(11) DEFAULT NULL,
  `feed_back` text,
  `arrive_lat` varchar(10) DEFAULT NULL,
  `arrive_lng` varchar(10) DEFAULT NULL,
  `finish_lat` varchar(10) DEFAULT NULL,
  `finish_lng` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8;

#
# Data for table "think_work_order_log"
#

INSERT INTO `think_work_order_log` VALUES (221,224,1,1,'1','管理员',1,NULL,'管理员',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(222,225,1,1,'1','管理员',1,NULL,'管理员',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(223,225,2,1,'1','管理员',0,NULL,NULL,NULL,NULL,NULL,NULL,'35.953373','120.179726','35.953373','120.179726'),(224,226,1,1,'1','管理员',1,NULL,'管理员',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(225,226,2,1,'42','总监2001',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(226,226,2,1,'43','总监2003',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(227,226,2,1,'44','总经理1001',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(228,226,2,1,'48','副总1003',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
