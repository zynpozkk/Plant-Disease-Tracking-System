SELECT 
    b.Bitki_Adi,
    sg.Gubre_Turu,
    sg.Gubre_Dozu,
    sg.Uygulama_Suresi
FROM bitki_sagligi.Bitki b
JOIN bitki_sagligi.SulamaGubreleme sg
    ON b.BitkiID = sg.BitkiID;