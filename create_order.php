<?php

/**
 * Sipariş oluşturma için istek gönderilecek sayfa
 *
 * @author  Mertcan EKREN <mertcanekren@gmail.com>
 * @link mertcanekren.github.io
 */

include 'db_connect.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    if ($_POST['customer_name'] != "" && $_POST['customer_email'] != "" && $_POST['customer_address'] != "") {

        //print_r($_POST);
        $customer_name = $_POST['customer_name'];
        $customer_email = $_POST['customer_email'];
        $customer_address = $_POST['customer_address'];

        $total_price = 0;

        $products = array();

        // Eğer birden fazla ürün gelirse
        if (is_array($_POST["product_id"])) {

            $product_c = -1;
            // Ürün ve ürün stok kontrolleri yapılıyor
            foreach ($_POST["product_id"] as $product_id) {
                $product_c++;
                $quantity = $_POST["quantity"][$product_c];

                $product_query = "SELECT stock_quantity, list_price FROM products WHERE id = :product_id";
                $product_insert = $pdo->prepare($product_query);
                $product_insert->execute(['product_id' => $product_id]);

                if ($product_insert->rowCount() > 0) {
                    $product_row = $product_insert->fetch(PDO::FETCH_ASSOC);
                    $product_stock = $product_row['stock_quantity'];
                    $product_price = $product_row['list_price'];
                    if ($quantity > $product_stock) {
                        http_response_code(400);
                        echo json_encode(array("status" => false, "message" => "Üründen yeterli stok yok."));
                        exit();
                    } else {
                        $total_price += $product_price * $quantity;
                        // sipariş ürünleri geçici olarak bir array üzerinde toplanıyor
                        $temp_products = array();
                        $temp_products["product_id"] = $product_id;
                        $temp_products["quantity"] = $quantity;
                        $temp_products["list_price"] = $product_price;
                        $temp_products["total_price"] = $product_price * $quantity;
                        $products[] = $temp_products;
                    }
                } else {
                    http_response_code(400);
                    echo json_encode(array("status" => false, "message" => "Almak istediğiniz ürün bulunamadı."));
                    exit();
                }
            }

            // Kargo bedeli hesaplama
            $shipping_cost = $total_price >= 200 ? 0 : 75;

            // Sipariş oluşturma
            $order_query = "INSERT INTO orders (customer_name, customer_email, customer_address, total_price, shipping_cost, createtime) VALUES (:customer_name, :customer_email, :customer_address, :total_price, :shipping_cost, :createtime)";
            $order_insert = $pdo->prepare($order_query);
            $order_insert->execute([
                'customer_name' => $customer_name,
                'customer_email' => $customer_email,
                'customer_address' => $customer_address,
                'total_price' => $total_price,
                'shipping_cost' => $shipping_cost,
                'createtime' => time()
            ]);
            if ($order_insert->rowCount() > 0) {
                
                $new_order_id = $pdo->lastInsertId();
                http_response_code(201);
                echo json_encode(array("status" => true, "data" => [
                    "id" => $new_order_id,
                    "customer_name" => $customer_name,
                    "customer_email" => $customer_email,
                    "customer_address" => $customer_address,
                    "total_price" => $total_price,
                    "shipping_cost" => $shipping_cost
                ]));

                foreach ($products as $product) {
                    
                    $product_id = $product["product_id"];
                    $quantity = $product["quantity"];
                    $list_price = $product["list_price"];
                    $total_price = $product["total_price"];
    
                    $product_query = "INSERT INTO order_products (order_id, product_id, quantity, list_price, total_price) VALUES (:order_id, :product_id, :quantity, :list_price, :total_price)";
                    $product_insert = $pdo->prepare($product_query);
                    $product_insert->execute([
                        'order_id' => $new_order_id,
                        'product_id' => $product_id,
                        'quantity' => $quantity,
                        'list_price' => $list_price,
                        'total_price' => $total_price,
                    ]);
                }

            } else {
                // Eğer yeni sipariş eklenememişse, 500 Internal Server Error HTTP durum kodu ve hata mesajıyla birlikte bir JSON yanıtı döndür
                http_response_code(500);
                echo json_encode(array("status" => false, "message" => "Siparis olusturulamadi."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("status" => false, "message" => "Ürün datası array tipinde gönderilmesi gerekmektedir."));
            exit();
        }
    } else {
        http_response_code(400);
        echo json_encode(array("status" => false, "message" => "Müşteri bilgileri eksik. Lütfen doldurunuz."));
    }
}
