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
-- Temporary table structure for view `view_ordersdetail`
--
DROP TABLE IF EXISTS `view_ordersdetail`;
DROP VIEW IF EXISTS `view_ordersdetail`;
CREATE TABLE `view_ordersdetail` (
  `order_id` int(10) unsigned,
  `price` double,
  `quantity` int(10) unsigned,
  `name` varchar(45),
  `product_sugar` varchar(45),
  `product_ice` varchar(45),
  `product_topping` varchar(45)
);

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
  `no.` int(45) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`no.`) USING BTREE,
  UNIQUE KEY `Index_u_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` (`email`,`name`,`gender`,`password`,`birthday`,`address`,`phone`,`status`,`no.`) VALUES 
 ('1234abbb@gmail.com','LENA','M','128888','1957-04-25','台北市復興北路99號2F','0933555187',1,1),
 ('1234abcb@gmail.com','BOB','M','128588','1968-01-11','台北市復興北路99號16F','0985963521',1,2),
 ('1234abcd@gmail.com','打丟賽','M','852258','1977-01-15','台北市復興北路99號7F','0933123321',1,3),
 ('abcd1234@gmail.com','織田信長','M','123321','1960-05-05','台北市復興北路99號6F','0987654321',1,4),
 ('dcba3214@gmail.com','洞爺湖','M','123111','1970-09-09','台北市復興北路99號1F','0911222333',1,5),
 ('ddaddy@yahoo.com.tw','佐佐成政','M','123456',NULL,'日本','02365923552',1,6),
 ('Goldwolf@com.tw','金鋼狼','M','123456','1911-10-06','台北','03214521287',1,7),
 ('sead000003@gmail.com','陳祥','M','123456','1911-08-06','asdsaasd','0321456987',1,8),
 ('Mr_X@com.tw','X教授','M','123446','1911-10-06','台北','03214521287',1,9),
 ('qe@yahoo.com','vincent','M','123456','1911-08-06','北縣','0321456987',1,10),
 ('qscesz@yahoo.com.tw','宮本武藏','M','123455','2016-01-12','日本','03-20549812',1,11),
 ('qwer@yahoo.com.tw','林筱筱','F','123456','2016-05-12','台北市萬華區','0229142525',1,12),
 ('qwwqe@yahoo.com.yw','vincent','M','123456','1911-08-06','北縣','0321456987',1,13),
 ('six.lu@gmail.com','路浩平','M','123456','1966-06-06','台北市復興北路99號16F','0987666066',1,14),
 ('south@yahoo.com.tw','藍藍路','F','456456','2005-12-02','台北市','0222123356',1,15),
 ('thewolf@yahoo.com.tw','王瑞亞','M','123456','2016-05-12','台北市復興北路99號14F','0225149191',1,16),
 ('q1s2c3@yahoo.com.tw','張芝柏','F','123456','2000-06-22','台北市','0922222222',1,17),
 ('qqww@yahoo.com.tw','哭哭啼','M','123456','1979-02-16','台北市','123456789',1,18),
 ('1239abcb@gmail.com','BOBB','M','128588','1968-01-11','台北市復興北路99號16F','0985963521',1,19),
 ('qqq1234@gmail.com','PITBULL','M','123456','2015-12-03','大安森林公園','0912345678',1,20),
 ('aaa111@gmail.com','林森零','F','123123','1993-10-28','台北市林森北路','22321156',1,21);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;


--
-- Definition of table `drinktype`
--

