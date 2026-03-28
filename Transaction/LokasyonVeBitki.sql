BEGIN TRY
    BEGIN TRANSACTION

    INSERT INTO bitki_sagligi.Lokasyon (Il, Ilce)
    VALUES ('TestIl', CONCAT('TestIlce_', LEFT(CONVERT(VARCHAR(36), NEWID()), 8)));

    DECLARE @YeniLokasyonID INT = SCOPE_IDENTITY();

    INSERT INTO bitki_sagligi.Bitki (KullaniciID, LokasyonID, Bitki_Adi, Bitki_Bilimsel_Adi)
    VALUES (1, @YeniLokasyonID, 'Test Bitki', 'Testus bitkius');

    COMMIT;

    SELECT 'COMMIT' AS Durum, @YeniLokasyonID AS LokasyonID;

END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0 ROLLBACK;
    SELECT 'ROLLBACK' AS Durum, ERROR_MESSAGE() AS HataMesaji;
END CATCH;

SELECT TOP 5 *
FROM bitki_sagligi.Lokasyon
ORDER BY LokasyonID DESC;

SELECT TOP 5 *
FROM bitki_sagligi.Bitki
ORDER BY BitkiID DESC;


BEGIN TRY
    BEGIN TRANSACTION;

    INSERT INTO bitki_sagligi.Lokasyon (Il, Ilce)
    VALUES ('TestIl', CONCAT('HATA_', LEFT(CONVERT(VARCHAR(36), NEWID()), 8)));

    DECLARE @YeniLokasyonID INT = SCOPE_IDENTITY();

    INSERT INTO bitki_sagligi.Bitki (KullaniciID, LokasyonID, Bitki_Adi, Bitki_Bilimsel_Adi)
    VALUES (999999, @YeniLokasyonID, 'Test Bitki', 'Testus bitkius');

    COMMIT;

END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0 ROLLBACK;
    SELECT 'ROLLBACK' AS Durum, ERROR_MESSAGE() AS HataMesaji;
END CATCH;



SELECT TOP 5 *
FROM bitki_sagligi.Lokasyon
WHERE Ilce LIKE 'HATA_%'
ORDER BY LokasyonID DESC;

     