SELECT 
    r.RaporID,
    k.AdSoyad,
    r.AnalizID
FROM bitki_sagligi.Rapor r
JOIN bitki_sagligi.Kullanici k
    ON r.KullaniciID = k.KullaniciID;