DROP TABLE IF EXISTS `drinktype`;
CREATE TABLE `drinktype` (
  `iddrinktype` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `drinktypecol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iddrinktype`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `drinktype`
--

/*!40000 ALTER TABLE `drinktype` DISABLE KEYS */;
INSERT INTO `drinktype` (`iddrinktype`,`drinktypecol`) VALUES 
 (1,'Dis'),
 (2,'Ice'),
 (3,'Milk'),
 (4,'Tea'),
 (5,'Coffee');
/*!40000 ALTER TABLE `drinktype` ENABLE KEYS */;


--
-- Definition of table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items` (
  `order_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `price` double NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `product_topping` varchar(45) NOT NULL,
  `product_ice` varchar(45) NOT NULL,
  `product_sugar` varchar(45) NOT NULL,
  PRIMARY KEY (`product_id`,`order_id`) USING BTREE,
  KEY `FK_order_items_order` (`order_id`),
  CONSTRAINT `FK_order_items_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `FK_order_items_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_items`
--

/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` (`order_id`,`product_id`,`price`,`quantity`,`product_topping`,`product_ice`,`product_sugar`) VALUES 
 (3,1,35,1,'無','正常','正常'),
 (6,1,35,1,'無','正常','正常'),
 (3,2,30,1,'珍珠','正常','正常'),
 (4,2,30,2,'珍珠','正常','正常'),
 (5,2,30,1,'珍珠','正常','正常'),
 (6,2,30,1,'小紫蘇','正常','正常'),
 (6,3,50,1,'無','正常','正常'),
 (4,4,30,2,'無','正常','正常'),
 (6,7,50,1,'無','正常','正常'),
 (2,24,20,1,'無','去冰','半糖'),
 (2,26,20,1,'無','去冰','半糖');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;


--
-- Definition of table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_email` varchar(70) NOT NULL,
  `receiver_address` varchar(45) NOT NULL,
  `receiver_name` varchar(45) NOT NULL,
  `receiver_phone` varchar(45) NOT NULL,
  `status` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_order_customer` (`customer_email`),
  CONSTRAINT `FK_order_customer` FOREIGN KEY (`customer_email`) REFERENCES `customer` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`id`,`customer_email`,`receiver_address`,`receiver_name`,`receiver_phone`,`status`,`create_time`) VALUES 
 (2,'south@yahoo.com.tw','台北市','藍藍路','0222123356',0,'2016-07-05 16:22:19'),
 (3,'south@yahoo.com.tw','台北市','藍藍路','0222123356',0,'2016-07-05 16:24:28'),
 (4,'south@yahoo.com.tw','台北市','藍藍路','0222123356',0,'2016-07-05 16:26:33'),
 (5,'south@yahoo.com.tw','台北市','藍藍路','0222123356',0,'2016-07-05 16:27:34'),
 (6,'south@yahoo.com.tw','台北市','凱生','0222123356',0,'2016-07-05 17:57:43');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;


