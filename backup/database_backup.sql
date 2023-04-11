CREATE DATABASE IF NOT EXISTS mertcan_ekren_case;

USE mertcan_ekren_case;

DROP TABLE IF EXISTS campaigns;

CREATE TABLE `campaigns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '0',
  `discount_type` varchar(200) NOT NULL DEFAULT '0',
  `discount_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `minimum_campaign_amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO campaigns SET `id`='1', `name`='100 TL Üstü Yüzde 5 İndirim', `discount_type`='percentage', `discount_amount`='5.00', `minimum_campaign_amount`='100.00';

DROP TABLE IF EXISTS order_products;

CREATE TABLE `order_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `list_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO order_products SET `id`='1', `order_id`='10', `product_id`='4', `quantity`='2', `list_price`='35.75', `total_price`='71.50';
INSERT INTO order_products SET `id`='2', `order_id`='11', `product_id`='1', `quantity`='2', `list_price`='48.75', `total_price`='97.50';
INSERT INTO order_products SET `id`='3', `order_id`='12', `product_id`='1', `quantity`='3', `list_price`='48.75', `total_price`='146.25';
INSERT INTO order_products SET `id`='4', `order_id`='13', `product_id`='1', `quantity`='3', `list_price`='48.75', `total_price`='146.25';
INSERT INTO order_products SET `id`='5', `order_id`='14', `product_id`='1', `quantity`='3', `list_price`='48.75', `total_price`='146.25';
INSERT INTO order_products SET `id`='6', `order_id`='15', `product_id`='1', `quantity`='3', `list_price`='48.75', `total_price`='146.25';
INSERT INTO order_products SET `id`='7', `order_id`='16', `product_id`='1', `quantity`='3', `list_price`='48.75', `total_price`='146.25';
INSERT INTO order_products SET `id`='8', `order_id`='17', `product_id`='1', `quantity`='3', `list_price`='48.75', `total_price`='146.25';
INSERT INTO order_products SET `id`='9', `order_id`='18', `product_id`='1', `quantity`='3', `list_price`='48.75', `total_price`='146.25';

DROP TABLE IF EXISTS orders;

CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(200) NOT NULL DEFAULT '0',
  `customer_email` varchar(200) NOT NULL DEFAULT '0',
  `customer_address` text NOT NULL,
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `discounted_price` decimal(10,2) DEFAULT NULL,
  `without_discounted_price` decimal(10,2) DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `shipping_cost` decimal(10,2) NOT NULL DEFAULT '0.00',
  `createtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO orders SET `id`='1', `customer_name`='mertcan', `customer_email`='mertcanekren@gmail.com', `customer_address`='kükürtlü', `total_price`='115.70', `discounted_price`='', `without_discounted_price`='', `campaign_id`='', `shipping_cost`='75.00', `createtime`='1680869121';
