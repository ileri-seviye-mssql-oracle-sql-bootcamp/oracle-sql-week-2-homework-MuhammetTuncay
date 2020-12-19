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


-- Kotası limitsiz olan ürünler hangileridir?
SELECT * FROM PRODUCT WHERE QUOTA ='LIMITLESS';

-- Statüsü 'Initial' olan müşterileri bulunuz.
SELECT CUSTOMER_NUM,NAME,SURNAME,STATUS FROM CUSTOMER WHERE STATUS = 'INITIAL';
SELECT * FROM CUSTOMER WHERE STATUS = 'INITIAL';

-- Şehir bilgisi 'ISTANBUL' olan adresleri bulunuz.
SELECT * FROM ADDRESS WHERE CITY = 'Istanbul';

-- Hesap ödeme şekli nakit olmayan hesaplar hangileridir?
SELECT * FROM ACCOUNT WHERE PAYMENT_TYPE! = 'CASH'
ORDER BY 13;

SELECT * FROM ACCOUNT WHERE NOT(PAYMENT_TYPE = 'CASH')
ORDER BY 13;

-- Statüsü deaktif olan müşterilerin bağlantı kesim tarihleri nedir?
SELECT CUSTOMER_NUM,NAME,SURNAME,DISCONNECTION_DATE FROM customer WHERE STATUS = 'DEACTIVE';

-- Hesap kapanış tarihi dolu olan hesapları bulunuz.
SELECT * FROM ACCOUNT WHERE ACCOUNT_CLOSING_DATE IS NOT NULL ;

-- Elektronik fatura mail adresi (E_bill_email) olan hesaplar hangileridir?
SELECT * FROM account WHERE E_BILL_EMAIL IS NOT NULL ;

-- Sözleşme bitiş tarihi 1 Ocak 2000'den büyük , 1 Ocak 2005'ten küçük olan sözleşmeleri bulunuz.
SELECT * FROM AGREEMENT
WHERE COMMITMENT_END_DATE > '2000/01/01' AND COMMITMENT_END_DATE < '2005/01/01';

SELECT * FROM AGREEMENT
WHERE COMMITMENT_END_DATE BETWEEN '2000/01/01' AND '2005/01/01';

-- Sözleşme bağlantı tarihi Ocak 2010'dan büyük olan sözleşmeleri bulunuz.
SELECT * FROM AGREEMENT WHERE COMMITMENT_START_DATE > '2010/01/01';

-- İsmi E ile başlayan müşterileri bulunuz
SELECT * FROM CUSTOMER WHERE NAME LIKE 'E%';

-- Product tipi 'DSL' ile biten ürünleri bulunuz.
SELECT * FROM PRODUCT WHERE PRODUCT_TYPE LIKE '%DSL';

-- İsminde ya da soyisminde 'ü' harfi geçen müşteriler hangileridir?
SELECT * FROM CUSTOMER WHERE NAME LIKE '%ü%' OR SURNAME LIKE '%ü%';

-- Ülke kodu UK ve AU olan adresleri bulunuz.
SELECT * FROM ADDRESS WHERE COUNTRY_CD = 'UK' OR COUNTRY_CD = 'AU';

-- Taahhüt süresi 240 ve 120 ay olan bütün sözleşmeleri bulmak istiyoruz.
SELECT * FROM AGREEMENT WHERE COMMITMENT_DURATION = '240 MONTHS' OR COMMITMENT_DURATION = '120 MONTHS' ORDER BY 11;

--Sözleşme alt tipi MAIN olan kaç tane sözleşme vardır?
SELECT  COUNT(SUBTYPE) FROM AGREEMENT WHERE SUBTYPE='MAIN';

-- İletişim tipi olarak email ve statusu kullanımda olan kaç müşteri var?
SELECT COUNT(*) FROM ACCOUNT WHERE STATUS = 'ACTIVE' AND E_BILL_EMAIL IS NOT NULL;

-- Deaktif müşterilerin sayısını bulunuz.
SELECT COUNT(STATUS) FROM CUSTOMER WHERE STATUS = 'DEACTIVE';

-- Birincil iletişim bilgisi olmayan telefon numaralarını bulunuz.
SELECT * FROM CONTACT WHERE CNT_TYPE = 'PHONE' AND IS_PRIMARY = 0;

-- 2005 yılından önce yapılan ve hala aktif olan subscriptionlar hangileridir?
SELECT * FROM subscrıption WHERE CREATE_DATE < '01/01/2005' AND STATUS = 'ACTIVE';


--Yılın 4. aylarında en çok hangi amaçla kredi çekilmi?tir?
SELECT COUNT(L.purpose),l.purpose FROM TRANSACTIONS T
INNER JOIN ACCOUNTS A ON T.account_id = A.account_id
INNER JOIN LOANS L ON L.account_id = A.account_id
WHERE L.month = 4
group by l.purpose;

--Hangi yıllarda kaç hesap açılmıştır?
select count(account_id) as Hesap_Numarası ,year as Yıl from accounts group by year order by 2 ;

