SELECT 
    b.Bitki_Adi,
    b.Bitki_Bilimsel_Adi,
    l.Il,
    l.Ilce
FROM bitki_sagligi.Bitki b
JOIN bitki_sagligi.Lokasyon l 
    ON b.LokasyonID = l.LokasyonID;
