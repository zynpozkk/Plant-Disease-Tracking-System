
-- Kullanici tablosu:
INSERT INTO bitki_sagligi.Kullanici (AdSoyad, Email, Telefon, Rol) VALUES
('Ahmet Yýlmaz','ahmet1@mail.com','0500000001','Çiftçi'),
('Mehmet Kaya','mehmet2@mail.com','0500000002','Ziraat Mühendisi'),
('Ayþe Demir','ayse3@mail.com','0500000003','Tarým Danýþmaný'),
('Fatma Þahin','fatma4@mail.com','0500000004','Üretici'),
('Ali Can','ali5@mail.com','0500000005','Sistem Yöneticisi'),
('Hasan Ak','hasan6@mail.com','0500000006','Çiftçi'),
('Zeynep Arslan','zeynep7@mail.com','0500000007','Üretici'),
('Murat Koç','murat8@mail.com','0500000008','Ziraat Mühendisi'),
('Elif Yýldýz','elif9@mail.com','0500000009','Tarým Danýþmaný'),
('Kemal Öz','kemal10@mail.com','0500000010','Çiftçi'),
('Burak Aydýn','burak11@mail.com','0500000011','Üretici'),
('Cem Doðan','cem12@mail.com','0500000012','Çiftçi'),
('Ece Korkmaz','ece13@mail.com','0500000013','Tarým Danýþmaný'),
('Serkan Uslu','serkan14@mail.com','0500000014','Ziraat Mühendisi'),
('Derya Polat','derya15@mail.com','0500000015','Üretici'),
('Tolga Kurt','tolga16@mail.com','0500000016','Çiftçi'),
('Nazan Acar','nazan17@mail.com','0500000017','Sistem Yöneticisi'),
('Onur Þimþek','onur18@mail.com','0500000018','Sistem Yöneticisi'),
('Hakan Yalçýn','hakan19@mail.com','0500000019','Çiftçi'),
('Selin Er','selin20@mail.com','0500000020','Tarým Danýþmaný'),
('Emre Kar','emre21@mail.com','0500000021','Üretici'),
('Berk Güneþ','berk22@mail.com','0500000022','Çiftçi'),
('Seda Mutlu','seda23@mail.com','0500000023','Ziraat Mühendisi'),
('Volkan Iþýk','volkan24@mail.com','0500000024','Çiftçi'),
('Merve Toprak','merve25@mail.com','0500000025','Üretici');


--Lokasyon Tablosu

INSERT INTO bitki_sagligi.Lokasyon (Il, Ilce) VALUES
('Adana','Seyhan'),('Adana','Yüreðir'),('Mersin','Tarsus'),
('Antalya','Serik'),('Konya','Meram'),('Konya','Selçuklu'),
('Manisa','Akhisar'),('Ýzmir','Tire'),('Ýzmir','Ödemiþ'),
('Aydýn','Nazilli'),('Bursa','Karacabey'),('Balýkesir','Edremit'),
('Çanakkale','Biga'),('Tekirdað','Malkara'),('Samsun','Bafra'),
('Tokat','Erbaa'),('Kayseri','Develi'),('Sivas','Þarkýþla'),
('Malatya','Battalgazi'),('Elazýð','Merkez'),
('Þanlýurfa','Harran'),('Gaziantep','Nizip'),
('Diyarbakýr','Bismil'),('Mardin','Kýzýltepe'),
('Hatay','Kýrýkhan');

--Bitki Tablosu

INSERT INTO bitki_sagligi.Bitki (KullaniciID, LokasyonID, Bitki_Adi, Bitki_Bilimsel_Adi) VALUES
(1,1,'Buðday','Triticum aestivum'),
(2,2,'Mýsýr','Zea mays'),
(3,3,'Domates','Solanum lycopersicum'),
(4,4,'Biber','Capsicum annuum'),
(5,5,'Patates','Solanum tuberosum'),
(6,6,'Pamuk','Gossypium hirsutum'),
(7,7,'Zeytin','Olea europaea'),
(8,8,'Üzüm','Vitis vinifera'),
(9,9,'Elma','Malus domestica'),
(10,10,'Arpa','Hordeum vulgare'),
(11,11,'Ayçiçeði','Helianthus annuus'),
(12,12,'Soðan','Allium cepa'),
(13,13,'Sarýmsak','Allium sativum'),
(14,14,'Pirinç','Oryza sativa'),
(15,15,'Kavun','Cucumis melo'),
(16,16,'Karpuz','Citrullus lanatus'),
(17,17,'Nohut','Cicer arietinum'),
(18,18,'Mercimek','Lens culinaris'),
(19,19,'Fasulye','Phaseolus vulgaris'),
(20,20,'Çilek','Fragaria × ananassa'),
(21,21,'Pamuk','Gossypium'),
(22,22,'Limon','Citrus limon'),
(23,23,'Portakal','Citrus sinensis'),
(24,24,'Mandalina','Citrus reticulata'),
(25,25,'Nar','Punica granatum');

--Bitkilerin Hasarlý Bölgesinin Olduðu Tablo

