CREATE OR ALTER TRIGGER bitki_sagligi.tr_Kullanici_Email_Kontrol
ON bitki_sagligi.Kullanici
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE Email NOT LIKE '%@%'
    )
    BEGIN
        PRINT 'HATA: Gecersiz e-mail adresi. E-mail alaninda @ karakteri bulunmalidir.';
        ROLLBACK;
        RETURN;
    END
END;

UPDATE bitki_sagligi.Kullanici SET Email = 'ahmetmail.com' WHERE KullaniciID = 1;

UPDATE bitki_sagligi.Kullanici SET Email = 'ahmet@mail.com' WHERE KullaniciID = 1;

INSERT INTO bitki_sagligi.Kullanici (AdSoyad, Email, Rol)
VALUES ('Test Kullanici', 'testmail.com', 'Ciftci');



