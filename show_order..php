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

    }
}else{
    http_response_code(400);
    echo json_encode(array("status" => false,"message" => "POST methodu ile istek yapınız"));
}

?>