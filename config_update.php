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

    // Veritabanı tablo ve kullanıcı bilgilerini güncelleme
    define('DB_USER', $newUsername);
    define('DB_PASS', $newPassword);

    // Güncellenmiş verileri dosyaya kaydetme
    $configFile = file_get_contents('config.php');
    $configFile = preg_replace("/define\('DB_USER',\s*'(.*)'\);/", "define('DB_USER', '$newUsername');", $configFile);
    $configFile = preg_replace("/define\('DB_PASS',\s*'(.*)'\);/", "define('DB_PASS', '$newPassword');", $configFile);

    if(file_put_contents('config.php', $configFile)){
        echo "Veritabanı bilgileri başarıyla güncellendi!";
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
            </td>
            <td>
                <input type="submit" value="Güncelle">
            </td>
        </tr>
    </table>
</form>