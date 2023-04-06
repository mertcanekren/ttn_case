<?php

include 'db_connect.php';

// check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
  }
  
  $tables = array();
  $result = $conn->query("SHOW TABLES");
  while ($row = $result->fetch_array(MYSQLI_NUM)) {
    $tables[] = $row[0];
  }
  
  $sql = "";
  $sql .= "CREATE DATABASE IF NOT EXISTS $dbname;\n\n";
  $sql .= "USE $dbname;\n\n";
  foreach ($tables as $table) {
    $result = $conn->query("SELECT * FROM $table");
    $columns = array();
    while ($col = $result->fetch_field()) {
      $columns[] = $col->name;
    }
    $rows = $result->fetch_all(MYSQLI_ASSOC);
    $sql .= "DROP TABLE IF EXISTS $table;\n";
    $row2 = $conn->query("SHOW CREATE TABLE $table")->fetch_array(MYSQLI_NUM);
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
  if(fwrite($file, $sql)){
    echo "veritanı yedeği oluşturuldu.";
  }else{
    echo "veritanı yedeği oluşturulamadı.";
  }
  fclose($file);
  
  // close connection
  $conn->close();
?>
