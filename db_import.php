<?php

/**
 * Veritabanı dosyasını içe aktarmak için kullanılır
 *
 * @author  Mertcan EKREN <mertcanekren@gmail.com>
 * @link mertcanekren.github.io
 */

include 'db_connect.php';

// Yedek dosyası okunuyor.
$backup_file = "backup/database_backup.sql";
$handle = fopen($backup_file, "r");

if ($handle) {
    $query = "";

    while (!feof($handle)) {
        $line = fgets($handle);

        if (substr($line, -2) == ";\n" || substr($line, -2) == ";\r") {
            $query .= $line;

            if (!$pdo->query($query)) {
                echo "Hata: " . $pdo->error . "<br>";
            }
            $query = "";
        } else {
            $query .= $line;
        }
    }
    fclose($handle);
    echo "Veriler başarıyla içe aktarıldı.";
} else {
    echo "Veritabanı dosyası açılamadı.";
}
?>