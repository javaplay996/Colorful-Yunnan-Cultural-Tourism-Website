/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - qcybwenhualvyou
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`qcybwenhualvyou` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `qcybwenhualvyou`;

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'轮播图1','upload/config1.jpg'),(2,'轮播图2','upload/config2.jpg'),(3,'轮播图3','upload/config3.jpg');

/*Table structure for table `daoyou` */

DROP TABLE IF EXISTS `daoyou`;

CREATE TABLE `daoyou` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `daoyou_name` varchar(200) DEFAULT NULL COMMENT '导游姓名 Search111 ',
  `daoyou_photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别 Search111 ',
  `daoyou_phone` varchar(200) DEFAULT NULL COMMENT '联系方式',
  `daoyou_email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `daoyou_delete` int(11) DEFAULT '1' COMMENT '假删',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='导游';

/*Data for the table `daoyou` */

insert  into `daoyou`(`id`,`username`,`password`,`daoyou_name`,`daoyou_photo`,`sex_types`,`daoyou_phone`,`daoyou_email`,`daoyou_delete`,`create_time`) values (1,'a1','123456','导游姓名1','upload/daoyou1.jpg',1,'17703786901','1@qq.com',1,'2023-04-10 09:48:26'),(2,'a2','123456','导游姓名2','upload/daoyou2.jpg',2,'17703786902','2@qq.com',1,'2023-04-10 09:48:26'),(3,'a3','123456','导游姓名3','upload/daoyou3.jpg',2,'17703786903','3@qq.com',1,'2023-04-10 09:48:26');

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int(11) DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int(11) DEFAULT NULL COMMENT '父字段id',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `dictionary` */

insert  into `dictionary`(`id`,`dic_code`,`dic_name`,`code_index`,`index_name`,`super_id`,`beizhu`,`create_time`) values (14,'jingdian_types','景点类型',1,'景点类型1',NULL,NULL,'2023-04-10 09:48:16'),(15,'jingdian_types','景点类型',2,'景点类型2',NULL,NULL,'2023-04-10 09:48:16'),(16,'jingdian_types','景点类型',3,'景点类型3',NULL,NULL,'2023-04-10 09:48:16'),(17,'jiudian_types','房间类型',1,'房间类型1',NULL,NULL,'2023-04-10 09:48:16'),(18,'jiudian_types','房间类型',2,'房间类型2',NULL,NULL,'2023-04-10 09:48:16'),(19,'jiudian_types','房间类型',3,'房间类型3',NULL,NULL,'2023-04-10 09:48:16'),(20,'sex_types','性别',1,'男',NULL,NULL,'2023-04-10 09:48:16'),(21,'sex_types','性别',2,'女',NULL,NULL,'2023-04-10 09:48:16'),(22,'news_types','公告类型',1,'公告类型1',NULL,NULL,'2023-04-10 09:48:16'),(23,'news_types','公告类型',2,'公告类型2',NULL,NULL,'2023-04-10 09:48:16'),(24,'news_types','公告类型',3,'公告类型3',NULL,NULL,'2023-04-10 09:48:16'),(25,'forum_state_types','帖子状态',1,'发帖',NULL,NULL,'2023-04-10 09:48:16'),(26,'forum_state_types','帖子状态',2,'回帖',NULL,NULL,'2023-04-10 09:48:16'),(27,'jingdian_collection_types','收藏表类型',1,'收藏',NULL,NULL,'2023-04-10 09:48:16'),(28,'jingdian_collection_types','收藏表类型',2,'赞',NULL,NULL,'2023-04-10 09:48:16'),(29,'jingdian_collection_types','收藏表类型',3,'踩',NULL,NULL,'2023-04-10 09:48:16'),(30,'shangxia_types','冻结状态',1,'正常',NULL,NULL,'2023-04-10 09:48:16'),(31,'shangxia_types','冻结状态',2,'冻结',NULL,NULL,'2023-04-10 09:48:16'),(32,'jiudian_collection_types','收藏表类型',1,'收藏',NULL,NULL,'2023-04-10 09:48:16'),(33,'jiudian_collection_types','收藏表类型',2,'赞',NULL,NULL,'2023-04-10 09:48:16'),(34,'jiudian_collection_types','收藏表类型',3,'踩',NULL,NULL,'2023-04-10 09:48:16');

/*Table structure for table `forum` */

