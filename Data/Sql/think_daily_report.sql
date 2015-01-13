# Host: localhost  (Version: 5.6.17)
# Date: 2014-10-10 23:25:43
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
# Source for table "think_daily_report"
#

DROP TABLE IF EXISTS `think_daily_report`;
CREATE TABLE `think_daily_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(50) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `dept_name` varchar(50) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `content` text,
  `plan` text,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  `add_file` varchar(50) DEFAULT NULL,
  `row1_1` varchar(10) DEFAULT NULL,
  `row1_2` varchar(50) DEFAULT NULL,
  `row1_3` varchar(200) DEFAULT NULL,
  `row1_4` varchar(200) DEFAULT NULL,
  `row1_5` varchar(10) DEFAULT NULL,
  `row2_1` varchar(10) DEFAULT NULL,
  `row2_2` varchar(50) DEFAULT NULL,
  `row2_3` varchar(200) DEFAULT NULL,
  `row2_4` varchar(200) DEFAULT NULL,
  `row2_5` varchar(10) DEFAULT NULL,
  `row3_1` varchar(10) DEFAULT NULL,
  `row3_2` varchar(50) DEFAULT NULL,
  `row3_3` varchar(200) DEFAULT NULL,
  `row3_4` varchar(200) DEFAULT NULL,
  `row3_5` varchar(10) DEFAULT NULL,
  `row4_1` varchar(10) DEFAULT NULL,
  `row4_2` varchar(50) DEFAULT NULL,
  `row4_3` varchar(200) DEFAULT NULL,
  `row4_4` varchar(200) DEFAULT NULL,
  `row4_5` varchar(10) DEFAULT NULL,
  `row5_1` varchar(10) DEFAULT NULL,
  `row5_2` varchar(50) DEFAULT NULL,
  `row5_3` varchar(200) DEFAULT NULL,
  `row5_4` varchar(200) DEFAULT NULL,
  `row5_5` varchar(10) DEFAULT NULL,
  `row6_1` varchar(10) DEFAULT NULL,
  `row6_2` varchar(50) DEFAULT NULL,
  `row6_3` varchar(200) DEFAULT NULL,
  `row6_4` varchar(200) DEFAULT NULL,
  `row6_5` varchar(10) DEFAULT NULL,
  `row7_1` varchar(10) DEFAULT NULL,
  `row7_2` varchar(50) DEFAULT NULL,
  `row7_3` varchar(200) DEFAULT NULL,
  `row7_4` varchar(200) DEFAULT NULL,
  `row7_5` varchar(10) DEFAULT NULL,
  `row8_1` varchar(10) DEFAULT NULL,
  `row8_2` varchar(50) DEFAULT NULL,
  `row8_3` varchar(200) DEFAULT NULL,
  `row8_4` varchar(200) DEFAULT NULL,
  `row8_5` varchar(10) DEFAULT NULL,
  `row9_1` varchar(10) DEFAULT NULL,
  `row9_2` varchar(50) DEFAULT NULL,
  `row9_3` varchar(200) DEFAULT NULL,
  `row9_4` varchar(200) DEFAULT NULL,
  `row9_5` varchar(10) DEFAULT NULL,
  `row10_1` varchar(10) DEFAULT NULL,
  `row10_2` varchar(50) DEFAULT NULL,
  `row10_3` varchar(200) DEFAULT NULL,
  `row10_4` varchar(200) DEFAULT NULL,
  `row10_5` varchar(10) DEFAULT NULL,
  `row11_1` varchar(10) DEFAULT NULL,
  `row11_2` varchar(50) DEFAULT NULL,
  `row11_3` varchar(200) DEFAULT NULL,
  `row11_4` varchar(200) DEFAULT NULL,
  `row11_5` varchar(10) DEFAULT NULL,
  `row12_1` varchar(10) DEFAULT NULL,
  `row12_2` varchar(50) DEFAULT NULL,
  `row12_3` varchar(200) DEFAULT NULL,
  `row12_4` varchar(200) DEFAULT NULL,
  `row12_5` varchar(10) DEFAULT NULL,
  `row13_1` varchar(10) DEFAULT NULL,
  `row13_2` varchar(50) DEFAULT NULL,
  `row13_3` varchar(200) DEFAULT NULL,
  `row13_4` varchar(200) DEFAULT NULL,
  `row13_5` varchar(10) DEFAULT NULL,
  `row14_1` varchar(10) DEFAULT NULL,
  `row14_2` varchar(50) DEFAULT NULL,
  `row14_3` varchar(200) DEFAULT NULL,
  `row14_4` varchar(200) DEFAULT NULL,
  `row14_5` varchar(10) DEFAULT NULL,
  `row15_1` varchar(10) DEFAULT NULL,
  `row15_2` varchar(50) DEFAULT NULL,
  `row15_3` varchar(200) DEFAULT NULL,
  `row15_4` varchar(200) DEFAULT NULL,
  `row15_5` varchar(10) DEFAULT NULL,
  `row16_1` varchar(10) DEFAULT NULL,
  `row16_2` varchar(50) DEFAULT NULL,
  `row16_3` varchar(200) DEFAULT NULL,
  `row16_4` varchar(200) DEFAULT NULL,
  `row16_5` varchar(10) DEFAULT NULL,
  `row17_1` varchar(10) DEFAULT NULL,
  `row17_2` varchar(50) DEFAULT NULL,
  `row17_3` varchar(200) DEFAULT NULL,
  `row17_4` varchar(200) DEFAULT NULL,
  `row17_5` varchar(10) DEFAULT NULL,
  `row18_1` varchar(10) DEFAULT NULL,
  `row18_2` varchar(50) DEFAULT NULL,
  `row18_3` varchar(200) DEFAULT NULL,
  `row18_4` varchar(200) DEFAULT NULL,
  `row18_5` varchar(10) DEFAULT NULL,
  `row19_1` varchar(10) DEFAULT NULL,
  `row19_2` varchar(50) DEFAULT NULL,
  `row19_3` varchar(200) DEFAULT NULL,
  `row19_4` varchar(200) DEFAULT NULL,
  `row19_5` varchar(10) DEFAULT NULL,
  `row50_1` varchar(10) DEFAULT NULL,
  `row50_2` varchar(50) DEFAULT NULL,
  `row50_3` varchar(200) DEFAULT NULL,
  `row50_4` varchar(200) DEFAULT NULL,
  `row50_5` varchar(10) DEFAULT NULL,
  `row21_1` varchar(200) DEFAULT NULL,
  `row22_1` varchar(200) DEFAULT NULL,
  `row23_1` varchar(200) DEFAULT NULL,
  `row24_1` varchar(10) DEFAULT NULL,
  `row24_2` varchar(10) DEFAULT NULL,
  `row24_3` varchar(10) DEFAULT NULL,
  `row24_4` varchar(10) DEFAULT NULL,
  `row24_5` varchar(10) DEFAULT NULL,
  `row24_6` varchar(10) DEFAULT NULL,
  `row24_7` varchar(10) DEFAULT NULL,
  `row24_8` varchar(10) DEFAULT NULL,
  `row24_9` varchar(10) DEFAULT NULL,
  `row25_1` varchar(200) DEFAULT NULL,
  `row26_1` varchar(200) DEFAULT NULL,
  `row27_1` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

#
# Data for table "think_daily_report"
#


/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
