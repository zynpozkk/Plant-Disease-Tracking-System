CREATE TABLE Kullanici (
    KullaniciID INT PRIMARY KEY IDENTITY(1,1),
    AdSoyad VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Telefon VARCHAR(20),
    Rol VARCHAR(50) NOT NULL
);

CREATE TABLE Lokasyon (
    LokasyonID INT PRIMARY KEY IDENTITY(1,1),
    Il VARCHAR(50) NOT NULL,
    Ilce VARCHAR(50) NOT NULL,
    CONSTRAINT UQ_Lokasyon UNIQUE (Il, Ilce)
);

CREATE TABLE Bitki (
    BitkiID INT PRIMARY KEY IDENTITY(1,1),
    KullaniciID INT NOT NULL,
    LokasyonID INT NOT NULL,
    Bitki_Adi VARCHAR(100) NOT NULL,
    Bitki_Bilimsel_Adi VARCHAR(150) NOT NULL,
    FOREIGN KEY (KullaniciID) REFERENCES Kullanici(KullaniciID),
    FOREIGN KEY (LokasyonID) REFERENCES Lokasyon(LokasyonID)
);

CREATE TABLE Patogen (
    PatogenID INT PRIMARY KEY IDENTITY(1,1),
    Patogen_Adi VARCHAR(100) NOT NULL,
    Patogen_Turu VARCHAR(50) NOT NULL,
    CONSTRAINT UQ_Patogen UNIQUE (Patogen_Adi, Patogen_Turu)
);

CREATE TABLE Belirti (
    BelirtiID INT PRIMARY KEY IDENTITY(1,1),
    Belirti_Adi VARCHAR(100) NOT NULL,
    Belirti_Tarihi DATE NOT NULL
);

CREATE TABLE Hastalik (
    HastalikID INT PRIMARY KEY IDENTITY(1,1),
    BitkiID INT NOT NULL,
    PatogenID INT NOT NULL,
    Hastalik_Bilimsel_Adi VARCHAR(150) NOT NULL,
    FOREIGN KEY (BitkiID) REFERENCES Bitki(BitkiID),
    FOREIGN KEY (PatogenID) REFERENCES Patogen(PatogenID)
);

CREATE TABLE HastalikBelirti (
    HastalikID INT NOT NULL,
    BelirtiID INT NOT NULL,
    PRIMARY KEY (HastalikID, BelirtiID),
    FOREIGN KEY (HastalikID) REFERENCES Hastalik(HastalikID),
    FOREIGN KEY (BelirtiID) REFERENCES Belirti(BelirtiID)
);

CREATE TABLE Tedavi (
    TedaviID INT PRIMARY KEY IDENTITY(1,1),
    HastalikID INT NOT NULL,
    Tedavi_Yontemi VARCHAR(100) NOT NULL,
    Tedavi_Suresi INT NOT NULL,
    FOREIGN KEY (HastalikID) REFERENCES Hastalik(HastalikID)
);

CREATE TABLE Ilac (
    IlacID INT PRIMARY KEY IDENTITY(1,1),
    TedaviID INT NOT NULL,
    Ilac_Adi VARCHAR(100) NOT NULL,
    Ilac_Dozaji VARCHAR(50) NOT NULL,
    FOREIGN KEY (TedaviID) REFERENCES Tedavi(TedaviID)
);

CREATE TABLE BitkiBolgesi (
    BolgeID INT PRIMARY KEY IDENTITY(1,1),
    BitkiID INT NOT NULL,
    Bitki_Bolge_Adi VARCHAR(100) NOT NULL,
    FOREIGN KEY (BitkiID) REFERENCES Bitki(BitkiID)
);

CREATE TABLE ToprakAnalizi (
    AnalizID INT PRIMARY KEY IDENTITY(1,1),
    BolgeID INT NOT NULL,
    pH FLOAT NOT NULL,
    Azot FLOAT,
    Fosfor FLOAT,
    Potasyum FLOAT,
    FOREIGN KEY (BolgeID) REFERENCES BitkiBolgesi(BolgeID)
);

CREATE TABLE VakaKaydi (
    VakaID INT PRIMARY KEY IDENTITY(1,1),
    KullaniciID INT NOT NULL,
    BitkiID INT NOT NULL,
    HastalikID INT NOT NULL,
    LokasyonID INT NOT NULL,
    TedaviID INT NOT NULL,
    FOREIGN KEY (KullaniciID) REFERENCES Kullanici(KullaniciID),
    FOREIGN KEY (BitkiID) REFERENCES Bitki(BitkiID),
    FOREIGN KEY (HastalikID) REFERENCES Hastalik(HastalikID),
    FOREIGN KEY (LokasyonID) REFERENCES Lokasyon(LokasyonID),
    FOREIGN KEY (TedaviID) REFERENCES Tedavi(TedaviID)
);

CREATE TABLE Rapor (
    RaporID INT PRIMARY KEY IDENTITY(1,1),
    VakaID INT NOT NULL,
    AnalizID INT NOT NULL,
    KullaniciID INT NOT NULL,
    FOREIGN KEY (VakaID) REFERENCES VakaKaydi(VakaID),
    FOREIGN KEY (AnalizID) REFERENCES ToprakAnalizi(AnalizID),
    FOREIGN KEY (KullaniciID) REFERENCES Kullanici(KullaniciID)
);

CREATE TABLE SulamaGubreleme (
    KayitID INT PRIMARY KEY IDENTITY(1,1),
    BitkiID INT NOT NULL,
    Gubre_Turu VARCHAR(100) NOT NULL,
    Gubre_Dozu FLOAT NOT NULL,
    Uygulama_Suresi INT NOT NULL,
    FOREIGN KEY (BitkiID) REFERENCES Bitki(BitkiID)
);
