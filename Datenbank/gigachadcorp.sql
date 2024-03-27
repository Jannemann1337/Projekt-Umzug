-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 27. Mrz 2024 um 23:57
-- Server-Version: 10.4.28-MariaDB
-- PHP-Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `gigachadcorp`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `room_num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `department`
--

INSERT INTO `department` (`id`, `name`, `room_num`) VALUES
(1, 'ABC', 3),
(2, 'Development', 5),
(3, 'Management', 1),
(4, 'Security', 6);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `emp_num` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `forename` varchar(64) NOT NULL,
  `mail` varchar(64) NOT NULL,
  `department_id` int(11) NOT NULL,
  `postcode` int(11) NOT NULL,
  `streetname` varchar(255) NOT NULL,
  `housenumber` int(11) NOT NULL,
  `entry_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `employee`
--

INSERT INTO `employee` (`id`, `emp_num`, `name`, `forename`, `mail`, `department_id`, `postcode`, `streetname`, `housenumber`, `entry_date`) VALUES
(1, 42, 'Rösler', 'David', 'LordLayer@gmx.de', 2, 71665, 'Gleis 9 ³/4', -1, '2024-02-28'),
(2, 69, 'Müller', 'Felix', 'felix.mueller@gigachad.corp', 4, 71234, 'Leerstraße', 33, '2024-03-13'),
(3, 32, 'Kleiner', 'Jan', 'jan.kleiner@gigchad.corp', 3, 12345, 'Im Versteckten', 42, '2024-03-06'),
(4, 16, 'Michalow', 'Marina', 'marina.michalow@gigachad.corp', 3, 75417, 'Keinweg', 101, '2024-03-13'),
(7, 4, 'Pan', 'Peter', 'peterpan@magicland.corp', 1, 911, 'Wunderland 23', 88, '2024-03-27'),
(8, 1, 'Administrator', 'Der', 'admin@gigachad.corp', 3, 404, 'Privat', 0, '2024-03-20');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employee_project`
--

CREATE TABLE `employee_project` (
  `emp_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `task` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `employee_project`
--

INSERT INTO `employee_project` (`emp_id`, `project_id`, `task`) VALUES
(1, 2, 'Backend'),
(2, 1, 'Slogan überlegen'),
(3, 2, 'Serverinfrastruktur aufsetzen'),
(4, 2, 'Frontend'),
(7, 3, 'Gelbe & Schwarze Tonne'),
(8, 2, 'Projektaufsicht');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `project`
--

CREATE TABLE `project` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `start` date NOT NULL DEFAULT current_timestamp(),
  `deadline` date DEFAULT NULL,
  `goal` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `project`
--

INSERT INTO `project` (`id`, `name`, `start`, `deadline`, `goal`) VALUES
(1, 'Werbung für Waschmaschinen', '2024-03-21', '2024-04-10', 'Erfolgreiche Werbung mit 20% Verkaufssteigerung'),
(2, 'Website', '2024-03-26', '2024-04-18', 'Website programmiern'),
(3, 'Müll rausbringen', '2024-03-27', '0000-00-00', 'Müllabfuhr am Mittwoch nicht verpassen');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indizes für die Tabelle `employee_project`
--
ALTER TABLE `employee_project`
  ADD PRIMARY KEY (`emp_id`,`project_id`),
  ADD KEY `employee_projects_project_id` (`project_id`);

--
-- Indizes für die Tabelle `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`);

--
-- Constraints der Tabelle `employee_project`
--
ALTER TABLE `employee_project`
  ADD CONSTRAINT `employee_projects_emp_id` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `employee_projects_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
