SELECT 
    b.Bitki_Adi,
    h.Hastalik_Bilimsel_Adi,
    p.Patogen_Turu
FROM bitki_sagligi.Bitki b
JOIN bitki_sagligi.Hastalik h ON b.BitkiID = h.BitkiID
JOIN bitki_sagligi.Patogen p ON h.PatogenID = p.PatogenID
JOIN bitki_sagligi.Lokasyon l ON b.LokasyonID = l.LokasyonID
WHERE l.Il = 'Adana';