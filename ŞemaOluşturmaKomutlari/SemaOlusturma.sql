CREATE SCHEMA bitki_sagligi;
GO

ALTER SCHEMA bitki_sagligi TRANSFER dbo.Kullanici;
ALTER SCHEMA bitki_sagligi TRANSFER dbo.Lokasyon;
ALTER SCHEMA bitki_sagligi TRANSFER dbo.Bitki;
ALTER SCHEMA bitki_sagligi TRANSFER dbo.Patogen;
ALTER SCHEMA bitki_sagligi TRANSFER dbo.Belirti;
ALTER SCHEMA bitki_sagligi TRANSFER dbo.Hastalik;
ALTER SCHEMA bitki_sagligi TRANSFER dbo.HastalikBelirti;
ALTER SCHEMA bitki_sagligi TRANSFER dbo.Tedavi;
ALTER SCHEMA bitki_sagligi TRANSFER dbo.Ilac;
ALTER SCHEMA bitki_sagligi TRANSFER dbo.BitkiBolgesi;
ALTER SCHEMA bitki_sagligi TRANSFER dbo.ToprakAnalizi;
ALTER SCHEMA bitki_sagligi TRANSFER dbo.VakaKaydi;
ALTER SCHEMA bitki_sagligi TRANSFER dbo.Rapor;
ALTER SCHEMA bitki_sagligi TRANSFER dbo.SulamaGubreleme;
