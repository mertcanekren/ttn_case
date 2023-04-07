<?php
/**
 * Yeni kampanya oluşturmak için istek gönderilecek sayfa
 *
 * @author  Mertcan EKREN <mertcanekren@gmail.com>
 * @link mertcanekren.github.io
 */

include 'db_connect.php';

if($_SERVER['REQUEST_METHOD'] === 'POST'){
    if ($_POST['campaign_name'] != "" && $_POST['discount_type'] != "" && $_POST['discount_amount'] != "") {

        $campaign_name = $_POST['campaign_name'];
        $discount_type = $_POST['discount_type'];
        $discount_amount = $_POST['discount_amount'];
    
        // Veritabanına kampanya bilgilerini kaydet
        $sql = "INSERT INTO campaigns (name, discount_type, discount_amount) VALUES (:name, :discount_type, :discount_amount)";
        $campaign_insert = $pdo->prepare($sql);
        $campaign_insert->bindParam(':name', $campaign_name);
        $campaign_insert->bindParam(':discount_type', $discount_type);
        $campaign_insert->bindParam(':discount_amount', $discount_amount);
        $campaign_insert->execute();
    
        // Yeni kampanya eklenmişse, 201 Created HTTP durum kodu ve yeni kaydın ID'siyle birlikte bir JSON yanıtı döndür
        if ($campaign_insert->rowCount() > 0) {
            $new_campaign_id = $pdo->lastInsertId();
            http_response_code(201);
            echo json_encode(array("status" => true, "data" => ["id" => $new_campaign_id, "name" => $campaign_name, "discount_type" => $discount_type, "discount_amount" => $discount_amount]));
        } else {
            // Eğer yeni kampanya eklenememişse, 500 Internal Server Error HTTP durum kodu ve hata mesajıyla birlikte bir JSON yanıtı döndür
            http_response_code(500);
            echo json_encode(array("status"=> false, "message" => "Yeni kampanya eklenirken bir hata olustu."));
        }
    } else {
        http_response_code(400);
        echo json_encode(array("status" => false,"message" => "Lutfen tum alanlari doldurunuz."));
    }
}else{
    http_response_code(400);
    echo json_encode(array("status" => false,"message" => "POST methodu ile istek yapınız"));
}
