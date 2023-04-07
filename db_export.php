<?php

include 'db_connect.php';




$stmt = $pdo->prepare("SHOW TABLES");
$stmt->execute();
$tables = $stmt->fetchAll(PDO::FETCH_COLUMN);

// Create backup SQL
$sql = "CREATE DATABASE IF NOT EXISTS ".DB_NAME.";\n\n";
$sql .= "USE ".DB_NAME.";\n\n";
foreach ($tables as $table) {
    $stmt = $pdo->prepare("SELECT * FROM $table");
    $stmt->execute();
    $columns = array();
    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
    foreach ($rows as $row) {
        $columns = array_keys($row);
        break;
    }
    $stmt = $pdo->prepare("SHOW CREATE TABLE $table");
    $stmt->execute();
    $row2 = $stmt->fetch(PDO::FETCH_NUM);
    $sql .= "DROP TABLE IF EXISTS $table;\n";
    $sql .= "\n" . $row2[1] . ";\n\n";
    foreach ($rows as $row) {
        $sql .= "INSERT INTO $table SET ";
        foreach ($columns as $column) {
            $sql .= "`$column`='" . addslashes($row[$column]) . "', ";
        }
        $sql = rtrim($sql, ", ");
        $sql .= ";\n";
    }
    $sql .= "\n";
}

// write SQL to file
$fileName = 'backup/database_backup.sql';
$file = fopen($fileName, 'w+');
if (fwrite($file, $sql)) {
    echo "veritanı yedeği oluşturuldu.";
} else {
    echo "veritanı yedeği oluşturulamadı.";
}
fclose($file);
