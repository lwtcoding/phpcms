-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2016 年 01 月 07 日 11:22
-- 服务器版本: 5.5.36
-- PHP 版本: 5.3.28

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `cashsyscgtblog`
--

-- --------------------------------------------------------

--
-- 表的结构 `pigcms_cashier_adminuser`
--

CREATE TABLE IF NOT EXISTS `pigcms_cashier_adminuser` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL,
  `account` varchar(100) NOT NULL,
  `pwd` varchar(35) NOT NULL,
  `salt` varchar(50) NOT NULL,
  `lastlogintime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `mid` (`mid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `pigcms_cashier_adminuser`
--

INSERT INTO `pigcms_cashier_adminuser` (`uid`, `mid`, `account`, `pwd`, `salt`, `lastlogintime`) VALUES
(1, 1, 'cgtblog', '0d3b66e455365e23c8c85f580bc7765b', 'pigcmso2oCashier', 1452135507);

-- --------------------------------------------------------

--
-- 表的结构 `pigcms_cashier_employee`
--

CREATE TABLE IF NOT EXISTS `pigcms_cashier_employee` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL,
  `username` char(50) NOT NULL,
  `account` char(100) NOT NULL,
  `password` char(32) NOT NULL,
  `email` char(200) NOT NULL,
  `salt` char(20) NOT NULL,
  `authority` text,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`eid`),
  KEY `mid` (`mid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `pigcms_cashier_employee`
--

INSERT INTO `pigcms_cashier_employee` (`eid`, `mid`, `username`, `account`, `password`, `email`, `salt`, `authority`, `status`) VALUES
(4, 23, '小春哥', 'cgtbloguser', '20952b5c74a0992d4decf9ca12354716', 'cgtbloguser@qq.com', '907077', 'Merchants/User/Pay/Config|Field,Merchants/User/Cashier/Index,Merchants/User/Cashier/PayRecord,Merchants/User/Cashier/EwmRecord,Merchants/User/Cashier/Odetail,Merchants/User/Cashier/DelOrderByid,Merchants/User/Cashier/WxRefund,Merchants/User/Cashier/payment,Merchants/User/Cashier/wxSmRefund,Merchants/User/Merchant/Employers,Merchants/User/Merchant/EmployersAdd,Merchants/User/Merchant/EmployersAppemd,Merchants/User/Merchant/Field,Merchants/User/Merchant/EmployersDel|EmployersDelAll,Merchants/User/Merchant/employersEdit,Merchants/User/statistics/index,Merchants/User/statistics/fans,Merchants/User/statistics/otherpie,Merchants/User/wxCoupon/index,Merchants/User/wxCoupon/createKq|docreateKq,Merchants/User/wxCoupon/delCardByid,Merchants/User/wxCoupon/ModifyStock,Merchants/User/wxCoupon/wxReceiveList,Merchants/User/wxCoupon/consumeCard', 1);

-- --------------------------------------------------------

--
-- 表的结构 `pigcms_cashier_fans`
--

CREATE TABLE IF NOT EXISTS `pigcms_cashier_fans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL,
  `appid` varchar(200) NOT NULL COMMENT '公众号id',
  `openid` varchar(250) NOT NULL COMMENT '公众号对应的公众号openid',
  `cf` varchar(100) NOT NULL DEFAULT 'local' COMMENT '来源',
  `totalfee` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '支付总额(分)',
  `refund` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '退款金额分',
  `is_subscribe` tinyint(4) NOT NULL COMMENT '1关注',
  `nickname` varchar(250) NOT NULL COMMENT '昵称',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1男2女0未知',
  `province` varchar(200) NOT NULL,
  `city` varchar(200) NOT NULL,
  `country` varchar(200) NOT NULL,
  `headimgurl` varchar(500) NOT NULL COMMENT '头像',
  `groupid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '微信粉丝分组id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `pigcms_cashier_merchants`
--

CREATE TABLE IF NOT EXISTS `pigcms_cashier_merchants` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `username` char(50) DEFAULT NULL,
  `thirduserid` varchar(100) NOT NULL COMMENT '第三方唯一身份ID',
  `password` char(32) DEFAULT NULL,
  `salt` char(50) NOT NULL,
  `wxname` char(210) NOT NULL,
  `weixin` varchar(150) NOT NULL COMMENT '微信号',
  `email` char(100) DEFAULT NULL,
  `logo` char(200) NOT NULL,
  `regTime` int(11) DEFAULT NULL,
  `regIp` char(20) DEFAULT NULL,
  `lastLoginTime` int(11) DEFAULT '0',
  `lastLoginIp` char(20) DEFAULT NULL,
  `source` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `mfypwd` tinyint(1) unsigned NOT NULL COMMENT '1修改过密码',
  `aeskey` varchar(50) NOT NULL COMMENT 'EncodingAESKey',
  `wxtoken` varchar(40) NOT NULL COMMENT 'wxToken',
  `encodetype` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '消息加解密方式',
  `isadmin` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1是总后台生成账号',
  PRIMARY KEY (`mid`),
  KEY `thirduserid` (`thirduserid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- 转存表中的数据 `pigcms_cashier_merchants`
--

INSERT INTO `pigcms_cashier_merchants` (`mid`, `username`, `thirduserid`, `password`, `salt`, `wxname`, `weixin`, `email`, `logo`, `regTime`, `regIp`, `lastLoginTime`, `lastLoginIp`, `source`, `status`, `mfypwd`, `aeskey`, `wxtoken`, `encodetype`, `isadmin`) VALUES
(23, 'cgtblog', '', '6c341a96b0e9311814d62ad4266cebe3', '609711', '春哥技术博客', '', '2931393342@qq.com', '', 1452084959, '2130706433', 1452084959, '2130706433', 0, 1, 0, 'V3ZmneAXDdRUCUUqZ7tEc2f1DBXrj5XvzeDyHMnCZDh', 'GQcpzhFxZQh9AnmQMUnEFmaYTKXr2Q', 0, 0),
(24, 'bbscgtblog', '', '1e5f38856e1cc2bf21692b9de7551f80', '677553', '春哥技术论坛', '', '2994655707@qq.com', '', 1452085079, '2130706433', 1452085079, '2130706433', 0, 1, 0, '', '', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `pigcms_cashier_order`
--

CREATE TABLE IF NOT EXISTS `pigcms_cashier_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` char(32) NOT NULL,
  `mid` int(11) NOT NULL,
  `pmid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '代理者mid',
  `pay_way` char(50) NOT NULL,
  `pay_type` char(50) NOT NULL,
  `goods_type` char(50) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `goods_name` char(200) NOT NULL,
  `goods_describe` varchar(500) NOT NULL,
  `goods_price` decimal(12,2) NOT NULL DEFAULT '0.00',
  `add_time` int(11) NOT NULL,
  `paytime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `ispay` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1已支付',
  `truename` varchar(250) NOT NULL,
  `openid` varchar(250) NOT NULL,
  `p_openid` varchar(250) NOT NULL COMMENT 'p_mid对应openid',
  `transaction_id` varchar(250) NOT NULL COMMENT '第三方支付订单号',
  `refund` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1退款中2已退款3失败',
  `refundtext` text NOT NULL COMMENT '退款结果数据',
  `comefrom` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0本地1微信营销 2微店 3 o2o系统',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `pigcms_cashier_order`
--

INSERT INTO `pigcms_cashier_order` (`id`, `order_id`, `mid`, `pmid`, `pay_way`, `pay_type`, `goods_type`, `goods_id`, `goods_name`, `goods_describe`, `goods_price`, `add_time`, `paytime`, `state`, `ispay`, `truename`, `openid`, `p_openid`, `transaction_id`, `refund`, `refundtext`, `comefrom`) VALUES
(1, '14520863119208535020160106211831', 23, 0, 'weixin', 'wxsaoma2pay', 'unlimit', 1, '春哥技术支持', '收银台生成二维码扫码支付', '100.00', 1452086311, 0, 0, 0, '', '', '', '', 0, '', 0),
(2, '14521351451666417220160107105225', 23, 0, 'weixin', 'wxsaoma2pay', 'unlimit', 1, 'CGTBLOG', '收银台生成二维码扫码支付', '100.00', 1452135145, 0, 0, 0, '', '', '', '', 0, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `pigcms_cashier_payconfig`
--

CREATE TABLE IF NOT EXISTS `pigcms_cashier_payconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL,
  `isOpen` tinyint(1) NOT NULL DEFAULT '0',
  `configData` varchar(2000) DEFAULT NULL,
  `proxymid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '代理者的mid',
  `wxsubmchid` varchar(30) NOT NULL COMMENT '分配到的子商户号',
  `pfpaymid` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '平台代付mid',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `pigcms_cashier_wxcoupon`
--

CREATE TABLE IF NOT EXISTS `pigcms_cashier_wxcoupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL,
  `card_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `card_title` varchar(250) NOT NULL,
  `card_id` varchar(250) NOT NULL COMMENT '微信卡券ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '卡券状态',
  `isdel` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1删除',
  `begin_timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `end_timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `quantity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '库存',
  `receivenum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '领取数',
  `consumenum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '核销数量',
  `get_limit` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '每人可领几张',
  `kqcontent` text NOT NULL COMMENT '卡券内容',
  `kqexpand` text NOT NULL COMMENT '卡券扩展内容',
  `checktime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '审核通过时间',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `cardticket` varchar(250) NOT NULL,
  `cardurl` varchar(250) NOT NULL COMMENT ' 二维码图片解析后的地址',
  `is_open_cell` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启买单功能（0：否，1：开启）',
  `activate` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '会员卡激活方式（0:字段激活，1：一键激活，2：手动激活）',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `pigcms_cashier_wxcoupon_common`
--

CREATE TABLE IF NOT EXISTS `pigcms_cashier_wxcoupon_common` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL,
  `logurl` varchar(250) NOT NULL,
  `mname` varchar(100) NOT NULL COMMENT '商户名字',
  `wxlogurl` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `pigcms_cashier_wxcoupon_receive`
--

CREATE TABLE IF NOT EXISTS `pigcms_cashier_wxcoupon_receive` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `openid` varchar(250) NOT NULL COMMENT '领取人openid',
  `give_openId` varchar(250) NOT NULL COMMENT '转赠送方账号openid',
  `cardid` varchar(250) NOT NULL,
  `cardtype` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '卡券类型',
  `cardtitle` varchar(250) NOT NULL COMMENT '卡券标题',
  `isgivebyfriend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为转赠',
  `cardcode` varchar(100) NOT NULL COMMENT 'code序列号',
  `oldcardcode` varchar(100) NOT NULL COMMENT '转赠前的code序列号',
  `outerid` int(10) unsigned NOT NULL COMMENT 'mid值',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0领取1核销',
  `addtime` int(10) unsigned NOT NULL COMMENT '添加时间',
  `deltime` int(10) unsigned NOT NULL COMMENT '用户删除时间',
  `consumetime` int(10) unsigned NOT NULL COMMENT '消费时间',
  `consumesource` varchar(100) NOT NULL COMMENT '核销来源',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
