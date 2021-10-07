-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 04 Eyl 2021, 20:08:41
-- Sunucu sürümü: 10.4.20-MariaDB
-- PHP Sürümü: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `depo_project`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `admin`
--

CREATE TABLE `admin` (
  `aid` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `admin`
--

INSERT INTO `admin` (`aid`, `email`, `name`, `password`) VALUES
(1, 'emine@mail.com', 'Emine', '12345');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `boxaction`
--

CREATE TABLE `boxaction` (
  `bid` int(11) NOT NULL,
  `adet` int(11) NOT NULL,
  `box_customer_id` int(11) NOT NULL,
  `box_product_id` int(11) NOT NULL,
  `fisNo` int(11) NOT NULL,
  `customer_cu_id` int(11) DEFAULT NULL,
  `products_pid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `boxaction`
--

INSERT INTO `boxaction` (`bid`, `adet`, `box_customer_id`, `box_product_id`, `fisNo`, `customer_cu_id`, `products_pid`) VALUES
(1, 2, 1, 3, 1, NULL, NULL),
(3, 1, 1, 5, 1, NULL, NULL),
(4, 5, 3, 4, 3, NULL, NULL),
(5, 2, 3, 7, 3, NULL, NULL),
(6, 1, 2, 5, 2, NULL, NULL),
(7, 10, 2, 2, 2, NULL, NULL),
(8, 1, 1, 3, 1, NULL, NULL),
(9, 1, 1, 3, 1, NULL, NULL),
(11, 1, 1, 7, 1, NULL, NULL),
(12, 1, 1, 4, 1, NULL, NULL),
(13, 1, 4, 5, 4, NULL, NULL),
(14, 2, 2, 5, 2, NULL, NULL),
(15, 1, 3, 4, 3, NULL, NULL),
(16, 1, 1, 7, 2, NULL, NULL),
(18, 2, 4, 2, 4, NULL, NULL),
(20, 9, 1, 2, 1, NULL, NULL),
(21, 7, 2, 4, 2, NULL, NULL),
(22, 2, 1, 2, 1, NULL, NULL),
(23, 1, 4, 5, 4, NULL, NULL),
(24, 1, 1, 4, 1, NULL, NULL),
(26, 2, 2, 4, 2, NULL, NULL),
(27, 10, 2, 2, 2, NULL, NULL),
(29, 1, 3, 7, 3, NULL, NULL),
(30, 5, 3, 3, 6, NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `boxcustomerproduct`
--

CREATE TABLE `boxcustomerproduct` (
  `bid` int(11) NOT NULL,
  `cu_name` varchar(255) DEFAULT NULL,
  `adet` int(11) NOT NULL,
  `fisNo` int(11) NOT NULL,
  `ptitle` varchar(255) DEFAULT NULL,
  `oprice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `customer`
--

CREATE TABLE `customer` (
  `cu_id` int(11) NOT NULL,
  `cu_address` varchar(500) DEFAULT NULL,
  `cu_code` bigint(20) NOT NULL,
  `cu_company_title` varchar(255) DEFAULT NULL,
  `cu_email` varchar(500) DEFAULT NULL,
  `cu_mobile` varchar(255) DEFAULT NULL,
  `cu_name` varchar(255) DEFAULT NULL,
  `cu_password` varchar(32) DEFAULT NULL,
  `cu_phone` varchar(255) DEFAULT NULL,
  `cu_status` int(11) NOT NULL,
  `cu_surname` varchar(255) DEFAULT NULL,
  `cu_tax_administration` varchar(255) DEFAULT NULL,
  `cu_tax_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `customer`
--

INSERT INTO `customer` (`cu_id`, `cu_address`, `cu_code`, `cu_company_title`, `cu_email`, `cu_mobile`, `cu_name`, `cu_password`, `cu_phone`, `cu_status`, `cu_surname`, `cu_tax_administration`, `cu_tax_number`) VALUES
(1, '', 678916578, 'Ali  A.Ş', 'ali@gmail.com', '258258258', 'Ali', '', '', 1, 'Bilmem', '', 123123123),
(2, '', 679741202, '', 'veli@mail.com', '6363525211', 'Veli', '', '', 2, 'Can', '', 951951951),
(3, '', 701600047, '', 'serkan@mail.com', '97461331', 'Serkan', '', '', 2, 'Kaz', '', 123147159),
(4, '', 932613677, '', '', '1111111111', 'Sahsanem', '', '', 2, 'Demirel', '', 858585);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cu_orders`
--

CREATE TABLE `cu_orders` (
  `oid` int(11) NOT NULL,
  `b_adet` int(11) NOT NULL,
  `b_bid` int(11) NOT NULL,
  `b_cu_name` varchar(255) DEFAULT NULL,
  `b_fisNo` int(11) NOT NULL,
  `b_fiyat` int(11) NOT NULL,
  `b_urun` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cu_orders_boxcustomerproduct`
--

CREATE TABLE `cu_orders_boxcustomerproduct` (
  `Cu_Orders_oid` int(11) NOT NULL,
  `boxCustomerProduct_bid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `order_boxcustomerproduct`
--

CREATE TABLE `order_boxcustomerproduct` (
  `Order_oid` int(11) NOT NULL,
  `boxCustomerProduct_bid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `payin`
--

CREATE TABLE `payin` (
  `payin_id` int(11) NOT NULL,
  `mu_fisno` int(11) NOT NULL,
  `mu_no` int(11) NOT NULL,
  `payin_date` datetime DEFAULT NULL,
  `payin_payment_detail` varchar(255) DEFAULT NULL,
  `payin_payment_total` int(11) NOT NULL,
  `customer_cu_id` int(11) DEFAULT NULL,
  `product_pid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `payout`
--

CREATE TABLE `payout` (
  `payout_id` int(11) NOT NULL,
  `payment_title` varchar(255) DEFAULT NULL,
  `payment_type` int(11) NOT NULL,
  `payout_date` datetime DEFAULT NULL,
  `payout_payment_detail` varchar(255) DEFAULT NULL,
  `payout_payment_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `payout`
--

INSERT INTO `payout` (`payout_id`, `payment_title`, `payment_type`, `payout_date`, `payout_payment_detail`, `payout_payment_total`) VALUES
(1, 'Su Ödeme', 1, '2021-09-02 20:28:40', 'Ödendi', 222),
(3, 'TV Ödeme', 1, '2021-09-01 17:28:54', 'Ödendi', 100),
(4, 'Ayakkabı Ödeme', 2, NULL, 'Ödendi', 350),
(5, 'Masa Ödeme', 2, NULL, 'Ödendi', 600),
(6, 'TV Ödeme', 3, NULL, 'Ödendi', 800),
(7, 'Su Ödeme', 1, NULL, 'Ödendi', 1),
(8, 'Su Ödeme', 1, NULL, 'Ödendi', 1),
(9, 'Ayakkabı Ödeme', 2, NULL, 'Ödendi', 100),
(10, 'Su Ödeme', 2, NULL, 'Ödendi', 25),
(11, 'TV Ödeme', 2, NULL, 'Ödendi', 75);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products`
--

CREATE TABLE `products` (
  `pid` int(11) NOT NULL,
  `aprice` int(11) NOT NULL,
  `oprice` int(11) NOT NULL,
  `pcode` int(11) NOT NULL,
  `pdetail` varchar(11) NOT NULL,
  `psection` int(11) NOT NULL,
  `psize` int(11) NOT NULL,
  `ptax` int(11) NOT NULL,
  `ptitle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `products`
--

INSERT INTO `products` (`pid`, `aprice`, `oprice`, `pcode`, `pdetail`, `psection`, `psize`, `ptax`, `ptitle`) VALUES
(2, 1, 2, 100516124, 'Erikli', 4, 1000, 1, 'Su'),
(3, 100, 200, 179071164, 'Kare', 0, 1000, 2, 'Masa'),
(4, 1000, 2500, 192585998, 'LCD Ekran', 0, 1500, 3, 'TV'),
(5, 5000, 10000, 246704031, 'ASUS', 0, 200, 2, 'Bilgisayar'),
(7, 1500, 2500, 321456987, 'A++', 0, 500, 3, 'Buzdolabı');

-- --------------------------------------------------------

--
-- Görünüm yapısı durumu `view_productlimit`
-- (Asıl görünüm için aşağıya bakın)
--
CREATE TABLE `view_productlimit` (
`pid` int(11)
,`pcode` int(11)
,`ptitle` varchar(255)
,`aprice` int(11)
);

-- --------------------------------------------------------

--
-- Görünüm yapısı `view_productlimit`
--
DROP TABLE IF EXISTS `view_productlimit`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_productlimit`  AS SELECT `products`.`pid` AS `pid`, `products`.`pcode` AS `pcode`, `products`.`ptitle` AS `ptitle`, `products`.`aprice` AS `aprice` FROM `products` WHERE `products`.`psize` > 0 ORDER BY `products`.`pid` DESC LIMIT 0, 5 ;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`aid`);

--
-- Tablo için indeksler `boxaction`
--
ALTER TABLE `boxaction`
  ADD PRIMARY KEY (`bid`),
  ADD KEY `FK1d88p8eiub1i0f9p1efyubnal` (`customer_cu_id`),
  ADD KEY `FKb3y5a7j3h54whdqxsgn3l2ry7` (`products_pid`);

--
-- Tablo için indeksler `boxcustomerproduct`
--
ALTER TABLE `boxcustomerproduct`
  ADD PRIMARY KEY (`bid`);

--
-- Tablo için indeksler `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cu_id`);

--
-- Tablo için indeksler `cu_orders`
--
ALTER TABLE `cu_orders`
  ADD PRIMARY KEY (`oid`);

--
-- Tablo için indeksler `cu_orders_boxcustomerproduct`
--
ALTER TABLE `cu_orders_boxcustomerproduct`
  ADD UNIQUE KEY `UK_4fbln5b7b5g5mrbdx56xopnh6` (`boxCustomerProduct_bid`),
  ADD KEY `FKjv2d425q5vu43m487m7yv26dg` (`Cu_Orders_oid`);

--
-- Tablo için indeksler `order_boxcustomerproduct`
--
ALTER TABLE `order_boxcustomerproduct`
  ADD PRIMARY KEY (`Order_oid`,`boxCustomerProduct_bid`),
  ADD UNIQUE KEY `UK_3yvaj0g0ytuc3kuwo5u5ehnua` (`boxCustomerProduct_bid`);

--
-- Tablo için indeksler `payin`
--
ALTER TABLE `payin`
  ADD PRIMARY KEY (`payin_id`),
  ADD KEY `FK5qg3e3ki9j05s1biym5muhep0` (`customer_cu_id`),
  ADD KEY `FKjtjftkh601kr18veljv5odrcq` (`product_pid`);

--
-- Tablo için indeksler `payout`
--
ALTER TABLE `payout`
  ADD PRIMARY KEY (`payout_id`);

--
-- Tablo için indeksler `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`pid`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `admin`
--
ALTER TABLE `admin`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `boxaction`
--
ALTER TABLE `boxaction`
  MODIFY `bid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Tablo için AUTO_INCREMENT değeri `customer`
--
ALTER TABLE `customer`
  MODIFY `cu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `cu_orders`
--
ALTER TABLE `cu_orders`
  MODIFY `oid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `payin`
--
ALTER TABLE `payin`
  MODIFY `payin_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `payout`
--
ALTER TABLE `payout`
  MODIFY `payout_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Tablo için AUTO_INCREMENT değeri `products`
--
ALTER TABLE `products`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `boxaction`
--
ALTER TABLE `boxaction`
  ADD CONSTRAINT `FK1d88p8eiub1i0f9p1efyubnal` FOREIGN KEY (`customer_cu_id`) REFERENCES `customer` (`cu_id`),
  ADD CONSTRAINT `FKb3y5a7j3h54whdqxsgn3l2ry7` FOREIGN KEY (`products_pid`) REFERENCES `products` (`pid`);

--
-- Tablo kısıtlamaları `cu_orders_boxcustomerproduct`
--
ALTER TABLE `cu_orders_boxcustomerproduct`
  ADD CONSTRAINT `FKjv2d425q5vu43m487m7yv26dg` FOREIGN KEY (`Cu_Orders_oid`) REFERENCES `cu_orders` (`oid`),
  ADD CONSTRAINT `FKrnvliem3ly70lg63er93le9oc` FOREIGN KEY (`boxCustomerProduct_bid`) REFERENCES `boxcustomerproduct` (`bid`);

--
-- Tablo kısıtlamaları `order_boxcustomerproduct`
--
ALTER TABLE `order_boxcustomerproduct`
  ADD CONSTRAINT `FK3biebnp0fxtp59xpc5yefnyd0` FOREIGN KEY (`boxCustomerProduct_bid`) REFERENCES `boxcustomerproduct` (`bid`);

--
-- Tablo kısıtlamaları `payin`
--
ALTER TABLE `payin`
  ADD CONSTRAINT `FK5qg3e3ki9j05s1biym5muhep0` FOREIGN KEY (`customer_cu_id`) REFERENCES `customer` (`cu_id`),
  ADD CONSTRAINT `FKjtjftkh601kr18veljv5odrcq` FOREIGN KEY (`product_pid`) REFERENCES `products` (`pid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
