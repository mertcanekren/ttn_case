<?php
/**
* Sipariş oluşturma için istek gönderilecek sayfa
*
* @author  Mertcan EKREN <mertcanekren@gmail.com>
* @link mertcanekren.github.io
*/

include 'db_connect.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if ($_POST['product_id'] != "" && $_POST['quantity'] != "" && $_POST['customer_name'] != "" && $_POST['customer_email'] != "" && $_POST['customer_address'] != "") {

        // Alınan sipariş bilgileri
        $product_id = $_POST['product_id'];
        $quantity = $_POST['quantity'];
        $customer_name = $_POST['customer_name'];
        $customer_email = $_POST['customer_email'];
        $customer_address = $_POST['customer_address'];

        // Ürün stok kontrolü
        $product_query = "SELECT stock_quantity, list_price FROM products WHERE id = $product_id";
        $product_result = mysqli_query($conn, $product_query);
        if (mysqli_num_rows($product_result) > 0) {
            $product_row = mysqli_fetch_assoc($product_result);
            $product_stock = $product_row['stock_quantity'];
            $product_price = $product_row['list_price'];
            if ($quantity > $product_stock) {
                http_response_code(400);
                echo json_encode(array("status" => false,"message" => "Üzgünüz, bu üründen yeterli stok yok."));
            } else {

                // Sipariş tutarı hesaplama
                $total_price = $product_price * $quantity;

                // Kargo bedeli hesaplama
                $shipping_cost = $total_price >= 200 ? 0 : 75;
                
                // Sipariş oluşturma
                $order_query = "INSERT INTO orders (product_id, quantity, customer_name, customer_email, customer_address, total_price, shipping_cost) VALUES ($product_id, $quantity, '$customer_name', '$customer_email', '$customer_address', $total_price, $shipping_cost)";
                if (mysqli_query($conn, $order_query)) {
                    http_response_code(201);
                    echo json_encode(array("product_id" => $product_id, "quantity" => $quantity, "customer_name" => $customer_name, "customer_email" => $customer_email, "customer_address" => $customer_address, "total_price" => $total_price, "shipping_cost" => $shipping_cost));
                } else {
                    http_response_code(500);
                    echo json_encode(array("message" => "Siparis olusturulamadi."));
                }
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Almak istediginiz urun bulunamadi."));
        }
    }else{
        http_response_code(400);
        echo json_encode(array("status" => false,"message" => "Lutfen tum alanlari doldurunuz."));
    }
}else{
    http_response_code(400);
    echo json_encode(array("status" => false,"message" => "POST methodu ile istek yapınız"));
}
