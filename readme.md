##Kurulum

Dosyaları kendi local alanınıza taşıdıktan sonra `config_update.php` dosyasını tarayıcıda açınız. Kendi MySQL kullanıcı bilgileriniz ile (kullanıcı adı ve şifre) ile formu submit ediniz. Bu işlem `config.php` dosyısı içinde olan veritabanı bilgilerini güncelleyecektir. Eğer aksi bir durum olup dosya gerekli güncelleme işlemini yapamazsa `config.php` dosyasını manuel olarak güncellemeniz gerekebilir.

Veritabanı bilgileri güncellemelerinden sonra `db_import.php` dosyasunu tarayıcıda açınız. Bu dosya `backup/database_backup.sql` adlı veritbanı dosyasını içe aktaracaktır. Eğer aksi bir durum olup içe aktarazsa manuel olarak veritabanına aktarmanız gerekebilir.

