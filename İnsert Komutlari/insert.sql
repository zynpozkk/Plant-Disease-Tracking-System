-- Kullanici tablosu:
-- Sistemi kullanan çiftçiler ve ziraat mühendisleri eklenir.
-- Her kullanýcý benzersiz Email adresine sahiptir.


INSERT INTO bitki_sagligi.Kullanici (AdSoyad, Email, Telefon, Rol)
VALUES
('Ali Yýlmaz','ali1@mail.com','0500000001','Çiftçi'),
('Ayþe Demir','ayse2@mail.com','0500000002','Çiftçi'),
('Mehmet Kaya','mehmet3@mail.com','0500000003','Çiftçi'),
('Fatma Þen','fatma4@mail.com','0500000004','Ziraat Mühendisi'),
('Ahmet Akýn','ahmet5@mail.com','0500000005','Çiftçi'),
('Elif Arslan','elif6@mail.com','0500000006','Çiftçi'),
('Murat Can','murat7@mail.com','0500000007','Çiftçi'),
('Zeynep Koç','zeynep8@mail.com','0500000008','Ziraat Mühendisi'),
('Burak Yýldýz','burak9@mail.com','0500000009','Çiftçi'),
('Cansu Acar','cansu10@mail.com','0500000010','Çiftçi');


-- Lokasyon tablosu:
-- Bitkilerin yetiþtirildiði il ve ilçe bilgileri tutulur.
-- (Il, Ilce) kombinasyonu UNIQUE olacak þekilde tasarlanmýþtýr.

INSERT INTO bitki_sagligi.Lokasyon (Il, Ilce)
VALUES
('Adana','Seyhan'),
('Adana','Yüreðir'),
('Kayseri','Erkilet'),
('Antalya','Manavgat'),
('Mersin','Tarsus'),
('Mersin','Erdemli'),
('Ýzmir','Menemen'),
('Ýzmir','Torbalý'),
('Konya','Meram'),
('Þanlýurfa','Viranþehir');


-- Bitki tablosu:
-- Her bitki bir kullanýcýya (sahibine) ve bir lokasyona baðlýdýr.
-- KullaniciID ve LokasyonID foreign key ile iliþkilidir.



INSERT INTO bitki_sagligi.Bitki (KullaniciID, LokasyonID, Bitki_Adi, Bitki_Bilimsel_Adi)
VALUES
(1,1,'Domates','Solanum lycopersicum'),
(2,2,'Biber','Capsicum annuum'),
(3,3,'Patlýcan','Solanum melongena'),
(4,4,'Salatalýk','Cucumis sativus'),
(5,5,'Kabak','Cucurbita pepo'),
(6,6,'Marul','Lactuca sativa'),
(7,7,'Soðan','Allium cepa'),
(8,8,'Sarýmsak','Allium sativum'),
(9,9,'Havuç','Daucus carota'),
(10,10,'Ispanak','Spinacia oleracea');

-- Patogen tablosu:
-- Bitkilerde hastalýða neden olan mantar ve bakteriler tutulur.
-- (Patogen_Adi, Patogen_Turu) birlikte benzersizdir.


INSERT INTO bitki_sagligi.Patogen (Patogen_Adi, Patogen_Turu)
VALUES
('Phytophthora infestans','Mantar'),
('Xanthomonas','Bakteri'),
('Fusarium oxysporum','Mantar'),
('Alternaria solani','Mantar'),
('Pseudomonas','Bakteri'),
('Rhizoctonia','Mantar'),
('Botrytis','Mantar'),
('Erwinia','Bakteri'),
('Verticillium','Mantar'),
('Ralstonia','Bakteri');


-- Hastalik tablosu:
-- Bir bitki ile bir patojen iliþkilendirilerek hastalýk kaydý oluþturulur.
-- Hastalýðý olmayan bitkiler bu tabloda yer almaz.