DROP TABLE IF EXISTS `forum`;

CREATE TABLE `forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `forum_name` varchar(200) DEFAULT NULL COMMENT '帖子标题  Search111 ',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '游客',
  `daoyou_id` int(11) DEFAULT NULL COMMENT '导游',
  `users_id` int(11) DEFAULT NULL COMMENT '管理员',
  `forum_content` longtext COMMENT '发布内容',
  `super_ids` int(11) DEFAULT NULL COMMENT '父id',
  `forum_state_types` int(11) DEFAULT NULL COMMENT '帖子状态',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '发帖时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='论坛';

/*Data for the table `forum` */

insert  into `forum`(`id`,`forum_name`,`yonghu_id`,`daoyou_id`,`users_id`,`forum_content`,`super_ids`,`forum_state_types`,`insert_time`,`update_time`,`create_time`) values (1,'帖子标题1',2,NULL,NULL,'发布内容1',3,1,'2023-04-10 09:48:26','2023-04-10 09:48:26','2023-04-10 09:48:26'),(2,'帖子标题2',3,NULL,NULL,'发布内容2',342,1,'2023-04-10 09:48:26','2023-04-10 09:48:26','2023-04-10 09:48:26'),(3,'帖子标题3',2,NULL,NULL,'发布内容3',119,1,'2023-04-10 09:48:26','2023-04-10 09:48:26','2023-04-10 09:48:26'),(4,'帖子标题4',1,NULL,NULL,'发布内容4',452,1,'2023-04-10 09:48:26','2023-04-10 09:48:26','2023-04-10 09:48:26'),(5,'帖子标题5',2,NULL,NULL,'发布内容5',493,1,'2023-04-10 09:48:26','2023-04-10 09:48:26','2023-04-10 09:48:26'),(6,'帖子标题6',3,NULL,NULL,'发布内容6',286,1,'2023-04-10 09:48:26','2023-04-10 09:48:26','2023-04-10 09:48:26'),(7,'帖子标题7',1,NULL,NULL,'发布内容7',374,1,'2023-04-10 09:48:26','2023-04-10 09:48:26','2023-04-10 09:48:26'),(8,'帖子标题8',1,NULL,NULL,'发布内容8',444,1,'2023-04-10 09:48:26','2023-04-10 09:48:26','2023-04-10 09:48:26'),(9,'帖子标题9',2,NULL,NULL,'发布内容9',231,1,'2023-04-10 09:48:26','2023-04-10 09:48:26','2023-04-10 09:48:26'),(10,'帖子标题10',2,NULL,NULL,'发布内容10',75,1,'2023-04-10 09:48:26','2023-04-10 09:48:26','2023-04-10 09:48:26'),(11,'帖子标题11',3,NULL,NULL,'发布内容11',195,1,'2023-04-10 09:48:26','2023-04-10 09:48:26','2023-04-10 09:48:26'),(13,'帖子标题13',2,NULL,NULL,'发布内容13',383,1,'2023-04-10 09:48:26','2023-04-10 09:48:26','2023-04-10 09:48:26'),(14,'帖子标题14',1,NULL,NULL,'发布内容14',25,1,'2023-04-10 09:48:26','2023-04-10 09:48:26','2023-04-10 09:48:26'),(15,NULL,1,NULL,NULL,'可以删除自己发布的贴子和评论',14,2,'2023-04-10 10:17:58',NULL,'2023-04-10 10:17:58'),(17,NULL,NULL,1,NULL,'11111111111111111111111111',14,2,'2023-04-10 10:19:03',NULL,'2023-04-10 10:19:03'),(18,NULL,NULL,NULL,1,'222222222222222222222222222222',14,2,'2023-04-10 10:20:04',NULL,'2023-04-10 10:20:04');

/*Table structure for table `jingdian` */

DROP TABLE IF EXISTS `jingdian`;

CREATE TABLE `jingdian` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `jingdian_uuid_number` varchar(200) DEFAULT NULL COMMENT '景点编号',
  `jingdian_name` varchar(200) DEFAULT NULL COMMENT '景点名称 Search111',
  `jingdian_types` int(11) DEFAULT NULL COMMENT '景点类型 Search111',
  `jingdian_photo` varchar(200) DEFAULT NULL COMMENT '景点图片',
  `jingdian_address` varchar(200) DEFAULT NULL COMMENT '景点地址',
  `jingdian_money` decimal(10,2) DEFAULT NULL COMMENT '价格/人',
  `jingdian_clicknum` int(11) DEFAULT NULL COMMENT '热度',
  `zan_number` int(11) DEFAULT NULL COMMENT '赞 ',
  `cai_number` int(11) DEFAULT NULL COMMENT '踩 ',
  `jingdian_text` longtext COMMENT '日程路线',
  `jingdian_content` longtext COMMENT '旅游景点详情',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='旅游景点';

/*Data for the table `jingdian` */

insert  into `jingdian`(`id`,`jingdian_uuid_number`,`jingdian_name`,`jingdian_types`,`jingdian_photo`,`jingdian_address`,`jingdian_money`,`jingdian_clicknum`,`zan_number`,`cai_number`,`jingdian_text`,`jingdian_content`,`create_time`) values (1,'1681091306434','景点名称1',2,'upload/jingdian1.jpg','景点地址1','74.16',26,360,488,'日程路线1','旅游景点详情1','2023-04-10 09:48:26'),(2,'1681091306493','景点名称2',2,'upload/jingdian2.jpg','景点地址2','229.21',25,401,35,'日程路线2','旅游景点详情2','2023-04-10 09:48:26'),(3,'1681091306460','景点名称3',1,'upload/jingdian3.jpg','景点地址3','499.49',99,251,427,'日程路线3','旅游景点详情3','2023-04-10 09:48:26'),(4,'1681091306481','景点名称4',1,'upload/jingdian4.jpg','景点地址4','227.00',204,127,276,'日程路线4','旅游景点详情4','2023-04-10 09:48:26'),(5,'1681091306459','景点名称5',1,'upload/jingdian5.jpg','景点地址5','35.43',433,17,406,'日程路线5','旅游景点详情5','2023-04-10 09:48:26'),(6,'1681091306475','景点名称6',3,'upload/jingdian6.jpg','景点地址6','418.31',428,92,132,'日程路线6','旅游景点详情6','2023-04-10 09:48:26'),(7,'1681091306476','景点名称7',2,'upload/jingdian7.jpg','景点地址7','329.20',325,275,315,'日程路线7','旅游景点详情7','2023-04-10 09:48:26'),(8,'1681091306456','景点名称8',1,'upload/jingdian8.jpg','景点地址8','887.71',364,271,308,'日程路线8','旅游景点详情8','2023-04-10 09:48:26'),(9,'1681091306506','景点名称9',2,'upload/jingdian9.jpg','景点地址9','444.94',372,190,464,'日程路线9','旅游景点详情9','2023-04-10 09:48:26'),(10,'1681091306470','景点名称10',1,'upload/jingdian10.jpg','景点地址10','387.93',206,439,43,'日程路线10','旅游景点详情10','2023-04-10 09:48:26'),(11,'1681091306515','景点名称11',1,'upload/jingdian11.jpg','景点地址11','341.75',424,155,179,'日程路线11','旅游景点详情11','2023-04-10 09:48:26'),(12,'1681091306509','景点名称12',1,'upload/jingdian12.jpg','景点地址12','941.03',392,165,414,'日程路线12','旅游景点详情12','2023-04-10 09:48:26'),(13,'1681091306478','景点名称13',2,'upload/jingdian13.jpg','景点地址13','384.32',502,221,290,'日程路线13','旅游景点详情13','2023-04-10 09:48:26'),(14,'1681091306472','景点名称14',3,'upload/jingdian14.jpg','景点地址14','301.18',377,363,129,'日程路线14','旅游景点详情14','2023-04-10 09:48:26');

/*Table structure for table `jingdian_collection` */

DROP TABLE IF EXISTS `jingdian_collection`;

CREATE TABLE `jingdian_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `jingdian_id` int(11) DEFAULT NULL COMMENT '旅游景点',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '游客',
  `jingdian_collection_types` int(11) DEFAULT NULL COMMENT '类型',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '收藏时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='旅游景点收藏';

