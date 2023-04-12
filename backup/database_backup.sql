CREATE DATABASE IF NOT EXISTS mertcan_ekren_case;

USE mertcan_ekren_case;

DROP TABLE IF EXISTS authors;

CREATE TABLE `authors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

INSERT INTO authors SET `id`='1', `author`='Yaşar Kemal';
INSERT INTO authors SET `id`='2', `author`='Oğuz Atay';
INSERT INTO authors SET `id`='3', `author`='Sabahattin Ali';
INSERT INTO authors SET `id`='4', `author`='John Steinback';
INSERT INTO authors SET `id`='5', `author`='Jose Mauro De Vasconcelos';
INSERT INTO authors SET `id`='6', `author`='Hakan Mengüç';
INSERT INTO authors SET `id`='7', `author`='Stephen Hawking';
INSERT INTO authors SET `id`='8', `author`='Uğur Koşar';
INSERT INTO authors SET `id`='9', `author`='Mehmet Yıldız';
INSERT INTO authors SET `id`='10', `author`='Mert Arık';
INSERT INTO authors SET `id`='11', `author`='Marcus Aurelius';
INSERT INTO authors SET `id`='12', `author`='Michel de Montaigne';
INSERT INTO authors SET `id`='13', `author`='George Orwell';
INSERT INTO authors SET `id`='14', `author`='Peyami Safa';

DROP TABLE IF EXISTS books;

CREATE TABLE `books` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `author_id` int NOT NULL DEFAULT '0',
  `title` varchar(200) NOT NULL,
  `list_price` decimal(10,2) NOT NULL,
  `stock_quantity` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;

INSERT INTO books SET `id`='1', `category_id`='1', `author_id`='1', `title`='İnce Memed', `list_price`='48.75', `stock_quantity`='910';
INSERT INTO books SET `id`='2', `category_id`='1', `author_id`='2', `title`='Tutunamayanlar', `list_price`='90.30', `stock_quantity`='20';
INSERT INTO books SET `id`='3', `category_id`='1', `author_id`='3', `title`='Kürk Mantolu Madonna', `list_price`='9.10', `stock_quantity`='4';
INSERT INTO books SET `id`='4', `category_id`='1', `author_id`='4', `title`='Fareler ve İnsanlar', `list_price`='35.75', `stock_quantity`='8';
INSERT INTO books SET `id`='5', `category_id`='1', `author_id`='5', `title`='Şeker Portakalı', `list_price`='33.00', `stock_quantity`='1';
INSERT INTO books SET `id`='6', `category_id`='2', `author_id`='6', `title`='Sen Yola Çık Yol Sana Görünür', `list_price`='28.50', `stock_quantity`='7';
INSERT INTO books SET `id`='7', `category_id`='3', `author_id`='7', `title`='Kara Delikler', `list_price`='39.00', `stock_quantity`='2';
INSERT INTO books SET `id`='8', `category_id`='4', `author_id`='8', `title`='Allah De Ötesini Bırak', `list_price`='39.60', `stock_quantity`='18';
INSERT INTO books SET `id`='9', `category_id`='4', `author_id`='9', `title`='Aşk 5 Vakittir', `list_price`='42.00', `stock_quantity`='9';
INSERT INTO books SET `id`='10', `category_id`='5', `author_id`='10', `title`='Benim Zürafam Uçabilir', `list_price`='27.30', `stock_quantity`='12';
INSERT INTO books SET `id`='11', `category_id`='1', `author_id`='3', `title`='Kuyucaklı Yusuf', `list_price`='10.40', `stock_quantity`='2';
INSERT INTO books SET `id`='12', `category_id`='6', `author_id`='3', `title`='Kamyon - Seçme Öyküler', `list_price`='9.75', `stock_quantity`='9';
INSERT INTO books SET `id`='13', `category_id`='7', `author_id`='11', `title`='Kendime Düşünceler', `list_price`='14.40', `stock_quantity`='1';
INSERT INTO books SET `id`='14', `category_id`='7', `author_id`='12', `title`='Denemeler - Hasan Ali Yücel Klasikleri', `list_price`='24.00', `stock_quantity`='4';
INSERT INTO books SET `id`='15', `category_id`='1', `author_id`='13', `title`='Animal Farm', `list_price`='17.50', `stock_quantity`='1';
INSERT INTO books SET `id`='16', `category_id`='1', `author_id`='14', `title`='Dokuzuncu Hariciye Koğuşu', `list_price`='18.50', `stock_quantity`='0';

DROP TABLE IF EXISTS campaigns;

CREATE TABLE `campaigns` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '0',
  `discount_type` varchar(200) NOT NULL DEFAULT '0',
  `discount_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `minimum_campaign_amount` decimal(10,2) DEFAULT NULL,
  `campaign_author` varchar(50) DEFAULT NULL,
  `campaign_minimum_pieces` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

