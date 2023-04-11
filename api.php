<?php

include 'db_connect.php';

$base =  basename(dirname(__FILE__));
echo "/".$base.'/siparisler';

if($_SERVER['REQUEST_METHOD'] == 'GET') {
    switch($_SERVER['REQUEST_URI']) {
        case '/':
            // anasayfa için yapılacak işlemler
            break;
        case "/".$base.'/siparisler':

            // siparişler sayfası için yapılacak işlemler
            break;
        case '/kampanyalar':
            // kampanyalar sayfası için yapılacak işlemler
            break;
        default:
            // tanımlanmayan bir URL isteği geldiğinde yapılacak işlemler
            break;
    }
} elseif($_SERVER['REQUEST_METHOD'] == 'POST') {
    switch($_SERVER['REQUEST_URI']) {
        case '/yeni-siparis':
            // yeni sipariş oluşturma işlemleri
            break;
        case '/yeni-kampanya':
            // yeni kampanya oluşturma işlemleri
            break;
        default:
            // tanımlanmayan bir URL isteği geldiğinde yapılacak işlemler
            break;
    }
}
