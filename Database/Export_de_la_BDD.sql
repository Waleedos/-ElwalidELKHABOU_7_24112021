-- phpMyAdmin SQL Dump
-- version 5.0.4deb2ubuntu5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 14 déc. 2021 à 22:12
-- Version du serveur :  10.5.13-MariaDB-0ubuntu0.21.10.1
-- Version de PHP : 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ewek_groupomania`
--

-- --------------------------------------------------------

--
-- Structure de la table `Comments`
--

CREATE TABLE `Comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `publication_date` datetime NOT NULL DEFAULT current_timestamp(),
  `content` text NOT NULL,
  `user_id` smallint(5) UNSIGNED DEFAULT NULL,
  `post_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Comments`
--

INSERT INTO `Comments` (`id`, `publication_date`, `content`, `user_id`, `post_id`) VALUES
(2, '2021-12-14 21:08:43', 'Très belle Plage & vue', 2, 9),
(3, '2021-12-14 21:09:01', 'c\'est dans quel pays ?', 2, 8),
(4, '2021-12-14 21:09:29', 'waw', 2, 5),
(5, '2021-12-14 21:09:43', 'Oui', 2, 7),
(6, '2021-12-14 21:10:03', 'Cela veut tout dir', 2, 6);

-- --------------------------------------------------------

--
-- Structure de la table `Likes`
--