INSERT INTO orders SET `id`='2', `customer_name`='mertcan', `customer_email`='mertcanekren@gmail.com', `customer_address`='kükürtlü', `total_price`='18.20', `discounted_price`='', `without_discounted_price`='', `campaign_id`='', `shipping_cost`='75.00', `createtime`='1680869774';
INSERT INTO orders SET `id`='3', `customer_name`='mertcan', `customer_email`='mertcanekren@gmail.com', `customer_address`='kükürtlü', `total_price`='18.20', `discounted_price`='', `without_discounted_price`='', `campaign_id`='', `shipping_cost`='75.00', `createtime`='1680869778';
INSERT INTO orders SET `id`='4', `customer_name`='mertcan', `customer_email`='mertcanekren@gmail.com', `customer_address`='kükürtlü', `total_price`='51.20', `discounted_price`='', `without_discounted_price`='', `campaign_id`='', `shipping_cost`='75.00', `createtime`='1680869987';
INSERT INTO orders SET `id`='5', `customer_name`='mertcan', `customer_email`='mertcanekren@gmail.com', `customer_address`='kükürtlü', `total_price`='51.20', `discounted_price`='', `without_discounted_price`='', `campaign_id`='', `shipping_cost`='75.00', `createtime`='1680870220';
INSERT INTO orders SET `id`='6', `customer_name`='mertcan', `customer_email`='mertcanekren@gmail.com', `customer_address`='kükürtlü', `total_price`='51.20', `discounted_price`='', `without_discounted_price`='', `campaign_id`='', `shipping_cost`='75.00', `createtime`='1680870370';
INSERT INTO orders SET `id`='7', `customer_name`='mertcan', `customer_email`='mertcanekren@gmail.com', `customer_address`='kükürtlü', `total_price`='51.20', `discounted_price`='', `without_discounted_price`='', `campaign_id`='', `shipping_cost`='75.00', `createtime`='1680870389';
INSERT INTO orders SET `id`='8', `customer_name`='mertcan', `customer_email`='mertcanekren@gmail.com', `customer_address`='kükürtlü', `total_price`='51.20', `discounted_price`='', `without_discounted_price`='', `campaign_id`='', `shipping_cost`='75.00', `createtime`='1680870401';
INSERT INTO orders SET `id`='9', `customer_name`='mertcan', `customer_email`='mertcanekren@gmail.com', `customer_address`='kükürtlü', `total_price`='51.20', `discounted_price`='', `without_discounted_price`='', `campaign_id`='', `shipping_cost`='75.00', `createtime`='1680870443';
INSERT INTO orders SET `id`='10', `customer_name`='mertcan', `customer_email`='mertcanekren@gmail.com', `customer_address`='kükürtlü', `total_price`='71.50', `discounted_price`='', `without_discounted_price`='', `campaign_id`='', `shipping_cost`='75.00', `createtime`='1680876474';
INSERT INTO orders SET `id`='11', `customer_name`='mertcan', `customer_email`='mertcanekren@gmail.com', `customer_address`='kükürtlü', `total_price`='97.50', `discounted_price`='', `without_discounted_price`='', `campaign_id`='', `shipping_cost`='75.00', `createtime`='1681243483';
INSERT INTO orders SET `id`='12', `customer_name`='mertcan', `customer_email`='mertcanekren@gmail.com', `customer_address`='kükürtlü', `total_price`='146.25', `discounted_price`='0.00', `without_discounted_price`='', `campaign_id`='0', `shipping_cost`='75.00', `createtime`='1681245678';
INSERT INTO orders SET `id`='13', `customer_name`='mertcan', `customer_email`='mertcanekren@gmail.com', `customer_address`='kükürtlü', `total_price`='146.25', `discounted_price`='1.00', `without_discounted_price`='', `campaign_id`='1', `shipping_cost`='75.00', `createtime`='1681245695';
INSERT INTO orders SET `id`='14', `customer_name`='mertcan', `customer_email`='mertcanekren@gmail.com', `customer_address`='kükürtlü', `total_price`='146.25', `discounted_price`='1.00', `without_discounted_price`='', `campaign_id`='1', `shipping_cost`='75.00', `createtime`='1681245723';
INSERT INTO orders SET `id`='15', `customer_name`='mertcan', `customer_email`='mertcanekren@gmail.com', `customer_address`='kükürtlü', `total_price`='146.25', `discounted_price`='1.00', `without_discounted_price`='', `campaign_id`='1', `shipping_cost`='75.00', `createtime`='1681245731';
INSERT INTO orders SET `id`='16', `customer_name`='mertcan', `customer_email`='mertcanekren@gmail.com', `customer_address`='kükürtlü', `total_price`='146.25', `discounted_price`='1.00', `without_discounted_price`='', `campaign_id`='1', `shipping_cost`='75.00', `createtime`='1681245841';
INSERT INTO orders SET `id`='17', `customer_name`='mertcan', `customer_email`='mertcanekren@gmail.com', `customer_address`='kükürtlü', `total_price`='146.25', `discounted_price`='138.94', `without_discounted_price`='', `campaign_id`='1', `shipping_cost`='75.00', `createtime`='1681245858';
INSERT INTO orders SET `id`='18', `customer_name`='mertcan', `customer_email`='mertcanekren@gmail.com', `customer_address`='kükürtlü', `total_price`='138.94', `discounted_price`='138.94', `without_discounted_price`='146.25', `campaign_id`='1', `shipping_cost`='75.00', `createtime`='1681246069';

