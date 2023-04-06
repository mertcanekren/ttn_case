<?php

include 'db_connect.php';

// Yedek dosyasının adını ve yolu belirle
$backup_file = "backup/database_backup.sql";

// Yedek dosyasını aç
$handle = fopen($backup_file, "r");

if ($handle) {
  $query = "";
  while (!feof($handle)) {
    $line = fgets($handle);
    // Satır sonu kontrolü yap
    if (substr($line, -2) == ";\n" || substr($line, -2) == ";\r") {
      $query .= $line;
      // Sorguyu çalıştır
      if (!$conn->query($query)) {
        echo "Hata: " . $conn->error . "<br>";
      }
      $query = "";
    } else {
      $query .= $line;
    }
  }
  fclose($handle);
  echo "Yedek dosyasındaki veriler başarıyla içe aktarıldı.";
} else {
  echo "Yedek dosyası açılamadı.";
}

// Veritabanı bağlantısını kapat
$conn->close();
?>
