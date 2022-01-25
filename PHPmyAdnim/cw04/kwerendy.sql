/* 3 */
ALTER TABLE uczen ADD id_ucznia INT NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;

/* 5 */
--a)
SELECT * FROM uczen ORDER BY nazwisko ASC;

--b)
SELECT * FROM uczen WHERE nazwisko LIKE 'N%' AND imie LIKE '%A';

/* 6 */
--a)
SELECT COUNT(id_ucznia) as Liczba_uczniow FROM uczen;

--b)
SELECT AVG(ocena) as Srednia_ocen FROM oceny;

--c)
SELECT MIN(ocena) as Najmniejsza_ocena FROM oceny WHERE id_przedmiotu = 3;

--d)
SELECT CONCAT(imie, " ", nazwisko) as 'Imie i nazwisko', nazwa_przedmiotu as Przedmiot, ocena FROM uczen, przedmiot, oceny WHERE uczen.id_ucznia = oceny.id_ucznia AND przedmiot.id_przedmiotu = oceny.id_przedmiotu;