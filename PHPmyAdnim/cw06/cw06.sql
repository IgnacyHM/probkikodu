CREATE DATABASE cw06;
USE cw06;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `uczen` (
  `id_ucznia` int(11) NOT NULL,
  `imie` varchar(20) NOT NULL,
  `nazwisko` varchar(30) NOT NULL,
  `data_urodzenia` date NOT NULL,
  `miejsce_ur` varchar(30) NOT NULL,
  `plec` char(1) NOT NULL,
  `klasa` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `uczen` (`id_ucznia`, `imie`, `nazwisko`, `data_urodzenia`, `miejsce_ur`, `plec`, `klasa`) VALUES
(1, 'Ignacy', 'Maluszynski', '2004-05-25', 'Zielona Góra', 'M', '3TH'),
(2, 'Julia', 'Zawadzka', '2005-04-13', 'Pozna?', 'K', '2Tb'),
(3, 'Janusz', 'S?owacki', '2004-01-19', 'Zielona Góra', 'M', '4Tg');

CREATE TABLE `nauczyciel` (
  `id_nauczyciela` int(11) NOT NULL,
  `imie` varchar(20) NOT NULL,
  `nazwisko` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `nauczyciel` (`id_nauczyciela`, `imie`, `nazwisko`) VALUES
(1, 'Grzegorz', 'Czerwinski'),
(2, 'Blanka', 'Wisniewska');

CREATE TABLE `przedmiot` (
  `id_przedmiotu` int(11) NOT NULL,
  `nazwa_przedmiotu` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `przedmiot` (`id_przedmiotu`, `nazwa_przedmiotu`) VALUES
(1, 'matematyka,'),
(2, 'fizyka'),
(3, 'wf');

CREATE TABLE `oceny` (
  `id_oceny` int(11) NOT NULL,
  `ocena` int(1) NOT NULL,
  `id_ucznia` int(11) NOT NULL,
  `id_nauczyciela` int(11) NOT NULL,
  `id_przedmiotu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `oceny` (`id_oceny`, `ocena`, `id_ucznia`, `id_nauczyciela`, `id_przedmiotu`) VALUES
(1, 5, 1, 1, 1),
(2, 3, 1, 2, 2),
(3, 3, 1, 2, 3),
(4, 4, 2, 2, 1),
(5, 4, 2, 1, 2),
(6, 6, 2, 1, 3),
(7, 5, 3, 2, 1),
(8, 5, 3, 2, 2),
(9, 1, 3, 1, 3);

ALTER TABLE `uczen`
  ADD PRIMARY KEY (`id_ucznia`);

ALTER TABLE `nauczyciel`
  ADD PRIMARY KEY (`id_nauczyciela`);

ALTER TABLE `oceny`
  ADD PRIMARY KEY (`id_oceny`),
  ADD KEY `id_nauczyciela` (`id_nauczyciela`),
  ADD KEY `id_ucznia` (`id_ucznia`),
  ADD KEY `id_przedmiotu` (`id_przedmiotu`);

ALTER TABLE `przedmiot`
  ADD PRIMARY KEY (`id_przedmiotu`);

ALTER TABLE `nauczyciel`
  MODIFY `id_nauczyciela` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `przedmiot`
  MODIFY `id_przedmiotu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `uczen`
  MODIFY `id_ucznia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `oceny`
  ADD CONSTRAINT `oceny_ibfk_1` FOREIGN KEY (`id_nauczyciela`) REFERENCES `nauczyciel` (`id_nauczyciela`),
  ADD CONSTRAINT `oceny_ibfk_2` FOREIGN KEY (`id_ucznia`) REFERENCES `uczen` (`id_ucznia`),
  ADD CONSTRAINT `oceny_ibfk_3` FOREIGN KEY (`id_przedmiotu`) REFERENCES `przedmiot` (`id_przedmiotu`);
COMMIT;
