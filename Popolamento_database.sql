USE e_commerce_videogiochi;

-- Inserimento dati nella tabella Genere
INSERT INTO Genere (tipo) VALUES
('Azione'),
('Avventura'),
('RPG'),
('Strategia'),
('Sport');

-- Inserimento dati nella tabella Videogioco
INSERT INTO Videogioco (nome, Prezzo, Studio, Data_uscita, PEGI) VALUES
('The Witcher 3', 49.99, 'CD Projekt Red', '2015-05-19', 18),
('FIFA 22', 59.99, 'EA Sports', '2021-10-01', 3),
('Cyberpunk 2077', 39.99, 'CD Projekt Red', '2020-12-10', 18),
('Minecraft', 29.99, 'Mojang', '2011-11-18', 7),
('Assassin\'s Creed Valhalla', 59.99, 'Ubisoft', '2020-11-10', 18);

-- Inserimento dati nella tabella Piattaforma
INSERT INTO Piattaforma (Nome) VALUES
('PC'),
('PlayStation 5'),
('Xbox Series X'),
('Nintendo Switch'),
('PlayStation 4');

-- Inserimento dati nella tabella Compatibilità
INSERT INTO Compatibilità (Piattaforma, Videogioco) VALUES
('PC', 1),
('PlayStation 5', 2),
('Xbox Series X', 3),
('Nintendo Switch', 4),
('PlayStation 4', 5);

-- Inserimento dati nella tabella Appartenere
INSERT INTO Appartenere (Genere, Videogioco) VALUES
('RPG', 1),
('Sport', 2),
('RPG', 3),
('Avventura', 4),
('Azione', 5);

-- Inserimento dati nella tabella Cliente
INSERT INTO Cliente (Codice_fiscale, nome, cognome, telefono, Data_nascita, via, civico, cap, città, stato) VALUES
('RSSMRA85M10H501U', 'Mario', 'Rossi', '3331234567', '1985-08-10', 'Via Roma', 1, 00100, 'Roma', 'Italia'),
('VRDGNN90A41H501X', 'Giovanna', 'Verdi', '3337654321', '1990-01-01', 'Via Milano', 2, 20100, 'Milano', 'Italia'),
('BNCLGU75P55H501Y', 'Luigi', 'Bianchi', '3339876543', '1975-09-15', 'Via Napoli', 3, 80100, 'Napoli', 'Italia'),
('GLLNDR88D12H501Z', 'Andrea', 'Gialli', '3334567890', '1988-04-12', 'Via Torino', 4, 10100, 'Torino', 'Italia'),
('NRIMRC83R05H501W', 'Marco', 'Neri', '3335678901', '1983-10-05', 'Via Palermo', 5, 90100, 'Palermo', 'Italia');

-- Inserimento dati nella tabella Recensione
INSERT INTO Recensione (Cliente, voto, Descrizione) VALUES
('RSSMRA85M10H501U', 4.5, 'Gioco fantastico, grafica incredibile!'),
('VRDGNN90A41H501X', 3.8, 'Buon gioco, ma con qualche bug.'),
('BNCLGU75P55H501Y', 5.0, 'Assolutamente perfetto, lo consiglio a tutti.'),
('GLLNDR88D12H501Z', 4.0, 'Divertente e coinvolgente.'),
('NRIMRC83R05H501W', 2.5, 'Deludente, mi aspettavo di più.');

-- Inserimento dati nella tabella Merchandise
INSERT INTO Merchandise (nome, dimensione, tipo, prezzo, peso) VALUES
('Maglietta The Witcher', 1.0, 'Abbigliamento', 19.99, 0.2),
('Action Figure Geralt', 15.0, 'Giocattolo', 29.99, 0.5),
('Tazza Cyberpunk', 10.0, 'Casa', 9.99, 0.3),
('Poster Minecraft', 50.0, 'Decorazione', 14.99, 0.1),
('Cappello Assassin\'s Creed', 2.0, 'Abbigliamento', 24.99, 0.2);

-- Inserimento dati nella tabella Valutare_Videogioco
INSERT INTO Valutare_Videogioco (videogioco, recensione) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Inserimento dati nella tabella Valutare_Merchandise
INSERT INTO Valutare_Merchandise (Merchandise, Recensione) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Inserimento dati nella tabella Casella_postale
INSERT INTO Casella_postale (e_mail, cliente) VALUES
('mario.rossi@example.com', 'RSSMRA85M10H501U'),
('giovanna.verdi@example.com', 'VRDGNN90A41H501X'),
('luigi.bianchi@example.com', 'BNCLGU75P55H501Y'),
('andrea.gialli@example.com', 'GLLNDR88D12H501Z'),
('marco.neri@example.com', 'NRIMRC83R05H501W');

-- Inserimento dati nella tabella Abbonamento
INSERT INTO Abbonamento (Codice_abbonamento, Cliente, Data_inizio, Durata) VALUES
(1, 'RSSMRA85M10H501U', '2023-01-01', 12),
(2, 'VRDGNN90A41H501X', '2023-02-01', 6),
(3, 'BNCLGU75P55H501Y', '2023-03-01', 3),
(4, 'GLLNDR88D12H501Z', '2023-04-01', 12),
(5, 'NRIMRC83R05H501W', '2023-05-01', 6);

-- Inserimento dati nella tabella Ordine
INSERT INTO Ordine (Cliente, Prezzo_totale, Data) VALUES
('RSSMRA85M10H501U', 149.97, '2023-01-15'),
('VRDGNN90A41H501X', 119.98, '2023-02-10'),
('BNCLGU75P55H501Y', 89.97, '2023-03-05'),
('GLLNDR88D12H501Z', 59.99, '2023-04-20'),
('NRIMRC83R05H501W', 29.99, '2023-05-25');

-- Inserimento dati nella tabella Contenere_Videogioco
INSERT INTO Contenere_Videogioco (videogioco, ordine, quantità) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1);

-- Inserimento dati nella tabella Contenere_Merchandise
INSERT INTO Contenere_Merchandise (merchandise, ordine, quantità) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 3),
(4, 4, 1),
(5, 5, 2);