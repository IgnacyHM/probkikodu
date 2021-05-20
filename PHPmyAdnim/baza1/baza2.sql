-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 02 Lut 2021, 10:59
-- Wersja serwera: 10.4.6-MariaDB
-- Wersja PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `z02`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ksiazki`
--

CREATE TABLE `ksiazki` (
  `Id_ksiazki` int(11) NOT NULL,
  `Autor` varchar(60) DEFAULT NULL,
  `Wydawnictwo` varchar(100) DEFAULT NULL,
  `Rok_wydania` year(4) DEFAULT NULL,
  `Liczba_stron` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `ksiazki`
--

INSERT INTO `ksiazki` (`Id_ksiazki`, `Autor`, `Wydawnictwo`, `Rok_wydania`, `Liczba_stron`) VALUES
(1, 'Adam Drzewicki', 'Kaliber', 2014, 211),
(2, 'Katarzyna puzynska', 'Oxford', 2020, 115),
(3, 'Norbert Koscierza', 'Kobiecki', 2013, 89),
(4, 'Artur Pawlak', 'Oxford', 2016, 321),
(5, 'Felix Dostojewski', 'Filia', 1999, 145),
(6, 'Justyna Kamil', 'Opera', 2014, 67);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uczniowie`
--

CREATE TABLE `uczniowie` (
  `Id_ucznia` int(11) NOT NULL,
  `Nazwisko` varchar(50) DEFAULT NULL,
  `Imie` varchar(50) DEFAULT NULL,
  `Klasa` varchar(5) DEFAULT NULL,
  `Telefon` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `uczniowie`
--

INSERT INTO `uczniowie` (`Id_ucznia`, `Nazwisko`, `Imie`, `Klasa`, `Telefon`) VALUES
(1, 'Olencki', 'Artur', '2Th', 654),
(2, 'Kowalski', 'Michal', '2Th', 123),
(3, 'Lewandowska', 'Alina', '1a', 675),
(4, 'Komorowski', 'Mateusz', '1c', 123),
(5, 'Nowak', 'Kamil', '3c', 542),
(6, 'Duda', 'Dominika', '4d', 179);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wypozyczenia`
--

CREATE TABLE `wypozyczenia` (
  `id_wyp` int(11) NOT NULL,
  `data_wyp` timestamp NULL DEFAULT NULL,
  `data_zwrotu` timestamp NULL DEFAULT NULL,
  `Id_ksiazki` int(11) NOT NULL,
  `Id_ucznia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `wypozyczenia`
--

INSERT INTO `wypozyczenia` (`id_wyp`, `data_wyp`, `data_zwrotu`, `Id_ksiazki`, `Id_ucznia`) VALUES
(1, '2021-01-12 23:00:00', '2021-01-28 23:00:00', 4, 2),
(2, '2020-12-05 23:00:00', '2020-12-23 23:00:00', 5, 3),
(3, '2020-10-05 22:00:00', '2020-10-16 22:00:00', 3, 1),
(4, '2020-12-31 23:00:00', '2021-01-08 23:00:00', 1, 4),
(5, '2020-09-06 22:00:00', '2020-11-02 23:00:00', 6, 5),
(6, '2021-01-10 23:00:00', '2021-01-26 23:00:00', 1, 2),
(7, '2020-10-05 22:00:00', '2020-11-09 23:00:00', 4, 3),
(8, '2020-06-14 22:00:00', '2020-07-08 22:00:00', 3, 5),
(9, '2020-01-13 23:00:00', '2020-02-11 23:00:00', 5, 6),
(10, '2021-01-02 23:00:00', '2021-01-06 23:00:00', 2, 3);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `ksiazki`
--
ALTER TABLE `ksiazki`
  ADD PRIMARY KEY (`Id_ksiazki`);

--
-- Indeksy dla tabeli `uczniowie`
--
ALTER TABLE `uczniowie`
  ADD PRIMARY KEY (`Id_ucznia`);

--
-- Indeksy dla tabeli `wypozyczenia`
--
ALTER TABLE `wypozyczenia`
  ADD PRIMARY KEY (`id_wyp`),
  ADD KEY `wypozyczenia_ibfk_1` (`Id_ucznia`),
  ADD KEY `wypozyczenia_ibfk_2` (`Id_ksiazki`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `ksiazki`
--
ALTER TABLE `ksiazki`
  MODIFY `Id_ksiazki` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT dla tabeli `uczniowie`
--
ALTER TABLE `uczniowie`
  MODIFY `Id_ucznia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `wypozyczenia`
--
ALTER TABLE `wypozyczenia`
  MODIFY `id_wyp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `wypozyczenia`
--
ALTER TABLE `wypozyczenia`
  ADD CONSTRAINT `wypozyczenia_ibfk_1` FOREIGN KEY (`Id_ucznia`) REFERENCES `uczniowie` (`Id_ucznia`),
  ADD CONSTRAINT `wypozyczenia_ibfk_2` FOREIGN KEY (`Id_ksiazki`) REFERENCES `ksiazki` (`Id_ksiazki`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
