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

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);

?>