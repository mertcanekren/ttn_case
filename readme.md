## Sipariş Servisi

- Bu repo task içinde istenilen sipariş servisini içerir.

## Kurulumu

- Proje git üzerinden çekildikten sonra veritabanı bağlantı ayarlarını yapıyoruz. `config_update.php` dosyasını tarayıcıda açınız. MySQL kullanıcı bilgileriniz ile (kullanıcı adı, şifre ve veritabanı adı) ile formu submit ediniz. Bu işlem `config.php` dosyısı içinde olan veritabanı bilgilerini güncelleyecektir. Güncelledikten sonra karşınıza gelen mesaj üzerinden verileri içe aktarmak için gerekli linki göreceksiniz. (Eğer dosya güncelleme ile ilgili bir hata almanız durumunda `config.php` dosyasını manuel olarak düzenleyerek `db_import.php` dosyasını çalıştırınız) Eğer aksi bir durum olup dosya gerekli güncelleme işlemini yapamazsa `config.php` dosyasını manuel olarak güncellemeniz gerekebilir.

## Dosyalar

- config_update.php - Kurulum aşamasında veritabanı ayarlarını kolay yapmak için oluşturuldu.
- config.php - Veritabanı bilgilerini tutar.
- db_connect.php - Veritabanı bağlantısını gerçekleştirir.
- db_import.php - Kurulum sırasında `backup/database_backup.sql` dosyasını okuyarak içe aktarır. 
- create_campaign.php - Yeni kampanya oluşturmak için istek gönderilecek dosya
- create_order.php - Yeni sipariş oluşturmak için istek gönderilecek dosya
- show_order.php - Sipariş detayları datasını döndürecek dosya
- functions.php - Servis üzerinde kullanılan fonksiyonları barındırır

## Servis İstekleri

### Yeni Kampanya Oluşturma

`create_campaign.php` dosyasına POST methodu ile gönderilecekler.

- `name (string)` - Kampanya adı
- `discount_type (string)` - Kampanya tipi (percentage & free_item)
- `discount_amount (integer)` - Kampanyanın sağlayacağı yüzdelik indirim oranı (5)
- `minimum_campaign_amount (integer)` - Kampanyanın sipariş üzerinde aktif hale gelmesi için gerekli minimum tutar. (100)
- `campaign_author (integer)` - Eğer bir yazarın kampanyası ücretsiz kitap kampanyası yapılacaksa `authors` tablosunda olan yazarın `id` bilgisi
- `campaign_minimum_pieces (integer)` - Yazara ait ücretiz kitap kampanyasının en az kaç kitap aldıktan sonra geçerli olacağı sayı.


### Yeni Sipariş Oluşturma

`create_order.php` dosyasına POST methodu ile gönderilecekler.

- `customer_name (string)` - Müşteri adı
- `customer_email (string)` - Müşteri mail adresi
- `customer_address (integer)` - Müşteri adresi
- `product_id (integer)` - Sipariş verilecek ürünün `books` tablosunda olan `id` bilgisi`
- `quantity (integer)` - Sipariş verilen ürünün kaç adet alınacağı bilgisi

*`product_id` ve `quantity` değerleri array tipinde POST edilmesi gerekmektedir.*

*Örnek: id numarası 1 ve 2 olan üründen 2 adet sipariş verceksek ürünleri içeren POST datası products_id[] = 1 quantity[] = 2, products_id[] = 2 quantity[] = 2 olmalıdır*

### Sipariş Detayları Görüntüleme

`show_order.php` dosyasına POST methodu ile gönderilmesi gereken değer.

- `order_id (integer)` - `order` tablosunda olan sipariş kaydının `id` bilgisi  

## Notlar

Dosyalarda yapılan işlemler dosyaların içine yorum satırlarıyla yazılmıştır, incelenebilir.

Eğer kurulumu manuel olarak yapacaksanız veritabanı dosyasını `backup/database_backup.sql` burada. Veritabanı bağlantı işlemleri için `config.php` dosyasını düzenlemeniz yeterlidir.

`orders` tablosunda demo olarak üç adet sipariş kaydı bulunmaktadır.
- `id` numarası `1` olan kayıt - `100 TL ve üzeri alışverişlerde sipariş toplamına %5 indirim` kampanyasından faydalanmıştır.
- `id` numarası `2` olan kayıt - `Sabahattin Ali'nin Roman kitaplarında 2 üründen 1 tanesi bedava` kampanyasından faydalanmıştır.
- `id` numarası `3` olan kayıt normal bir siparişi temsil etmekdir.

Teşekkürler, iyi çalışmalar

Mertcan