/*Data for the table `jingdian_collection` */

insert  into `jingdian_collection`(`id`,`jingdian_id`,`yonghu_id`,`jingdian_collection_types`,`insert_time`,`create_time`) values (1,1,3,1,'2023-04-10 09:48:26','2023-04-10 09:48:26'),(2,2,2,1,'2023-04-10 09:48:26','2023-04-10 09:48:26'),(3,3,2,1,'2023-04-10 09:48:26','2023-04-10 09:48:26'),(4,4,3,1,'2023-04-10 09:48:26','2023-04-10 09:48:26'),(5,5,2,1,'2023-04-10 09:48:26','2023-04-10 09:48:26'),(6,6,2,1,'2023-04-10 09:48:26','2023-04-10 09:48:26'),(8,8,1,1,'2023-04-10 09:48:26','2023-04-10 09:48:26'),(9,9,3,1,'2023-04-10 09:48:26','2023-04-10 09:48:26'),(10,10,3,1,'2023-04-10 09:48:26','2023-04-10 09:48:26'),(11,11,1,1,'2023-04-10 09:48:26','2023-04-10 09:48:26'),(12,12,1,1,'2023-04-10 09:48:26','2023-04-10 09:48:26'),(13,13,1,1,'2023-04-10 09:48:26','2023-04-10 09:48:26'),(14,14,3,1,'2023-04-10 09:48:26','2023-04-10 09:48:26'),(17,13,1,2,'2023-04-10 10:18:23','2023-04-10 10:18:23');

