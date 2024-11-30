-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 30 nov. 2024 à 23:39
-- Version du serveur : 10.4.20-MariaDB
-- Version de PHP : 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestionevents`
--

-- --------------------------------------------------------

--
-- Structure de la table `event`
--

CREATE TABLE `event` (
  `id` bigint(20) NOT NULL,
  `capacity` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `datefin` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `event`
--

INSERT INTO `event` (`id`, `capacity`, `date`, `datefin`, `description`, `image_url`, `location`, `price`, `title`, `type`) VALUES
(1, 200, '2025-12-02 10:30:00', NULL, 'Atelier pratique sur les techniques d\'artisanat local.', 'https://www.lenouvelliste.ma/wp-content/uploads/2023/02/produits-dartisanat-.jpeg', 'Rabat ', 100, 'Artisanat et Créativité', 'ATELIER'),
(2, 100, '2025-02-11 09:30:00', NULL, 'Une conférence sur les technologies de demain.', 'https://www.gep.com/prod/s3fs-public/blog-images/vision-or-delusion-how-future-technology-varies-from-present-day-expectations.jpg', 'Casablanca Ecole X', 200, 'Tech for Future', 'CONFERENCE'),
(3, 50, '2025-01-10 21:30:00', NULL, 'Concert live avec des artistes internationaux.', 'https://cdn.sortiraparis.com/images/80/98675/769391-visuel-concert-fete-de-la-musique-spectacle.jpg', 'Agadir Hotel X', 400, 'Nuit de la Musique', 'CONFERENCE'),
(4, 5, '2025-10-01 10:30:00', NULL, 'Apprenez les bases de la photographie et comment capturer des moments mémorables.', 'https://image.jimcdn.com/app/cms/image/transf/dimension=646x1024:format=jpg/path/se8106f40fa086d78/image/ie94987155bdb7a27/version/1413135708/image.jpg', 'Casablanca Studio', 60, 'Atelier de Photographie', 'CONFERENCE'),
(5, 100, '2025-05-02 09:30:00', NULL, 'Séminaire interactif pour apprendre à mieux se connaître et atteindre ses objectifs.', 'https://www.ericchabot.fr/public/img/big/Conf2PAjpg_63fdca68ca4ac6.72877600.jpg', 'Rabat Salle de Conférence', 100, 'Développement Personnel', 'CONFERENCE');

-- --------------------------------------------------------

--
-- Structure de la table `participant`
--

CREATE TABLE `participant` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `event_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `participant`
--

INSERT INTO `participant` (`id`, `email`, `name`, `event_id`) VALUES
(1, 'chaimae@gmail.Com', 'chaimae', 1),
(2, 'nadia@gmail.com', 'nadia', 1),
(3, 'ahmed@gmail.com', 'ahmed', 1),
(4, 'sara@gmail.com', 'sara', 1),
(5, 'zineb@gmail.com', 'zineb', 4),
(6, 'chaimae@gmail.Com', 'chaimae', 4),
(7, 'nadia@gmail.com', 'nadia', 4),
(8, 'Amine@gmail.Com', 'Amine', 4),
(9, 'saraa@gmail.com', 'sara', 4);

-- --------------------------------------------------------

--
-- Structure de la table `payment`
--

CREATE TABLE `payment` (
  `id` bigint(20) NOT NULL,
  `amount` decimal(38,2) DEFAULT NULL,
  `formatted_date` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `participant_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `payment`
--

INSERT INTO `payment` (`id`, `amount`, `formatted_date`, `method`, `payment_date`, `status`, `transaction_id`, `participant_id`) VALUES
(1, '100.00', NULL, 'CARD', '2024-11-30 16:39:25', 'COMPLETED', '90321087-6224-4fe9-800f-539cb9a55ba9', 1),
(2, '1000.00', NULL, 'CARD', '2024-11-30 16:44:59', 'COMPLETED', '80019062-afd2-4289-a757-d1923e7b38db', 2),
(3, '400.00', NULL, 'CARD', '2024-11-30 16:50:48', 'COMPLETED', '0a99b5fa-f03a-416b-8951-3e44f7984c6e', 3),
(4, '1000.00', NULL, 'CARD', '2024-11-30 18:51:15', 'COMPLETED', '7ab8fa54-8bcc-4eb6-9327-8bb506757ecd', 4),
(5, '60.00', NULL, 'CARD', '2024-11-30 21:47:34', 'COMPLETED', '023db5be-7166-475c-b9df-4319384c42a1', 5),
(6, '60.00', NULL, 'CARD', '2024-11-30 21:48:01', 'COMPLETED', '4466874c-3652-4909-b8e0-c0b37f09a0cc', 6),
(7, '60.00', NULL, 'CARD', '2024-11-30 21:48:17', 'COMPLETED', '78b09ee6-4058-437c-89c3-8100ef7a238a', 7),
(8, '60.00', NULL, 'CARD', '2024-11-30 21:48:37', 'COMPLETED', '4fc0159a-74e5-475f-ac55-aec37c15d9d0', 8),
(9, '60.00', NULL, 'CARD', '2024-11-30 21:49:06', 'COMPLETED', '7b57da58-15f4-4ec7-a5ba-979811a99247', 9);

-- --------------------------------------------------------

--
-- Structure de la table `rating`
--

CREATE TABLE `rating` (
  `id` bigint(20) NOT NULL,
  `value` varchar(255) NOT NULL,
  `event_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `rating`
--

INSERT INTO `rating` (`id`, `value`, `event_id`) VALUES
(1, 'Bon', 1);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ORGANIZER'),
(3, 'PARTICIPANT');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `password`) VALUES
(1, 'chaimae@gmail.com', '$2a$10$gXAdn8nZCOGCCeb4WI80Yuw2j2LN6cxBUEECb0L6IBnfPAOfslvcq'),
(2, 'organizer@gmail.com', '$2a$10$A4cgHWqV0tDW8ok2HYbN2OiK7S.oC/HbGBBDO43halbe1Nd9NdPH.'),
(3, 'nouhaila@gmail.com', '$2a$10$CkHN8pGC92hMTgRW/zlPmOGh6LbM/1qUPQIKs1hyLQg8wzqrCVGgK');

-- --------------------------------------------------------

--
-- Structure de la table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 2),
(3, 3);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `participant`
--
ALTER TABLE `participant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKojeqkvv72xcx0ytdqkik7objq` (`event_id`);

--
-- Index pour la table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK3xynl12gou0is0i1a262t44oa` (`participant_id`);

--
-- Index pour la table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKrndl54g8x53w4qmxu5pdfdr8p` (`event_id`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `FKrhfovtciq1l558cw6udg0h0d3` (`role_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `event`
--
ALTER TABLE `event`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `participant`
--
ALTER TABLE `participant`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `rating`
--
ALTER TABLE `rating`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `participant`
--
ALTER TABLE `participant`
  ADD CONSTRAINT `FKojeqkvv72xcx0ytdqkik7objq` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`);

--
-- Contraintes pour la table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `FK3xynl12gou0is0i1a262t44oa` FOREIGN KEY (`participant_id`) REFERENCES `participant` (`id`);

--
-- Contraintes pour la table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `FKrndl54g8x53w4qmxu5pdfdr8p` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`);

--
-- Contraintes pour la table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `FK55itppkw3i07do3h7qoclqd4k` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKrhfovtciq1l558cw6udg0h0d3` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
