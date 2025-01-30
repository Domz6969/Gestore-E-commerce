/* 
seleziona un videogioco con prezzo maggiore di 50 e pegi 18 
oppure il videogioco con studio ninetendo e data di uscita 2024 ordinato per il prezzo descrescente 
*/
SELECT *
FROM Videogioco
WHERE (Prezzo > 50 AND PEGI = '18') 
OR (Studio = 'Nintendo' AND Data_uscita > '2015-01-01')
ORDER BY Prezzo DESC;

/*
seleziona nome cliente, cognome cliente data ordine e codice ordine del cliente 
con prezzo totale ordine maggiore di 50 e citta del cliente uguale roma
*/
SELECT c.nome, c.cognome, o.Codice_ordine, o.Data
FROM Cliente c
JOIN Ordine o ON c.Codice_fiscale = o.Cliente
WHERE o.Prezzo_totale > 50 AND c.città = 'Roma';

/*
Selezione il totale vendite e la spesa media dagli ordini
*/
SELECT SUM(Prezzo_totale) AS Totale_vendite, AVG(Prezzo_totale) AS Spesa_media
FROM Ordine;

/*
Conta i videogiochi appartenenti ad ogni genere
*/
SELECT G.tipo, COUNT(V.ID_Prodotto) AS Numero_videogiochi
FROM Genere G
JOIN Appartenere A ON G.tipo = A.Genere
JOIN Videogioco V ON A.Videogioco = V.ID_Prodotto
GROUP BY G.tipo;

/*
Seleziona il totale speso per ogni cliente con totale maggiore di 100
*/
SELECT Cliente, SUM(Prezzo_totale) AS Totale_speso
FROM Ordine
GROUP BY Cliente
HAVING Totale_speso > 100;

/*
Seleziona il genere con il prezzo medio maggiore
*/
SELECT G.tipo, AVG(V.Prezzo) AS Prezzo_medio_genere
FROM Genere G
JOIN Appartenere A ON G.tipo = A.Genere
JOIN Videogioco V ON A.Videogioco = V.ID_Prodotto
GROUP BY G.tipo
HAVING Prezzo_medio_genere = (
		SELECT MAX(Prezzo_medio_totale)
		FROM (
			SELECT AVG(V.Prezzo) AS Prezzo_medio_totale
        	FROM Genere G
			JOIN Appartenere A ON G.tipo = A.Genere
			JOIN Videogioco V ON A.Videogioco = V.ID_Prodotto
        	GROUP BY G.tipo
			) AS Prezzo_medio
	);

/*
Selezione nome e prezzo dall’unione delle tabelle videogioco e merchandise 
dove i prezzo dei videogiochi sono > 50 e prezzo della merchandise sono maggiore di >20
*/
SELECT nome, Prezzo AS Valore
FROM Videogioco
WHERE Prezzo > 50
UNION
SELECT nome, prezzo
FROM Merchandise
WHERE prezzo > 20;

/*
Clienti che hanno acquistato tutti i videogiochi di un genere
*/
SELECT c.Codice_fiscale, c.nome, c.cognome
FROM Cliente c
WHERE NOT EXISTS (
		SELECT 1
    	FROM Genere g
   		WHERE g.tipo = 'Azione'
    	AND NOT EXISTS (
			SELECT 1
			FROM Appartenere a, Videogioco v, Contenere_Videogioco cv, Ordine o
			WHERE o.Cliente = c.Codice_fiscale 
			AND a.Videogioco = v.ID_Prodotto 
			AND v.ID_Prodotto = cv.videogioco 
			AND a.Genere = g.tipo AND cv.ordine =o.Codice_ordine
			)
	);