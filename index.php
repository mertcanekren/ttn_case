<?php

include 'db_connect.php';
include 'functions.php';

// URL'deki endpoint'i al
$endpoint = $_GET['endpoint'];

// Endpoint'e göre işlem yap
switch ($endpoint) {
    case 'order/create':
        // Yeni sipariş oluşturma işlemi için gerekli kodları buraya yazın

        createOrder($_POST);

        break;
    case 'campaigns':
        // Kampanya listeleme işlemi için gerekli kodları buraya yazın
        break;
    case 'campaigns/new':
        // Yeni kampanya ekleme işlemi için gerekli kodları buraya yazın
        
        createCampaign($_POST);

        break;
    case 'order/detail':
        // Sipariş detayı görüntüleme işlemi için gerekli kodları buraya yazın
        break;
    default:
        // Hatalı endpoint durumunda hata mesajı döndür
        http_response_code(404);
        echo "Hata: Geçersiz endpoint!";
        break;
}
