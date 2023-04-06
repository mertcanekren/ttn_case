<style>
    td{
        text-align: center;
        border-bottom:1px solid #c0c0c0
    }
</style>

<?php

include 'db/db_connect.php';

// Sorgu oluşturma ve çalıştırma
$query = "SELECT * FROM products";
$result = $conn->query($query);


// Sonuçların sayısı kontrolü
if ($result->num_rows > 0) {
    // Sonuçları ekrana yazdırma
    echo "<table cellpadding=3>";
    echo "<tr><th>ID</th><th>Title</th><th>Category ID</th><th>Category Title</th><th>Author</th><th>List Price</th><th>Stock Quantity</th></tr>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row['id'] . "</td><td>" . $row['title'] . "</td><td>" . $row['category_id'] . "</td><td>" . $row['category_title'] . "</td><td>" . $row['author'] . "</td><td>" . $row['list_price'] . "</td><td>" . $row['stock_quantity'] . "</td></tr>";
    }
    echo "</table>";
} else {
    echo "Tabloda kayıt yok";
}
