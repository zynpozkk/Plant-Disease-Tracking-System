SELECT 
    b.Bitki_Adi,
    t.Tedavi_Yontemi,
    i.Ilac_Adi,
    i.Ilac_Dozaji
FROM bitki_sagligi.Bitki b
JOIN bitki_sagligi.Hastalik h 
    ON b.BitkiID = h.BitkiID
JOIN bitki_sagligi.Tedavi t 
    ON h.HastalikID = t.HastalikID
JOIN bitki_sagligi.Ilac i 
    ON t.TedaviID = i.TedaviID;