/*Table structure for table `jingdian_liuyan` */

DROP TABLE IF EXISTS `jingdian_liuyan`;

CREATE TABLE `jingdian_liuyan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `jingdian_id` int(11) DEFAULT NULL COMMENT '旅游景点',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '游客',
  `jingdian_liuyan_text` longtext COMMENT '留言内容',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '留言时间',
  `reply_text` longtext COMMENT '回复内容',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '回复时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='旅游景点留言';

/*Data for the table `jingdian_liuyan` */

insert  into `jingdian_liuyan`(`id`,`jingdian_id`,`yonghu_id`,`jingdian_liuyan_text`,`insert_time`,`reply_text`,`update_time`,`create_time`) values (1,1,2,'留言内容1','2023-04-10 09:48:26','回复信息1','2023-04-10 09:48:26','2023-04-10 09:48:26'),(2,2,2,'留言内容2','2023-04-10 09:48:26','回复信息2','2023-04-10 09:48:26','2023-04-10 09:48:26'),(3,3,3,'留言内容3','2023-04-10 09:48:26','回复信息3','2023-04-10 09:48:26','2023-04-10 09:48:26'),(4,4,3,'留言内容4','2023-04-10 09:48:26','回复信息4','2023-04-10 09:48:26','2023-04-10 09:48:26'),(5,5,3,'留言内容5','2023-04-10 09:48:26','回复信息5','2023-04-10 09:48:26','2023-04-10 09:48:26'),(6,6,1,'留言内容6','2023-04-10 09:48:26','回复信息6','2023-04-10 09:48:26','2023-04-10 09:48:26'),(7,7,2,'留言内容7','2023-04-10 09:48:26','回复信息7','2023-04-10 09:48:26','2023-04-10 09:48:26'),(8,8,2,'留言内容8','2023-04-10 09:48:26','回复信息8','2023-04-10 09:48:26','2023-04-10 09:48:26'),(9,9,1,'留言内容9','2023-04-10 09:48:26','回复信息9','2023-04-10 09:48:26','2023-04-10 09:48:26'),(10,10,3,'留言内容10','2023-04-10 09:48:26','回复信息10','2023-04-10 09:48:26','2023-04-10 09:48:26'),(11,11,1,'留言内容11','2023-04-10 09:48:26','回复信息11','2023-04-10 09:48:26','2023-04-10 09:48:26'),(12,12,2,'留言内容12','2023-04-10 09:48:26','回复信息12','2023-04-10 09:48:26','2023-04-10 09:48:26'),(13,13,2,'留言内容13','2023-04-10 09:48:26','回复信息13','2023-04-10 09:48:26','2023-04-10 09:48:26'),(14,14,1,'留言内容14','2023-04-10 09:48:26','回复信息14','2023-04-10 09:48:26','2023-04-10 09:48:26');

/*Table structure for table `jiudian` */

DROP TABLE IF EXISTS `jiudian`;

CREATE TABLE `jiudian` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `jiudian_name` varchar(200) DEFAULT NULL COMMENT '酒店名称 Search111',
  `jiudian_types` int(11) DEFAULT NULL COMMENT '房间类型 Search111',
  `jiudian_money` decimal(10,2) DEFAULT NULL COMMENT '价格/天',
  `jiudian_photo` varchar(200) DEFAULT NULL COMMENT '酒店图片',
  `jiudian_address` varchar(200) DEFAULT NULL COMMENT '酒店地址',
  `jiudian_clicknum` int(11) DEFAULT NULL COMMENT '热度',
  `zan_number` int(11) DEFAULT NULL COMMENT '赞 ',
  `cai_number` int(11) DEFAULT NULL COMMENT '踩 ',
  `shangxia_types` int(11) DEFAULT NULL COMMENT '冻结状态 ',
  `jiudian_content` longtext COMMENT '酒店详情',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='酒店信息';

/*Data for the table `jiudian` */

insert  into `jiudian`(`id`,`jiudian_name`,`jiudian_types`,`jiudian_money`,`jiudian_photo`,`jiudian_address`,`jiudian_clicknum`,`zan_number`,`cai_number`,`shangxia_types`,`jiudian_content`,`create_time`) values (1,'酒店名称1',2,'109.31','upload/jiudian1.jpg','酒店地址1',409,448,1,1,'酒店详情1','2023-04-10 09:48:26'),(2,'酒店名称2',3,'930.81','upload/jiudian2.jpg','酒店地址2',114,215,5,1,'酒店详情2','2023-04-10 09:48:26'),(3,'酒店名称3',3,'177.36','upload/jiudian3.jpg','酒店地址3',290,91,313,1,'酒店详情3','2023-04-10 09:48:26'),(4,'酒店名称4',1,'485.45','upload/jiudian4.jpg','酒店地址4',306,277,299,1,'酒店详情4','2023-04-10 09:48:26'),(5,'酒店名称5',1,'72.48','upload/jiudian5.jpg','酒店地址5',44,436,101,1,'酒店详情5','2023-04-10 09:48:26'),(6,'酒店名称6',2,'759.60','upload/jiudian6.jpg','酒店地址6',126,458,169,1,'酒店详情6','2023-04-10 09:48:26'),(7,'酒店名称7',3,'579.36','upload/jiudian7.jpg','酒店地址7',256,141,61,1,'酒店详情7','2023-04-10 09:48:26'),(8,'酒店名称8',3,'234.51','upload/jiudian8.jpg','酒店地址8',91,481,62,1,'酒店详情8','2023-04-10 09:48:26'),(9,'酒店名称9',3,'679.18','upload/jiudian9.jpg','酒店地址9',407,154,21,1,'酒店详情9','2023-04-10 09:48:26'),(10,'酒店名称10',2,'20.62','upload/jiudian10.jpg','酒店地址10',145,329,405,1,'酒店详情10','2023-04-10 09:48:26'),(11,'酒店名称11',2,'236.32','upload/jiudian11.jpg','酒店地址11',227,278,102,1,'酒店详情11','2023-04-10 09:48:26'),(12,'酒店名称12',3,'942.57','upload/jiudian12.jpg','酒店地址12',485,12,450,1,'酒店详情12','2023-04-10 09:48:26'),(13,'酒店名称13',1,'543.02','upload/jiudian13.jpg','酒店地址13',22,7,191,1,'酒店详情13','2023-04-10 09:48:26'),(14,'酒店名称14',2,'565.30','upload/jiudian14.jpg','酒店地址14',151,230,310,1,'酒店详情14','2023-04-10 09:48:26');

/*Table structure for table `jiudian_collection` */

DROP TABLE IF EXISTS `jiudian_collection`;

CREATE TABLE `jiudian_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `jiudian_id` int(11) DEFAULT NULL COMMENT '酒店',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '游客',
  `jiudian_collection_types` int(11) DEFAULT NULL COMMENT '类型',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '收藏时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='酒店收藏';

