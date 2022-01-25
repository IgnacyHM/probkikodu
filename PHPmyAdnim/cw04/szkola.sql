CREATE DATABASE szkola;
USE szkola;

CREATE TABLE `uczen` (
  `id_ucznia` int(11) NOT NULL,
  `imie` varchar(20) DEFAULT NULL,
  `nazwisko` varchar(30) DEFAULT NULL,
  `data_urodzenia` date DEFAULT NULL,
  `miejsce_ur` varchar(40) DEFAULT NULL,
  `plec` char(1) DEFAULT NULL,
  `klasa` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `uczen` (`id_ucznia`, `imie`, `nazwisko`, `data_urodzenia`, `miejsce_ur`, `plec`, `klasa`) VALUES
(1, 'Ignacy', 'Maluszynski', '2004-05-25', 'Zielona Góra', 'M', '3Th'),

(2, 'Bronisław', 'Kowalczyk', '2007-02-28', 'Babimost', 'M', '1Tg'),

(3, 'Gracjan', 'Kalinowski', '2002-11-11', 'Krezoly', 'M', '4Tf'),

(4, 'Amalia', 'Krupa', '2005-07-31', 'Nowa Sol', 'K', '2Tg'),

(5, 'Kinga', 'Szewczyk', '2003-04-16', 'Zielona Góra', 'K', '3Th');

CREATE TABLE `oceny` (
  `id_oceny` int(11) NOT NULL,
  `ocena` int(1) DEFAULT NULL,
  `id_ucznia` int(11) NOT NULL,
  `id_przedmiotu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `oceny` (`id_oceny`, `ocena`, `id_ucznia`, `id_przedmiotu`) VALUES
(1, 5, 1, 1),
(2, 5, 1, 2),
(3, 2, 1, 3),
(4, 2, 1, 4),
(5, 6, 1, 5),
(6, 6, 2, 1),
(7, 6, 2, 2),
(8, 3, 2, 3),
(9, 3, 2, 4),
(10, 4, 2, 5),
(11, 2, 3, 1),
(12, 2, 3, 2),
(13, 6, 3, 3),
(14, 4, 3, 4),
(15, 2, 3, 5),
(16, 1, 4, 1),
(17, 1, 4, 2),
(18, 6, 4, 3),
(19, 3, 4, 4),
(20, 2, 4, 5);
(21, 4, 5, 1);
(22, 5, 5, 2);
(23, 6, 5, 3);
(24, 5, 5, 4);
(25, 4, 5, 5);

CREATE TABLE `przedmiot` (
  `id_przedmiotu` int(11) NOT NULL,
  `nazwa_przedmiotu` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `przedmiot` (`id_przedmiotu`, `nazwa_przedmiotu`) VALUES
(1, 'matematyka'),
(2, 'fizyka'),
(3, 'chemia'),
(4, 'geografia'),
(5, 'biologia');

ALTER TABLE `uczen`
  ADD PRIMARY KEY (`id_ucznia`);

ALTER TABLE `oceny`
  ADD PRIMARY KEY (`id_oceny`),
  ADD KEY `id_przedmiotu` (`id_przedmiotu`),
  ADD KEY `id_ucznia` (`id_ucznia`);

ALTER TABLE `przedmiot`
  ADD PRIMARY KEY (`id_przedmiotu`);

ALTER TABLE `oceny`
  MODIFY `id_oceny` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `przedmiot`
  MODIFY `id_przedmiotu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `uczen`
  MODIFY `id_ucznia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `oceny`
  ADD CONSTRAINT `oceny_ibfk_1` FOREIGN KEY (`id_przedmiotu`) REFERENCES `przedmiot` (`id_przedmiotu`),
  ADD CONSTRAINT `oceny_ibfk_2` FOREIGN KEY (`id_ucznia`) REFERENCES `uczen` (`id_ucznia`);
COMMIT;
