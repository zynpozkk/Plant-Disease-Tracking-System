-- =============================================
-- Amaç: Sistemde kayıtlı tüm bitkileri listelemek
-- =============================================
CREATE PROCEDURE bitki_sagligi.sp_TumBitkileriGetir
AS
BEGIN
    SELECT
        b.BitkiID,
        b.Bitki_Adi,
        b.Bitki_Bilimsel_Adi
    FROM bitki_sagligi.Bitki b;
END;

EXEC bitki_sagligi.sp_TumBitkileriGetir;

-- ======================================================
-- Amaç: Girilen KullaniciID'ye ait bitkileri listelemek
-- ======================================================
CREATE PROCEDURE bitki_sagligi.sp_KullaniciBitkileriGetir
    @KullaniciID INT
AS
BEGIN
    SELECT
        b.BitkiID,
        b.Bitki_Adi,
        b.Bitki_Bilimsel_Adi
    FROM bitki_sagligi.Bitki b
    WHERE b.KullaniciID = @KullaniciID;
END;

EXEC bitki_sagligi.sp_KullaniciBitkileriGetir @KullaniciID = 15;

-- ==========================================================
-- Amaç: Henüz hastalık kaydı bulunmayan (sağlıklı) bitkileri
--        listelemek
-- ==========================================================
CREATE PROCEDURE bitki_sagligi.sp_SaglikliBitkileriGetir
AS
BEGIN
    SELECT
        b.BitkiID,
        b.Bitki_Adi
    FROM bitki_sagligi.Bitki b
    LEFT JOIN bitki_sagligi.Hastalik h
        ON h.BitkiID = b.BitkiID
    WHERE h.HastalikID IS NULL;
END;

EXEC bitki_sagligi.sp_SaglikliBitkileriGetir;


-- ==========================================================
-- Amaç: Yeni bir rapor kaydı eklemek
-- Parametreler:
--   @VakaID      → İlgili vaka kaydı
--   @AnalizID    → Kullanılan toprak analizi
--   @KullaniciID → Raporu oluşturan kullanıcı
-- Kullanım Alanı:
--  - Rapor oluşturma işlemleri
-- ==========================================================
CREATE PROCEDURE bitki_sagligi.sp_RaporEkle
    @VakaID INT,
    @AnalizID INT,
    @KullaniciID INT
AS
BEGIN
    INSERT INTO bitki_sagligi.Rapor (VakaID, AnalizID, KullaniciID)
    VALUES (@VakaID, @AnalizID, @KullaniciID);
END;

EXEC bitki_sagligi.sp_RaporEkle 
     @VakaID = 1,
     @AnalizID = 11,
     @KullaniciID = 4;


-- ==========================================================
-- Amaç: Bitkinin hasar görülen bölgesine ait analiz sonuçlarını
--        detaylı şekilde listelemek
-- Kullanım Alanı:
--  - Teknik analiz
--  - Akademik raporlar
-- ==========================================================
CREATE PROCEDURE bitki_sagligi.sp_BolgeBazliAnalizler
AS
BEGIN
    SELECT
        b.Bitki_Adi,
        bb.Bitki_Bolge_Adi,
        ta.pH,
        ta.Azot,
        ta.Fosfor,
        ta.Potasyum
    FROM bitki_sagligi.ToprakAnalizi ta
    JOIN bitki_sagligi.BitkiBolgesi bb
        ON bb.BolgeID = ta.BolgeID
    JOIN bitki_sagligi.Bitki b
        ON b.BitkiID = bb.BitkiID;
END;

EXEC bitki_sagligi.sp_BolgeBazliAnalizler;



-- ==========================================================
-- sp_RiskSkorluRaporlar
-- Amaç:
--   Rapor + Vaka + Hastalık + Tedavi + ToprakAnalizi bilgilerini
--   birleştirip basit kurallarla "RiskSkoru" ve "RiskSeviyesi"
--   üretmek.

