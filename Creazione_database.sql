CREATE DATABASE IF NOT EXISTS e_commerce_videogiochi;

USE e_commerce_videogiochi;

CREATE TABLE IF NOT EXISTS Genere(
	tipo varchar(50),
	PRIMARY KEY(tipo)
);

CREATE TABLE IF NOT EXISTS Videogioco(
	ID_Prodotto int AUTO_INCREMENT,
	nome varchar(40) NOT NULL,
	Prezzo decimal(5,2) NOT NULL,
	Studio varchar(30) NOT NULL,
	Data_uscita date NOT NULL,
	Piattaforme varchar(30) NOT NULL,
	PEGI varchar(20) NOT NULL,
	PRIMARY KEY(ID_Prodotto)
);

CREATE TABLE IF NOT EXISTS Piattaforma(
	Nome varchar(20) PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Compatibilità(
	Piattaforma varchar(20) REFERENCES Piattaforma(Nome),
    Videogioco int REFERENCES Videogioco(ID_Prodotto),
    PRIMARY KEY(Piattaforma, Videogioco)
);

CREATE TABLE IF NOT EXISTS Appartenere(
	Genere varchar(50) REFERENCES Genere(Tipo),
	Videogioco int REFERENCES Videogioco(ID_Prodotto),
	PRIMARY KEY(Genere, Videogioco)
);

CREATE TABLE IF NOT EXISTS Cliente(
	Codice_fiscale varchar(20),
	nome varchar(30) NOT NULL,
	cognome varchar(30) NOT NULL,
	telefono varchar(15) NOT NULL,
	Data_nascita date NOT NULL,
	via varchar(30) NOT NULL,
	civico int NOT NULL,
	cap int NOT NULL,
	città varchar(30) NOT NULL,
	stato varchar(30) NOT NULL,
	PRIMARY KEY(Codice_fiscale)
);

CREATE TABLE IF NOT EXISTS Recensione(
	ID_Recensione int AUTO_INCREMENT,
	Cliente varchar(20) REFERENCES Cliente(Codice_fiscale),
	voto decimal(3,2) NOT NULL,
	Descrizione varchar(200),
	Primary key(ID_Recensione)
);

CREATE TABLE IF NOT EXISTS Merchandise(
	ID_Prodotto int AUTO_INCREMENT,
	nome varchar(30) NOT NULL,
	dimensione decimal(5,2) NOT NULL,
	tipo varchar(20) NOT NULL,
	prezzo decimal(4,2) NOT NULL,
	peso decimal(3,2) NOT NULL,
	PRIMARY KEY(ID_Prodotto)
);

CREATE TABLE IF NOT EXISTS Valutare_Videogioco(
	videogioco int REFERENCES videogioco(ID_Prodotto),
	recensione int REFERENCES recensione(ID_Recensione),
	PRIMARY KEY(videogioco,recensione)
);

CREATE TABLE IF NOT EXISTS Valutare_Merchandise(
	Merchandise int REFERENCES Merchandise(ID_Prodotto),
	Recensione int REFERENCES Recensione(ID_Recensione),
	PRIMARY KEY(Merchandise,Recensione)
);

CREATE TABLE IF NOT EXISTS Casella_postale(
	e_mail varchar(40),
	cliente varchar(20) REFERENCES Cliente(Codice_fiscale),
	PRIMARY KEY(e_mail)
);

CREATE TABLE IF NOT EXISTS Abbonamento(
	Codice_abbonamento int AUTO_INCREMENT,
	Cliente varchar(20) REFERENCES Cliente(Codice_fiscale),
	Data_inizio date NOT NULL,
	Durata int default 3 NOT NULL,
	PRIMARY KEY(Codice_abbonamento, Cliente)
);

CREATE TABLE IF NOT EXISTS Ordine(
	Codice_ordine int AUTO_INCREMENT,
	Cliente varchar(20) REFERENCES Cliente(Codice_fiscale),
	Prezzo_totale Decimal(5,2) NOT NULL,
    Data date NOT NULL,
	PRIMARY KEY(Codice_ordine)
);
 
 CREATE TABLE IF NOT EXISTS Contenere_Videogioco(
	videogioco int REFERENCES videogioco(ID_Prodotto),
	ordine int REFERENCES Ordine(Codice_ordine),
	quantità int NOT NULL,
	PRIMARY KEY(videogioco, ordine)
);

CREATE TABLE IF NOT EXISTS Contenere_Merchandise(
	merchandise int REFERENCES Merchandise(ID_Prodotto),
	ordine int REFERENCES Ordine(Codice_odrine),
	quantità int NOT NULL,
	PRIMARY KEY(merchandise, ordine)
)