-- İşlemlerin tiplerine göre toplam sayılarının büyükten küçüğe sıralaması nedir?-
select count(type) as ISLEM_SAYISI, type AS ISLEM_TURU from transactions group by type;

-- İşlemlerin tiplerine göre toplam tutarlarının büyükten küçüğe sıralaması nedir?
select COUNT(BALANCE)AS TOPLAM_TUTAR ,TYPE AS ISLEM_TUR FROM transactions GROUP BY TYPE ORDER BY 1;

-- Bankanın 50 ve ya 51 yaşında kadın müşterilerinden aynı isme sahip olan müşterisi/müşterileri var mı? Varsa isimleri neler?
select COUNT(DISTINCT FIRST),FIRST from clients
where AGE BETWEEN 50 AND 51
AND SEX = 'Female'
GROUP BY FIRST;

--SALES QUERY

-- Birim fiyatı 150'den büyük olan order_itemları bulunuz.
select * from order_items where UNIT_PRICE >150;

-- İşe alım tarihi Mayıs 2016 olan çalışanları bulunuz.
SELECT * FROM EMPLOYEES WHERE HIRE_DATE BETWEEN '01/05/2016' AND '30/05/2016';

-- Adı Charlie ya da Charlsie olan contactları bulunuz.
SELECT * FROM CONTACTS WHERE FIRST_NAME = 'Charlie' OR FIRST_NAME = 'Charlsie' ;

-- Adet sayısı 10dan büyük 50den küçük envanterleri bulunuz.
SELECT * FROM INVENTORIES WHERE QUANTITY > 10 AND QUANTITY<50;

-- Manager'ı olmayan çalışanlar hangileridir?
SELECT * FROM EMPLOYEES WHERE MANAGER_ID IS NULL;

-- State bilgisi boş olan lokasyonları bulunuz.----Sales şeması için
SELECT * FROM LOCATIONS WHERE STATE IS NULL;

--  Durumu iptal olan ve satıcıları olmayan emirler hangileridir? ----Sales şeması için
SELECT * FROM ORDERS WHERE STATUS = 'Canceled' AND SALESMAN_ID IS NULL;

-- Ocak 2016 ile Haziran 2016 arasında verilen siparişler hangileridir? ----Sales şeması için
SELECT * FROM ORDERS WHERE ORDER_DATE BETWEEN '01/01/2016' AND '30/06/2016';

--  Unvanı 'S' ile başlamayan çalışanları bulunuz. ----Sales şeması için.
SELECT * FROM EMPLOYEES WHERE JOB_TITLE NOT LIKE 'S%' ORDER BY job_title;

-- Herhangi bir çeşit Intel Xeon ürünler hangileridir? ----Sales şeması için
SELECT * FROM productS WHERE PRODUCT_NAME LIKE 'Intel Xeon%';

-- İsmi 'C' ile başlayan kontaklar hangileridir? Soyadına göre alfabetik sıra ile sıralayalım. ----Sales şeması için
SELECT * FROM CONTACTS WHERE FIRST_NAME LIKE 'C%' ORDER BY LAST_NAME ;

-- Ürün adı 'Asus' ile başlayan ve liste fiyatı standart ücretinden küçük olan ürünleri bulunuz. ----Sales şeması için
SELECT * FROM PRODUCTS WHERE PRODUCT_NAME LIKE 'Asus%' AND LIST_PRICE < STANDARD_COST ;

-- 1,2,4,5 id'li kategorilerin bilgilerini bulunuz.
SELECT * FROM PRODUCT_CATEGORIES WHERE CATEGORY_ID BETWEEN 1 AND 5;

-- Sipariş durumu 'Shipped'den farklı olan müşterilerin bilgilerini bulunuz. ----Sales şeması için
SELECT * FROM ORDERS WHERE STATUS! = 'Shipped';

-- Adet sayısı 100e eşit olan envanterlerin product bilgisini bulunuz. ----Sales şeması için
SELECT * FROM INVENTORIES I
LEFT JOIN PRODUCTS P
ON I.product_id = P.product_id
WHERE QUANTITY = 100;

-- Beijing (8 numaralı warehouse)'da kaç farklı envanter vardır? ----Sales şeması için
SELECT COUNT(W.WAREHOUSE_ID)AS ENVARTER_KAYIT_SAYISI FROM INVENTORIES I
INNER JOIN WAREHOUSES W
ON I.warehouse_id = W.warehouse_id
WHERE W.WAREHOUSE_ID = 8;

-- Liste fiyati 1000 ile 3000 arasinda olan kaç product var?----Sales şeması için
SELECT * FROM PRODUCTS WHERE LIST_PRICE BETWEEN 1000 AND 3000;

-- Bir siparişte toplam 100.0000'den fazla ücret ödeyen emirler nedir? ----Sales şeması için
SELECT ORDER_ID FROM ORDER_ITEMS
WHERE (QUANTITY * UNIT_PRICE) > 100000
GROUP BY ORDER_ID
ORDER BY 1;