/*Data for the table `jiudian_collection` */

insert  into `jiudian_collection`(`id`,`jiudian_id`,`yonghu_id`,`jiudian_collection_types`,`insert_time`,`create_time`) values (3,3,1,1,'2023-04-10 09:48:26','2023-04-10 09:48:26'),(5,5,3,1,'2023-04-10 09:48:26','2023-04-10 09:48:26'),(6,6,3,1,'2023-04-10 09:48:26','2023-04-10 09:48:26'),(7,7,3,1,'2023-04-10 09:48:26','2023-04-10 09:48:26'),(8,8,3,1,'2023-04-10 09:48:26','2023-04-10 09:48:26'),(9,9,3,1,'2023-04-10 09:48:26','2023-04-10 09:48:26'),(10,10,1,1,'2023-04-10 09:48:26','2023-04-10 09:48:26'),(11,11,2,1,'2023-04-10 09:48:26','2023-04-10 09:48:26'),(12,12,3,1,'2023-04-10 09:48:26','2023-04-10 09:48:26'),(13,13,1,1,'2023-04-10 09:48:26','2023-04-10 09:48:26'),(14,14,3,1,'2023-04-10 09:48:26','2023-04-10 09:48:26'),(15,9,1,2,'2023-04-10 10:13:40','2023-04-10 10:13:40'),(16,4,1,1,'2023-04-10 10:17:31','2023-04-10 10:17:31'),(17,4,1,2,'2023-04-10 10:17:32','2023-04-10 10:17:32');

