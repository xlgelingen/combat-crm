/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `clue` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(225) DEFAULT NULL COMMENT '姓名',
  `phone` varchar(225) DEFAULT NULL COMMENT '电话',
  `utm` varchar(225) DEFAULT NULL COMMENT '来源',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_name` varchar(225) DEFAULT NULL COMMENT '销售人员',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `remark` varchar(225) DEFAULT NULL COMMENT '备注',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO `clue` (`id`, `name`, `phone`, `utm`, `create_time`, `sale_name`, `status`, `remark`) VALUES
(1, '顾一', '13511111111', 'baidu_search', '2024-01-15 16:30:21', '季梦梦', 2, '备注1');
INSERT INTO `clue` (`id`, `name`, `phone`, `utm`, `create_time`, `sale_name`, `status`, `remark`) VALUES
(2, '季二', '13522222222', 'baidu_search', '2024-01-15 16:30:21', '季梦梦', 3, '备注2');
INSERT INTO `clue` (`id`, `name`, `phone`, `utm`, `create_time`, `sale_name`, `status`, `remark`) VALUES
(3, '苏三', '13533333333', 'baidu_search', '2024-01-15 16:32:46', '王晨晨', 1, '备注3');
INSERT INTO `clue` (`id`, `name`, `phone`, `utm`, `create_time`, `sale_name`, `status`, `remark`) VALUES
(4, '梦四', '13544444444', 'google', '2024-01-16 23:09:34', '曲筱筱', 3, '222'),
(5, '武五', '13555555555', 'google', '2024-01-17 11:06:22', '曲筱筱', 4, '66666666');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;