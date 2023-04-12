CREATE DATABASE IF NOT EXISTS mertcan_ekren_case;

USE mertcan_ekren_case;

DROP TABLE IF EXISTS campaigns;

CREATE TABLE `campaigns` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '0',
  `discount_type` varchar(200) NOT NULL DEFAULT '0',
  `discount_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `minimum_campaign_amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

INSERT INTO campaigns SET `id`='1', `name`='100 TL Üstü Yüzde 5 İndirim', `discount_type`='percentage', `discount_amount`='5.00', `minimum_campaign_amount`='100.00';
INSERT INTO campaigns SET `id`='2', `name`='Sabahattin Ali\'nin Roman kitaplarında 2 üründen 1 tanesi bedava', `discount_type`='free_item', `discount_amount`='0.00', `minimum_campaign_amount`='';

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
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

INSERT INTO order_products SET `id`='16', `order_id`='24', `product_id`='1', `quantity`='5', `list_price`='48.75', `total_price`='243.75';
INSERT INTO order_products SET `id`='15', `order_id`='23', `product_id`='1', `quantity`='2', `list_price`='48.75', `total_price`='97.50';
INSERT INTO order_products SET `id`='14', `order_id`='22', `product_id`='1', `quantity`='2', `list_price`='48.75', `total_price`='97.50';
INSERT INTO order_products SET `id`='13', `order_id`='21', `product_id`='1', `quantity`='2', `list_price`='48.75', `total_price`='97.50';
INSERT INTO order_products SET `id`='12', `order_id`='20', `product_id`='1', `quantity`='2', `list_price`='48.75', `total_price`='97.50';
INSERT INTO order_products SET `id`='11', `order_id`='19', `product_id`='2', `quantity`='5', `list_price`='90.30', `total_price`='451.50';
INSERT INTO order_products SET `id`='10', `order_id`='19', `product_id`='1', `quantity`='2', `list_price`='48.75', `total_price`='97.50';
INSERT INTO order_products SET `id`='9', `order_id`='18', `product_id`='1', `quantity`='3', `list_price`='48.75', `total_price`='146.25';

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
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

INSERT INTO orders SET `id`='20', `customer_id`='0', `total_price`='97.50', `discounted_price`='0.00', `without_discounted_price`='0.00', `campaign_id`='0', `shipping_cost`='75.00', `createtime`='1681287815';
INSERT INTO orders SET `id`='19', `customer_id`='0', `total_price`='521.55', `discounted_price`='521.55', `without_discounted_price`='549.00', `campaign_id`='1', `shipping_cost`='0.00', `createtime`='1681287745';
INSERT INTO orders SET `id`='18', `customer_id`='0', `total_price`='138.94', `discounted_price`='138.94', `without_discounted_price`='146.25', `campaign_id`='1', `shipping_cost`='75.00', `createtime`='1681246069';
INSERT INTO orders SET `id`='21', `customer_id`='1', `total_price`='97.50', `discounted_price`='0.00', `without_discounted_price`='0.00', `campaign_id`='0', `shipping_cost`='75.00', `createtime`='1681293258';
INSERT INTO orders SET `id`='22', `customer_id`='2', `total_price`='97.50', `discounted_price`='0.00', `without_discounted_price`='0.00', `campaign_id`='0', `shipping_cost`='75.00', `createtime`='1681293271';
INSERT INTO orders SET `id`='23', `customer_id`='2', `total_price`='97.50', `discounted_price`='0.00', `without_discounted_price`='0.00', `campaign_id`='0', `shipping_cost`='75.00', `createtime`='1681293277';
INSERT INTO orders SET `id`='24', `customer_id`='2', `total_price`='231.56', `discounted_price`='231.56', `without_discounted_price`='243.75', `campaign_id`='1', `shipping_cost`='0.00', `createtime`='1681293320';

DROP TABLE IF EXISTS products;

CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `title` varchar(200) NOT NULL,
  `author` varchar(200) NOT NULL,
  `list_price` decimal(10,2) NOT NULL,
  `stock_quantity` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;

INSERT INTO products SET `id`='1', `category_id`='1', `title`='İnce Memed', `author`='Yaşar Kemal', `list_price`='48.75', `stock_quantity`='10';
INSERT INTO products SET `id`='2', `category_id`='1', `title`='Tutunamayanlar', `author`='Oğuz Atay', `list_price`='90.30', `stock_quantity`='20';
INSERT INTO products SET `id`='3', `category_id`='1', `title`='Kürk Mantolu Madonna', `author`='Sabahattin Ali', `list_price`='9.10', `stock_quantity`='4';
INSERT INTO products SET `id`='4', `category_id`='1', `title`='Fareler ve İnsanlar', `author`='John Steinback', `list_price`='35.75', `stock_quantity`='8';
INSERT INTO products SET `id`='5', `category_id`='1', `title`='Şeker Portakalı', `author`='Jose Mauro De Vasconcelos', `list_price`='33.00', `stock_quantity`='1';
INSERT INTO products SET `id`='6', `category_id`='2', `title`='Sen Yola Çık Yol Sana Görünür', `author`='Hakan Mengüç', `list_price`='28.50', `stock_quantity`='7';
INSERT INTO products SET `id`='7', `category_id`='3', `title`='Kara Delikler', `author`='Stephen Hawking', `list_price`='39.00', `stock_quantity`='2';
INSERT INTO products SET `id`='8', `category_id`='4', `title`='Allah De Ötesini Bırak', `author`='Uğur Koşar', `list_price`='39.60', `stock_quantity`='18';
INSERT INTO products SET `id`='9', `category_id`='4', `title`='Aşk 5 Vakittir', `author`='Mehmet Yıldız', `list_price`='42.00', `stock_quantity`='9';
INSERT INTO products SET `id`='10', `category_id`='5', `title`='Benim Zürafam Uçabilir', `author`='Mert Arık', `list_price`='27.30', `stock_quantity`='12';
INSERT INTO products SET `id`='11', `category_id`='1', `title`='Kuyucaklı Yusuf', `author`='Sabahattin Ali', `list_price`='10.40', `stock_quantity`='2';
INSERT INTO products SET `id`='12', `category_id`='6', `title`='Kamyon - Seçme Öyküler', `author`='Sabahattin Ali', `list_price`='9.75', `stock_quantity`='9';
INSERT INTO products SET `id`='13', `category_id`='7', `title`='Kendime Düşünceler', `author`='Marcus Aurelius', `list_price`='14.40', `stock_quantity`='1';
INSERT INTO products SET `id`='14', `category_id`='7', `title`='Denemeler - Hasan Ali Yücel Klasikleri', `author`='Michel de Montaigne', `list_price`='24.00', `stock_quantity`='4';
INSERT INTO products SET `id`='15', `category_id`='1', `title`='Animal Farm', `author`='George Orwell', `list_price`='17.50', `stock_quantity`='1';
INSERT INTO products SET `id`='16', `category_id`='1', `title`='Dokuzuncu Hariciye Koğuşu', `author`='Peyami Safa', `list_price`='18.50', `stock_quantity`='0';

