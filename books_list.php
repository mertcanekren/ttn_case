<style>
    td{
        text-align: center;
        border-bottom:1px solid #c0c0c0
    }
</style>

<?php

include 'db_connect.php';


$query = "SELECT * FROM products";
$stmt = $pdo->query($query);


if ($stmt->rowCount() > 0) {

    echo "<table cellpadding=3>";
    echo "<tr><th>ID</th><th>Title</th><th>Category ID</th><th>Category Title</th><th>Author</th><th>List Price</th><th>Stock Quantity</th></tr>";
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        echo "<tr><td>" . $row['id'] . "</td><td>" . $row['title'] . "</td><td>" . $row['category_id'] . "</td><td>" . $row['category_title'] . "</td><td>" . $row['author'] . "</td><td>" . $row['list_price'] . "</td><td>" . $row['stock_quantity'] . "</td></tr>";
    }
    echo "</table>";
} else {
    echo "Kayıtli veri bulunamadı";
}
?>