CREATE OR ALTER TRIGGER bitki_sagligi.tr_Tedavi_Sure_Kontrol
ON bitki_sagligi.Tedavi
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE Tedavi_Suresi < 0
    )
    BEGIN
        ROLLBACK;
        RETURN;
    END
END;



UPDATE bitki_sagligi.Tedavi SET Tedavi_Suresi = 10 WHERE TedaviID = 1;

UPDATE bitki_sagligi.Tedavi SET Tedavi_Suresi = -5 WHERE TedaviID = 1;






