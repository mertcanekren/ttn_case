<?php
/**
* config.php dosyasını güncellemek için kullanılır
*
* @author  Mertcan EKREN <mertcanekren@gmail.com>
* @link mertcanekren.github.io
*/

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $newUsername = $_POST['username'];
    $newPassword = $_POST['password'];
    $newDbName = $_POST['dbname'];

    // Veritabanı tablo ve kullanıcı bilgilerini güncelleme
    define('DB_USER', $newUsername);
    define('DB_PASS', $newPassword);
    define('DB_NAME', $newDbName);

    // Güncellenmiş verileri dosyaya kaydetme
    $configFile = file_get_contents('config.php');
    $configFile = preg_replace("/define\('DB_USER',\s*'(.*)'\);/", "define('DB_USER', '$newUsername');", $configFile);
    $configFile = preg_replace("/define\('DB_PASS',\s*'(.*)'\);/", "define('DB_PASS', '$newPassword');", $configFile);
    $configFile = preg_replace("/define\('DB_NAME',\s*'(.*)'\);/", "define('DB_NAME', '$newDbName');", $configFile);

    if(file_put_contents('config.php', $configFile)){
        echo "Veritabanı bilgileri başarıyla güncellendi! <br><br>";
        echo 'Tabloları oluşturmak için <a href="db_import.php">tıklayınız.</a>';
    try {
        $pdo = new PDO('mysql:host=localhost', $newUsername, $newPassword);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $pdo->exec("CREATE DATABASE IF NOT EXISTS $newDbName");
    } catch (PDOException $e) {
        echo "Bağlantı hatası: " . $e->getMessage();
    }

    }else{
        echo "Veritabanı bilgileri güncellenemdi. Lütfen config.php dosyasını veritabani bilgileriniz ile güncelleyiniz.";
    }
}

?>

<form method="post" action="config_update.php">
    <h3>Veritabanı bağlantı bilgileri</h3>
    <table>
        <tr>
            <td>
                <label for="username">Kullanıcı Adı:</label>
            </td>
            <td>
                <input type="text" name="username" id="username">
            </td>
        </tr>
        <tr>
            <td>
                <label for="password">Parola:</label>
            </td>
            <td>
                <input type="password" name="password" id="password">
            </td>
        </tr>
        <tr>
            <td>
                <label for="dbname">Veritabanı Adı:</label>
            </td>
            <td>
                <input type="text" name="dbname" id="dbname">
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <input type="submit" value="Güncelle">
            </td>
        </tr>
    </table>
</form>