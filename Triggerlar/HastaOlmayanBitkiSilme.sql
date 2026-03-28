CREATE OR ALTER TRIGGER bitki_sagligi.tr_Bitki_Delete_Kontrol
ON bitki_sagligi.Bitki
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM deleted d
        JOIN bitki_sagligi.Hastalik h
            ON h.BitkiID = d.BitkiID
    )
    BEGIN
        ROLLBACK;
        RETURN;
    END
    DELETE FROM bitki_sagligi.Bitki
    WHERE BitkiID IN (SELECT BitkiID FROM deleted);
END;

DELETE FROM bitki_sagligi.Bitki WHERE BitkiID = 36; --Hastalýðý Olmayan Bitki

DELETE FROM bitki_sagligi.Bitki WHERE BitkiID = 5;  --Hastalýðý Olan Bitki



