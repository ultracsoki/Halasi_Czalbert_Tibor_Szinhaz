-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: localhost
-- Létrehozás ideje: 2023. Dec 15. 10:28
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `szinhaz`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `eloadas`
--

CREATE TABLE `eloadas` (
  `id` int(11) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `percentage` int(11) NOT NULL,
  `code` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `eloadas`
--

INSERT INTO `eloadas` (`id`, `title`, `percentage`, `code`) VALUES
(1, 'Piroska és a farkas', 67, 'KSAF-219382'),
(2, 'Lúdas Matyi', 32, 'FNSA-353293'),
(3, 'Ferenc az úton', 98, 'OKES-798673'),
(4, 'Béci Balladája', 50, 'MCXY-672890'),
(5, 'Dini muzsikája', 18, 'FMSD-372842'),
(6, 'Partyzán', 89, 'SANK-128942'),
(12, 'sdanjk', 1, 'SAFN-793243'),
(13, 'sajo', 99, 'ASFN-724934');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `eloadas`
--
ALTER TABLE `eloadas`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `eloadas`
--
ALTER TABLE `eloadas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
