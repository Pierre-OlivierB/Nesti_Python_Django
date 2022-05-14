-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 14 mai 2022 à 13:38
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `e_commerce`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id_category` int(11) NOT NULL,
  `libelle` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id_category`, `libelle`) VALUES
(1, 'Apéritifs'),
(2, 'Entrées'),
(3, 'Plats'),
(4, 'Desserts'),
(5, 'Boissons'),
(6, 'Petit-déj/brunch');

-- --------------------------------------------------------

--
-- Structure de la table `gives_a_grade`
--

CREATE TABLE `gives_a_grade` (
  `id_recipe` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `five_grades` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `importation`
--

CREATE TABLE `importation` (
  `id_article` int(11) NOT NULL,
  `ref_commande` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `import_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `nesti2_admin`
--

CREATE TABLE `nesti2_admin` (
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `nesti2_article`
--

CREATE TABLE `nesti2_article` (
  `id_article` int(11) NOT NULL,
  `unity_by_quantity` smallint(6) NOT NULL,
  `status` varchar(1) NOT NULL,
  `creation_date` datetime NOT NULL,
  `date_update` datetime DEFAULT NULL,
  `id_product` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `nesti2_article`
--

INSERT INTO `nesti2_article` (`id_article`, `unity_by_quantity`, `status`, `creation_date`, `date_update`, `id_product`, `id_unit`) VALUES
(1, 10, 'a', '2022-04-01 00:00:00', NULL, 1, 1),
(2, 100, 'w', '2022-04-01 00:00:00', NULL, 2, 1),
(3, 200, 'b', '2022-04-01 00:00:00', NULL, 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `nesti2_article_price`
--

CREATE TABLE `nesti2_article_price` (
  `id_article_price` int(11) NOT NULL,
  `application_date` datetime NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `id_article` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `nesti2_chief`
--

CREATE TABLE `nesti2_chief` (
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `nesti2_chief`
--

INSERT INTO `nesti2_chief` (`id_user`) VALUES
(1);

-- --------------------------------------------------------

--
-- Structure de la table `nesti2_city`
--

CREATE TABLE `nesti2_city` (
  `id_city` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `nesti2_city`
--

INSERT INTO `nesti2_city` (`id_city`, `name`) VALUES
(4, 'Grabels'),
(5, 'Juvignac'),
(1, 'Montpellier'),
(2, 'Paris'),
(3, 'Pignan'),
(6, 'Tours');

-- --------------------------------------------------------

--
-- Structure de la table `nesti2_command`
--

CREATE TABLE `nesti2_command` (
  `id_command` int(11) NOT NULL,
  `status` varchar(1) NOT NULL,
  `creation_date` datetime NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `nesti2_commentary`
--

CREATE TABLE `nesti2_commentary` (
  `id_user_1` int(11) NOT NULL,
  `id_recipe` int(11) NOT NULL,
  `title_of_comentary` varchar(50) NOT NULL,
  `comment_content` varchar(50) NOT NULL,
  `creation_date` datetime NOT NULL,
  `status` varchar(1) NOT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `nesti2_image`
--

CREATE TABLE `nesti2_image` (
  `id_image` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `i_name` varchar(50) NOT NULL,
  `extension` varchar(6) NOT NULL,
  `id_article` int(11) NOT NULL,
  `id_recipe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `nesti2_ingredients`
--

CREATE TABLE `nesti2_ingredients` (
  `id_product` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `nesti2_lot`
--

CREATE TABLE `nesti2_lot` (
  `id_article` int(11) NOT NULL,
  `ref_commande` int(11) NOT NULL,
  `unit_cost` decimal(15,2) NOT NULL,
  `quantity_purchased` smallint(6) NOT NULL,
  `reception_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `nesti2_measurement`
--

CREATE TABLE `nesti2_measurement` (
  `id_unit` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `nesti2_measurement`
--

INSERT INTO `nesti2_measurement` (`id_unit`, `name`) VALUES
(1, 'g'),
(2, 'ml');

-- --------------------------------------------------------

--
-- Structure de la table `nesti2_moderator`
--

CREATE TABLE `nesti2_moderator` (
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `nesti2_paragraph`
--

CREATE TABLE `nesti2_paragraph` (
  `id_paragraph` int(11) NOT NULL,
  `p_order` smallint(6) NOT NULL,
  `creation_date` datetime NOT NULL,
  `content` varchar(50) NOT NULL,
  `id_recipe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `nesti2_product`
--

CREATE TABLE `nesti2_product` (
  `id_product` int(11) NOT NULL,
  `product_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `nesti2_product`
--

INSERT INTO `nesti2_product` (`id_product`, `product_name`) VALUES
(8, 'courgette'),
(1, 'fromage'),
(9, 'oignon'),
(5, 'olive'),
(3, 'pain'),
(4, 'pâte à tarte'),
(7, 'riz'),
(2, 'steak'),
(6, 'tomate');

-- --------------------------------------------------------

--
-- Structure de la table `nesti2_recipe`
--

CREATE TABLE `nesti2_recipe` (
  `id_recipe` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `recipe_name` varchar(120) NOT NULL,
  `difficulty` smallint(6) NOT NULL,
  `numbre_people` int(11) NOT NULL,
  `status` varchar(1) NOT NULL,
  `recipe_time` time NOT NULL,
  `id_category` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `nesti2_recipe`
--

INSERT INTO `nesti2_recipe` (`id_recipe`, `creation_date`, `recipe_name`, `difficulty`, `numbre_people`, `status`, `recipe_time`, `id_category`, `id_user`) VALUES
(1, '2022-04-01 00:00:00', 'burger', 4, 4, 'a', '00:30:00', 3, 1),
(2, '2022-04-01 00:00:00', 'pizza', 2, 2, 'b', '00:45:00', 3, 1),
(3, '2022-04-01 00:00:00', 'tartinade', 1, 1, 'w', '00:15:00', 2, 1),
(4, '2022-04-01 00:00:00', 'soupe', 6, 10, 'a', '05:00:00', 2, 1),
(5, '2022-04-01 00:00:00', 'tarte au sucre', 9, 6, 'w', '01:30:00', 4, 1);

-- --------------------------------------------------------

--
-- Structure de la table `nesti2_recipe_ingredient`
--

CREATE TABLE `nesti2_recipe_ingredient` (
  `id_recipe` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` smallint(6) NOT NULL,
  `r_order` smallint(6) NOT NULL,
  `id_unit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `nesti2_user`
--

CREATE TABLE `nesti2_user` (
  `id_user` int(11) NOT NULL,
  `pseudo` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` varchar(1) NOT NULL,
  `creation_date` datetime NOT NULL,
  `adress_1` varchar(50) NOT NULL,
  `adress_2` varchar(50) DEFAULT NULL,
  `zip_code` int(11) NOT NULL,
  `id_city` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `nesti2_user`
--

INSERT INTO `nesti2_user` (`id_user`, `pseudo`, `lastname`, `firstname`, `email`, `password`, `status`, `creation_date`, `adress_1`, `adress_2`, `zip_code`, `id_city`) VALUES
(1, 'Tutifruti', 'Oui', 'Non', 'test@gmail.fr', '1234', 'a', '2022-04-01 00:00:00', '121 allee de la liberté', NULL, 34000, 1);

-- --------------------------------------------------------

--
-- Structure de la table `nesti2_user_log`
--

CREATE TABLE `nesti2_user_log` (
  `id_user_log` int(11) NOT NULL,
  `date_de_connexion` datetime NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `order_line`
--

CREATE TABLE `order_line` (
  `id_article` int(11) NOT NULL,
  `id_command` int(11) NOT NULL,
  `amount_ordered` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_category`);

--
-- Index pour la table `gives_a_grade`
--
ALTER TABLE `gives_a_grade`
  ADD KEY `id_recipe` (`id_recipe`),
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `importation`
--
ALTER TABLE `importation`
  ADD KEY `id_article` (`id_article`,`ref_commande`),
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `nesti2_admin`
--
ALTER TABLE `nesti2_admin`
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `nesti2_article`
--
ALTER TABLE `nesti2_article`
  ADD PRIMARY KEY (`id_article`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_unit` (`id_unit`);

--
-- Index pour la table `nesti2_article_price`
--
ALTER TABLE `nesti2_article_price`
  ADD PRIMARY KEY (`id_article_price`),
  ADD KEY `id_article` (`id_article`);

--
-- Index pour la table `nesti2_chief`
--
ALTER TABLE `nesti2_chief`
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `nesti2_city`
--
ALTER TABLE `nesti2_city`
  ADD PRIMARY KEY (`id_city`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `nesti2_command`
--
ALTER TABLE `nesti2_command`
  ADD PRIMARY KEY (`id_command`),
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `nesti2_commentary`
--
ALTER TABLE `nesti2_commentary`
  ADD KEY `id_user_1` (`id_user_1`),
  ADD KEY `id_recipe` (`id_recipe`),
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `nesti2_image`
--
ALTER TABLE `nesti2_image`
  ADD PRIMARY KEY (`id_image`),
  ADD UNIQUE KEY `id_article` (`id_article`),
  ADD UNIQUE KEY `id_recipe` (`id_recipe`),
  ADD UNIQUE KEY `i_name` (`i_name`);

--
-- Index pour la table `nesti2_ingredients`
--
ALTER TABLE `nesti2_ingredients`
  ADD KEY `id_product` (`id_product`);

--
-- Index pour la table `nesti2_lot`
--
ALTER TABLE `nesti2_lot`
  ADD PRIMARY KEY (`ref_commande`),
  ADD KEY `id_article` (`id_article`);

--
-- Index pour la table `nesti2_measurement`
--
ALTER TABLE `nesti2_measurement`
  ADD PRIMARY KEY (`id_unit`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `nesti2_moderator`
--
ALTER TABLE `nesti2_moderator`
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `nesti2_paragraph`
--
ALTER TABLE `nesti2_paragraph`
  ADD PRIMARY KEY (`id_paragraph`),
  ADD KEY `id_recipe` (`id_recipe`);

--
-- Index pour la table `nesti2_product`
--
ALTER TABLE `nesti2_product`
  ADD PRIMARY KEY (`id_product`),
  ADD UNIQUE KEY `product_name` (`product_name`);

--
-- Index pour la table `nesti2_recipe`
--
ALTER TABLE `nesti2_recipe`
  ADD PRIMARY KEY (`id_recipe`),
  ADD KEY `id_category` (`id_category`),
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `nesti2_recipe_ingredient`
--
ALTER TABLE `nesti2_recipe_ingredient`
  ADD KEY `id_recipe` (`id_recipe`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_unit` (`id_unit`);

--
-- Index pour la table `nesti2_user`
--
ALTER TABLE `nesti2_user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `pseudo` (`pseudo`),
  ADD KEY `id_city` (`id_city`);

--
-- Index pour la table `nesti2_user_log`
--
ALTER TABLE `nesti2_user_log`
  ADD PRIMARY KEY (`id_user_log`),
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `order_line`
--
ALTER TABLE `order_line`
  ADD KEY `id_article` (`id_article`),
  ADD KEY `id_command` (`id_command`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `nesti2_article`
--
ALTER TABLE `nesti2_article`
  MODIFY `id_article` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `nesti2_article_price`
--
ALTER TABLE `nesti2_article_price`
  MODIFY `id_article_price` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `nesti2_city`
--
ALTER TABLE `nesti2_city`
  MODIFY `id_city` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `nesti2_command`
--
ALTER TABLE `nesti2_command`
  MODIFY `id_command` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `nesti2_image`
--
ALTER TABLE `nesti2_image`
  MODIFY `id_image` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `nesti2_lot`
--
ALTER TABLE `nesti2_lot`
  MODIFY `ref_commande` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `nesti2_measurement`
--
ALTER TABLE `nesti2_measurement`
  MODIFY `id_unit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `nesti2_paragraph`
--
ALTER TABLE `nesti2_paragraph`
  MODIFY `id_paragraph` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `nesti2_product`
--
ALTER TABLE `nesti2_product`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `nesti2_recipe`
--
ALTER TABLE `nesti2_recipe`
  MODIFY `id_recipe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `nesti2_user`
--
ALTER TABLE `nesti2_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `nesti2_user_log`
--
ALTER TABLE `nesti2_user_log`
  MODIFY `id_user_log` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `gives_a_grade`
--
ALTER TABLE `gives_a_grade`
  ADD CONSTRAINT `gives_a_grade_ibfk_1` FOREIGN KEY (`id_recipe`) REFERENCES `nesti2_recipe` (`id_recipe`),
  ADD CONSTRAINT `gives_a_grade_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `nesti2_user` (`id_user`);

--
-- Contraintes pour la table `importation`
--
ALTER TABLE `importation`
  ADD CONSTRAINT `importation_ibfk_1` FOREIGN KEY (`id_article`,`ref_commande`) REFERENCES `nesti2_lot` (`id_article`, `ref_commande`),
  ADD CONSTRAINT `importation_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `nesti2_admin` (`id_user`);

--
-- Contraintes pour la table `nesti2_admin`
--
ALTER TABLE `nesti2_admin`
  ADD CONSTRAINT `nesti2_admin_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `nesti2_user` (`id_user`);

--
-- Contraintes pour la table `nesti2_article`
--
ALTER TABLE `nesti2_article`
  ADD CONSTRAINT `nesti2_article_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `nesti2_product` (`id_product`),
  ADD CONSTRAINT `nesti2_article_ibfk_2` FOREIGN KEY (`id_unit`) REFERENCES `nesti2_measurement` (`id_unit`);

--
-- Contraintes pour la table `nesti2_article_price`
--
ALTER TABLE `nesti2_article_price`
  ADD CONSTRAINT `nesti2_article_price_ibfk_1` FOREIGN KEY (`id_article`) REFERENCES `nesti2_article` (`id_article`);

--
-- Contraintes pour la table `nesti2_chief`
--
ALTER TABLE `nesti2_chief`
  ADD CONSTRAINT `nesti2_chief_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `nesti2_user` (`id_user`);

--
-- Contraintes pour la table `nesti2_command`
--
ALTER TABLE `nesti2_command`
  ADD CONSTRAINT `nesti2_command_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `nesti2_user` (`id_user`);

--
-- Contraintes pour la table `nesti2_commentary`
--
ALTER TABLE `nesti2_commentary`
  ADD CONSTRAINT `nesti2_commentary_ibfk_1` FOREIGN KEY (`id_user_1`) REFERENCES `nesti2_user` (`id_user`),
  ADD CONSTRAINT `nesti2_commentary_ibfk_2` FOREIGN KEY (`id_recipe`) REFERENCES `nesti2_recipe` (`id_recipe`),
  ADD CONSTRAINT `nesti2_commentary_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `nesti2_moderator` (`id_user`);

--
-- Contraintes pour la table `nesti2_image`
--
ALTER TABLE `nesti2_image`
  ADD CONSTRAINT `nesti2_image_ibfk_1` FOREIGN KEY (`id_article`) REFERENCES `nesti2_article` (`id_article`),
  ADD CONSTRAINT `nesti2_image_ibfk_2` FOREIGN KEY (`id_recipe`) REFERENCES `nesti2_recipe` (`id_recipe`);

--
-- Contraintes pour la table `nesti2_ingredients`
--
ALTER TABLE `nesti2_ingredients`
  ADD CONSTRAINT `nesti2_ingredients_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `nesti2_product` (`id_product`);

--
-- Contraintes pour la table `nesti2_lot`
--
ALTER TABLE `nesti2_lot`
  ADD CONSTRAINT `nesti2_lot_ibfk_1` FOREIGN KEY (`id_article`) REFERENCES `nesti2_article` (`id_article`);

--
-- Contraintes pour la table `nesti2_moderator`
--
ALTER TABLE `nesti2_moderator`
  ADD CONSTRAINT `nesti2_moderator_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `nesti2_user` (`id_user`);

--
-- Contraintes pour la table `nesti2_paragraph`
--
ALTER TABLE `nesti2_paragraph`
  ADD CONSTRAINT `nesti2_paragraph_ibfk_1` FOREIGN KEY (`id_recipe`) REFERENCES `nesti2_recipe` (`id_recipe`);

--
-- Contraintes pour la table `nesti2_recipe`
--
ALTER TABLE `nesti2_recipe`
  ADD CONSTRAINT `nesti2_recipe_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `category` (`id_category`),
  ADD CONSTRAINT `nesti2_recipe_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `nesti2_chief` (`id_user`);

--
-- Contraintes pour la table `nesti2_recipe_ingredient`
--
ALTER TABLE `nesti2_recipe_ingredient`
  ADD CONSTRAINT `nesti2_recipe_ingredient_ibfk_1` FOREIGN KEY (`id_recipe`) REFERENCES `nesti2_recipe` (`id_recipe`),
  ADD CONSTRAINT `nesti2_recipe_ingredient_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `nesti2_ingredients` (`id_product`),
  ADD CONSTRAINT `nesti2_recipe_ingredient_ibfk_3` FOREIGN KEY (`id_unit`) REFERENCES `nesti2_measurement` (`id_unit`);

--
-- Contraintes pour la table `nesti2_user`
--
ALTER TABLE `nesti2_user`
  ADD CONSTRAINT `nesti2_user_ibfk_1` FOREIGN KEY (`id_city`) REFERENCES `nesti2_city` (`id_city`);

--
-- Contraintes pour la table `nesti2_user_log`
--
ALTER TABLE `nesti2_user_log`
  ADD CONSTRAINT `nesti2_user_log_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `nesti2_user` (`id_user`);

--
-- Contraintes pour la table `order_line`
--
ALTER TABLE `order_line`
  ADD CONSTRAINT `order_line_ibfk_1` FOREIGN KEY (`id_article`) REFERENCES `nesti2_article` (`id_article`),
  ADD CONSTRAINT `order_line_ibfk_2` FOREIGN KEY (`id_command`) REFERENCES `nesti2_command` (`id_command`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