INSERT INTO campaigns SET `id`='1', `name`='100 TL Üstü Yüzde 5 İndirim', `discount_type`='percentage', `discount_amount`='5.00', `minimum_campaign_amount`='100.00', `campaign_author`='', `campaign_minimum_pieces`='';
INSERT INTO campaigns SET `id`='2', `name`='Sabahattin Ali\'nin Roman kitaplarında 2 üründen 1 tanesi bedava', `discount_type`='free_item', `discount_amount`='0.00', `minimum_campaign_amount`='', `campaign_author`='3', `campaign_minimum_pieces`='2';

DROP TABLE IF EXISTS categories;

CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `category_title` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

INSERT INTO categories SET `id`='1', `category_id`='1', `category_title`='Roman';
INSERT INTO categories SET `id`='2', `category_id`='2', `category_title`='Kişisel Gelişim';
INSERT INTO categories SET `id`='3', `category_id`='3', `category_title`='Bilim';
INSERT INTO categories SET `id`='4', `category_id`='4', `category_title`='Din Tasavvuf';
INSERT INTO categories SET `id`='5', `category_id`='4', `category_title`='Çocuk ve Gençlik';
INSERT INTO categories SET `id`='6', `category_id`='5', `category_title`='Öykü';
INSERT INTO categories SET `id`='7', `category_id`='6', `category_title`='Felsefe';

DROP TABLE IF EXISTS customers;

CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `customer_email` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `customer_address` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `createtime` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

INSERT INTO customers SET `id`='1', `customer_name`='Mertcan Ekren', `customer_email`='mertcanekren@gmail.com', `customer_address`='Bursa', `createtime`='1681293224';
INSERT INTO customers SET `id`='2', `customer_name`='Mertcan Ekren-2', `customer_email`='mertcanekren@windowslive.com', `customer_address`='Bursa', `createtime`='1681293271';

DROP TABLE IF EXISTS order_products;

CREATE TABLE `order_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL DEFAULT '0',
  `product_id` int NOT NULL DEFAULT '0',
  `quantity` int NOT NULL DEFAULT '0',
  `list_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

