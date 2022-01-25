USE biblioteka;

/* 4 */
SELECT tytul, imie, nazwisko, nazwa FROM ksiazki, autorzy, kategorie WHERE autor = aid AND kategoria = kid;
/* 5 */
UPDATE autorzy SET imie = 'Andrzej', nazwisko = 'Nowak' WHERE aid = 1;