CREATE TABLE `Likes` (
  `id` int(10) UNSIGNED NOT NULL,
  `rate` tinyint(4) NOT NULL,
  `user_id` smallint(5) UNSIGNED NOT NULL,
  `post_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Likes`
--

INSERT INTO `Likes` (`id`, `rate`, `user_id`, `post_id`) VALUES
(11, 1, 2, 9),
(12, 1, 2, 7),
(13, 1, 2, 6),
(14, 1, 2, 5),
(15, 1, 6, 6);

-- --------------------------------------------------------

--
-- Structure de la table `Notifications`
--

CREATE TABLE `Notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` smallint(5) UNSIGNED NOT NULL,
  `initiator_id` smallint(5) UNSIGNED DEFAULT NULL,
  `post_id` mediumint(8) UNSIGNED NOT NULL,
  `type_id` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Notifications`
--

INSERT INTO `Notifications` (`id`, `user_id`, `initiator_id`, `post_id`, `type_id`) VALUES
(11, 4, 2, 9, 1),
(12, 4, 2, 9, 2),
(13, 5, 2, 8, 2),
(14, 7, 2, 7, 1),
(15, 6, 2, 6, 1),
(16, 9, 2, 5, 1),
(17, 9, 2, 5, 2),
(18, 7, 2, 7, 2),
(19, 6, 2, 6, 2);

-- --------------------------------------------------------

--
-- Structure de la table `Notification_types`
--

CREATE TABLE `Notification_types` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Notification_types`
--

INSERT INTO `Notification_types` (`id`, `name`) VALUES
(1, 'reaction'),
(2, 'comment'),
(3, 'answer');

-- --------------------------------------------------------

--
-- Structure de la table `Posts`
--

CREATE TABLE `Posts` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `publication_date` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` smallint(5) UNSIGNED DEFAULT NULL,
  `imageurl` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Posts`
--

INSERT INTO `Posts` (`id`, `publication_date`, `user_id`, `imageurl`, `content`) VALUES
(5, '2021-12-14 18:09:26', 9, 'http://localhost:3000/images/Capture_d’écran_2021-12-14_17-37-30_1639501766668.png', 'Voila un endroit merveilleux'),
(6, '2021-12-14 18:13:55', 6, 'http://localhost:3000/images/11_1639502035579.png', 'Allez Au sommets, nous serons seuls làba'),
(7, '2021-12-14 18:15:01', 7, 'http://localhost:3000/images/499D8D18-676E-42FA-84AB-2B883442BEFD_1639502101523.png', 'Une rencontre à vie'),
(8, '2021-12-14 18:15:56', 5, 'http://localhost:3000/images/10_1639502156793.png', 'Le Beau vieux temps'),
(9, '2021-12-14 18:17:01', 4, 'http://localhost:3000/images/333_1639502221004.png', 'le repos'),
(10, '2021-12-14 18:27:23', 2, 'http://localhost:3000/images/777777_1639502843555.png', 'Aimer l\'océan');

-- --------------------------------------------------------

--
-- Structure de la table `Users`
--

CREATE TABLE `Users` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `pictureurl` varchar(255) DEFAULT NULL,
  `outline` varchar(255) DEFAULT NULL,
  `isadmin` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Users`
--

INSERT INTO `Users` (`id`, `name`, `email`, `password`, `pictureurl`, `outline`, `isadmin`) VALUES
(1, 'Vladimirovsky', 'vladimirovsky@yahoo.com', 'U2FsdGVkX19v/T1eyyqaBr9tGcaj/nbx4wiw+4czleIa23Ehr+E+nEbokxeR7j7KvXSoT7xIlw3wRGyPiV5SlkboJqQf5zsBFchSUcO7R9I=', 'http://localhost:3000/images/AdminUser_1639514962895.png', NULL, 1),
(2, 'Christophe LeGrand', 'christophe@paris.com', 'U2FsdGVkX18jQZ2n0XyqbWy6nSfk36/5VfSv/dny0EMflno0AKtVFJzTUrWVzIxw265jfJsVgIlG9i4ohB5mBUG+KiTSCRoWKW6RsCikg74=', 'http://localhost:3000/images/555_1639502673118.png', NULL, 0),
(3, 'Michel Dupon', 'michel@le95.fr', 'U2FsdGVkX18q/A4Si1cqReXWutUlXUaDXzgaEzqaaaoDrsXpa5HID5k4Cg/FsB7ibDZ8R91EhpLHn7PsrvMOOXdlhUyYAujx2cR3LJdTPrs=', 'http://localhost:3000/images/888_1639501599053.png', NULL, 0),
(4, 'Lucette Marenier', 'l.marenier@grouporama.fr', 'U2FsdGVkX1+kK18+9e/h+JrMOJ8rUmKJ/lqPgeKn/tAswIW+sG7fcsHeH9mY6ooFr/kspPOeqLfdixEOQYQWJ0QbjHyg2/oBn7gAfZ9RhxI=', 'http://localhost:3000/images/222_1639502195404.png', NULL, 0),
(5, 'Lucie Calanne', 'calanne.lucie@live.fr', 'U2FsdGVkX1/5s/Lc4smE1Fcx5u29BUbxy402l8jFdpXP0joqUrHNs3vn/nAkcnfXKRYGfAIuIlQWlZw8DMfiEWTDRPAbweHXRHg40nn0Avo=', 'http://localhost:3000/images/666_1639502127011.png', NULL, 0),
(6, 'EL-WALID EL-KHABOU', 'alkhabou@aol.com', 'U2FsdGVkX18WWsBhD7NrNSxNE37K0/EKISVUW3m4VGmOK/ReL9dtK+uwwTo3LVyRJMOIHXxewychSalDV/OJ1ZHzuz/V/BnjbE6KgR//XjQ=', 'http://localhost:3000/images/111_1639501794986.png', NULL, 0),
(7, 'Jean Michel SIOUD', 'sioud@orange.fr', 'U2FsdGVkX19Ii8poL102vvG1eF0iciiw7b41Km4XQU64TAGHqagcJAX3fWPNp3A+gntny7vyXSbEaGHg7Fmaw5GoCcxFD2iQb43048zPVIw=', 'http://localhost:3000/images/444_1639502057674.png', NULL, 0),
(8, 'Mme Linda Osset', 'l.osset@gmail.com', 'U2FsdGVkX19IZcyymsg5ClpBZ9LjHidS2om2JeUJSLAC6q6yfCdfrFopR4mcT2P/SlZY+hcGVr4l1VeJ55FTAdIePpzE8JlcHhGQgKfmn6g=', 'http://localhost:3000/images/Capture_d’écran_2021-12-14_21-42-17_1639514553515.png', NULL, 0),
(9, 'Alexandre', 'alexandre@email.com', 'U2FsdGVkX19cBjpbCjJleI+hpiIr6Nca3qKtcISW+jnBK5L3/P8MTRAwLqrLsYgHNkxW/gAE+EVXGj6I7SSciXX2urT7XyZkEfD3qOxuHxw=', 'http://localhost:3000/images/7787_1639501711323.png', NULL, 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Comments`
--
ALTER TABLE `Comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Comments_Users_id` (`user_id`),
  ADD KEY `fk_Comments_Posts_id` (`post_id`);

--
-- Index pour la table `Likes`
--
ALTER TABLE `Likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Likes_Users_id` (`user_id`),
  ADD KEY `fk_Likes_Posts_id` (`post_id`);

--
-- Index pour la table `Notifications`
--
ALTER TABLE `Notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Notifications_Users_id` (`user_id`),
  ADD KEY `fk_Notifications_Initiator_id` (`initiator_id`),
  ADD KEY `fk_Notifications_Posts_id` (`post_id`),
  ADD KEY `fk_Notifications_Notifications_types_id` (`type_id`);

--
-- Index pour la table `Notification_types`
--
ALTER TABLE `Notification_types`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Posts`
--
ALTER TABLE `Posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Posts_Users_id` (`user_id`);

--
-- Index pour la table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ind_uni_email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Comments`
--
ALTER TABLE `Comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `Likes`
--
ALTER TABLE `Likes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `Notifications`
--
ALTER TABLE `Notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `Notification_types`
--
ALTER TABLE `Notification_types`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `Posts`
--
ALTER TABLE `Posts`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `Users`
--
ALTER TABLE `Users`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Comments`
--
ALTER TABLE `Comments`
  ADD CONSTRAINT `fk_Comments_Posts_id` FOREIGN KEY (`post_id`) REFERENCES `Posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Comments_Users_id` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `Likes`
--
ALTER TABLE `Likes`
  ADD CONSTRAINT `fk_Likes_Posts_id` FOREIGN KEY (`post_id`) REFERENCES `Posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Likes_Users_id` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Notifications`
--
ALTER TABLE `Notifications`
  ADD CONSTRAINT `fk_Notifications_Initiator_id` FOREIGN KEY (`initiator_id`) REFERENCES `Users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Notifications_Notifications_types_id` FOREIGN KEY (`type_id`) REFERENCES `Notification_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Notifications_Posts_id` FOREIGN KEY (`post_id`) REFERENCES `Posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Notifications_Users_id` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Posts`
--
ALTER TABLE `Posts`
  ADD CONSTRAINT `fk_Posts_Users_id` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
