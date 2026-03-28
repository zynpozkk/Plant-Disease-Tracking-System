SELECT name
FROM sys.foreign_keys
WHERE parent_object_id = OBJECT_ID('bitki_sagligi.VakaKaydi');


ALTER TABLE bitki_sagligi.VakaKaydi
DROP CONSTRAINT FK__VakaKaydi__Lokas__5BE2A6F2;

ALTER TABLE bitki_sagligi.VakaKaydi
DROP CONSTRAINT FK__VakaKaydi__Hasta__5AEE82B9;

ALTER TABLE bitki_sagligi.VakaKaydi DROP COLUMN LokasyonID;