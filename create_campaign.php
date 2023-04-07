<?php
/**
 * Yeni kampanya oluşturmak için istek gönderilecek sayfa
 *
 * @author  Mertcan EKREN <mertcanekren@gmail.com>
 * @link mertcanekren.github.io
 */

include 'db_connect.php';

if($_SERVER['REQUEST_METHOD'] === 'POST'){

    $name = $_POST['name'];
    $type = $_POST['type'];
    $min_purchase_amount = $_POST['min_purchase_amount'];
    $discount_percentage = $_POST['discount_percentage'];
    $free_item_quantity = $_POST['free_item_quantity'];

    // Veritabanına kampanya bilgilerini kaydet
    $sql = "INSERT INTO campaigns (name, type, min_purchase_amount, discount_percentage, free_item_quantity) VALUES (:name, :type, :min_purchase_amount, :discount_percentage, :free_item_quantity)";
    $campaign_insert = $pdo->prepare($sql);
    $campaign_insert->bindParam(':name', $name);
    $campaign_insert->bindParam(':type', $type);
    $campaign_insert->bindParam(':min_purchase_amount', $min_purchase_amount);
    $campaign_insert->bindParam(':discount_percentage', $discount_percentage);
    $campaign_insert->bindParam(':free_item_quantity', $free_item_quantity);
    $campaign_insert->execute();

    // Yeni kampanya eklenmişse, 201 Created HTTP durum kodu ve yeni kaydın ID'siyle birlikte bir JSON yanıtı döndür
    if ($campaign_insert->rowCount() > 0) {
        $new_campaign_id = $pdo->lastInsertId();
        http_response_code(201);
        echo json_encode(array("status" => true, "data" => ["id" => $new_campaign_id, "name" => $name, "type" => $type, "min_purchase_amount" => $min_purchase_amount, "discount_percentage" => $discount_percentage, "free_item_quantity" => $free_item_quantity]));
    } else {
        // Eğer yeni kampanya eklenememişse, 500 Internal Server Error HTTP durum kodu ve hata mesajıyla birlikte bir JSON yanıtı döndür
        http_response_code(500);
        echo json_encode(array("status"=> false, "message" => "Yeni kampanya eklenirken bir hata olustu."));
    }
}else{
    http_response_code(400);
    echo json_encode(array("status" => false,"message" => "POST methodu ile istek yapınız"));
}
