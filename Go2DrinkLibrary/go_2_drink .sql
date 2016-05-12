CREATE DATABASE `go_2_drink` /*!40100 DEFAULT CHARACTER SET utf8 */;
COMMIT;
USE go_2_drink;

DROP TABLE IF EXISTS `go_2_drink`.`customer`;
CREATE TABLE  `go_2_drink`.`customer` (
  `email` varchar(45) NOT NULL,
  `name` varchar(20) NOT NULL,
  `gender` char(1) NOT NULL,
  `password` varchar(20) NOT NULL,
  `birthday` date DEFAULT NULL,
  `address` varchar(120) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `status` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`email`),
  UNIQUE KEY `Index_u_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
COMMIT;