INSERT INTO bitki_sagligi.BitkiBolgesi (BitkiID, Bitki_Bolge_Adi) VALUES
(1,'Yaprak'),(2,'Gövde'),(3,'Kök'),(4,'Yaprak'),
(5,'Gövde'),(6,'Kök'),(7,'Yaprak'),(8,'Gövde'),
(9,'Kök'),(10,'Yaprak'),(11,'Gövde'),(12,'Kök'),
(13,'Yaprak'),(14,'Gövde'),(15,'Kök'),
(16,'Yaprak'),(17,'Gövde'),(18,'Kök'),
(19,'Yaprak'),(20,'Gövde'),(21,'Kök'),
(22,'Yaprak'),(23,'Gövde'),(24,'Kök'),
(25,'Yaprak');


--Bölgenin Toprak Analizi Tablosu

INSERT INTO bitki_sagligi.ToprakAnalizi (BolgeID, pH, Azot, Fosfor, Potasyum) VALUES
(1,6.5,2.1,1.3,2.0),(2,6.8,2.3,1.5,2.2),
(3,7.0,1.9,1.2,1.8),(4,6.6,2.0,1.4,2.1),
(5,6.7,2.2,1.6,2.3),(6,6.4,1.8,1.1,1.7),
(7,6.9,2.4,1.7,2.4),(8,7.1,2.0,1.3,2.0),
(9,6.3,1.7,1.0,1.6),(10,6.8,2.1,1.4,2.2),
(11,7.0,2.5,1.8,2.6),(12,6.6,2.0,1.3,2.1),
(13,6.9,2.3,1.6,2.4),(14,7.2,2.6,1.9,2.7),
(15,6.5,1.9,1.2,1.9),
(16,6.7,2.2,1.5,2.3),(17,6.8,2.1,1.4,2.2),
(18,6.4,1.8,1.1,1.7),(19,7.0,2.4,1.7,2.5),
(20,6.6,2.0,1.3,2.1),
(21,6.9,2.3,1.6,2.4),(22,7.1,2.5,1.8,2.6),
(23,6.7,2.1,1.4,2.2),(24,6.8,2.2,1.5,2.3),
(25,7.0,2.4,1.7,2.5);

--Patogen Tablosu

INSERT INTO bitki_sagligi.Patogen (Patogen_Adi, Patogen_Turu) VALUES
('Fusarium','Mantar'),('Phytophthora','Mantar'),
('Pseudomonas','Bakteri'),('Xanthomonas','Bakteri'),
('CMV','Virüs'),('TMV','Virüs'),
('Alternaria','Mantar'),('Rhizoctonia','Mantar'),
('Erwinia','Bakteri'),('PVY','Virüs'),
('Botrytis','Mantar'),('Verticillium','Mantar'),
('Agrobacterium','Bakteri'),('TSWV','Virüs'),
('Oidium','Mantar'),('Puccinia','Mantar'),
('Clavibacter','Bakteri'),('SMV','Virüs'),
('Colletotrichum','Mantar'),('Ralstonia','Bakteri'),
('BYDV','Virüs'),('Sclerotinia','Mantar'),
('Dickeya','Bakteri'),('TYLCV','Virüs'),
('Ustilago','Mantar');


--Hastalik Tablosu

INSERT INTO bitki_sagligi.Hastalik (BitkiID, PatogenID, Hastalik_Bilimsel_Adi) VALUES
(1,1,'Fusarium Solgunluðu'),
(2,2,'Kök Çürüklüðü'),
(3,7,'Yaprak Lekesi'),
(4,11,'Gri Küf'),
(5,8,'Kök Çürüklüðü'),
(6,16,'Pas Hastalýðý'),
(7,15,'Külleme'),
(8,19,'Antraknoz'),
(9,12,'Solgunluk'),
(10,25,'Sürme'),
(11,22,'Beyaz Çürüklük'),
(12,9,'Yumuþak Çürüklük'),
(13,3,'Bakteriyel Yanýklýk'),
(14,14,'Bronzlaþma'),
(15,5,'Mozaik'),
(16,10,'Virüs Hastalýðý'),
(17,18,'Mozaik'),
(18,20,'Bakteriyel Solgunluk'),
(19,17,'Yanýklýk'),
(20,24,'Sararma');

--Tedavi Tablosu

INSERT INTO bitki_sagligi.Tedavi (HastalikID, Tedavi_Yontemi, Tedavi_Suresi) VALUES
(1,'Fungisit',14),(2,'Toprak Drenajý',10),
(3,'Ýlaçlama',7),(4,'Fungisit',10),
(5,'Toprak Dezenfeksiyonu',14),(6,'Ýlaçlama',7),
(7,'Kükürt',10),(8,'Fungisit',12),
(9,'Hijyen',8),(10,'Ýlaçlama',10),
(11,'Fungisit',14),(12,'Bakterisit',7),
(13,'Bakýrlý Ýlaç',10),(14,'Ýlaçlama',7),
(15,'Zararlý Kontrolü',10),(16,'Ýlaçlama',7),
(17,'Virüs Kontrolü',14),(18,'Toprak Ýyileþtirme',12),
(19,'Ýlaçlama',8),(20,'Besin Takviyesi',10),
(1,'Fungisit+',14),(2,'Drenaj+',10),
(3,'Ýlaç+',7),(4,'Fungisit+',10),
(5,'Dezenfeksiyon+',14);


