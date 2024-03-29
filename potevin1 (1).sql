-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : ven. 29 mars 2024 à 08:55
-- Version du serveur : 10.5.23-MariaDB-0+deb11u1
-- Version de PHP : 8.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `potevin1`
--

-- --------------------------------------------------------

--
-- Structure de la table `Categories`
--

CREATE TABLE `Categories` (
  `id_categorie` int(11) NOT NULL,
  `labelle` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Categories`
--

INSERT INTO `Categories` (`id_categorie`, `labelle`) VALUES
(1, 'Science-fiction'),
(2, 'Super-héros'),
(3, 'Aventure'),
(4, 'Guerre'),
(5, 'Histoire'),
(6, 'Action'),
(7, 'Comédie'),
(8, 'Drame'),
(9, 'Comédie dramatique'),
(10, 'Fiction jeunesse'),
(11, 'Film musical'),
(12, 'Policier'),
(13, 'espionnage'),
(14, 'fantastique'),
(15, 'horreur'),
(16, 'Western'),
(17, 'Documentaire');

-- --------------------------------------------------------

--
-- Structure de la table `Comptes`
--

CREATE TABLE `Comptes` (
  `id_utilisateur` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `email` varchar(70) NOT NULL,
  `pswd` varchar(64) NOT NULL,
  `dateNaissance` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `FilmCategorie`
--

CREATE TABLE `FilmCategorie` (
  `id_film` int(11) NOT NULL,
  `id_categorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `FilmCategorie`
--

INSERT INTO `FilmCategorie` (`id_film`, `id_categorie`) VALUES
(1, 1),
(1, 9),
(2, 1),
(2, 2),
(3, 8),
(3, 15);

-- --------------------------------------------------------

--
-- Structure de la table `Films`
--

CREATE TABLE `Films` (
  `id_film` int(11) NOT NULL,
  `titre` varchar(30) NOT NULL,
  `realisateur` varchar(30) NOT NULL,
  `annee` int(11) NOT NULL,
  `urlImage` text NOT NULL,
  `urlTrailer` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Films`
--

INSERT INTO `Films` (`id_film`, `titre`, `realisateur`, `annee`, `urlImage`, `urlTrailer`) VALUES
(1, 'E.T.', 'Steven Spielberg', 1982, 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSV5O9PUahoMcrUOdrORPDRswRoQ0l1Qm1dxVo4lk9ykS4lb4Eg', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Jva4IWuDYLM?si=SS8hW4FEuOhhpxFd\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>'),
(2, 'Avengers: Endgame', 'Anthony et Joe Russo', 2019, 'https://fr.web.img2.acsta.net/pictures/19/04/04/09/04/0472053.jpg', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/bgTlt5-l-AA?si=0mUOiD0ei6o0IBkg\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>'),
(3, 'Oppenheimer', 'Christopher Nolan', 2023, 'https://fr.web.img5.acsta.net/pictures/23/05/26/16/52/2793170.jpg', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/CoXtvSRpHgM?si=kZvWn_8U9f3M3TdT\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Categories`
--
ALTER TABLE `Categories`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Index pour la table `Comptes`
--
ALTER TABLE `Comptes`
  ADD PRIMARY KEY (`id_utilisateur`);

--
-- Index pour la table `FilmCategorie`
--
ALTER TABLE `FilmCategorie`
  ADD PRIMARY KEY (`id_film`,`id_categorie`),
  ADD KEY `id_categorie` (`id_categorie`);

--
-- Index pour la table `Films`
--
ALTER TABLE `Films`
  ADD PRIMARY KEY (`id_film`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Categories`
--
ALTER TABLE `Categories`
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `Comptes`
--
ALTER TABLE `Comptes`
  MODIFY `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Films`
--
ALTER TABLE `Films`
  MODIFY `id_film` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `FilmCategorie`
--
ALTER TABLE `FilmCategorie`
  ADD CONSTRAINT `FilmCategorie_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `Films` (`id_film`),
  ADD CONSTRAINT `FilmCategorie_ibfk_2` FOREIGN KEY (`id_categorie`) REFERENCES `Categories` (`id_categorie`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
