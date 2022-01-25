
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

CREATE DATABASE biblioteka;
USE biblioteka;

CREATE TABLE `ksiazki` (
  `id` int(11) NOT NULL,
  `tytul` varchar(60) DEFAULT NULL,
  `autor` int(11) DEFAULT NULL,
  `kategoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `ksiazki` (`id`, `tytul`, `autor`, `kategoria`) VALUES
(1, 'PHP Samouczek', 3, 1),
(2, 'MySQL Samouczek', 2, 2),
(3, 'PHP Praktyczne rozwiazania', 1, 1),
(4, 'MYSQL Przewodnik programisty', 2, 2),
(5, 'Klasa 3Th', 4, 3);

CREATE TABLE `autorzy` (
  `aid` int(11) NOT NULL,
  `imie` varchar(20) NOT NULL,
  `nazwisko` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `autorzy` (`aid`, `imie`, `nazwisko`) VALUES
(1, 'Marek', 'Nowakowski'),
(2, 'Leon', 'Atkinson'),
(3, 'Karol', 'Wierzcho?owski'),
(4, 'Volodymyr', 'Paprotskyi');

CREATE TABLE `kategorie` (
  `kid` int(11) NOT NULL,
  `nazwa` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `kategorie` (`kid`, `nazwa`) VALUES
(1, 'PHP'),
(2, 'MySQL'),
(3, 'Bez kategorii');

ALTER TABLE `ksiazki`
  ADD PRIMARY KEY (`id`),
  ADD KEY `autor` (`autor`),
  ADD KEY `kategoria` (`kategoria`);

ALTER TABLE `autorzy`
  ADD PRIMARY KEY (`aid`);

ALTER TABLE `kategorie`
  ADD PRIMARY KEY (`kid`);

ALTER TABLE `ksiazki`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `autorzy`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `kategorie`
  MODIFY `kid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `ksiazki`
  ADD CONSTRAINT `ksiazki_ibfk_1` FOREIGN KEY (`autor`) REFERENCES `autorzy` (`aid`),
  ADD CONSTRAINT `ksiazki_ibfk_2` FOREIGN KEY (`kategoria`) REFERENCES `kategorie` (`kid`);
COMMIT;