--Ýlaç Tablosu

INSERT INTO bitki_sagligi.Ilac (TedaviID, Ilac_Adi, Ilac_Dozaji) VALUES
(1,'Fusil','2 ml/L'),(2,'RootFix','3 ml/L'),
(3,'LeafStop','1.5 ml/L'),(4,'BotryClean','2 ml/L'),
(5,'SoilCare','4 ml/L'),(6,'RustOff','2 ml/L'),
(7,'SulfurMax','3 g/L'),(8,'AnthraStop','2 ml/L'),
(9,'CleanSoil','—'),(10,'SeedProtect','1 ml/L'),
(11,'WhiteGuard','2 ml/L'),(12,'BactoKill','2 ml/L'),
(13,'CopperPlus','2.5 ml/L'),(14,'VirusStop','1 ml/L'),
(15,'MosaicFix','2 ml/L'),(16,'ViroClean','1 ml/L'),
(17,'MozaFix','2 ml/L'),(18,'WiltStop','3 ml/L'),
(19,'BurnAway','2 ml/L'),(20,'NutriBoost','5 ml/L'),
(21,'ExtraFungi','2 ml/L'),(22,'DrainMax','—'),
(23,'LeafExtra','1 ml/L'),(24,'FungiPlus','2 ml/L'),
(25,'SoilMax','4 ml/L');


--VakaKaydi Tablosu 

INSERT INTO bitki_sagligi.VakaKaydi (KullaniciID, BitkiID, TedaviID) VALUES
(1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),
(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),
(11,11,11),(12,12,12),(13,13,13),(14,14,14),
(15,15,15),(16,16,16),(17,17,17),(18,18,18),
(19,19,19),(20,20,20);

--Rapor Tablosu

INSERT INTO bitki_sagligi.Rapor (VakaID, AnalizID, KullaniciID) VALUES
(1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),
(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),
(11,11,11),(12,12,12),(13,13,13),(14,14,14),
(15,15,15),(16,16,16),(17,17,17),(18,18,18),
(19,19,19),(20,20,20),
(1,21,21),(2,22,22),(3,23,23),(4,24,24),(5,25,25);

--Sulama Ve Gübreleme Tablosu

INSERT INTO bitki_sagligi.SulamaGubreleme (BitkiID, Gubre_Turu, Gubre_Dozu, Uygulama_Suresi) VALUES
(1,'Azotlu',2.5,30),(2,'Fosforlu',3.0,25),
(3,'Potasyumlu',2.0,20),(4,'Organik',4.0,35),
(5,'Kompoze',3.5,30),(6,'Azotlu',2.8,28),
(7,'Organik',4.2,40),(8,'Potasyumlu',2.3,22),
(9,'Fosforlu',3.1,26),(10,'Azotlu',2.6,29),
(11,'Organik',4.0,35),(12,'Kompoze',3.5,30),
(13,'Potasyumlu',2.4,23),(14,'Azotlu',2.9,27),
(15,'Fosforlu',3.0,25),(16,'Organik',4.1,38),
(17,'Kompoze',3.6,32),(18,'Azotlu',2.7,28),
(19,'Potasyumlu',2.5,24),(20,'Organik',4.3,40),
(21,'Fosforlu',3.2,26),(22,'Azotlu',2.8,29),
(23,'Kompoze',3.7,33),(24,'Organik',4.0,36),
(25,'Potasyumlu',2.6,25);


--Bir Kullanici birden fazla bitki Eklemek isterse ?

INSERT INTO bitki_sagligi.Bitki 
(KullaniciID, LokasyonID, Bitki_Adi, Bitki_Bilimsel_Adi) VALUES
-- KullaniciID = 1 (Ahmet Yýlmaz)
(1, 2, 'Arpa', 'Hordeum vulgare'),
(1, 3, 'Yulaf', 'Avena sativa'),

-- KullaniciID = 2 (Mehmet Kaya)
(2, 4, 'Soðan', 'Allium cepa'),
(2, 5, 'Sarýmsak', 'Allium sativum'),

-- KullaniciID = 3 (Ayþe Demir)
(3, 6, 'Patlýcan', 'Solanum melongena'),

-- KullaniciID = 5 (Ali Can)
(5, 7, 'Ayçiçeði', 'Helianthus annuus'),
(5, 8, 'Kanola', 'Brassica napus'),

-- KullaniciID = 7 (Zeynep Arslan)
(7, 9, 'Ýncir', 'Ficus carica'),

-- KullaniciID = 10 (Kemal Öz)
(10, 10, 'Buðday (Kýþlýk)', 'Triticum aestivum'),

-- KullaniciID = 15 (Derya Polat)
(15, 11, 'Kabak', 'Cucurbita pepo'),
(15, 12, 'Salatalýk', 'Cucumis sativus');


