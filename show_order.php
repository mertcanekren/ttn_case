<?php
/**
* Sipariş bilgileri için istek gönderilecek sayfa
*
* @author  Mertcan EKREN <mertcanekren@gmail.com>
* @link mertcanekren.github.io
*/

include 'db_connect.php';
include 'functions.php';
header('Content-Type: application/json; charset=utf-8');

if ($_SERVER['REQUEST_METHOD'] === 'POST'){
    if($_POST["order_id"] != ""){

        $order_sql = $pdo->prepare("SELECT * FROM orders where id=:order_id");
        $order_sql->bindParam(':order_id', $_POST["order_id"]);
        $order_sql->execute();
        if ($order_sql->rowCount() > 0) {

            $order_data = $order_sql->fetch(PDO::FETCH_ASSOC);
            $order_return_data = array();

            // siparişin müşteri bilgileri çekiliyor
            $customer_data = getCustomerDatabyID($order_data["customer_id"]);

            // eğer sipariş bir kampanyadan faydalanmışsa
            if($order_data["campaign_id"] != 0){
                //siparişin kampanya bilgileri çekiliyor
                $campaign_data = getCampaignDatabyID($order_data["campaign_id"]);
                $order["campaign"] = $campaign_data["name"];
            }else{
                $order["campaign"] = "Faydalanılan kampanya yok.";
            }

            // sipariş ürün bilgileri
            $order_products = getOrderProductsbyOrderID($order_data["id"]);

            $products = array();
            foreach ($order_products as &$order_products_row) {
                
                // sipariş ürün bilgileri okunuyor
                $product_data = getProductbyID($order_products_row["product_id"]);

                // ürünün yazar bilgisi
                $author_data = getAuthorbyID($product_data["id"]);

                $p_temp["title"] = $product_data["title"];
                $p_temp["quantity"] = $order_products_row["quantity"];
                $p_temp["author_id"] = $author_data["author"];
                $p_temp["list_price"] = $order_products_row["list_price"];
                $products[] = $p_temp;
            }
            
            //sipariş toplam ücreti
            $order["total_price"] = $order_data["total_price"];
            
            // siparişe uygulanmış bir indirim varsa ücreti
            $order["discounted_price"] = $order_data["discounted_price"];

            //siparişe indirim uygulanmışsa, indirimsiz ücreti
            $order["without_discounted_price"] = $order_data["without_discounted_price"];
            
            // sipariş kargo ücreti
            $order["shipping_cost"] = $order_data["shipping_cost"];

            // siparişin müşteri id bilgisi
            $order["customer_id"] = $order_data["customer_id"];

            // siparişin kampanya id bilgisi
            $order["campaign_id"] = $order_data["campaign_id"];

            $order_return_data["order_data"] = $order;
            $order_return_data["customer"] = $customer_data;
            $order_return_data["products"] = $products;
            http_response_code(200);
            echo json_encode(array(
                "status" => true,
                "order_data" => $order_return_data
            ));
        }else{
            http_response_code(400);
            echo json_encode(array("status" => false,"message" => "Sipariş bulunamadı."));        
        }
    }else{
        http_response_code(400);
        echo json_encode(array("status" => false,"message" => "Sipariş numarası gönderiniz."));    
    }
}else{
    http_response_code(400);
    echo json_encode(array("status" => false,"message" => "POST methodu ile istek yapınız"));
}
?>