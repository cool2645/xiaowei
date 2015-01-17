# Host: localhost  (Version: 5.6.17)
# Date: 2015-01-17 20:51:06
# Generator: MySQL-Front 5.3  (Build 4.187)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "think_task"
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
  `status` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;

#
# Data for table "think_task"
#

/*!40000 ALTER TABLE `think_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `think_task` ENABLE KEYS */;