INSERT INTO order_products SET `id`='1', `order_id`='1', `product_id`='3', `quantity`='1', `list_price`='9.10', `total_price`='9.10';
INSERT INTO order_products SET `id`='2', `order_id`='1', `product_id`='12', `quantity`='1', `list_price`='9.75', `total_price`='0.00';
INSERT INTO order_products SET `id`='3', `order_id`='1', `product_id`='11', `quantity`='1', `list_price`='10.40', `total_price`='10.40';
INSERT INTO order_products SET `id`='4', `order_id`='2', `product_id`='3', `quantity`='1', `list_price`='9.10', `total_price`='9.10';
INSERT INTO order_products SET `id`='5', `order_id`='2', `product_id`='12', `quantity`='1', `list_price`='9.75', `total_price`='0.00';
INSERT INTO order_products SET `id`='6', `order_id`='2', `product_id`='11', `quantity`='1', `list_price`='10.40', `total_price`='10.40';
INSERT INTO order_products SET `id`='7', `order_id`='3', `product_id`='3', `quantity`='1', `list_price`='9.10', `total_price`='9.10';
INSERT INTO order_products SET `id`='8', `order_id`='3', `product_id`='12', `quantity`='1', `list_price`='9.75', `total_price`='0.00';
INSERT INTO order_products SET `id`='9', `order_id`='3', `product_id`='11', `quantity`='1', `list_price`='10.40', `total_price`='10.40';
INSERT INTO order_products SET `id`='10', `order_id`='4', `product_id`='3', `quantity`='1', `list_price`='9.10', `total_price`='9.10';
INSERT INTO order_products SET `id`='11', `order_id`='4', `product_id`='12', `quantity`='1', `list_price`='9.75', `total_price`='0.00';
INSERT INTO order_products SET `id`='12', `order_id`='4', `product_id`='11', `quantity`='1', `list_price`='10.40', `total_price`='10.40';
INSERT INTO order_products SET `id`='13', `order_id`='5', `product_id`='3', `quantity`='1', `list_price`='9.10', `total_price`='9.10';
INSERT INTO order_products SET `id`='14', `order_id`='5', `product_id`='12', `quantity`='1', `list_price`='9.75', `total_price`='0.00';
INSERT INTO order_products SET `id`='15', `order_id`='5', `product_id`='11', `quantity`='1', `list_price`='10.40', `total_price`='10.40';
INSERT INTO order_products SET `id`='16', `order_id`='6', `product_id`='3', `quantity`='1', `list_price`='9.10', `total_price`='9.10';
INSERT INTO order_products SET `id`='17', `order_id`='6', `product_id`='12', `quantity`='8', `list_price`='9.75', `total_price`='0.00';
INSERT INTO order_products SET `id`='18', `order_id`='6', `product_id`='11', `quantity`='1', `list_price`='10.40', `total_price`='10.40';
INSERT INTO order_products SET `id`='19', `order_id`='7', `product_id`='3', `quantity`='1', `list_price`='9.10', `total_price`='9.10';
INSERT INTO order_products SET `id`='20', `order_id`='7', `product_id`='12', `quantity`='8', `list_price`='9.75', `total_price`='0.00';
INSERT INTO order_products SET `id`='21', `order_id`='7', `product_id`='11', `quantity`='2', `list_price`='10.40', `total_price`='20.80';
INSERT INTO order_products SET `id`='22', `order_id`='8', `product_id`='3', `quantity`='1', `list_price`='9.10', `total_price`='9.10';
INSERT INTO order_products SET `id`='23', `order_id`='8', `product_id`='12', `quantity`='8', `list_price`='9.75', `total_price`='0.00';
INSERT INTO order_products SET `id`='24', `order_id`='8', `product_id`='11', `quantity`='2', `list_price`='10.40', `total_price`='20.80';
INSERT INTO order_products SET `id`='25', `order_id`='9', `product_id`='3', `quantity`='1', `list_price`='9.10', `total_price`='9.10';
INSERT INTO order_products SET `id`='26', `order_id`='9', `product_id`='12', `quantity`='8', `list_price`='9.75', `total_price`='0.00';
INSERT INTO order_products SET `id`='27', `order_id`='9', `product_id`='11', `quantity`='2', `list_price`='10.40', `total_price`='20.80';
INSERT INTO order_products SET `id`='28', `order_id`='10', `product_id`='3', `quantity`='1', `list_price`='9.10', `total_price`='9.10';
INSERT INTO order_products SET `id`='29', `order_id`='10', `product_id`='12', `quantity`='1', `list_price`='9.75', `total_price`='0.00';
INSERT INTO order_products SET `id`='30', `order_id`='10', `product_id`='11', `quantity`='1', `list_price`='10.40', `total_price`='10.40';
INSERT INTO order_products SET `id`='31', `order_id`='11', `product_id`='3', `quantity`='1', `list_price`='9.10', `total_price`='9.10';
INSERT INTO order_products SET `id`='32', `order_id`='11', `product_id`='12', `quantity`='1', `list_price`='9.75', `total_price`='0.00';
INSERT INTO order_products SET `id`='33', `order_id`='11', `product_id`='11', `quantity`='1', `list_price`='10.40', `total_price`='10.40';
INSERT INTO order_products SET `id`='34', `order_id`='12', `product_id`='3', `quantity`='1', `list_price`='9.10', `total_price`='9.10';
INSERT INTO order_products SET `id`='35', `order_id`='12', `product_id`='12', `quantity`='8', `list_price`='9.75', `total_price`='0.00';
INSERT INTO order_products SET `id`='36', `order_id`='12', `product_id`='11', `quantity`='2', `list_price`='10.40', `total_price`='20.80';
INSERT INTO order_products SET `id`='37', `order_id`='13', `product_id`='3', `quantity`='1', `list_price`='9.10', `total_price`='9.10';
INSERT INTO order_products SET `id`='38', `order_id`='13', `product_id`='12', `quantity`='8', `list_price`='9.75', `total_price`='0.00';
INSERT INTO order_products SET `id`='39', `order_id`='13', `product_id`='11', `quantity`='2', `list_price`='10.40', `total_price`='20.80';
INSERT INTO order_products SET `id`='40', `order_id`='14', `product_id`='3', `quantity`='1', `list_price`='9.10', `total_price`='9.10';
INSERT INTO order_products SET `id`='41', `order_id`='14', `product_id`='12', `quantity`='8', `list_price`='9.75', `total_price`='0.00';
INSERT INTO order_products SET `id`='42', `order_id`='14', `product_id`='11', `quantity`='2', `list_price`='10.40', `total_price`='20.80';
INSERT INTO order_products SET `id`='43', `order_id`='15', `product_id`='3', `quantity`='1', `list_price`='9.10', `total_price`='9.10';
INSERT INTO order_products SET `id`='44', `order_id`='15', `product_id`='11', `quantity`='1', `list_price`='10.40', `total_price`='0.00';
INSERT INTO order_products SET `id`='45', `order_id`='16', `product_id`='3', `quantity`='1', `list_price`='9.10', `total_price`='9.10';
INSERT INTO order_products SET `id`='46', `order_id`='16', `product_id`='13', `quantity`='1', `list_price`='14.40', `total_price`='14.40';
INSERT INTO order_products SET `id`='47', `order_id`='17', `product_id`='3', `quantity`='1', `list_price`='9.10', `total_price`='9.10';
INSERT INTO order_products SET `id`='48', `order_id`='17', `product_id`='13', `quantity`='1', `list_price`='14.40', `total_price`='14.40';
INSERT INTO order_products SET `id`='49', `order_id`='18', `product_id`='3', `quantity`='1', `list_price`='9.10', `total_price`='9.10';
INSERT INTO order_products SET `id`='50', `order_id`='18', `product_id`='13', `quantity`='1', `list_price`='14.40', `total_price`='14.40';
INSERT INTO order_products SET `id`='51', `order_id`='19', `product_id`='3', `quantity`='1', `list_price`='9.10', `total_price`='9.10';
INSERT INTO order_products SET `id`='52', `order_id`='19', `product_id`='13', `quantity`='1', `list_price`='14.40', `total_price`='14.40';
INSERT INTO order_products SET `id`='53', `order_id`='20', `product_id`='3', `quantity`='1', `list_price`='9.10', `total_price`='9.10';
INSERT INTO order_products SET `id`='54', `order_id`='20', `product_id`='13', `quantity`='1', `list_price`='14.40', `total_price`='14.40';

