CREATE OR ALTER TRIGGER bitki_sagligi.tr_ToprakAnalizi_pH_Kontrol
ON bitki_sagligi.ToprakAnalizi
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM inserted WHERE pH < 0 OR pH > 14)
    BEGIN
        RAISERROR('pH 0 ile 14 arasinda olmalidir.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
END;


UPDATE bitki_sagligi.ToprakAnalizi SET pH = 20 WHERE AnalizID = 1;  -- hata + rollback
UPDATE bitki_sagligi.ToprakAnalizi SET pH = 6.8 WHERE AnalizID = 1; -- baþarýlý