INSERT INTO bitki_sagligi.Hastalik (BitkiID, PatogenID, Hastalik_Bilimsel_Adi)
VALUES
(1,1,'Geç Yanýklýk'),
(2,2,'Bakteriyel Leke'),
(3,3,'Solgunluk'),
(4,4,'Yaprak Lekesi'),
(5,5,'Külleme'),
(6,6,'Kök Çürüklüðü'),
(7,7,'Gri Küf'),
(8,8,'Yumuþak Çürüklük'),
(9,9,'Damar Kararmasý'),
(10,10,'Bakteriyel Solgunluk');

-- Tedavi tablosu:
-- Her hastalýk için uygulanan tedavi yöntemi ve süresi tutulur.


INSERT INTO bitki_sagligi.Tedavi (HastalikID, Tedavi_Yontemi, Tedavi_Suresi)
VALUES
(1,'Fungisit',14),
(2,'Bakýr Ýlacý',10),
(3,'Toprak Islahý',20),
(4,'Biyolojik Mücadele',15),
(5,'Kükürt',12),
(6,'Toprak Dezenfeksiyonu',18),
(7,'Ýlaçlama',10),
(8,'Hijyen',7),
(9,'Besin Takviyesi',14),
(10,'Antibakteriyel',16);

-- VakaKaydi tablosu:
-- Bir kullanýcýnýn bitkisi için uygulanan tedavi kayýt altýna alýnýr.
-- Bu tablo, sistemdeki hastalýk vakalarýný temsil eder.


INSERT INTO bitki_sagligi.VakaKaydi (KullaniciID, BitkiID, TedaviID)
VALUES
(1,1,1),
(2,2,2),
(3,3,3),
(4,4,4),
(5,5,5),
(6,6,6),
(7,7,7),
(8,8,8),
(9,9,9),
(10,10,10);

-- Bu bitkiler sisteme eklenmiþtir ancak henüz hastalýk kaydý yoktur.
-- Bu sayede "hasta olmayan bitkiler" sorgularý yapýlabilir.



INSERT INTO bitki_sagligi.Bitki (KullaniciID, LokasyonID, Bitki_Adi, Bitki_Bilimsel_Adi)
VALUES
(6, 6, 'Roka', 'Eruca sativa'),
(7, 7, 'Dereotu', 'Anethum graveolens'),
(8, 8, 'Maydanoz', 'Petroselinum crispum'),
(9, 9, 'Reyhan', 'Ocimum basilicum'),
(10,10,'Tere', 'Lepidium sativum');





-- Her bitki için bir bölge tanýmý
INSERT INTO bitki_sagligi.BitkiBolgesi (BitkiID, Bitki_Bolge_Adi)
VALUES
(1, 'Tarla-1'),
(2, 'Tarla-2'),
(3, 'Tarla-3');


INSERT INTO bitki_sagligi.BitkiBolgesi (BitkiID, Bitki_Bolge_Adi)
VALUES
(1, 'Gövde'),
(1, 'Kök'),
(2, 'Kök'),
(3, 'Gövde');


INSERT INTO bitki_sagligi.ToprakAnalizi (BolgeID, pH, Azot, Fosfor, Potasyum)
VALUES
(1, 6.5, 2.1, 1.3, 2.0),
(2, 6.8, 2.4, 1.5, 2.2),
(3, 7.0, 1.9, 1.2, 1.8),
(4, 6.6, 2.0, 1.4, 2.1);




-- 1. rapor
-- VakaID = 1
-- AnalizID = 11
-- Raporu oluþturan = KullaniciID 4 (Fatma Þen)

INSERT INTO bitki_sagligi.Rapor (VakaID, AnalizID, KullaniciID)
VALUES (1, 11, 4);


-- 2. rapor
-- VakaID = 2
-- AnalizID = 12
-- Raporu oluþturan = KullaniciID 8 (Zeynep Koç)

INSERT INTO bitki_sagligi.Rapor (VakaID, AnalizID, KullaniciID)
VALUES (2, 12, 8);








