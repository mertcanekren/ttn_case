<?php
/**
* Sipariş bilgileri için istek gönderilecek sayfa
*
* @author  Mertcan EKREN <mertcanekren@gmail.com>
* @link mertcanekren.github.io
*/

include 'db_connect.php';

if ($_SERVER['REQUEST_METHOD'] === 'GET'){
    if($_GET["order_id"] != ""){

        $order_sql = $pdo->prepare("SELECT * FROM orders where id=:order_id");
        $order_sql->bindParam(':order_id', $_GET["order_id"]);
        $order_sql->execute();
        $order_data = $order_sql->fetch(PDO::FETCH_ASSOC);
        print_r($order_data);
    }
}else{
    http_response_code(400);
    echo json_encode(array("status" => false,"message" => "POST methodu ile istek yapınız"));
}
?>