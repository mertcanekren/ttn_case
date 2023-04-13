<?php
/**
* API üzerinde kullanılan fonksiyonları barındırır.
*
* @author  Mertcan EKREN <mertcanekren@gmail.com>
* @link mertcanekren.github.io
*/

/**
* Mail adresi validasyonu gerçekleştirir.
*
* @param string $email Mail adresi
* @return bool
*/
function CheckEmail($email){
    if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
        return true;
    }else{
        return false;
    }
}

/**
* id bilgisi gönderilen ürünün bilgilerini döndürür.
*
* @param int $book_id ürün id bilgisi
* @return array
*/
function getBookDatabyID($book_id){
    global $pdo;

    $book_query = "SELECT * FROM books WHERE id=:id";
    $book_query = $pdo->prepare($book_query);
    $book_query->execute(['id' => $book_id]);
    if ($book_query->rowCount() > 0) {
        $book_data = $book_query->fetch(PDO::FETCH_ASSOC);
        return $book_data;
    }else{
        return false;
    }
}

/**
* id bilgisi gönderilen müşteri bilgilerini döndürür.
*
* @param int $customer_id müşteri id bilgisi
* @return array
*/
function getCustomerDatabyID($customer_id){
    global $pdo;

    $customer_query = "SELECT * FROM customers WHERE id=:id";
    $customer_query = $pdo->prepare($customer_query);
    $customer_query->execute(['id' => $customer_id]);
    if ($customer_query->rowCount() > 0) {
        $customer_data = $customer_query->fetch(PDO::FETCH_ASSOC);
        return $customer_data;
    }else{
        return false;
    }
}

/**
* id bilgisi gönderilen kampanya bilgilerini döndürür.
*
* @param int $campaign_id kampanya id bilgisi
* @return array
*/
function getCampaignDatabyID($campaign_id){
    global $pdo;

    $campaign_query = "SELECT * FROM campaigns WHERE id=:id";
    $campaign_query = $pdo->prepare($campaign_query);
    $campaign_query->execute(['id' => $campaign_id]);
    if ($campaign_query->rowCount() > 0) {
        $campaign_data = $campaign_query->fetch(PDO::FETCH_ASSOC);
        return $campaign_data;
    }else{
        return false;
    }
}

/**
* id bilgisi gönderilen siparişin ürünlerini döndürür.
*
* @param int $order_id sipariş id bilgisi
* @return array
*/
function getOrderProductsbyOrderID($order_id){
    global $pdo;

    $order_p_query = "SELECT * FROM order_products WHERE order_id=:order_id";
    $order_p_query = $pdo->prepare($order_p_query);
    $order_p_query->execute(['order_id' => $order_id]);
    if ($order_p_query->rowCount() > 0) {
        $order_p_data = $order_p_query->fetchAll(PDO::FETCH_ASSOC);
        return $order_p_data;
    }else{
        return false;
    }
}

/**
* id bilgisi gönderilen ürünün bilgilerini döndürür.
*
* @param int $product_id ürün id bilgisi
* @param string $field istenilen sütun adı
* @return array
*/
function getProductbyID($product_id){
    global $pdo;

    $product_query = "SELECT * FROM books WHERE id=:id";
    $product_query = $pdo->prepare($product_query);
    $product_query->execute(['id' => $product_id]);
    if ($product_query->rowCount() > 0) {
        $product_data = $product_query->fetch(PDO::FETCH_ASSOC);
        return $product_data;
    }else{
        return false;
    }
}

/**
* id bilgisi gönderilen yazarın bilgilerini döndürür.
*
* @param int $author_id yazar id bilgisi
* @return array
*/
function getAuthorbyID($author_id){
    global $pdo;

    $author_query = "SELECT * FROM authors WHERE id=:id";
    $author_query = $pdo->prepare($author_query);
    $author_query->execute(['id' => $author_id]);
    if ($author_query->rowCount() > 0) {
        $author_data = $author_query->fetch(PDO::FETCH_ASSOC);
        return $author_data;
    }else{
        return false;
    }
}

/**
* sipariş aşamasında ürün arrayinin sıralanması için kullanılır
*/
function sort_list_price($a, $b) {
    if ($a['list_price'] == $b['list_price']) {
        return 0;
    }
    return ($a['list_price'] < $b['list_price']) ? -1 : 1;
}