/*Table structure for table `jiudian_liuyan` */

DROP TABLE IF EXISTS `jiudian_liuyan`;

CREATE TABLE `jiudian_liuyan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `jiudian_id` int(11) DEFAULT NULL COMMENT '酒店',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '游客',
  `jiudian_liuyan_text` longtext COMMENT '留言内容',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '留言时间',
  `reply_text` longtext COMMENT '回复内容',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '回复时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='酒店留言';

/*Data for the table `jiudian_liuyan` */

insert  into `jiudian_liuyan`(`id`,`jiudian_id`,`yonghu_id`,`jiudian_liuyan_text`,`insert_time`,`reply_text`,`update_time`,`create_time`) values (1,1,2,'留言内容1','2023-04-10 09:48:26','回复信息1','2023-04-10 09:48:26','2023-04-10 09:48:26'),(2,2,3,'留言内容2','2023-04-10 09:48:26','回复信息2','2023-04-10 09:48:26','2023-04-10 09:48:26'),(3,3,3,'留言内容3','2023-04-10 09:48:26','回复信息3','2023-04-10 09:48:26','2023-04-10 09:48:26'),(4,4,3,'留言内容4','2023-04-10 09:48:26','回复信息4','2023-04-10 09:48:26','2023-04-10 09:48:26'),(5,5,3,'留言内容5','2023-04-10 09:48:26','回复信息5','2023-04-10 09:48:26','2023-04-10 09:48:26'),(6,6,3,'留言内容6','2023-04-10 09:48:26','回复信息6','2023-04-10 09:48:26','2023-04-10 09:48:26'),(7,7,1,'留言内容7','2023-04-10 09:48:26','回复信息7','2023-04-10 09:48:26','2023-04-10 09:48:26'),(8,8,2,'留言内容8','2023-04-10 09:48:26','回复信息8','2023-04-10 09:48:26','2023-04-10 09:48:26'),(9,9,3,'留言内容9','2023-04-10 09:48:26','回复信息9','2023-04-10 09:48:26','2023-04-10 09:48:26'),(10,10,1,'留言内容10','2023-04-10 09:48:26','回复信息10','2023-04-10 09:48:26','2023-04-10 09:48:26'),(11,11,2,'留言内容11','2023-04-10 09:48:26','回复信息11','2023-04-10 09:48:26','2023-04-10 09:48:26'),(12,12,3,'留言内容12','2023-04-10 09:48:26','回复信息12','2023-04-10 09:48:26','2023-04-10 09:48:26'),(13,13,2,'留言内容13','2023-04-10 09:48:26','回复信息13','2023-04-10 09:48:26','2023-04-10 09:48:26'),(14,14,3,'留言内容14','2023-04-10 09:48:26','回复信息14','2023-04-10 09:48:26','2023-04-10 09:48:26'),(15,9,1,'登录后才能进入数据详情页进行点赞评论 收藏预约等功能','2023-04-10 10:14:09','回复评论1111','2023-04-10 10:19:41','2023-04-10 10:14:09');

/*Table structure for table `jiudian_yuyue` */

DROP TABLE IF EXISTS `jiudian_yuyue`;

CREATE TABLE `jiudian_yuyue` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '游客',
  `jiudian_id` int(11) DEFAULT NULL COMMENT '酒店',
  `jiudian_yuyue_time` timestamp NULL DEFAULT NULL COMMENT '预定时间',
  `jiudian_yuyue_number` int(11) DEFAULT NULL COMMENT '预定天数',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3 listShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='酒店预定';

/*Data for the table `jiudian_yuyue` */

insert  into `jiudian_yuyue`(`id`,`yonghu_id`,`jiudian_id`,`jiudian_yuyue_time`,`jiudian_yuyue_number`,`create_time`) values (1,2,1,'2023-04-10 09:48:26',347,'2023-04-10 09:48:26'),(2,2,2,'2023-04-10 09:48:26',304,'2023-04-10 09:48:26'),(3,1,3,'2023-04-10 09:48:26',316,'2023-04-10 09:48:26'),(4,1,4,'2023-04-10 09:48:26',428,'2023-04-10 09:48:26'),(5,1,5,'2023-04-10 09:48:26',269,'2023-04-10 09:48:26'),(6,1,6,'2023-04-10 09:48:26',315,'2023-04-10 09:48:26'),(7,1,7,'2023-04-10 09:48:26',312,'2023-04-10 09:48:26'),(8,3,8,'2023-04-10 09:48:26',129,'2023-04-10 09:48:26'),(9,2,9,'2023-04-10 09:48:26',128,'2023-04-10 09:48:26'),(10,2,10,'2023-04-10 09:48:26',315,'2023-04-10 09:48:26'),(11,2,11,'2023-04-10 09:48:26',102,'2023-04-10 09:48:26'),(12,2,12,'2023-04-10 09:48:26',1,'2023-04-10 09:48:26'),(13,3,13,'2023-04-10 09:48:26',100,'2023-04-10 09:48:26'),(14,2,14,'2023-04-10 09:48:26',44,'2023-04-10 09:48:26'),(16,1,4,'2023-04-14 10:17:32',1,'2023-04-10 10:17:40');

/*Table structure for table `liuyan` */

DROP TABLE IF EXISTS `liuyan`;

CREATE TABLE `liuyan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '游客',
  `liuyan_name` varchar(200) DEFAULT NULL COMMENT '留言标题  Search111 ',
  `liuyan_text` longtext COMMENT '留言内容',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '留言时间',
  `reply_text` longtext COMMENT '回复内容',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '回复时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='留言板';

