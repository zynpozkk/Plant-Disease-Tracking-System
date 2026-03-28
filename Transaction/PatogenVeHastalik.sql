SET NOCOUNT ON;

DECLARE @Durum VARCHAR(10);
DECLARE @PatogenID INT;

BEGIN TRY
    BEGIN TRANSACTION;

    INSERT INTO bitki_sagligi.Patogen (Patogen_Adi, Patogen_Turu)
    VALUES ('COMMIT_PATOGEN_002', 'Mantar');

    SET @PatogenID = SCOPE_IDENTITY();

    COMMIT TRANSACTION;
    SET @Durum = 'COMMIT';

END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
    SET @Durum = 'ROLLBACK';
END CATCH;

SELECT @Durum AS Durum, @PatogenID AS PatogenID;


SELECT *
FROM bitki_sagligi.Patogen
WHERE Patogen_Adi = 'COMMIT_PATOGEN_002';



SET NOCOUNT ON;

DECLARE @Durum VARCHAR(10);
DECLARE @PatogenID INT;

BEGIN TRY
    BEGIN TRANSACTION;

    INSERT INTO bitki_sagligi.Patogen (Patogen_Adi, Patogen_Turu)
    VALUES ('HATA_PATOGEN_003', 'Mantar');

    SET @PatogenID = SCOPE_IDENTITY();

    -- KASITLI HATA
    THROW 51010, 'Test icin bilincli hata (ROLLBACK senaryosu).', 1;

    COMMIT TRANSACTION;
    SET @Durum = 'COMMIT';

END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
    SET @Durum = 'ROLLBACK';
END CATCH;

SELECT @Durum AS Durum, @PatogenID AS PatogenID;


SELECT *
FROM bitki_sagligi.Patogen
WHERE Patogen_Adi = 'HATA_PATOGEN_003';

