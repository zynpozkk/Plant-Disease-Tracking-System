# 🌿 Bitki Hastalıkları Takip Sistemi (Veritabanı Yönetimi)

[![SQL Server](https://img.shields.io/badge/SQL%20Server-2022-red.svg)](https://www.microsoft.com/sql-server)
[![Database](https://img.shields.io/badge/Database-Relational-blue.svg)]()
[![Normalization](https://img.shields.io/badge/Normalization-BCNF-green.svg)]()

## 📌 Proje Hakkında
Bu proje, tarımsal verimliliği artırmak ve bitki sağlığını dijital ortamda takip etmek amacıyla geliştirilmiş, ilişkisel bir veritabanı yönetim sistemidir. Veritabanı mimarisi, veri tekrarını önlemek ve tutarlılığı sağlamak amacıyla **BCNF (Boyce-Codd Normal Form)** kurallarına göre tasarlanmıştır.

---

## 🏗️ Veritabanı Mimarisi ve Teknik Detaylar

Proje içeriği, ileri seviye SQL yetkinliklerini gösteren şu modüllerden oluşmaktadır:

* **⚡ Triggerlar:** Veri girişlerinde otomatik kontrol sağlayan (pH değeri, telefon formatı, e-posta doğrulama vb.) tetikleyiciler.
* **📂 Saklı Yordamlar (Stored Procedures):** Karmaşık sorguları optimize eden ve performansı artıran önceden derlenmiş prosedürler.
* **🔄 Transactions:** Veri bütünlüğünü korumak adına birden fazla işlemin "ya hep ya hiç" prensibiyle yönetilmesi.
* **🛠️ Normalizasyon:** Veritabanının BCNF formuna getirilmesi için hazırlanan dönüşüm komutları.
* **🔍 Gelişmiş Sorgular:** Sulama takibi, bölge bazlı hastalık raporlama ve kullanıcı rollerini yöneten kompleks sorgu yapıları.

---

## 📂 Klasör Yapısı

* `/BCNFHALE GETIRME KOMUTU/`: Veritabanı normalizasyon süreci.
* `/Triggerlar/`: Veri bütünlüğü kısıtlamaları.
* `/SakliYordamlar/`: Veritabanı iş mantığı prosedürleri.
* `/queries/`: Hazır raporlama ve analiz sorguları.

---

## 🛠️ Kullanılan Teknolojiler
* **RDBMS:** Microsoft SQL Server
* **Dil:** T-SQL (Transact-SQL)
* **Tasarım:** ER Diyagramı ve İlişkisel Şema

---

## 🤝 İletişim
**Zeynep Özkök**
* **Üniversite:** Fırat Üniversitesi - Bilgisayar Mühendisliği 3. Sınıf
* **LinkedIn:** [linkedin.com/in/zynpozkk](https://www.linkedin.com/in/zynpozkk)

---
*Bu proje, Veritabanı Sistemleri dersi kapsamında mühendislik prensiplerine uygun olarak geliştirilmiştir.*
