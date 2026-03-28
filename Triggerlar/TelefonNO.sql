CREATE OR ALTER TRIGGER bitki_sagligi.tr_Kullanici_Telefon_11Hane_Kontrol
ON bitki_sagligi.Kullanici
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE Telefon IS NOT NULL
          AND LEN(Telefon) <> 11
    )
    BEGIN
        PRINT 'HATA: Telefon numarasi 11 haneli olmalidir.';
        ROLLBACK;
        RETURN;
    END
END;

UPDATE bitki_sagligi.Kullanici SET Telefon = '0532111223'  WHERE KullaniciID = 1; --10 Tane

UPDATE bitki_sagligi.Kullanici SET Telefon = '05321112233' WHERE KullaniciID = 1; -- 11 hane
