CREATE TABLE food_list (
	ID int IDENTITY NOT NULL PRIMARY KEY,
	TITLE nvarchar,
	TYPE nvarchar,
	CREATE_DATE datetime NULL DEFAULT (getdate()),
	DELETED int NULL DEFAULT (0),
);
/*---#---*/
CREATE TABLE material_list (
	ID int IDENTITY NOT NULL PRIMARY KEY,
	TITLE nvarchar,
	TYPE nvarchar,
	CREATE_DATE datetime NULL DEFAULT (getdate()),
	DELETED int NULL DEFAULT (0),
);
/*---#---*/
CREATE TABLE food_material_list (
	ID int IDENTITY NOT NULL,
	FOOD_ID int NULL DEFAULT (0),
	MATERIAL_ID int NULL DEFAULT (0),
	PRIMARY KEY (ID)
);


SELECT PRODUCT_NAME,QUOTA
from product where QUOTA = 'LIMITLESS';--Kotası limitsiz olan ürünler hangileridir? ----Telco şeması için

SELECT NAME,SURNAME,STATUS
from customer where STATUS = 'INITIAL';-- Statüsü 'Initial' olan müşterileri bulunuz. ----Telco şeması için

SELECT FULL_ADDRESS,CITY
from address where CITY = 'Istanbul';-- Şehir bilgisi 'ISTANBUL' olan adresleri bulunuz. ----Telco şeması için

SELECT * FROM order_ıtems WHERE UNIT_PRICE > 150;-- Birim fiyatı 150'den büyük olan order_itemları bulunuz. ----Sales şeması için

-- İşe alım tarihi Mayıs 2016 olan çalışanları bulunuz. ----Sales şeması için
-- SELECT * FROM employees WHERE TO_CHAR(HIRE_DATE,’YYYY’) = 2016
-- AND TO_CHAR(HIRE_DATE,’MM’) = 05;

SELECT * FROM contacts WHERE fırst_name = 'Charlie ' OR fırst_name = 'Charlsie';-- Adı Charlie ya da Charlsie olan contactları bulunuz. ----Sales şeması için

--Yılın 4. aylarında en çok hangi amaçla kredi çekilmi?tir? ----Banking şeması için


SELECT * FROM ınventorıes WHERE QUANTITY > '10 ' AND QUANTITY < '50';-- Adet sayısı 10dan büyük 50den küçük envanterleri bulunuz. ----Sales şeması için

SELECT CNT_VALUE from contact where IS_PRIMARY = '0';-- Birincil iletişim bilgisi olmayan telefon numaralarını bulunuz. ----Telco şeması için

-- Bir siparişte toplam 100.0000'den fazla ücret ödeyen emirler nedir? ----Sales şeması için

-- Bankanın 50 ve ya 51 yaşında kadın müşterilerinden aynı isme sahip olan müşterisi/müşterileri var mı? Varsa isimleri neler?----Banking şeması için

-- Hesap ödeme şekli nakit olmayan hesaplar hangileridir? ----Telco şeması için

-- Statüsü deaktif olan müşterilerin bağlantı kesim tarihleri nedir? ----Telco şeması için

-- Manager'ı olmayan çalışanlar hangileridir? ----Sales şeması için

-- State bilgisi boş olan lokasyonları bulunuz.----Sales şeması için

-- Hesap kapanış tarihi dolu olan hesapları bulunuz. ----Telco şeması için

-- Elektronik fatura mail adresi (E_bill_email) olan hesaplar hangileridir? ----Telco şeması için

-- Durumu iptal olan ve satıcıları olmayan emirler hangileridir? ----Sales şeması için

-- Sözleşme bitiş tarihi 1 Ocak 2000'den büyük , 1 Ocak 2005'ten küçük olan sözleşmeleri bulunuz. ----Telco şeması için

-- Ocak 2016 ile Haziran 2016 arasında verilen siparişler hangileridir? ----Sales şeması için

-- 2005 yılından önce yapılan ve hala aktif olan subscriptionlar hangileridir? ----Telco şeması için

-- Sözleşme başlangıç tarihi Ocak 2010'dan büyük olan sözleşmeleri bulunuz. ----Telco şeması için

-- İsmi E ile başlayan müşterileri bulunuz. ----Telco şeması için

-- Product tipi 'DSL' ile biten ürünleri bulunuz. ----Telco şeması için

-- Unvanı 'S' ile başlamayan çalışanları bulunuz. ----Sales şeması için

-- Herhangi bir çeşit Intel Xeon ürünler hangileridir? ----Sales şeması için

-- İsminde ya da soyisminde 'ü' harfi geçen müşteriler hangileridir? ----Telco şeması için

-- İsmi 'C' ile başlayan kontaklar hangileridir? Soyadına göre alfabetik sıra ile sıralayalım. ----Sales şeması için

-- Ürün adı 'Asus' ile başlayan ve liste fiyatı standart ücretinden küçük olan ürünleri bulunuz. ----Sales şeması için

-- Ülke kodu UK ve AU olan adresleri bulunuz.----Telco şeması için

-- 1,2,4,5 id'li kategorilerin bilgilerini bulunuz. ----Sales şeması için

-- Taahhüt süresi 240 ve 120 ay olan bütün sözleşmeleri bulmak istiyoruz.----Telco şeması için

-- Sipariş durumu 'Shipped'den farklı olan müşterilerin bilgilerini bulunuz. ----Sales şeması için

-- Adet sayısı 100e eşit olan envanterlerin product bilgisini bulunuz. ----Sales şeması için

-- Sözleşme alt tipi MAIN olan kaç tane sözleşme vardır?----Telco şeması için

-- Deaktif müşterilerin sayısını bulunuz.----Telco şeması için

-- Beijing (8 numaralı warehouse)'da kaç farklı envanter vardır? ----Sales şeması için

-- İletişim tipi olarak email ve statusu kullanımda olan kaç müşteri var?----Telco şeması için

-- Liste fiyati 1000 ile 3000 arasinda olan kaç product var?----Sales şeması için

--Hangi yıllarda kaç hesap açılmıştır?----Banking şeması için

-- İşlemlerin tiplerine göre toplam sayılarının büyükten küçüğe sıralaması nedir?----Banking şeması için

-- İşlemlerin tiplerine göre toplam tutarlarının büyükten küçüğe sıralaması nedir?----Banking şeması için
