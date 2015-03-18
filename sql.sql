/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.1.49-community : Database - media
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`media` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `media`;

/*Table structure for table `action` */

DROP TABLE IF EXISTS `action`;

CREATE TABLE `action` (
  `aId` varchar(20) NOT NULL COMMENT 'ID',
  `aType` varchar(50) DEFAULT NULL COMMENT '请求类型',
  `aName` varchar(50) DEFAULT NULL COMMENT 'action名称',
  `aLink` varchar(100) DEFAULT NULL COMMENT 'action连接',
  `aShow` int(1) DEFAULT NULL COMMENT '是否显示',
  `aOrder` int(10) DEFAULT NULL COMMENT '排序方式',
  `aAllow` varchar(200) DEFAULT NULL COMMENT '权限允许连接',
  `aIcon` varchar(20) DEFAULT NULL COMMENT '改连接的图标',
  `aRemark` text COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `action` */

insert  into `action`(`aId`,`aType`,`aName`,`aLink`,`aShow`,`aOrder`,`aAllow`,`aIcon`,`aRemark`) values ('nav1_1','nav1','客户信息录入','',1,1,'','icon-home',''),('nav1_2_1','nav1_2','查看详情','',0,1,'','icon-home',''),('nav1_2_2','nav1_2','导出档案','',0,2,'','icon-home',''),('nav1_2_3','nav1_2','编辑','',0,3,'','icon-home',''),('nav1_2_4','nav1_2','删除','',0,4,'','icon-home',''),('nav1_2','nav1','客户档案管理','',1,2,'','icon-home',''),('nav1','0','客户管理','',1,1,'','icon-home',''),('nav2_1','nav2','销售信息录入','',1,1,'','icon-home',''),('nav2_2_1','nav2_2','查看详情','',0,4,'','icon-home',''),('nav2_2_2','nav2_2','编辑','',0,4,'','icon-home',''),('nav2_2_3','nav2_2','删除','',0,4,'','icon-home',''),('nav2_2_4','nav2_2','导出记录','',0,4,'','icon-home',''),('nav2_2','nav2','销售信息管理','',1,1,'','icon-home',''),('nav2_3_1','nav2_3','导出报表','',0,4,'','icon-home',''),('nav2_3','nav2','销售信息统计','',1,1,'','icon-home',''),('nav2','0','销售管理','',1,2,'','icon-home',''),('nav3_1','nav3','售后信息录入','',1,1,'','icon-home',''),('nav3_2','nav3','售后信息查询','',1,1,'','icon-home',''),('nav3_3','nav3','售后信息统计','',1,1,'','icon-home',''),('nav3','0','售后管理','',1,3,'','icon-home',''),('nav4_1','nav4','待审核','',1,1,'','icon-home',''),('nav4_1','nav4','审核完成','',1,1,'','icon-home',''),('nav4','0','审批','',1,4,'','icon-home',''),('nav5_1','nav5','备件入库','',1,1,'','icon-home',''),('nav5_2','nav5','备件出库','',1,1,'','icon-home',''),('nav5_3','nav5','备件查询','',1,1,'','icon-home',''),('nav5_4','nav5','领取记录','',1,1,'','icon-home',''),('nav5_5_1','nav5_5','转为报废','',0,4,'','icon-home',''),('nav5_5_2','nav5_5','查看详情','',0,4,'','icon-home',''),('nav5_5_3','nav5_5','查看记录','',0,4,'','icon-home',''),('nav5_5','nav5','报废管理','',1,1,'','icon-home',''),('nav5','0','维修备件管理','',1,5,'','icon-home',''),('nav6_1_1','nav6_1','查看详情','',0,4,'','icon-home',''),('nav6_1_2','nav6_1','新增商品','',0,4,'','icon-home',''),('nav6_1_3','nav6_1','编辑','',0,4,'','icon-home',''),('nav6_1_4','nav6_1','删除','',0,4,'','icon-home',''),('nav6_1','nav6','商品基本信息管理','',1,1,'','icon-home',''),('nav6_2_1','nav6_2','新增价目','',0,4,'','icon-home',''),('nav6_2_2','nav6_2','编辑','',0,4,'','icon-home',''),('nav6_2_3','nav6_2','删除','',0,4,'','icon-home',''),('nav6_2','nav6','价目管理','',1,1,'','icon-home',''),('nav6_3_1','nav6_3','新增备件','',0,4,'','icon-home',''),('nav6_3_1','nav6_3','编辑','',0,4,'','icon-home',''),('nav6_3_1','nav6_3','删除','',0,4,'','icon-home',''),('nav6_3','nav6','维修备件信息管理','',1,1,'','icon-home',''),('nav6','0','内容管理','',1,6,'','icon-home',''),('nav7_1_1','nav7_1','新增用户','',0,4,'','icon-home',''),('nav7_1_2','nav7_1','编辑','',0,4,'','icon-home',''),('nav7_1_3','nav7_1','删除','',0,4,'','icon-home',''),('nav7_1','nav7','用户管理','',1,1,'','icon-home',''),('nav7_2_1','nav7_2','新增角色','',0,4,'','icon-home',''),('nav7_2_2','nav7_2','编辑','',0,4,'','icon-home',''),('nav7_2_3','nav7_2','删除','',0,4,'','icon-home',''),('nav7_2','nav7','角色管理','',1,1,'','icon-home',''),('nav7_3_1','nav7_3','新增权限','',0,4,'','icon-home',''),('nav7_3_2','nav7_3','编辑','',0,4,'','icon-home',''),('nav7_3_3','nav7_3','删除','',0,4,'','icon-home',''),('nav7_3','nav7','权限管理','',1,1,'','icon-home',''),('nav7_4_1','nav7_4','新增变量','',0,4,'','icon-home',''),('nav7_4_2','nav7_4','编辑','',0,4,'','icon-home',''),('nav7_4_3','nav7_4','删除','',0,4,'','icon-home',''),('nav7_4','nav7','综合变量设置','',1,1,'','icon-home',''),('nav7','0','系统设置','',1,7,'','icon-home','');

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `goId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `goNo` varchar(20) DEFAULT NULL COMMENT '商品编号',
  `goType` varchar(20) DEFAULT NULL COMMENT '商品大类',
  `goName` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `goVersion` varchar(50) DEFAULT NULL COMMENT '商品型号',
  `goProperty` text COMMENT '配置',
  `goFormat` varchar(10) DEFAULT NULL COMMENT '规格单位',
  `goImg` varchar(200) DEFAULT NULL COMMENT '图片详情',
  `goRemark` text COMMENT '备注',
  PRIMARY KEY (`goId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

/*Table structure for table `guest` */

DROP TABLE IF EXISTS `guest`;

CREATE TABLE `guest` (
  `gId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gNo` varchar(20) NOT NULL COMMENT '编号',
  `gName` varchar(20) DEFAULT NULL COMMENT '姓名',
  `gSex` char(1) DEFAULT NULL COMMENT '性别',
  `gPhone` varchar(11) DEFAULT NULL COMMENT '手机号',
  `gTel` varchar(20) DEFAULT NULL COMMENT '固话',
  `gCompany` varchar(50) DEFAULT NULL COMMENT '单位名称',
  `gAdress` varchar(100) DEFAULT NULL COMMENT '详细地址',
  `gVIP` varchar(20) DEFAULT NULL COMMENT 'VIP号',
  `gQQ` varchar(20) DEFAULT NULL COMMENT 'QQ号码',
  `gEmail` varchar(20) DEFAULT NULL COMMENT '邮箱号',
  `gIDcard` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `gInputDate` varchar(20) DEFAULT NULL COMMENT '录入时间',
  `gRemark` text COMMENT '备注',
  PRIMARY KEY (`gId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `guest` */

/*Table structure for table `permissions` */

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `psId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `psNo` varchar(20) DEFAULT NULL COMMENT '权限编号',
  `psName` varchar(20) DEFAULT NULL COMMENT '名称',
  `psPermission` varchar(100) DEFAULT NULL COMMENT '包含的请求列表',
  `psRemark` text COMMENT '备注',
  PRIMARY KEY (`psId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `permissions` */

/*Table structure for table `prices` */

DROP TABLE IF EXISTS `prices`;

CREATE TABLE `prices` (
  `pId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `p_gId` int(20) DEFAULT NULL COMMENT '商品ID（外键）',
  `pType` varchar(10) DEFAULT NULL COMMENT '操作类型：出售/采购',
  `pPrice` float DEFAULT NULL COMMENT '价格',
  `pDate` varchar(20) DEFAULT NULL COMMENT '时间段',
  `pPerson` int(20) DEFAULT NULL COMMENT '录入员ID（外键）',
  `pRemark` text COMMENT '备注',
  PRIMARY KEY (`pId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `prices` */

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `rId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `rNo` varchar(20) DEFAULT NULL COMMENT '角色编号',
  `rName` varchar(20) DEFAULT NULL COMMENT '角色名称',
  `r_psId` int(20) DEFAULT NULL COMMENT '权限组ID（外键）',
  `rRemark` text COMMENT '备注',
  PRIMARY KEY (`rId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `roles` */

/*Table structure for table `sale` */

DROP TABLE IF EXISTS `sale`;

CREATE TABLE `sale` (
  `sId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `sNo` varbinary(20) DEFAULT NULL COMMENT '销售单号',
  `s_goNum` varchar(20) DEFAULT NULL COMMENT '商品编号外键',
  `s_gId` varchar(20) DEFAULT NULL COMMENT '客户编号外键',
  `sNum` int(10) DEFAULT NULL COMMENT '数量',
  `sReceivable` float DEFAULT NULL COMMENT '应收金额',
  `sReceived` float DEFAULT NULL COMMENT '实收金额',
  `sWarrantyDate` varchar(20) DEFAULT NULL COMMENT '质保截止',
  `sTechnologyPerson` varchar(20) DEFAULT NULL COMMENT '技术负责人',
  `sSalesUnit` varchar(50) DEFAULT NULL COMMENT '销售单位',
  `sSalesRepresentative` varchar(20) DEFAULT NULL COMMENT '销售代表',
  `sPayType` varchar(20) DEFAULT NULL COMMENT '购买方式',
  `sInvoice` varchar(20) DEFAULT NULL COMMENT '发票号码',
  `sInputDate` varchar(20) DEFAULT NULL COMMENT '录入时间',
  `sInputPerson` int(20) DEFAULT NULL COMMENT '录入员ID(外键)',
  `sRemark` text COMMENT '备注',
  PRIMARY KEY (`sId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sale` */

/*Table structure for table `saled` */

DROP TABLE IF EXISTS `saled`;

CREATE TABLE `saled` (
  `sdId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `sdNo` varchar(20) DEFAULT NULL COMMENT '编号',
  `sdType` varchar(20) DEFAULT NULL COMMENT '售后类型：换件、维修。。',
  `sd_sId` int(20) DEFAULT NULL COMMENT '销售记录序号（外键）',
  `sdRepairStatus` varchar(20) DEFAULT NULL COMMENT '单据状态',
  `sdReportDate` varchar(20) DEFAULT NULL COMMENT '报修日期',
  `sdOrdersPerson` varchar(20) DEFAULT NULL COMMENT '接单员',
  `sdRepairDate` varchar(20) DEFAULT NULL COMMENT '维修时间',
  `sdEquipmentTrouble` varchar(300) DEFAULT NULL COMMENT '报修故障',
  `sd_uNo` varchar(20) DEFAULT NULL COMMENT '关联维修工号（外键）',
  `sdChargeType` varchar(20) DEFAULT NULL COMMENT '收费类型',
  `sdChargeMoney` float DEFAULT NULL COMMENT '收费金额',
  `sdTrafficMoney` float DEFAULT NULL COMMENT '交通费用',
  `sdOtherMoney` float DEFAULT NULL COMMENT '其他费用',
  `sdCheckPerson` int(20) DEFAULT NULL COMMENT '审核人员ID(外键)',
  `sdCheckDate` varchar(10) DEFAULT NULL COMMENT '审核时间',
  `sdCheckStatus` varchar(10) DEFAULT NULL COMMENT '审核状态',
  `sdCheckSuggestion` varchar(200) DEFAULT NULL COMMENT '审核意见',
  `sdInputPerson` int(20) DEFAULT NULL COMMENT '录入员ID（外键）',
  `sdInputDate` varchar(10) DEFAULT NULL COMMENT '录入时间',
  `sdRemark` text COMMENT '备注',
  PRIMARY KEY (`sdId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `saled` */

/*Table structure for table `sparepartsbase` */

DROP TABLE IF EXISTS `sparepartsbase`;

CREATE TABLE `sparepartsbase` (
  `sbId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `sbNo` varchar(20) DEFAULT NULL COMMENT '编号',
  `sbType` varchar(50) DEFAULT NULL COMMENT '备件大类',
  `sbName` varchar(50) DEFAULT NULL COMMENT '备件名称',
  `sbNumber` int(20) DEFAULT NULL COMMENT '库存量',
  `sbPrice` float DEFAULT NULL COMMENT '采购价格',
  `sbFormat` varchar(10) DEFAULT NULL COMMENT '规格单位',
  `sbRemark` text COMMENT '备注',
  PRIMARY KEY (`sbId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sparepartsbase` */

/*Table structure for table `sparepartsinout` */

DROP TABLE IF EXISTS `sparepartsinout`;

CREATE TABLE `sparepartsinout` (
  `siId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `siNo` varchar(20) DEFAULT NULL COMMENT '单号',
  `siType` varchar(10) DEFAULT NULL COMMENT '库存类型：出库/入库',
  `siDate` varchar(10) DEFAULT NULL COMMENT '出库入库时间',
  `si_sbId` int(20) DEFAULT NULL COMMENT '备件ID（外键）',
  `siCheckPerson` int(10) DEFAULT NULL COMMENT '经办人ID(外键)',
  `siPerson` varchar(10) DEFAULT NULL COMMENT '领取/入库人员',
  `siPrice` float DEFAULT NULL COMMENT '出售/采购 单价',
  `siNumber` int(10) DEFAULT NULL COMMENT '数量',
  `siRemark` text COMMENT '备注',
  PRIMARY KEY (`siId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sparepartsinout` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `uId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uNo` varchar(20) DEFAULT NULL COMMENT '用户工号',
  `uName` varchar(20) DEFAULT NULL COMMENT '用户名',
  `uPwd` varchar(50) DEFAULT NULL COMMENT '登陆密码',
  `uDoPwd` varchar(50) DEFAULT NULL COMMENT '操作密码',
  `uCompany` varchar(50) DEFAULT NULL COMMENT '所属单位',
  `uSex` char(1) DEFAULT NULL COMMENT '性别',
  `uPhone` varchar(20) DEFAULT NULL COMMENT '联系方式',
  `u_rId` int(20) DEFAULT NULL COMMENT '用户所属角色（外键）',
  `uRemark` text COMMENT '备注',
  PRIMARY KEY (`uId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

/*Table structure for table `val` */

DROP TABLE IF EXISTS `val`;

CREATE TABLE `val` (
  `vId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `vType` int(20) DEFAULT NULL COMMENT '所属父类的ID',
  `vName` varchar(50) DEFAULT NULL COMMENT '名称',
  `vValues` text COMMENT '变量值',
  `vRemark` text COMMENT '备注',
  PRIMARY KEY (`vId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `val` */

insert  into `val`(`vId`,`vType`,`vName`,`vValues`,`vRemark`) values (1,1,'1',NULL,NULL),(2,1,'2',NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
