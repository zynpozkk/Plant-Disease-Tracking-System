BEGIN TRY
    BEGIN TRANSACTION;

    DECLARE 
        @HastalikID INT = 1,   -- Var olan bir HastalikID olmalý
        @TedaviYontemi VARCHAR(100) = 'Fungisit uygulamasi',
        @TedaviSuresi INT = 14;

    -- 1) Tedavi kaydý ekle
    INSERT INTO bitki_sagligi.Tedavi (HastalikID, Tedavi_Yontemi, Tedavi_Suresi)
    VALUES (@HastalikID, @TedaviYontemi, @TedaviSuresi);

    DECLARE @YeniTedaviID INT = SCOPE_IDENTITY();

    -- 2) Tedaviye baðlý ilaç kayýtlarýný ekle
    INSERT INTO bitki_sagligi.Ilac (TedaviID, Ilac_Adi, Ilac_Dozaji)
    VALUES
        (@YeniTedaviID, 'Bakirli ilac', '2 ml/L'),
        (@YeniTedaviID, 'Koruyucu sprey', '1 ml/L');

    COMMIT TRANSACTION;

    SELECT 
        'COMMIT edildi' AS Durum,
        @YeniTedaviID AS OlusanTedaviID;

END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    SELECT 
        'ROLLBACK yapildi' AS Durum,
        ERROR_NUMBER() AS HataNo,
        ERROR_MESSAGE() AS HataMesaji;
END CATCH;



SELECT TOP 5 *
FROM bitki_sagligi.Tedavi
ORDER BY TedaviID DESC;

SELECT TOP 10 *
FROM bitki_sagligi.Ilac
ORDER BY IlacID DESC;


BEGIN TRY
    BEGIN TRANSACTION;

    DECLARE 
        @HastalikID INT = 999999, -- Bilerek hatalý verildi
        @TedaviYontemi VARCHAR(100) = 'Deneme tedavisi',
        @TedaviSuresi INT = 7;

    INSERT INTO bitki_sagligi.Tedavi (HastalikID, Tedavi_Yontemi, Tedavi_Suresi)
    VALUES (@HastalikID, @TedaviYontemi, @TedaviSuresi);

    DECLARE @YeniTedaviID INT = SCOPE_IDENTITY();

    INSERT INTO bitki_sagligi.Ilac (TedaviID, Ilac_Adi, Ilac_Dozaji)
    VALUES (@YeniTedaviID, 'Test ilaci', '1 ml/L');

    COMMIT TRANSACTION;

END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    SELECT 
        'ROLLBACK yapildi' AS Durum,
        ERROR_NUMBER() AS HataNo,
        ERROR_MESSAGE() AS HataMesaji;
END CATCH;

--ROLLBACK KONTOLÜ

SELECT TOP 10 *
FROM bitki_sagligi.Tedavi
ORDER BY TedaviID DESC;
