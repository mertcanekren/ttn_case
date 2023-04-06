<?php

/**
 * Yeni kampanya oluşturmak için istek gönderilecek sayfa
 *
 * @author  Mertcan EKREN <mertcanekren@gmail.com>
 * @link mertcanekren.github.io
 */

include 'db_connect.php';

if($_POST){
    if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['campaign_name']) && isset($_POST['discount_type']) && isset($_POST['discount_amount'])) {

        // Kampanya verilerini al
        $campaign_name = $_POST['campaign_name'];
        $discount_type = $_POST['discount_type']; // 'percentage' veya 'fixed_amount'
        $discount_amount = $_POST['discount_amount'];
    
        // Veritabanına kampanya bilgilerini kaydet
        $sql = "INSERT INTO campaigns (name, discount_type, discount_amount) VALUES (?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ssi", $campaign_name, $discount_type, $discount_amount);
        $stmt->execute();
    
        // Yeni kampanya eklenmişse, 201 Created HTTP durum kodu ve yeni kaydın ID'siyle birlikte bir JSON yanıtı döndür
        if ($stmt->affected_rows > 0) {
            $new_campaign_id = $stmt->insert_id;
            http_response_code(201);
            echo json_encode(array("id" => $new_campaign_id, "name" => $campaign_name, "discount_type" => $discount_type, "discount_amount" => $discount_amount));
        } else {
            // Eğer yeni kampanya eklenememişse, 500 Internal Server Error HTTP durum kodu ve hata mesajıyla birlikte bir JSON yanıtı döndür
            http_response_code(500);
            echo json_encode(array("message" => "Yeni kampanya eklenirken bir hata olustu."));
        }
    } else {
        http_response_code(400);
        echo json_encode(array("message" => "Lutfen tum alanlari doldurunuz."));
    }
}

