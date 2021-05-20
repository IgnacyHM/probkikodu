-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 02 Lut 2021, 10:21
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
-- Baza danych: `z01`
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
  `Liczba_stron` int(5) DEFAULT NULL,
  `Id_wypozyczajacego` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `ksiazki`
--

INSERT INTO `ksiazki` (`Id_ksiazki`, `Autor`, `Wydawnictwo`, `Rok_wydania`, `Liczba_stron`, `Id_wypozyczajacego`) VALUES
(1, 'Adam Drzewicki', 'Kaliber', 2014, 211, 1),
(2, 'Katarzyna puzynska', 'Oxford', 2020, 115, 3),
(3, 'Norbert Koscierza', 'Kobiecki', 2013, 89, 4),
(4, 'Artur Pawlak', 'Oxford', 2016, 321, 2),
(5, 'Felix Dostojewski', 'Filia', 1999, 145, 1),
(6, 'Justyna Kamil', 'Opera', 2014, 67, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uczniowie`
--

CREATE TABLE `uczniowie` (
  `Id_ucznia` int(11) NOT NULL,
  `Nazwisko` varchar(50) DEFAULT NULL,
  `Imie` varchar(50) DEFAULT NULL,
  `klasa` varchar(5) DEFAULT NULL,
  `Telefon` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `uczniowie`
--

INSERT INTO `uczniowie` (`Id_ucznia`, `Nazwisko`, `Imie`, `klasa`, `Telefon`) VALUES
(1, 'Olencki', 'Artur', '2Th', 654),
(2, 'Kowalski', 'Michal', '2Th', 123),
(3, 'Lewandowska', 'Alina', '1a', 675),
(4, 'Komorowski', 'Mateusz', '1c', 123),
(5, 'Nowak', 'Kamil', '3c', 542),
(6, 'Duda', 'Dominika', '4d', 179);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `ksiazki`
--
ALTER TABLE `ksiazki`
  ADD PRIMARY KEY (`Id_ksiazki`),
  ADD KEY `Id_wypozyczajacego` (`Id_wypozyczajacego`);

--
-- Indeksy dla tabeli `uczniowie`
--
ALTER TABLE `uczniowie`
  ADD PRIMARY KEY (`Id_ucznia`);

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
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `ksiazki`
--
ALTER TABLE `ksiazki`
  ADD CONSTRAINT `ksiazki_ibfk_1` FOREIGN KEY (`Id_wypozyczajacego`) REFERENCES `uczniowie` (`Id_ucznia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
