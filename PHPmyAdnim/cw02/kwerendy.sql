USE nauka04;

/* 1 */
SOURCE D:\TiADB\cw02\nauka04.sql

/* 2 */
SELECT * FROM duzatabelka WHERE cena > 32765;

/* 3 */
SELECT * FROM duzatabelka WHERE cena BETWEEN 20000 and 20010 ORDER BY kod;

/* 4 */
SELECT * FROM duzatabelka WHERE cena BETWEEN 20000 and 20010 ORDER BY kod LIMIT 19,10;

/* 5 */
SELECT avg(cena) as srednia_cena FROM duzatabelka;

/* 6 */
SELECT * FROM duzatabelka WHERE cena > (SELECT avg(cena) FROM duzatabelka) AND opis LIKE "%receitei%";