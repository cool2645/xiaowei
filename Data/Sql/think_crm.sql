# Host: localhost  (Version: 5.5.16)
# Date: 2014-09-08 13:09:07
# Generator: MySQL-Front 5.3  (Build 1.27)

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

#
# Source for table "think_crm"
#

DROP TABLE IF EXISTS `think_crm`;
CREATE TABLE `think_crm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '名称',
  `mobile_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '移动电话',
  `district` varchar(50) DEFAULT NULL,
  `need` varchar(255) DEFAULT NULL,
  `source` varchar(50) DEFAULT NULL,
  `age` varchar(3) DEFAULT NULL,
  `work` varchar(50) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `is_del` tinyint(3) DEFAULT '0',
  `status` tinyint(3) DEFAULT '0' COMMENT '0 未审核  1审核通过',
  `sex` varchar(255) DEFAULT NULL,
  `remark` text,
  `interest` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Data for table "think_crm"
#

/*!40000 ALTER TABLE `think_crm` DISABLE KEYS */;
INSERT INTO `think_crm` VALUES (18,'姓名*','186-1865-2222','小区：','地板,室内门','姓名*','姓名*','职业：',1409990972,'1','管理员',0,1,'male','',''),(19,'2去阿','撒旦发射点发','fasd阿斯蒂芬','瓷砖,地板','2去阿斯蒂芬','2去阿','发生大幅',1409990972,'1','管理员',0,2,'male','',''),(20,'使得法','公司','对方告s','瓷砖,地板,室内门','使得法','使得法','斯蒂芬g',1409991153,'1','管理员',0,1,'male','顾客说明：','兴趣爱好：'),(21,'姓名*','手机号*','小区','瓷砖,地板',NULL,'年龄','职业',1410147000,'1','管理员',0,1,'male','其他：','兴趣爱好：'),(22,'QQQQQQ','22222','11111','瓷砖,地板,室内门','','ss ','姓名*',1410148875,'42','总监2001',0,0,'male','姓名*','姓名*');
/*!40000 ALTER TABLE `think_crm` ENABLE KEYS */;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
