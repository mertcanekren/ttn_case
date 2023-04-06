<?php

include 'db_connect.php';

$data = file_get_contents('data.json');

$datas = json_decode($data);

foreach($datas as $item) {
    $product_id = $item->product_id;
    $title = $item->title;
    $category_id = $item->category_id;
    $category_title = $item->category_title;
    $author = $item->author;
    $list_price = $item->list_price;
    $stock_quantity = $item->stock_quantity;
    $sql = "INSERT INTO products (id, title, category_id, category_title, author, list_price, stock_quantity)
            VALUES ('$product_id', '$title', '$category_id', '$category_title', '$author', '$list_price', '$stock_quantity')";

    if (mysqli_query($conn, $sql)) {
        echo "Record added successfully";
    } else {
        echo "Error adding record: " . mysqli_error($conn);
    }
}