--
-- Definition of table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `name` varchar(45) NOT NULL,
  `price` double NOT NULL,
  `ice` varchar(45) DEFAULT NULL,
  `sugar` varchar(45) DEFAULT NULL,
  `url` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `iddrinktype` int(11) unsigned DEFAULT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `iddrinktype` (`iddrinktype`),
  CONSTRAINT `iddrinktype` FOREIGN KEY (`iddrinktype`) REFERENCES `drinktype` (`iddrinktype`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`name`,`price`,`ice`,`sugar`,`url`,`type`,`iddrinktype`,`id`) VALUES 
 ('仙草凍奶茶',35,NULL,NULL,'image/products/仙草凍奶茶.png','Dis',3,1),
 ('包種茶',30,NULL,NULL,'image/products/包種茶.png','Tea',4,2),
 ('卡布奇諾',50,NULL,NULL,'image/products/卡布奇諾.png','Coffee',5,3),
 ('四季春',30,NULL,NULL,'image/products/四季春茶.png','Tea',4,4),
 ('奶綠',30,NULL,NULL,'image/products/奶綠.png','Tea',3,5),
 ('奶茶',30,NULL,NULL,'image/products/奶茶.png','Tea',3,6),
 ('奶茶冰沙',50,NULL,NULL,'image/products/奶茶冰沙.png','Ice',2,7),
 ('巧克力冰沙',50,NULL,NULL,'image/products/巧克力冰沙.png','Ice',2,8),
 ('康寶藍',50,NULL,NULL,'image/products/康寶藍.png','Coffee',5,9),
 ('拿鐵',50,NULL,NULL,'image/products/拿鐵.png','Coffee',5,10),
 ('拿鐵咖啡冰沙',50,NULL,NULL,'image/products/拿鐵咖啡冰沙.png','Ice',2,11),
 ('摩卡',50,NULL,NULL,'image/products/摩卡.png','Coffee',5,12),
 ('摩卡咖啡冰沙',50,NULL,NULL,'image/products/摩卡咖啡冰沙.png','Ice',2,13),
 ('桔子綠',30,NULL,NULL,'image/products/桔子綠.png','Dis',1,14),
 ('檸檬綠',30,NULL,NULL,'image/products/檸檬綠.png','Dis',1,15),
 ('水果茶',35,NULL,NULL,'image/products/水果茶.png','Dis',1,16),
 ('港式奶茶',30,NULL,NULL,'image/products/港式奶茶.png','Tea',3,17),
 ('烏龍茶',30,NULL,NULL,'image/products/烏龍茶.png','Tea',4,18),
 ('焦糖瑪奇朵',50,NULL,NULL,'image/products/焦糖瑪奇朵.png','Coffee',5,19),
 ('珍珠奶茶',35,NULL,NULL,'image/products/珍珠奶茶.png','Dis',3,20),
 ('白咖啡',50,NULL,NULL,'image/products/白咖啡.png','Coffe',5,21),
 ('白蔗青',30,NULL,NULL,'image/products/白蔗青.png','Dis',1,22),
 ('百香綠',30,NULL,NULL,'image/products/百香綠.png','Dis',1,23),
 ('紅茶',20,NULL,NULL,'image/products/紅茶.png','Tea',4,24),
 ('紅茶冰沙',50,NULL,NULL,'image/products/紅茶冰沙.png','Ice',2,25),
 ('綠茶',20,NULL,NULL,'image/products/綠茶.png','Tea',4,26),
 ('義式咖啡',50,NULL,NULL,'image/products/義式咖啡.png','Coffee',5,27),
 ('草莓冰沙',50,NULL,NULL,'image/products/草莓冰沙.png','Ice',2,28),
 ('蜜糖檸檬',30,NULL,NULL,'image/products/蜜糖檸檬.png','Dis',1,29),
 ('鳳梨冰茶',35,NULL,NULL,'image/products/鳳梨冰茶.png','Dis',1,30),
 ('黑咖啡',50,NULL,NULL,'image/products/黑咖啡.png','Coffee',5,31);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;


--
-- Definition of table `test`
--

DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productname` varchar(45) NOT NULL,
  `price` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `test`
--

/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` (`id`,`productname`,`price`) VALUES 
 (1,'紅茶','20.0');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;


--
-- Definition of table `topping`
--

DROP TABLE IF EXISTS `topping`;
CREATE TABLE `topping` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `price` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `topping`
--

/*!40000 ALTER TABLE `topping` DISABLE KEYS */;
INSERT INTO `topping` (`id`,`name`,`price`) VALUES 
 (1,'珍珠',5),
 (2,'小紫蘇',5),
 (3,'小芋圓',10),
 (4,'寒天晶球',10),
 (5,'荔枝凍',10),
 (6,'仙草凍',10),
 (7,'愛玉',10),
 (8,'紅豆',10),
 (9,'蘆葦',10),
 (10,'椰果',10),
 (11,'焦糖糖漿',10),
 (12,'北海道糖漿',10),
 (13,'布丁',15);
/*!40000 ALTER TABLE `topping` ENABLE KEYS */;


--
-- Definition of view `view_ordersdetail`
--

DROP TABLE IF EXISTS `view_ordersdetail`;
DROP VIEW IF EXISTS `view_ordersdetail`;
CREATE ALGORITHM=UNDEFINED DEFINER=`s930415`@`%` SQL SECURITY DEFINER VIEW `view_ordersdetail` AS select `order_items`.`order_id` AS `order_id`,`order_items`.`price` AS `price`,`order_items`.`quantity` AS `quantity`,`product`.`name` AS `name`,`order_items`.`product_sugar` AS `product_sugar`,`order_items`.`product_ice` AS `product_ice`,`order_items`.`product_topping` AS `product_topping` from (`order_items` join `product` on((`order_items`.`product_id` = `product`.`id`)));



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
