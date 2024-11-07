-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 07 nov. 2024 à 10:15
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `university`
--

-- --------------------------------------------------------

--
-- Structure de la table `contenu`
--

DROP TABLE IF EXISTS `contenu`;
CREATE TABLE IF NOT EXISTS `contenu` (
  `IDD` int NOT NULL,
  `IDEX` int NOT NULL,
  `BAREME` double DEFAULT NULL,
  PRIMARY KEY (`IDD`,`IDEX`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `contenu`
--

INSERT INTO `contenu` (`IDD`, `IDEX`, `BAREME`) VALUES
(1, 1, 6),
(1, 3, 4),
(2, 2, 5),
(2, 4, 2),
(3, 6, 3),
(3, 7, 4),
(3, 8, 3),
(4, 1, 1),
(4, 5, 2),
(4, 9, 1),
(5, 1, 2),
(5, 3, 5),
(5, 6, 5),
(5, 2, 3),
(5, 11, 5),
(6, 1, 3),
(6, 2, 6),
(6, 4, 5),
(6, 8, 2),
(7, 2, 3),
(7, 5, 2),
(8, 5, 2),
(8, 2, 2),
(8, 7, 2),
(8, 6, 2),
(8, 11, 2),
(9, 2, 2),
(9, 4, 2),
(9, 8, 2),
(9, 11, 4),
(10, 1, 2),
(10, 3, 2),
(10, 6, 2),
(10, 9, 2),
(10, 10, 2),
(10, 4, 2);

-- --------------------------------------------------------

--
-- Structure de la table `devoir`
--

DROP TABLE IF EXISTS `devoir`;
CREATE TABLE IF NOT EXISTS `devoir` (
  `IDD` int NOT NULL,
  `DATE_CREATION` date DEFAULT NULL,
  `PROF_CREATEUR` int NOT NULL,
  `NIVEAU` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`IDD`),
  KEY `ce1_devoir` (`PROF_CREATEUR`),
  KEY `ce2_devoir` (`NIVEAU`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `devoir`
--

INSERT INTO `devoir` (`IDD`, `DATE_CREATION`, `PROF_CREATEUR`, `NIVEAU`) VALUES
(1, '0000-00-00', 1, '6eme'),
(2, '0000-00-00', 1, '5eme'),
(3, '0000-00-00', 2, '4eme'),
(4, '0000-00-00', 1, '6eme'),
(5, '0000-00-00', 2, '5eme'),
(6, '0000-00-00', 3, '4eme'),
(7, '0000-00-00', 8, '4eme'),
(8, '0000-00-00', 4, '3eme'),
(9, '0000-00-00', 2, '3eme'),
(10, '0000-00-00', 5, '3eme');

-- --------------------------------------------------------

--
-- Structure de la table `eleve`
--

DROP TABLE IF EXISTS `eleve`;
CREATE TABLE IF NOT EXISTS `eleve` (
  `IDEL` int NOT NULL,
  `NOM` varchar(50) NOT NULL,
  `PRENOM` varchar(30) DEFAULT NULL,
  `COLLEGE` varchar(8) DEFAULT NULL,
  `NIVEAU` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`IDEL`),
  KEY `ce1_eleve` (`COLLEGE`),
  KEY `ce2_eleve` (`NIVEAU`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `eleve`
--

INSERT INTO `eleve` (`IDEL`, `NOM`, `PRENOM`, `COLLEGE`, `NIVEAU`) VALUES
(1, 'RAMI', 'ALEXANDRE', '0341278E', '6eme'),
(2, 'DUPONT', 'MAXIME', '0340008Z', '4eme'),
(3, 'DUPONT', 'ARNAUD', '0341278E', '6eme'),
(4, 'VIGROS', 'HELENE', '0341278E', '6eme'),
(5, 'GOMAZ', 'GILLE', '0341280G', '5eme'),
(6, 'CHOUMIN', 'KHALIL', '0340008Z', '4eme'),
(7, 'MONTEO', 'ILONA', '0340008Z', '3eme'),
(8, 'MONTEO', 'MILAN', '0340008Z', '5eme');

-- --------------------------------------------------------

--
-- Structure de la table `etablissement`
--

DROP TABLE IF EXISTS `etablissement`;
CREATE TABLE IF NOT EXISTS `etablissement` (
  `RNE` varchar(8) NOT NULL,
  `NOM` varchar(50) NOT NULL,
  `LOCALITE` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`RNE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `etablissement`
--

INSERT INTO `etablissement` (`RNE`, `NOM`, `LOCALITE`) VALUES
('0341278E', 'College Arthur Rimbaud', 'Montpellier'),
('0341280G', 'College Les Pins', 'Castries'),
('0340008Z', 'College Victor Hugo', 'Bessan'),
('0301094B', 'College Diderot', 'Nimes');

-- --------------------------------------------------------

--
-- Structure de la table `exercice`
--

DROP TABLE IF EXISTS `exercice`;
CREATE TABLE IF NOT EXISTS `exercice` (
  `IDEX` int NOT NULL,
  `CONTENU` varchar(250) DEFAULT NULL,
  `NIVEAU` varchar(4) DEFAULT NULL,
  `PROPRIETAIRE` int DEFAULT NULL,
  `DATE_CREATION` date DEFAULT NULL,
  PRIMARY KEY (`IDEX`),
  KEY `ce1_exercice` (`NIVEAU`),
  KEY `ce2_exercice` (`PROPRIETAIRE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `exercice`
--

INSERT INTO `exercice` (`IDEX`, `CONTENU`, `NIVEAU`, `PROPRIETAIRE`, `DATE_CREATION`) VALUES
(1, 'Calculer 2+3', '6eme', 2, '0000-00-00'),
(2, 'Developper 2(3x+5)', '5eme', 1, '0000-00-00'),
(3, 'Calculer (-3)-(2)', '5eme', 2, '0000-00-00'),
(4, 'Calculer la médiane de la série suivante : 12 - 14 - 15 - 19 -22 -25', '5eme', 1, '0000-00-00'),
(5, 'Tracer un triangle equilatéral de 6 cm de côte', '6eme', 3, '0000-00-00'),
(6, 'Calculer la longueur du segment [AB]', '4eme', 2, '0000-00-00'),
(7, 'Tracer l\'image de A par la translation qui transforme B en C', '4eme', 2, '0000-00-00'),
(8, 'Simplifier l\'expression suivante puis exprimer son double en fonction de x', '4eme', 2, '0000-00-00'),
(9, 'Calculer le triple de 9', '6eme', 2, '0000-00-00'),
(10, 'Effectuer les calculs suivants : 8 + 3 * 5 ; 17 - 3*2', '6eme', 5, '0000-00-00'),
(11, 'Developper l\'expression suivante : (2x-5)²', '3eme', 5, '0000-00-00');

-- --------------------------------------------------------

--
-- Structure de la table `niveau`
--

DROP TABLE IF EXISTS `niveau`;
CREATE TABLE IF NOT EXISTS `niveau` (
  `NIVEAU` varchar(4) NOT NULL,
  PRIMARY KEY (`NIVEAU`)
) ;

--
-- Déchargement des données de la table `niveau`
--

INSERT INTO `niveau` (`NIVEAU`) VALUES
('3eme'),
('4eme'),
('5eme'),
('6eme');

-- --------------------------------------------------------

--
-- Structure de la table `notion`
--

DROP TABLE IF EXISTS `notion`;
CREATE TABLE IF NOT EXISTS `notion` (
  `IDEXO` int NOT NULL,
  `NOTION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`IDEXO`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `notion`
--

INSERT INTO `notion` (`IDEXO`, `NOTION`) VALUES
(1, 'calcul numerique'),
(2, 'calcul litteral'),
(3, 'calcul numerique'),
(4, 'calcul litteral'),
(5, 'geometrie'),
(6, 'geometrie'),
(7, 'geometrie'),
(8, 'calcul litteral'),
(9, 'calcul numerique'),
(10, 'calcul numerique'),
(11, 'calcul litteral');

-- --------------------------------------------------------

--
-- Structure de la table `passage`
--

DROP TABLE IF EXISTS `passage`;
CREATE TABLE IF NOT EXISTS `passage` (
  `IDD` int NOT NULL,
  `IDEL` int NOT NULL,
  `DATE_PASSAGE` date NOT NULL,
  `NOTE` int DEFAULT NULL,
  PRIMARY KEY (`IDD`,`IDEL`,`DATE_PASSAGE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `passage`
--

INSERT INTO `passage` (`IDD`, `IDEL`, `DATE_PASSAGE`, `NOTE`) VALUES
(1, 1, '0000-00-00', 5),
(1, 3, '0000-00-00', 6),
(1, 4, '0000-00-00', 4),
(2, 5, '0000-00-00', 5),
(2, 2, '0000-00-00', 6),
(3, 1, '0000-00-00', 8),
(3, 2, '0000-00-00', 8),
(3, 3, '0000-00-00', 7),
(3, 4, '0000-00-00', 6),
(4, 2, '0000-00-00', 8),
(4, 4, '0000-00-00', 7),
(4, 7, '0000-00-00', 7),
(5, 1, '0000-00-00', 5),
(5, 5, '0000-00-00', 5),
(5, 7, '0000-00-00', 6),
(5, 8, '0000-00-00', 7),
(6, 2, '0000-00-00', 7),
(6, 3, '0000-00-00', 6),
(6, 4, '0000-00-00', 8),
(7, 1, '0000-00-00', 6),
(7, 2, '0000-00-00', 6),
(7, 3, '0000-00-00', 5),
(8, 5, '0000-00-00', 4),
(8, 6, '0000-00-00', 8),
(9, 2, '0000-00-00', 5),
(9, 4, '0000-00-00', 8),
(9, 8, '0000-00-00', 7),
(9, 10, '0000-00-00', 7),
(10, 3, '0000-00-00', 6),
(10, 4, '0000-00-00', 6),
(10, 6, '0000-00-00', 7),
(10, 7, '0000-00-00', 6),
(10, 8, '0000-00-00', 8),
(10, 11, '0000-00-00', 7);

-- --------------------------------------------------------

--
-- Structure de la table `prof`
--

DROP TABLE IF EXISTS `prof`;
CREATE TABLE IF NOT EXISTS `prof` (
  `IDP` int NOT NULL,
  `NOM` varchar(20) NOT NULL,
  `ANNEE_NAISSANCE` int DEFAULT NULL,
  `RNE` varchar(8) DEFAULT NULL,
  `VILLE` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`IDP`),
  KEY `ce_prof` (`RNE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `prof`
--

INSERT INTO `prof` (`IDP`, `NOM`, `ANNEE_NAISSANCE`, `RNE`, `VILLE`) VALUES
(1, 'James Bond', 1972, '0341278E', 'Montpellier'),
(2, 'Bioman', 1970, '0341278E', 'Lunel'),
(3, 'Superman', 1978, '0341280G', 'Castries'),
(4, 'Batman', 1972, '0340008Z', 'Juvignac'),
(5, 'Hulk', 1979, '0340008Z', 'Montpellier'),
(6, 'Wonder Woman', 1983, '0341280G', 'Montpellier'),
(7, 'Tintin', 1974, '0340008Z', 'Grabels'),
(8, 'Zorro', 1972, '0340008Z', 'Castries');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
