-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.7.12-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema go_2_drink
--

CREATE DATABASE IF NOT EXISTS go_2_drink;
USE go_2_drink;

--
-- Definition of table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `email` varchar(70) NOT NULL,
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

--
-- Dumping data for table `customer`
--

/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` (`email`,`name`,`gender`,`password`,`birthday`,`address`,`phone`,`status`) VALUES 
 ('1234abbb@gmail.com','LENA','M','128888','1957-04-25','台北市復興北路99號2F','0933555187',1),
 ('1234abcb@gmail.com','BOB','M','128588','1968-01-11','台北市復興北路99號16F','0985963521',1),
 ('1234abcd@gmail.com','打丟賽','M','852258','1977-01-15','台北市復興北路99號7F','0933123321',1),
 ('abcd1234@gmail.com','織田信長','M','123321','1960-05-05','台北市復興北路99號6F','0987654321',1),
 ('dcba3214@gmail.com','洞爺湖','M','123111','1970-09-09','台北市復興北路99號1F','0911222333',1),
 ('ddaddy@yahoo.com.tw','佐佐成政','M','123456',NULL,'日本','02365923552',1),
 ('Goldwolf@com.tw','金鋼狼','M','123456','1911-10-06','台北','03214521287',1),
 ('HIHI@com.tw','陳祥','M','123456','1911-08-06','asdsaasd','0321456987',1),
 ('Mr_X@com.tw','X教授','M','123446','1911-10-06','台北','03214521287',1),
 ('qe@yahoo.com','vincent','M','123456','1911-08-06','北縣','0321456987',1),
 ('qscesz@yahoo.com.tw','宮本武藏','M','123455','2016-01-12','日本','03-20549812',1),
 ('qwer@yahoo.com.tw','林筱筱','F','123456','2016-05-12','台北市萬華區','0229142525',1),
 ('qwwqe@yahoo.com.yw','vincent','M','123456','1911-08-06','北縣','0321456987',1),
 ('six.lu@gmail.com','路浩平','M','123456','1966-06-06','台北市復興北路99號16F','0987666066',1),
 ('south@yahoo.com.tw','藍藍路','M','123456','2016-05-12','台北市','0222157895',1),
 ('thewolf@yahoo.com.tw','王瑞亞','M','123456','2016-05-12','台北市復興北路99號14F','0225149191',1);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;


--
-- Definition of table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `name` varchar(45) NOT NULL,
  `price` double NOT NULL,
  `ice` varchar(45) DEFAULT NULL,
  `sugar` varchar(45) DEFAULT NULL,
  `size` varchar(45) DEFAULT NULL,
  `url` varchar(100) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`name`,`price`,`ice`,`sugar`,`size`,`url`) VALUES 
 ('仙草凍奶茶',35,NULL,NULL,NULL,''),
 ('包種茶',30,NULL,NULL,NULL,''),
 ('卡布奇諾',60,NULL,NULL,NULL,''),
 ('可爾必思',50,NULL,NULL,NULL,''),
 ('四季春茶',25,NULL,NULL,NULL,''),
 ('奶綠',30,NULL,NULL,NULL,''),
 ('奶茶',30,NULL,NULL,NULL,'image/products/奶茶.png'),
 ('奶茶冰沙',50,NULL,NULL,NULL,'image/products/奶茶冰沙.png'),
 ('巧克力冰沙',50,NULL,NULL,NULL,'image/products/巧克力冰沙.png'),
 ('拿鐵',60,NULL,NULL,NULL,'image/products/拿鐵.png'),
 ('拿鐵咖啡冰沙',50,NULL,NULL,NULL,''),
 ('摩卡咖啡冰沙',50,NULL,NULL,NULL,''),
 ('桔子綠',40,NULL,NULL,NULL,''),
 ('檸檬綠',40,NULL,NULL,NULL,''),
 ('水果茶',40,NULL,NULL,NULL,''),
 ('港式奶茶',30,NULL,NULL,NULL,''),
 ('烏龍茶',25,NULL,NULL,NULL,''),
 ('珍珠奶茶',35,NULL,NULL,NULL,''),
 ('白蔗青',40,NULL,NULL,NULL,''),
 ('百香綠',40,NULL,NULL,NULL,''),
 ('紅茶',25,NULL,NULL,NULL,''),
 ('紅茶冰沙',50,NULL,NULL,NULL,''),
 ('綠茶',25,NULL,NULL,NULL,''),
 ('草莓冰沙',50,NULL,NULL,NULL,''),
 ('蜜糖檸檬',40,NULL,NULL,NULL,''),
 ('鳳梨冰茶',40,NULL,NULL,NULL,''),
 ('黑咖啡',60,NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
