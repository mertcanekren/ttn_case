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
* sipariş aşamasında ürün arrayinin sıralanması için kullanılır
*/
function sort_list_price($a, $b) {
    if ($a['list_price'] == $b['list_price']) {
        return 0;
    }
    return ($a['list_price'] < $b['list_price']) ? -1 : 1;
}