/*Data for the table `liuyan` */

insert  into `liuyan`(`id`,`yonghu_id`,`liuyan_name`,`liuyan_text`,`insert_time`,`reply_text`,`update_time`,`create_time`) values (1,3,'留言标题1','留言内容1','2023-04-10 09:48:26','回复信息1','2023-04-10 09:48:26','2023-04-10 09:48:26'),(2,3,'留言标题2','留言内容2','2023-04-10 09:48:26','回复信息2','2023-04-10 09:48:26','2023-04-10 09:48:26'),(3,1,'留言标题3','留言内容3','2023-04-10 09:48:26','回复信息3','2023-04-10 09:48:26','2023-04-10 09:48:26'),(4,3,'留言标题4','留言内容4','2023-04-10 09:48:26','回复信息4','2023-04-10 09:48:26','2023-04-10 09:48:26'),(5,1,'留言标题5','留言内容5','2023-04-10 09:48:26','回复信息5','2023-04-10 09:48:26','2023-04-10 09:48:26'),(6,2,'留言标题6','留言内容6','2023-04-10 09:48:26','回复信息6','2023-04-10 09:48:26','2023-04-10 09:48:26'),(7,1,'留言标题7','留言内容7','2023-04-10 09:48:26','回复信息7','2023-04-10 09:48:26','2023-04-10 09:48:26'),(8,2,'留言标题8','留言内容8','2023-04-10 09:48:26','回复信息8','2023-04-10 09:48:26','2023-04-10 09:48:26'),(9,2,'留言标题9','留言内容9','2023-04-10 09:48:26','回复信息9','2023-04-10 09:48:26','2023-04-10 09:48:26'),(10,2,'留言标题10','留言内容10','2023-04-10 09:48:26','回复信息10','2023-04-10 09:48:26','2023-04-10 09:48:26'),(11,1,'留言标题11','留言内容11','2023-04-10 09:48:26','回复信息11','2023-04-10 09:48:26','2023-04-10 09:48:26'),(12,3,'留言标题12','留言内容12','2023-04-10 09:48:26','回复信息12','2023-04-10 09:48:26','2023-04-10 09:48:26'),(13,2,'留言标题13','留言内容13','2023-04-10 09:48:26','回复信息13','2023-04-10 09:48:26','2023-04-10 09:48:26'),(14,2,'留言标题14','留言内容14','2023-04-10 09:48:26','回复信息14','2023-04-10 09:48:26','2023-04-10 09:48:26'),(15,1,'12','3123','2023-04-10 10:18:32','回复留言','2023-04-10 10:19:55','2023-04-10 10:18:32');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `news_name` varchar(200) DEFAULT NULL COMMENT '公告标题  Search111 ',
  `news_types` int(11) DEFAULT NULL COMMENT '公告类型  Search111 ',
  `news_photo` varchar(200) DEFAULT NULL COMMENT '公告图片',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '公告时间',
  `news_content` longtext COMMENT '公告详情',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='公告信息';