DROP TABLE IF EXISTS products;

CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `category_id` int(11) NOT NULL,
  `category_title` varchar(200) NOT NULL,
  `author` varchar(200) NOT NULL,
  `list_price` decimal(10,2) NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

INSERT INTO products SET `id`='1', `title`='İnce Memed', `category_id`='1', `category_title`='Roman', `author`='Yaşar Kemal', `list_price`='48.75', `stock_quantity`='10';
INSERT INTO products SET `id`='2', `title`='Tutunamayanlar', `category_id`='1', `category_title`='Roman', `author`='Oğuz Atay', `list_price`='90.30', `stock_quantity`='20';
INSERT INTO products SET `id`='3', `title`='Kürk Mantolu Madonna', `category_id`='1', `category_title`='Roman', `author`='Sabahattin Ali', `list_price`='9.10', `stock_quantity`='4';
INSERT INTO products SET `id`='4', `title`='Fareler ve İnsanlar', `category_id`='1', `category_title`='Roman', `author`='John Steinback', `list_price`='35.75', `stock_quantity`='8';
INSERT INTO products SET `id`='5', `title`='Şeker Portakalı', `category_id`='1', `category_title`='Roman', `author`='Jose Mauro De Vasconcelos', `list_price`='33.00', `stock_quantity`='1';
INSERT INTO products SET `id`='6', `title`='Sen Yola Çık Yol Sana Görünür', `category_id`='2', `category_title`='Kişisel Gelişim', `author`='Hakan Mengüç', `list_price`='28.50', `stock_quantity`='7';
INSERT INTO products SET `id`='7', `title`='Kara Delikler', `category_id`='3', `category_title`='Bilim', `author`='Stephen Hawking', `list_price`='39.00', `stock_quantity`='2';
INSERT INTO products SET `id`='8', `title`='Allah De Ötesini Bırak', `category_id`='4', `category_title`='Din Tasavvuf', `author`='Uğur Koşar', `list_price`='39.60', `stock_quantity`='18';
INSERT INTO products SET `id`='9', `title`='Aşk 5 Vakittir', `category_id`='4', `category_title`='Din Tasavvuf', `author`='Mehmet Yıldız', `list_price`='42.00', `stock_quantity`='9';
INSERT INTO products SET `id`='10', `title`='Benim Zürafam Uçabilir', `category_id`='4', `category_title`='Çocuk ve Gençlik', `author`='Mert Arık', `list_price`='27.30', `stock_quantity`='12';
INSERT INTO products SET `id`='11', `title`='Kuyucaklı Yusuf', `category_id`='1', `category_title`='Roman', `author`='Sabahattin Ali', `list_price`='10.40', `stock_quantity`='2';
INSERT INTO products SET `id`='12', `title`='Kamyon - Seçme Öyküler', `category_id`='5', `category_title`='Öykü', `author`='Sabahattin Ali', `list_price`='9.75', `stock_quantity`='9';
INSERT INTO products SET `id`='13', `title`='Kendime Düşünceler', `category_id`='6', `category_title`='Felsefe', `author`='Marcus Aurelius', `list_price`='14.40', `stock_quantity`='1';
INSERT INTO products SET `id`='14', `title`='Denemeler - Hasan Ali Yücel Klasikleri', `category_id`='6', `category_title`='Felsefe', `author`='Michel de Montaigne', `list_price`='24.00', `stock_quantity`='4';
INSERT INTO products SET `id`='15', `title`='Animal Farm', `category_id`='1', `category_title`='Roman', `author`='George Orwell', `list_price`='17.50', `stock_quantity`='1';
INSERT INTO products SET `id`='16', `title`='Dokuzuncu Hariciye Koğuşu', `category_id`='1', `category_title`='Roman', `author`='Peyami Safa', `list_price`='18.50', `stock_quantity`='0';