DROP TABLE IF EXISTS orders;

CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL DEFAULT '0',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `discounted_price` decimal(10,2) DEFAULT NULL,
  `without_discounted_price` decimal(10,2) DEFAULT NULL,
  `campaign_id` int DEFAULT NULL,
  `shipping_cost` decimal(10,2) NOT NULL DEFAULT '0.00',
  `createtime` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

INSERT INTO orders SET `id`='1', `customer_id`='2', `total_price`='29.25', `discounted_price`='0.00', `without_discounted_price`='0.00', `campaign_id`='0', `shipping_cost`='75.00', `createtime`='1681310304';
INSERT INTO orders SET `id`='2', `customer_id`='2', `total_price`='29.25', `discounted_price`='0.00', `without_discounted_price`='0.00', `campaign_id`='0', `shipping_cost`='75.00', `createtime`='1681310454';
INSERT INTO orders SET `id`='3', `customer_id`='2', `total_price`='29.25', `discounted_price`='0.00', `without_discounted_price`='0.00', `campaign_id`='0', `shipping_cost`='75.00', `createtime`='1681310676';
INSERT INTO orders SET `id`='4', `customer_id`='2', `total_price`='29.25', `discounted_price`='0.00', `without_discounted_price`='0.00', `campaign_id`='0', `shipping_cost`='75.00', `createtime`='1681310694';
INSERT INTO orders SET `id`='5', `customer_id`='2', `total_price`='29.25', `discounted_price`='0.00', `without_discounted_price`='0.00', `campaign_id`='2', `shipping_cost`='75.00', `createtime`='1681310782';
INSERT INTO orders SET `id`='6', `customer_id`='2', `total_price`='97.50', `discounted_price`='0.00', `without_discounted_price`='0.00', `campaign_id`='2', `shipping_cost`='75.00', `createtime`='1681310804';
INSERT INTO orders SET `id`='7', `customer_id`='2', `total_price`='102.51', `discounted_price`='102.51', `without_discounted_price`='107.90', `campaign_id`='1', `shipping_cost`='75.00', `createtime`='1681310818';
INSERT INTO orders SET `id`='8', `customer_id`='2', `total_price`='102.51', `discounted_price`='102.51', `without_discounted_price`='107.90', `campaign_id`='1', `shipping_cost`='75.00', `createtime`='1681310837';
INSERT INTO orders SET `id`='9', `customer_id`='2', `total_price`='102.51', `discounted_price`='102.51', `without_discounted_price`='107.90', `campaign_id`='1', `shipping_cost`='75.00', `createtime`='1681310855';
INSERT INTO orders SET `id`='10', `customer_id`='2', `total_price`='29.25', `discounted_price`='0.00', `without_discounted_price`='0.00', `campaign_id`='2', `shipping_cost`='75.00', `createtime`='1681310859';
INSERT INTO orders SET `id`='11', `customer_id`='2', `total_price`='29.25', `discounted_price`='0.00', `without_discounted_price`='0.00', `campaign_id`='2', `shipping_cost`='75.00', `createtime`='1681310862';
INSERT INTO orders SET `id`='12', `customer_id`='2', `total_price`='102.51', `discounted_price`='102.51', `without_discounted_price`='107.90', `campaign_id`='1', `shipping_cost`='75.00', `createtime`='1681310872';
INSERT INTO orders SET `id`='13', `customer_id`='2', `total_price`='107.90', `discounted_price`='0.00', `without_discounted_price`='0.00', `campaign_id`='2', `shipping_cost`='75.00', `createtime`='1681310977';
INSERT INTO orders SET `id`='14', `customer_id`='2', `total_price`='107.90', `discounted_price`='0.00', `without_discounted_price`='0.00', `campaign_id`='2', `shipping_cost`='75.00', `createtime`='1681311030';
INSERT INTO orders SET `id`='15', `customer_id`='2', `total_price`='19.50', `discounted_price`='0.00', `without_discounted_price`='0.00', `campaign_id`='2', `shipping_cost`='75.00', `createtime`='1681311061';
INSERT INTO orders SET `id`='16', `customer_id`='2', `total_price`='23.50', `discounted_price`='0.00', `without_discounted_price`='0.00', `campaign_id`='2', `shipping_cost`='75.00', `createtime`='1681311069';
INSERT INTO orders SET `id`='17', `customer_id`='2', `total_price`='23.50', `discounted_price`='0.00', `without_discounted_price`='0.00', `campaign_id`='2', `shipping_cost`='75.00', `createtime`='1681311079';
INSERT INTO orders SET `id`='18', `customer_id`='2', `total_price`='23.50', `discounted_price`='0.00', `without_discounted_price`='0.00', `campaign_id`='2', `shipping_cost`='75.00', `createtime`='1681311129';
INSERT INTO orders SET `id`='19', `customer_id`='2', `total_price`='23.50', `discounted_price`='0.00', `without_discounted_price`='0.00', `campaign_id`='2', `shipping_cost`='75.00', `createtime`='1681311182';
INSERT INTO orders SET `id`='20', `customer_id`='2', `total_price`='23.50', `discounted_price`='0.00', `without_discounted_price`='0.00', `campaign_id`='2', `shipping_cost`='75.00', `createtime`='1681311210';