-- Basit risk kuralları (örnek):
--   pH < 5.5 veya pH > 7.5         => +2 puan
--   Azot < 1.8                     => +1 puan
--   Fosfor < 1.2                   => +1 puan
--   Potasyum < 1.9                 => +1 puan
--   Tedavi süresi > 14 gün         => +1 puan
--
-- RiskSeviyesi:
--   0-1  => Düşük
--   2-3  => Orta
--   4+   => Yüksek
-- ==========================================================
CREATE PROCEDURE bitki_sagligi.sp_RiskSkorluRaporlar
AS
BEGIN
    SELECT
        r.RaporID,
        k.AdSoyad AS RaporuHazirlayan,
        b.Bitki_Adi,
        h.Hastalik_Bilimsel_Adi,
        t.Tedavi_Yontemi,
        t.Tedavi_Suresi,
        ta.pH,
        ta.Azot,
        ta.Fosfor,
        ta.Potasyum,

        -- RiskSkoru hesaplama
        (
            CASE WHEN ta.pH < 5.5 OR ta.pH > 7.5 THEN 2 ELSE 0 END +
            CASE WHEN ta.Azot IS NOT NULL AND ta.Azot < 1.8 THEN 1 ELSE 0 END +
            CASE WHEN ta.Fosfor IS NOT NULL AND ta.Fosfor < 1.2 THEN 1 ELSE 0 END +
            CASE WHEN ta.Potasyum IS NOT NULL AND ta.Potasyum < 1.9 THEN 1 ELSE 0 END +
            CASE WHEN t.Tedavi_Suresi > 14 THEN 1 ELSE 0 END
        ) AS RiskSkoru,

        -- RiskSeviyesi sınıflandırma
        CASE
            WHEN (
                CASE WHEN ta.pH < 5.5 OR ta.pH > 7.5 THEN 2 ELSE 0 END +
                CASE WHEN ta.Azot IS NOT NULL AND ta.Azot < 1.8 THEN 1 ELSE 0 END +
                CASE WHEN ta.Fosfor IS NOT NULL AND ta.Fosfor < 1.2 THEN 1 ELSE 0 END +
                CASE WHEN ta.Potasyum IS NOT NULL AND ta.Potasyum < 1.9 THEN 1 ELSE 0 END +
                CASE WHEN t.Tedavi_Suresi > 14 THEN 1 ELSE 0 END
            ) >= 4 THEN 'Yüksek'
            WHEN (
                CASE WHEN ta.pH < 5.5 OR ta.pH > 7.5 THEN 2 ELSE 0 END +
                CASE WHEN ta.Azot IS NOT NULL AND ta.Azot < 1.8 THEN 1 ELSE 0 END +
                CASE WHEN ta.Fosfor IS NOT NULL AND ta.Fosfor < 1.2 THEN 1 ELSE 0 END +
                CASE WHEN ta.Potasyum IS NOT NULL AND ta.Potasyum < 1.9 THEN 1 ELSE 0 END +
                CASE WHEN t.Tedavi_Suresi > 14 THEN 1 ELSE 0 END
            ) BETWEEN 2 AND 3 THEN 'Orta'
            ELSE 'Düşük'
        END AS RiskSeviyesi

    FROM bitki_sagligi.Rapor r
    JOIN bitki_sagligi.Kullanici k ON k.KullaniciID = r.KullaniciID
    JOIN bitki_sagligi.VakaKaydi vk ON vk.VakaID = r.VakaID
    JOIN bitki_sagligi.Bitki b ON b.BitkiID = vk.BitkiID
    JOIN bitki_sagligi.Tedavi t ON t.TedaviID = vk.TedaviID
    JOIN bitki_sagligi.Hastalik h ON h.HastalikID = t.HastalikID
    JOIN bitki_sagligi.ToprakAnalizi ta ON ta.AnalizID = r.AnalizID
    ORDER BY RiskSkoru DESC, r.RaporID;
END;

EXEC bitki_sagligi.sp_RiskSkorluRaporlar;