/*Data for the table `news` */

insert  into `news`(`id`,`news_name`,`news_types`,`news_photo`,`insert_time`,`news_content`,`create_time`) values (1,'公告标题1',1,'upload/news1.jpg','2023-04-10 09:48:26','公告详情1','2023-04-10 09:48:26'),(2,'公告标题2',2,'upload/news2.jpg','2023-04-10 09:48:26','公告详情2','2023-04-10 09:48:26'),(3,'公告标题3',3,'upload/news3.jpg','2023-04-10 09:48:26','公告详情3','2023-04-10 09:48:26'),(4,'公告标题4',3,'upload/news4.jpg','2023-04-10 09:48:26','公告详情4','2023-04-10 09:48:26'),(5,'公告标题5',3,'upload/news5.jpg','2023-04-10 09:48:26','公告详情5','2023-04-10 09:48:26'),(6,'公告标题6',3,'upload/news6.jpg','2023-04-10 09:48:26','公告详情6','2023-04-10 09:48:26'),(7,'公告标题7',2,'upload/news7.jpg','2023-04-10 09:48:26','公告详情7','2023-04-10 09:48:26'),(8,'公告标题8',2,'upload/news8.jpg','2023-04-10 09:48:26','公告详情8','2023-04-10 09:48:26'),(9,'公告标题9',3,'upload/news9.jpg','2023-04-10 09:48:26','公告详情9','2023-04-10 09:48:26'),(10,'公告标题10',1,'upload/news10.jpg','2023-04-10 09:48:26','公告详情10','2023-04-10 09:48:26'),(11,'公告标题11',1,'upload/news11.jpg','2023-04-10 09:48:26','公告详情11','2023-04-10 09:48:26'),(12,'公告标题12',3,'upload/news12.jpg','2023-04-10 09:48:26','公告详情12','2023-04-10 09:48:26'),(13,'公告标题13',1,'upload/news13.jpg','2023-04-10 09:48:26','公告详情13','2023-04-10 09:48:26'),(14,'公告标题14',3,'upload/news14.jpg','2023-04-10 09:48:26','公告详情14','2023-04-10 09:48:26');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,1,'a1','yonghu','游客','xnkn8qk8em02vzhi6iv5ajdv0fs2a58u','2023-04-10 09:46:23','2023-04-10 11:13:39'),(2,1,'admin','users','管理员','sm77ftmatzmyv7w1rza6rchxq6y7r3a2','2023-04-10 09:52:00','2023-04-10 11:21:19'),(3,1,'a1','daoyou','导游','vdoern5enamc7zh2bbwvdjtzjje1w069','2023-04-10 10:18:50','2023-04-10 11:18:51');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'admin','admin','管理员','2022-05-01 00:00:00');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '游客姓名 Search111 ',
  `yonghu_photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别 Search111 ',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '联系方式',
  `yonghu_email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `yonghu_delete` int(11) DEFAULT '1' COMMENT '假删',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='游客';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`username`,`password`,`yonghu_name`,`yonghu_photo`,`sex_types`,`yonghu_phone`,`yonghu_email`,`yonghu_delete`,`create_time`) values (1,'a1','123456','游客姓名1','upload/yonghu1.jpg',1,'17703786901','1@qq.com',1,'2023-04-10 09:48:26'),(2,'a2','123456','游客姓名2','upload/yonghu2.jpg',1,'17703786902','2@qq.com',1,'2023-04-10 09:48:26'),(3,'a3','123456','游客姓名3','upload/yonghu3.jpg',1,'17703786903','3@qq.com',1,'2023-04-10 09:48:26');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
