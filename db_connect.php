<?php
/**
* Veritabanı bağlantısını gerçekleştirir.
*
* @author  Mertcan EKREN <mertcanekren@gmail.com>
* @link mertcanekren.github.io
*/
include 'config.php';

$servername = "localhost";
$username = DB_USER;
$password = DB_PASS;
$dbname = DB_NAME;

// PDO veritabanı bağlantısı
try {
    $pdo = new PDO("mysql:host=$servername;dbname=$dbname;charset=utf8", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    echo "Veritabanı Bağlantı hatası: " . $e->getMessage();
}

?>