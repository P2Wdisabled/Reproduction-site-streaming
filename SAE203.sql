-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 11 avr. 2024 à 15:13
-- Version du serveur :  8.0.36-0ubuntu0.20.04.1
-- Version de PHP : 7.4.3-4ubuntu2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `SAE203`
--

-- --------------------------------------------------------

--
-- Structure de la table `Categories`
--

CREATE TABLE `Categories` (
  `id_categorie` int NOT NULL,
  `labelle` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
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
(17, 'Documentaire'),
(18, 'Fantasy'),
(19, 'War'),
(20, 'Science Fiction'),
(21, 'Adventure'),
(22, 'Horror'),
(23, 'Thriller'),
(24, 'Drama'),
(25, 'Animation'),
(26, 'Comedy'),
(27, 'Family'),
(28, 'Crime'),
(29, 'Mystery'),
(30, 'Romance'),
(31, 'History'),
(32, 'Music'),
(33, 'TV Movie');

-- --------------------------------------------------------

--
-- Structure de la table `Commentaires`
--

CREATE TABLE `Commentaires` (
  `id_comment` int NOT NULL,
  `id_film` int NOT NULL,
  `id_profile` int NOT NULL,
  `date` date NOT NULL,
  `commentaire` text COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Commentaires`
--

INSERT INTO `Commentaires` (`id_comment`, `id_film`, `id_profile`, `date`, `commentaire`, `status`) VALUES
(4, 35, 6, '2024-04-02', 'normalement c\'est terminé', 'accepted'),
(5, 3, 5, '2024-04-04', 'ça a l\'aire de bien fonctionner', 'accepted'),
(6, 35, 5, '2024-04-03', 'oh parfait ça, il est génial le site', 'accepted'),
(7, 115, 33, '2024-04-03', 'il était grave cool le filme', 'accepted'),
(8, 3, 6, '2024-04-04', 'pas mal', 'accepted'),
(9, 35, 18, '2024-04-04', 'pas vu', 'pending');

-- --------------------------------------------------------

--
-- Structure de la table `Comptes`
--

CREATE TABLE `Comptes` (
  `id_utilisateur` int NOT NULL,
  `nom` varchar(30) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Comptes`
--

INSERT INTO `Comptes` (`id_utilisateur`, `nom`) VALUES
(5, 'mel'),
(6, 'louis'),
(7, 'Loris'),
(8, 'emma'),
(9, 'françois'),
(10, 'julien'),
(11, 'arda'),
(12, 'François-pierre'),
(13, 'Matéo'),
(14, 'Stannie'),
(15, 'Ethan'),
(16, 'Alexis'),
(17, 'Louka'),
(18, 'Brad'),
(19, 'Rafaël'),
(20, 'Florian'),
(21, 'Enguerran'),
(22, 'Bastien'),
(23, 'Cyriaque'),
(24, 'Eloïse'),
(25, 'Melih'),
(26, 'Mathys'),
(27, 'Gilian'),
(28, 'Lauryne'),
(29, 'Mathias'),
(30, 'Alexandre'),
(31, 'Vivien'),
(32, 'Kévin'),
(33, 'Armand'),
(34, 'Kélian'),
(35, 'William'),
(36, 'Matis'),
(37, 'Noa'),
(38, 'Nathan'),
(39, 'Julian'),
(41, 'Jean-José'),
(42, 'Jean'),
(43, 'Enzo'),
(44, 'Maël');

-- --------------------------------------------------------

--
-- Structure de la table `Films`
--

CREATE TABLE `Films` (
  `id_film` int NOT NULL,
  `titre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `realisateur` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `annee` int NOT NULL,
  `urlImage` text COLLATE utf8mb4_general_ci NOT NULL,
  `urlTrailer` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `Priorite` int NOT NULL,
  `id_categorie` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Films`
--

INSERT INTO `Films` (`id_film`, `titre`, `realisateur`, `annee`, `urlImage`, `urlTrailer`, `Priorite`, `id_categorie`) VALUES
(1, 'E.T.', 'Steven Spielberg', 1982, 'et.jfif', 'https://www.youtube.com/embed/Jva4IWuDYLM?si=SS8hW4FEuOhhpxFd', 0, 1),
(2, 'Avengers: Endgame', 'Anthony et Joe Russo', 2019, 'avengers-endgame.jpg', 'https://www.youtube.com/embed/bgTlt5-l-AA?si=0mUOiD0ei6o0IBkg', 0, 2),
(3, 'Oppenheimer', 'Christopher Nolan', 2023, 'oppenheimer.jpg', 'https://www.youtube.com/embed/CoXtvSRpHgM?si=kZvWn_8U9f3M3TdT', 0, 8),
(35, 'Spider-Man: Far From Home', '	Jon Watts', 2019, 'spiderman-farfromhome.jpg', 'https://www.youtube.com/embed/inFIHmGshgk?si=kYpreCGtq5dex7V5', 0, 6),
(36, 'Godzilla x Kong : Le nouvel Empire', 'Adam Wingard', 2024, 'nKnWr062zhRvk48NtK27zz3oLgS.jpg', 'https://www.youtube.com/embed/XeDbyVODQ5M', 1, 1),
(37, 'Kung Fu Panda 4', 'Mike Mitchell', 2024, 'kDp1vUBnMpe8ak4rjgl3cLELqjU.jpg', 'https://www.youtube.com/embed/d2OONzqh2jk', 0, 1),
(38, 'Road House', 'Doug Liman', 2024, 'lwPsIgh98Wnpvkr3svkZwlhDrfm.jpg', 'https://www.youtube.com/embed/Y0ZsLudtfjI', 0, NULL),
(39, 'Argylle', 'Matthew Vaughn', 2024, 'uVAk2YliqInQfH4B4vzZ75rwcNB.jpg', 'https://www.youtube.com/embed/Sy6eNs3EW3E', 0, NULL),
(40, 'The Weapon', 'Tony Schiena', 2023, 'xbRpgiF5whvkSMRBSTdEffW6dwP.jpg', 'https://www.youtube.com/embed/zEd-ur8vvNc', 0, NULL),
(41, 'Wonka', 'Paul King', 2023, 'aKK2C3SErXIhNdT9gI93as2b8GV.jpg', 'https://www.youtube.com/embed/wYmtRhKvmVE', 1, NULL),
(45, 'Madame Web', 'S.J. Clarkson', 2024, 'xAHGuVQFTbSbbdeUbkfrAY8kf2m.jpg', 'https://www.youtube.com/embed/ZTycQKub30c', 1, 6),
(46, 'Creation of the Gods I: Kingdom of Storms', 'Wuershan', 2023, '8fzJZQhmkLyZeXdZUi1eE2ZKhkm.jpg', 'https://www.youtube.com/embed/0ucTl-cxIjc', 0, 19),
(47, 'Alienoid : Les Protecteurs du futur', 'Choi Dong-hoon', 2022, 'sYCUwnywPbN8GN3LUJ1kCYyKoH4.jpg', 'https://www.youtube.com/embed/myMfVZX9Nso', 0, 18),
(48, 'La Demoiselle et le dragon', 'Juan Carlos Fresnadillo', 2024, 'fP9OIOzJFPRLBkNfHyPGPf6wmfx.jpg', 'https://www.youtube.com/embed/5fv9UdRC8eg', 0, 18),
(49, 'No Way Up', 'Claudio Fäh', 2024, 'ktxq0LYgl41I2DUn49TYIaS9dZR.jpg', 'https://www.youtube.com/embed/UJa1zUYegqo', 0, 22),
(50, 'Alana, déesse de justice', 'Upi Avianto', 2022, 'lMZWF6Bm8MkFHjL9PHgUzHuuYfi.jpg', 'https://www.youtube.com/embed/QeT6Ke2kQYo', 0, 18),
(51, 'La Passion du Christ', 'Mel Gibson', 2004, 'nVjopQNIWFGQ4Kk73QxAeIw6xov.jpg', 'https://www.youtube.com/embed/4Aif1qEB_JU', 0, 24),
(52, 'Migration', 'Benjamin Renner', 2023, '3xGLxvuVvLoPhrCxkofkczfR6R5.jpg', 'https://www.youtube.com/embed/LPaVMtOXQY4', 0, 25),
(53, 'Bullet Train Down', 'Brian Nowak', 2022, '5a7cocgyVuFjYV71neDIGVzD6Yq.jpg', 'https://www.youtube.com/embed/LFswH2TrAg0', 0, 6),
(54, 'Land of Bad', 'William Eubank', 2024, 'z1uj3ZGvMa03gqYsl1jns0CBy8z.jpg', 'https://www.youtube.com/embed/SU9tWw0aofg', 0, 19),
(55, '24 Hours with Gaspar', 'Yosep Anggi Noen', 2023, 'cOfwvriK6oQvFYCDkdI43KGzZ0B.jpg', 'https://www.youtube.com/embed/W5Gwgw-DpDw', 0, 20),
(56, 'The Pig, the Snake and the Pigeon', 'Wong Ching-Po', 2023, 'eNvuf4PHepy0nlXfludjGCJGG59.jpg', 'https://www.youtube.com/embed/tFyzEsPcyrg', 0, 28),
(57, 'Godzilla vs. Kong', 'Adam Wingard', 2021, '4bTShLVFnVKK31cowgjdAIZV84T.jpg', 'https://www.youtube.com/embed/Qi_u_1rq8_o', 0, 20),
(58, 'Megamind vs. the Doom Syndicate', 'Eric Fogel', 2024, 'fko8CPrnspewLXgFUlUkivyvpHX.jpg', 'https://www.youtube.com/embed/mq68rIllIvo', 0, 25),
(59, 'Dune : Deuxième partie', 'Denis Villeneuve', 2024, 'iRNbRAIGQQr5diGnjpwJFm0dgt4.jpg', 'https://www.youtube.com/embed/Xq6OPXGEzBo', 0, 21),
(60, 'Vikings: Battle of Heirs', 'Robin Keane', 2023, '87goLbbqrJqAxqDS5cBsik1zKT.jpg', 'https://www.youtube.com/embed/PfaJiHP1oHU', 0, 6),
(61, 'Air Force One Down', 'James Bamford', 2024, '4VBzIkP0EJWZysH5LiIhXxJwaDU.jpg', 'https://www.youtube.com/embed/0cWBaR8JW6M', 0, 23),
(62, 'Godzilla Minus One', 'Takashi Yamazaki', 2023, 'tBzOqSc51CiUeOlxW2unvYVBU8v.jpg', 'https://www.youtube.com/embed/CEArEbO25lE', 0, 22),
(63, 'Meteor', 'Brett Bentman', 2021, 'tVMddOS5bi3YPVPgTPlEw0TOWoF.jpg', 'https://www.youtube.com/embed/08wIEr6VPgE', 0, 23),
(64, 'Code 8 : Partie II', 'Jeff Chan', 2024, '1aJerbWBk8sBOEXEFwgojSMYOIU.jpg', 'https://www.youtube.com/embed/omBi2KxEcRk', 0, 28),
(65, 'Tout sauf toi', 'Will Gluck', 2023, '41Dg2A3EsS3mAjeqVH1c2EdeGU3.jpg', 'https://www.youtube.com/embed/ou9Lcax6DdQ', 0, 30),
(66, 'Pauvres créatures', 'Yorgos Lanthimos', 2023, 'roRjNH7cRVrZQYv1Ex8ownMu2ey.jpg', 'https://www.youtube.com/embed/QKGa2XHHWrI', 0, 26),
(67, 'Skal - Fight for Survival', 'Benjamin Cappelletti', 2023, '1On8iF3AsFIbpyfZg1xiGWMAFBn.jpg', 'https://www.youtube.com/embed/85Sg3MTrXyo', 0, 23),
(68, 'Wish, Asha et la bonne étoile', 'Chris Buck', 2023, 'g3wF6T4xa727p4W3A44oFqM3XTm.jpg', 'https://www.youtube.com/embed/JISBGkkI5rE', 0, 18),
(69, 'Les Dix Commandements', 'Cecil B. DeMille', 1956, 'q0KM14O75n0h4324npmThHi56FG.jpg', 'https://www.youtube.com/embed/TwPwRyF9RH0', 0, 31),
(70, 'Ruthless', 'Art Camacho', 2023, '4ndp1pnHWRuiZLNpFJvO4Kh6Tav.jpg', 'https://www.youtube.com/embed/iCM060OOWSY', 0, 6),
(71, 'Jaque Mate', 'Jorge Nisco', 2024, 'umRkEsTwKU5nVbLVNw22cYB2fjm.jpg', 'https://www.youtube.com/embed/742HNcvLh68', 0, 26),
(72, 'Dune - Première partie', 'Denis Villeneuve', 2021, 'qpyaW4xUPeIiYA5ckg5zAZFHvsb.jpg', 'https://www.youtube.com/embed/AHqIUDZBRM4', 0, 20),
(73, 'The Marvels', 'Nia DaCosta', 2023, 'mqAQO6j5gkq6iwCXNbXpzf0RXBU.jpg', 'https://www.youtube.com/embed/dpjGzDvuueE', 0, 20),
(74, 'S.O.S. Fantômes : La Menace de Glace', 'Gil Kenan', 2024, '4vMh5IgOZYxyAOCNjk3CIpLzLxH.jpg', 'https://www.youtube.com/embed/P9pai8K8AaY', 0, 18),
(75, 'The Loch Ness Horror', 'Tyler-James', 2023, 'fFdG5U2PzhRrHRpbbORQrcAMn8D.jpg', 'https://www.youtube.com/embed/9FA8tCT-PF4', 0, 22),
(76, 'Leave', 'Alex Herron', 2022, '908fS4q4oxEot5SgDDcwFnKMNxk.jpg', 'https://www.youtube.com/embed/cKQxHfug6BU', 0, 23),
(77, 'Godzilla II : Roi des Monstres', 'Michael Dougherty', 2019, 'rmM0NovZxrIT9f6OIoUyzWwRQ1L.jpg', 'https://www.youtube.com/embed/ZK8AvDwwegI', 0, 6),
(78, 'Death Alley', 'Nicholas Barton', 2021, 'iIKYK9mdapWlJ21YNRGB57WKErK.jpg', 'https://www.youtube.com/embed/ffyf8sDQX1M', 0, 16),
(79, 'The OctoGames', 'Aaron Mirtes', 2022, 'qGz5rffXhegQH5PGUDiObqoOt06.jpg', 'https://www.youtube.com/embed/luwZJPaNp7w', 0, 22),
(80, 'Aquaman et le Royaume perdu', 'James Wan', 2023, 'w8r7NAEIGLPH5r3NhiMobEO80PS.jpg', 'https://www.youtube.com/embed/rS3GZUaSrqw', 0, 18),
(81, 'Bob Marley : One Love', 'Reinaldo Marcus Green', 2024, 'iN6WZnetgrf2gnS4bMdCDZLDkar.jpg', 'https://www.youtube.com/embed/XpBY5nS3_fg', 0, 32),
(82, 'Le Retour des Thunderman', 'Trevor Kirschner', 2024, 'p4HOnQETJNCrSAQvvjvx6rGAHeV.jpg', 'https://www.youtube.com/embed/zSOtzFZEUPc', 0, 27),
(83, 'The Beekeeper', 'David Ayer', 2024, 'pZIBf6sc5ZcascB6lKHo5NhXcOz.jpg', 'https://www.youtube.com/embed/lyFFerAxpF0', 0, 24),
(84, 'I viaggiatori', 'Ludovico Di Martino', 2022, 'uDJAvuOrULRF2cRYIElQkiyyh0N.jpg', 'https://www.youtube.com/embed/wYjoMjwS12k', 0, 33),
(85, 'Fast & Furious X', 'Louis Leterrier', 2023, 'piYNJlLvSlXYnXh6ZoKzhPdrMfV.jpg', 'https://www.youtube.com/embed/0qCCiY2se90', 0, 23),
(86, 'Godzilla', 'Gareth Edwards', 2014, '5PFXNXUsjlKFP4tmewK6WVgbFmT.jpg', 'https://www.youtube.com/embed/rWplCoFZFeA', 0, 24),
(87, 'Red Right Hand', 'Eshom Nelms', 2024, 'vfEG79SQIg3p6B8rBLVeIo2BBhb.jpg', 'https://www.youtube.com/embed/fJzyFV4wXWk', 0, 28),
(88, 'Stopmotion', 'Robert Morgan', 2024, 'kWzWZEctPcZ0dATbtcYy6lIJgGj.jpg', 'https://www.youtube.com/embed/bgAwzPWam7I', 0, 22),
(89, 'A.R.I.', 'Stephen Shimek', 2022, 'o9sT3vYJSXGsrroOKQjlm4H4lsZ.jpg', 'https://www.youtube.com/embed/fQ1FzSDTofM', 0, 27),
(90, 'Bienvenue chez les Casagrandes : Le film', 'Miguel Puga', 2024, 'uEf3SQRrrHe9RVAodHU2NuhUuks.jpg', 'https://www.youtube.com/embed/gJVC-4LxX3s', 0, 26),
(91, 'Freelance', 'Pierre Morel', 2023, 'wRTKRKfXxf19eDEoxUYG6fPc1ob.jpg', 'https://www.youtube.com/embed/W0k2XerT8Nw', 0, 26),
(92, 'Attack', 'Lakshya Raj Anand', 2022, '5jGKbYuZtdxSNOocI6ZziQeiY4n.jpg', 'https://www.youtube.com/embed/KnC-XvFGflM', 0, 23),
(93, 'ผจญภัยล่าขุมทรัพย์หมื่นลี้', 'Ittisak Eusunthornwattana', 2023, 'w0Fao59IOjgfA9a1BFHG5nECGJg.jpg', 'https://www.youtube.com/embed/ZN6_PSCGIwk', 0, 30),
(94, 'The Masked Saint', 'Warren P. Sonoda', 2016, 'zlT1Tc9hA1Ntye5hr7Gxos9U6U9.jpg', 'https://www.youtube.com/embed/4_mrNsa-0PI', 0, 28),
(95, 'Drive-Away Dolls', 'Ethan Coen', 2024, 'ccTvcYPTq9oSVAgIAsCHrwbWJVx.jpg', 'https://www.youtube.com/embed/2yDDUPR3eC0', 0, 28),
(96, 'Badland Hunters', 'Heo Myeong-haeng', 2024, '2mPde54Cl50Ck8DHEUnvLt56tXR.jpg', 'https://www.youtube.com/embed/G82CgMekC5U', 0, 20),
(97, 'She Came to Me', 'Rebecca Miller', 2023, 'aBnG2kEl7NN7GjFEWwz20Lxz8I0.jpg', 'https://www.youtube.com/embed/iQHUM7C5gDw', 0, 30),
(98, 'The Family Plan', 'Simon Cellan Jones', 2023, '18qxq7jPWP1TGxHTYkCcCc3M0mP.jpg', 'https://www.youtube.com/embed/VQ2XpnUvksw', 0, 26),
(99, '#хочувигру', 'Anna Zaytseva', 2021, 'wNQuRpVSETj15ht8knrTZgEOoTn.jpg', 'https://www.youtube.com/embed/IqH3DkvzDnk', 0, 24),
(100, 'Sorry, Charlie', 'Colton Tran', 2023, '5FdlhzK976qK6tbmVre5eX1CGAt.jpg', 'https://www.youtube.com/embed/l6quD9jvRe8', 0, 23),
(101, 'The Five', 'Travis Mills', 2023, 'xckDPGprPVDpuzhSyo9E7SZJ2wa.jpg', 'https://www.youtube.com/embed/cdwT6lYSWGI', 0, 16),
(102, 'Napoléon', 'Ridley Scott', 2023, 'lnCoPFCcg6vRv8M2RbNotUkEMAN.jpg', 'https://www.youtube.com/embed/VnsYxOHFNzQ', 0, 19),
(103, 'Spaceman', 'Johan Renck', 2024, 'f46WvKEsBn98WJbPJcO47ZoKn6B.jpg', 'https://www.youtube.com/embed/SG4k53x9anQ', 0, 21),
(104, 'After the Pandemic', 'Richard Lowry', 2022, 'p1LbrdJ53dGfEhRopG71akfzOVu.jpg', 'https://www.youtube.com/embed/UZCVv3SFNtE', 0, 20),
(105, 'Le Cœur au vol', 'Recai Karagöz', 2024, '7yQrflwBkZWVJbrJs67s31IKPUJ.jpg', 'https://www.youtube.com/embed/f77agh-CZ-c', 0, 24),
(106, 'Kong : Skull Island', 'Jordan Vogt-Roberts', 2017, 'mfbpsBiEu5EM1OAzfxULXC1067r.jpg', 'https://www.youtube.com/embed/mjKTtE_BKO8', 0, 18),
(107, 'Soixante minutes', 'Oliver Kienle', 2024, 'aajCqg315CoJPu1NmgPCkbRjnl6.jpg', 'https://www.youtube.com/embed/uiyZW82Rxf8', 0, 6),
(108, 'Those Who Call', 'Anubys Lopez', 2021, 'kps2mkDFWDnb00BY1kKj0GIjSCP.jpg', 'https://www.youtube.com/embed/imW8H608otM', 0, 22),
(109, 'Transformers: Rise Of The Beasts', 'Steven Caple Jr.', 2023, 'kq6AYN96FjWSZQVRYpAPmBAVq2s.jpg', 'https://www.youtube.com/embed/kCsjv5j4mBc', 0, 21),
(110, 'Le garçon et le héron', 'Hayao Miyazaki', 2023, 'f9EoS3lVr644WXO8YPRvBiTS1K.jpg', 'https://www.youtube.com/embed/A002-b7IH2M', 0, 25),
(111, 'Avatar : La Voie de l\'eau', 'James Cameron', 2022, 'ilp4BRPbMQ07fcUePhR8mDN8Kle.jpg', 'https://www.youtube.com/embed/pwA0k1oNrhI', 0, 20),
(112, 'Irish Wish', 'Janeen Damian', 2024, 'b2jlRzErQu2j4tJHC8RHWNYU0Lj.jpg', 'https://www.youtube.com/embed/_gKXowSyfjM', 0, 18),
(113, 'Underground Fights', 'Christian Sesma', 2024, 'z6JafhE2n4AZx6TZdW2NwMNn7yq.jpg', 'https://www.youtube.com/embed/NGo00SVyeso', 0, 23),
(114, 'The Wild', 'Kim Bong-han', 2023, 'sm9ETmNPR25kBhRAL1vB6IxvTf8.jpg', 'https://www.youtube.com/embed/', 0, 28),
(115, 'Super Mario Bros. le film', 'Michael Jelenic', 2023, 'ahMxyHMSJXingQr4yJBMzMU9k42.jpg', 'https://www.youtube.com/embed/0xvw5oX028I?si=1-Q1l11RjDG6iwXA', 0, 21),
(116, 'S.O.S. Fantômes : L\'Héritage', 'Jason Reitman', 2021, 'w1cmavTc0IwISr9ypI1XkBtxhVK.jpg', 'https://www.youtube.com/embed/hFaI8UCOFOI', 0, 26),
(117, 'Ghost Project', 'Federico Finkielstain', 2023, 'jYBEX4ed6NBeDYbqC5Rd0xVzblO.jpg', 'https://www.youtube.com/embed/dWeDFJ7UATE', 0, 20);

-- --------------------------------------------------------

--
-- Structure de la table `Notes`
--

CREATE TABLE `Notes` (
  `id_profil` int NOT NULL,
  `id_film` int NOT NULL,
  `note` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Notes`
--

INSERT INTO `Notes` (`id_profil`, `id_film`, `note`) VALUES
(5, 3, 5),
(6, 1, 5),
(6, 2, 4),
(6, 3, 5),
(6, 35, 4),
(6, 36, 5),
(6, 37, 5),
(6, 38, 5),
(6, 45, 5);

-- --------------------------------------------------------

--
-- Structure de la table `Playlist`
--

CREATE TABLE `Playlist` (
  `id_film` int NOT NULL,
  `id_profile` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Playlist`
--

INSERT INTO `Playlist` (`id_film`, `id_profile`) VALUES
(3, 5),
(35, 5),
(36, 5),
(3, 6),
(35, 6),
(35, 16),
(111, 16),
(58, 17),
(64, 17),
(1, 18),
(52, 18),
(58, 18),
(115, 18),
(41, 21),
(52, 21),
(2, 27),
(3, 27),
(3, 31),
(110, 33),
(115, 33);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Categories`
--
ALTER TABLE `Categories`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Index pour la table `Commentaires`
--
ALTER TABLE `Commentaires`
  ADD PRIMARY KEY (`id_comment`),
  ADD UNIQUE KEY `id_film` (`id_film`,`id_profile`);

--
-- Index pour la table `Comptes`
--
ALTER TABLE `Comptes`
  ADD PRIMARY KEY (`id_utilisateur`);

--
-- Index pour la table `Films`
--
ALTER TABLE `Films`
  ADD PRIMARY KEY (`id_film`),
  ADD KEY `id_categorie` (`id_categorie`);

--
-- Index pour la table `Notes`
--
ALTER TABLE `Notes`
  ADD PRIMARY KEY (`id_profil`,`id_film`),
  ADD KEY `Notes_ibfk_1` (`id_film`);

--
-- Index pour la table `Playlist`
--
ALTER TABLE `Playlist`
  ADD PRIMARY KEY (`id_film`,`id_profile`),
  ADD KEY `id_profile` (`id_profile`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Categories`
--
ALTER TABLE `Categories`
  MODIFY `id_categorie` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT pour la table `Commentaires`
--
ALTER TABLE `Commentaires`
  MODIFY `id_comment` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `Comptes`
--
ALTER TABLE `Comptes`
  MODIFY `id_utilisateur` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT pour la table `Films`
--
ALTER TABLE `Films`
  MODIFY `id_film` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Commentaires`
--
ALTER TABLE `Commentaires`
  ADD CONSTRAINT `Commentaires_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `Films` (`id_film`),
  ADD CONSTRAINT `Commentaires_ibfk_3` FOREIGN KEY (`id_film`) REFERENCES `Films` (`id_film`);

--
-- Contraintes pour la table `Films`
--
ALTER TABLE `Films`
  ADD CONSTRAINT `Films_ibfk_1` FOREIGN KEY (`id_categorie`) REFERENCES `Categories` (`id_categorie`);

--
-- Contraintes pour la table `Notes`
--
ALTER TABLE `Notes`
  ADD CONSTRAINT `Notes_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `Films` (`id_film`),
  ADD CONSTRAINT `Notes_ibfk_2` FOREIGN KEY (`id_profil`) REFERENCES `Comptes` (`id_utilisateur`);

--
-- Contraintes pour la table `Playlist`
--
ALTER TABLE `Playlist`
  ADD CONSTRAINT `Playlist_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `Films` (`id_film`),
  ADD CONSTRAINT `Playlist_ibfk_2` FOREIGN KEY (`id_profile`) REFERENCES `Comptes` (`id_utilisateur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
