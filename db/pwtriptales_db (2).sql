-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 23, 2025 alle 15:03
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pwtriptales_db`
--
CREATE DATABASE IF NOT EXISTS `pwtriptales_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pwtriptales_db`;

-- --------------------------------------------------------

--
-- Struttura della tabella `authtoken_token`
--

CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `authtoken_token`
--

INSERT INTO `authtoken_token` (`key`, `created`, `user_id`) VALUES
('276eff9c648511d4a7a190b53624c0c973e565f9', '2025-05-17 06:45:31.420922', 2),
('ad4240f02a07fc7641e1fac4cf0416bc37bd8d82', '2025-05-12 07:14:04.965517', 1),
('e44068edcdc88403981dd27f123385fd80369703', '2025-05-18 09:30:06.829329', 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add Token', 6, 'add_token'),
(22, 'Can change Token', 6, 'change_token'),
(23, 'Can delete Token', 6, 'delete_token'),
(24, 'Can view Token', 6, 'view_token'),
(25, 'Can add Token', 7, 'add_tokenproxy'),
(26, 'Can change Token', 7, 'change_tokenproxy'),
(27, 'Can delete Token', 7, 'delete_tokenproxy'),
(28, 'Can view Token', 7, 'view_tokenproxy'),
(29, 'Can add user', 8, 'add_user'),
(30, 'Can change user', 8, 'change_user'),
(31, 'Can delete user', 8, 'delete_user'),
(32, 'Can view user', 8, 'view_user'),
(33, 'Can add group', 9, 'add_group'),
(34, 'Can change group', 9, 'change_group'),
(35, 'Can delete group', 9, 'delete_group'),
(36, 'Can view group', 9, 'view_group'),
(37, 'Can add group membership', 10, 'add_groupmembership'),
(38, 'Can change group membership', 10, 'change_groupmembership'),
(39, 'Can delete group membership', 10, 'delete_groupmembership'),
(40, 'Can view group membership', 10, 'view_groupmembership'),
(41, 'Can add post', 11, 'add_post'),
(42, 'Can change post', 11, 'change_post'),
(43, 'Can delete post', 11, 'delete_post'),
(44, 'Can view post', 11, 'view_post'),
(45, 'Can add badge', 12, 'add_badge'),
(46, 'Can change badge', 12, 'change_badge'),
(47, 'Can delete badge', 12, 'delete_badge'),
(48, 'Can view badge', 12, 'view_badge'),
(49, 'Can add user badge', 13, 'add_userbadge'),
(50, 'Can change user badge', 13, 'change_userbadge'),
(51, 'Can delete user badge', 13, 'delete_userbadge'),
(52, 'Can view user badge', 13, 'view_userbadge'),
(53, 'Can add comment', 14, 'add_comment'),
(54, 'Can change comment', 14, 'change_comment'),
(55, 'Can delete comment', 14, 'delete_comment'),
(56, 'Can view comment', 14, 'view_comment'),
(57, 'Can add photo', 15, 'add_photo'),
(58, 'Can change photo', 15, 'change_photo'),
(59, 'Can delete photo', 15, 'delete_photo'),
(60, 'Can view photo', 15, 'view_photo'),
(61, 'Can add group invitation', 16, 'add_groupinvitation'),
(62, 'Can change group invitation', 16, 'change_groupinvitation'),
(63, 'Can delete group invitation', 16, 'delete_groupinvitation'),
(64, 'Can view group invitation', 16, 'view_groupinvitation'),
(65, 'Can add like', 17, 'add_like'),
(66, 'Can change like', 17, 'change_like'),
(67, 'Can delete like', 17, 'delete_like'),
(68, 'Can view like', 17, 'view_like');

-- --------------------------------------------------------

--
-- Struttura della tabella `badges_badge`
--

CREATE TABLE `badges_badge` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `icon` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `badges_userbadge`
--

CREATE TABLE `badges_userbadge` (
  `id` bigint(20) NOT NULL,
  `assignment_date` datetime(6) NOT NULL,
  `badge_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `comments_comment`
--

CREATE TABLE `comments_comment` (
  `id` bigint(20) NOT NULL,
  `text` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `post_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `comments_comment`
--

INSERT INTO `comments_comment` (`id`, `text`, `created_at`, `author_id`, `post_id`) VALUES
(1, 'bel commento tibaldo', '2025-05-12 08:18:25.490409', 1, 1),
(4, 'ciao ragazzi!!', '2025-05-22 16:12:43.288375', 1, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(6, 'authtoken', 'token'),
(7, 'authtoken', 'tokenproxy'),
(12, 'badges', 'badge'),
(13, 'badges', 'userbadge'),
(14, 'comments', 'comment'),
(4, 'contenttypes', 'contenttype'),
(9, 'groups', 'group'),
(16, 'groups', 'groupinvitation'),
(10, 'groups', 'groupmembership'),
(15, 'photos', 'photo'),
(17, 'posts', 'like'),
(11, 'posts', 'post'),
(5, 'sessions', 'session'),
(8, 'users', 'user');

-- --------------------------------------------------------

--
-- Struttura della tabella `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-04-28 15:06:49.690363'),
(2, 'contenttypes', '0002_remove_content_type_name', '2025-04-28 15:06:49.720772'),
(3, 'auth', '0001_initial', '2025-04-28 15:06:49.871306'),
(4, 'auth', '0002_alter_permission_name_max_length', '2025-04-28 15:06:49.900542'),
(5, 'auth', '0003_alter_user_email_max_length', '2025-04-28 15:06:49.906004'),
(6, 'auth', '0004_alter_user_username_opts', '2025-04-28 15:06:49.911043'),
(7, 'auth', '0005_alter_user_last_login_null', '2025-04-28 15:06:49.916039'),
(8, 'auth', '0006_require_contenttypes_0002', '2025-04-28 15:06:49.918247'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2025-04-28 15:06:49.924613'),
(10, 'auth', '0008_alter_user_username_max_length', '2025-04-28 15:06:49.930079'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2025-04-28 15:06:49.935495'),
(12, 'auth', '0010_alter_group_name_max_length', '2025-04-28 15:06:49.944402'),
(13, 'auth', '0011_update_proxy_permissions', '2025-04-28 15:06:49.953668'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2025-04-28 15:06:49.959268'),
(15, 'users', '0001_initial', '2025-04-28 15:06:50.116949'),
(16, 'admin', '0001_initial', '2025-04-28 15:06:50.185642'),
(17, 'admin', '0002_logentry_remove_auto_add', '2025-04-28 15:06:50.193324'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2025-04-28 15:06:50.200710'),
(19, 'authtoken', '0001_initial', '2025-04-28 15:06:50.234522'),
(20, 'authtoken', '0002_auto_20160226_1747', '2025-04-28 15:06:50.254819'),
(21, 'authtoken', '0003_tokenproxy', '2025-04-28 15:06:50.257527'),
(22, 'authtoken', '0004_alter_tokenproxy_options', '2025-04-28 15:06:50.262359'),
(23, 'badges', '0001_initial', '2025-04-28 15:06:50.298007'),
(24, 'badges', '0002_initial', '2025-04-28 15:06:50.349695'),
(25, 'posts', '0001_initial', '2025-04-28 15:06:50.363201'),
(26, 'comments', '0001_initial', '2025-04-28 15:06:50.375817'),
(27, 'comments', '0002_initial', '2025-04-28 15:06:50.442828'),
(28, 'groups', '0001_initial', '2025-04-28 15:06:50.478448'),
(29, 'groups', '0002_initial', '2025-04-28 15:06:50.555611'),
(30, 'photos', '0001_initial', '2025-04-28 15:06:50.565998'),
(31, 'photos', '0002_initial', '2025-04-28 15:06:50.612602'),
(32, 'posts', '0002_initial', '2025-04-28 15:06:50.682043'),
(33, 'sessions', '0001_initial', '2025-04-28 15:06:50.700068'),
(34, 'groups', '0003_groupmembership_role_groupinvitation', '2025-05-19 08:50:40.084665'),
(35, 'photos', '0003_alter_photo_options_photo_device_info_and_more', '2025-05-19 14:39:38.929407'),
(36, 'posts', '0003_alter_post_options_post_is_pinned_post_updated_at_and_more', '2025-05-19 14:39:39.161434'),
(37, 'posts', '0003_like', '2025-05-22 09:14:22.921122');

-- --------------------------------------------------------

--
-- Struttura della tabella `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `groups_group`
--

CREATE TABLE `groups_group` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` longtext DEFAULT NULL,
  `creation_date` datetime(6) NOT NULL,
  `creator_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `groups_group`
--

INSERT INTO `groups_group` (`id`, `name`, `description`, `creation_date`, `creator_id`) VALUES
(1, 'gita monaco', 'gita più bella del mondo', '2025-05-12 07:28:03.441772', 1),
(2, 'Prova 1', 'Vediamo se funziona il codice', '2025-05-19 08:59:39.675921', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `groups_groupinvitation`
--

CREATE TABLE `groups_groupinvitation` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  `recipient_id` bigint(20) NOT NULL,
  `sender_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `groups_groupinvitation`
--

INSERT INTO `groups_groupinvitation` (`id`, `status`, `created_at`, `updated_at`, `group_id`, `recipient_id`, `sender_id`) VALUES
(1, 'ACCEPTED', '2025-05-19 09:33:53.505879', '2025-05-19 09:34:14.656790', 2, 2, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `groups_groupmembership`
--

CREATE TABLE `groups_groupmembership` (
  `id` bigint(20) NOT NULL,
  `join_date` datetime(6) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `role` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `groups_groupmembership`
--

INSERT INTO `groups_groupmembership` (`id`, `join_date`, `group_id`, `user_id`, `role`) VALUES
(1, '2025-05-19 08:59:39.686536', 2, 1, 'ADMIN'),
(2, '2025-05-19 09:34:14.669376', 2, 2, 'MEMBER');

-- --------------------------------------------------------

--
-- Struttura della tabella `photos_photo`
--

CREATE TABLE `photos_photo` (
  `id` bigint(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `post_id` bigint(20) NOT NULL,
  `device_info` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(100) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `photos_photo`
--

INSERT INTO `photos_photo` (`id`, `image`, `latitude`, `longitude`, `created_at`, `post_id`, `device_info`, `thumbnail`, `title`) VALUES
(10, 'trip_photos/upload_image_1747932050100.jpg', NULL, NULL, '2025-05-22 16:40:52.782995', 19, NULL, NULL, NULL),
(12, 'trip_photos/upload_image_1748001656953.jpg', NULL, NULL, '2025-05-23 12:01:04.255048', 21, NULL, NULL, NULL),
(13, 'trip_photos/upload_image_1748005158277.jpg', NULL, NULL, '2025-05-23 12:59:21.691323', 22, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `posts_like`
--

CREATE TABLE `posts_like` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `post_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `posts_like`
--

INSERT INTO `posts_like` (`id`, `created_at`, `author_id`, `post_id`) VALUES
(3, '2025-05-22 16:12:32.377782', 1, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `posts_post`
--

CREATE TABLE `posts_post` (
  `id` bigint(20) NOT NULL,
  `text` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  `is_pinned` tinyint(1) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `posts_post`
--

INSERT INTO `posts_post` (`id`, `text`, `created_at`, `author_id`, `group_id`, `is_pinned`, `updated_at`) VALUES
(1, 'gita di 5', '2025-05-12 08:01:54.525596', 1, 1, 0, '2025-05-19 14:39:38.974222'),
(3, 'ciao rigobello', '2025-05-20 11:12:42.971725', 1, 2, 0, '0000-00-00 00:00:00.000000'),
(19, 'bella vita', '2025-05-22 16:40:50.215066', 1, 2, 0, '0000-00-00 00:00:00.000000'),
(21, 'codice', '2025-05-23 12:00:58.166514', 1, 2, 0, '0000-00-00 00:00:00.000000'),
(22, 'zaino', '2025-05-23 12:59:19.457974', 1, 2, 0, '0000-00-00 00:00:00.000000');

-- --------------------------------------------------------

--
-- Struttura della tabella `users_user`
--

CREATE TABLE `users_user` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  `registration_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `users_user`
--

INSERT INTO `users_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `email`, `registration_date`) VALUES
(1, 'pbkdf2_sha256$600000$sKrTEOkZSTRXSh2A6FpK07$s/1aKZsjDB5L7noFOdWpb6h0SkacvZNty7R1BlmgewI=', NULL, 0, 'alessandro', '', '', 0, 1, '2025-05-12 07:14:03.097059', 'alessandrotiba@gmail.com', '2025-05-12 07:14:03.097075'),
(2, 'pbkdf2_sha256$600000$qDh64AUJpKidXuJBSYJOAV$6sd3BrCExQCiYX6zpWZEIHF1vonC65jPb0H8+yNheTc=', NULL, 0, 'rigobello', '', '', 0, 1, '2025-05-17 06:45:30.179790', 'rigobelloandrea@gmail.com', '2025-05-17 06:45:30.179807'),
(3, 'pbkdf2_sha256$600000$98v4FCCF9wn2Tt6OrwzhSr$YxQhUe2/Uc0AZfnVeHZAAh7WWA694dWky5tAPM8mJck=', NULL, 0, 'nencio', '', '', 0, 1, '2025-05-18 09:30:06.248573', 'nencioniluca@gmail.com', '2025-05-18 09:30:06.248579');

-- --------------------------------------------------------

--
-- Struttura della tabella `users_user_groups`
--

CREATE TABLE `users_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `users_user_user_permissions`
--

CREATE TABLE `users_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indici per le tabelle `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indici per le tabelle `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indici per le tabelle `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indici per le tabelle `badges_badge`
--
ALTER TABLE `badges_badge`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `badges_userbadge`
--
ALTER TABLE `badges_userbadge`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `badges_userbadge_user_id_badge_id_9350997d_uniq` (`user_id`,`badge_id`),
  ADD KEY `badges_userbadge_badge_id_080c0754_fk_badges_badge_id` (`badge_id`);

--
-- Indici per le tabelle `comments_comment`
--
ALTER TABLE `comments_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_comment_author_id_334ce9e2_fk_users_user_id` (`author_id`),
  ADD KEY `comments_comment_post_id_96a9ac05_fk_posts_post_id` (`post_id`);

--
-- Indici per le tabelle `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_users_user_id` (`user_id`);

--
-- Indici per le tabelle `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indici per le tabelle `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indici per le tabelle `groups_group`
--
ALTER TABLE `groups_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groups_group_creator_id_fa867071_fk_users_user_id` (`creator_id`);

--
-- Indici per le tabelle `groups_groupinvitation`
--
ALTER TABLE `groups_groupinvitation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `groups_groupinvitation_group_id_recipient_id_st_6a95d5af_uniq` (`group_id`,`recipient_id`,`status`),
  ADD KEY `groups_groupinvitation_recipient_id_8968eeab_fk_users_user_id` (`recipient_id`),
  ADD KEY `groups_groupinvitation_sender_id_db9216ce_fk_users_user_id` (`sender_id`);

--
-- Indici per le tabelle `groups_groupmembership`
--
ALTER TABLE `groups_groupmembership`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `groups_groupmembership_user_id_group_id_d5008afd_uniq` (`user_id`,`group_id`),
  ADD KEY `groups_groupmembership_group_id_01c2a50a_fk_groups_group_id` (`group_id`);

--
-- Indici per le tabelle `photos_photo`
--
ALTER TABLE `photos_photo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `photos_phot_post_id_e04c27_idx` (`post_id`),
  ADD KEY `photos_phot_created_84134a_idx` (`created_at`),
  ADD KEY `photos_phot_latitud_92201d_idx` (`latitude`,`longitude`);

--
-- Indici per le tabelle `posts_like`
--
ALTER TABLE `posts_like`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_like_author_id_post_id_a8055675_uniq` (`author_id`,`post_id`),
  ADD KEY `posts_like_post_id_127195b7_fk_posts_post_id` (`post_id`);

--
-- Indici per le tabelle `posts_post`
--
ALTER TABLE `posts_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_post_author__19d68b_idx` (`author_id`),
  ADD KEY `posts_post_group_i_2d08a2_idx` (`group_id`),
  ADD KEY `posts_post_created_dadbfe_idx` (`created_at`);

--
-- Indici per le tabelle `users_user`
--
ALTER TABLE `users_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indici per le tabelle `users_user_groups`
--
ALTER TABLE `users_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_user_groups_user_id_group_id_b88eab82_uniq` (`user_id`,`group_id`),
  ADD KEY `users_user_groups_group_id_9afc8d0e_fk_auth_group_id` (`group_id`);

--
-- Indici per le tabelle `users_user_user_permissions`
--
ALTER TABLE `users_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_user_user_permissions_user_id_permission_id_43338c45_uniq` (`user_id`,`permission_id`),
  ADD KEY `users_user_user_perm_permission_id_0b93982e_fk_auth_perm` (`permission_id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT per la tabella `badges_badge`
--
ALTER TABLE `badges_badge`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `badges_userbadge`
--
ALTER TABLE `badges_userbadge`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `comments_comment`
--
ALTER TABLE `comments_comment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT per la tabella `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT per la tabella `groups_group`
--
ALTER TABLE `groups_group`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `groups_groupinvitation`
--
ALTER TABLE `groups_groupinvitation`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `groups_groupmembership`
--
ALTER TABLE `groups_groupmembership`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la tabella `photos_photo`
--
ALTER TABLE `photos_photo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT per la tabella `posts_like`
--
ALTER TABLE `posts_like`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `posts_post`
--
ALTER TABLE `posts_post`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT per la tabella `users_user`
--
ALTER TABLE `users_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `users_user_groups`
--
ALTER TABLE `users_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `users_user_user_permissions`
--
ALTER TABLE `users_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);

--
-- Limiti per la tabella `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Limiti per la tabella `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Limiti per la tabella `badges_userbadge`
--
ALTER TABLE `badges_userbadge`
  ADD CONSTRAINT `badges_userbadge_badge_id_080c0754_fk_badges_badge_id` FOREIGN KEY (`badge_id`) REFERENCES `badges_badge` (`id`),
  ADD CONSTRAINT `badges_userbadge_user_id_77032e2b_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);

--
-- Limiti per la tabella `comments_comment`
--
ALTER TABLE `comments_comment`
  ADD CONSTRAINT `comments_comment_author_id_334ce9e2_fk_users_user_id` FOREIGN KEY (`author_id`) REFERENCES `users_user` (`id`),
  ADD CONSTRAINT `comments_comment_post_id_96a9ac05_fk_posts_post_id` FOREIGN KEY (`post_id`) REFERENCES `posts_post` (`id`);

--
-- Limiti per la tabella `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);

--
-- Limiti per la tabella `groups_group`
--
ALTER TABLE `groups_group`
  ADD CONSTRAINT `groups_group_creator_id_fa867071_fk_users_user_id` FOREIGN KEY (`creator_id`) REFERENCES `users_user` (`id`);

--
-- Limiti per la tabella `groups_groupinvitation`
--
ALTER TABLE `groups_groupinvitation`
  ADD CONSTRAINT `groups_groupinvitation_group_id_7d46fb84_fk_groups_group_id` FOREIGN KEY (`group_id`) REFERENCES `groups_group` (`id`),
  ADD CONSTRAINT `groups_groupinvitation_recipient_id_8968eeab_fk_users_user_id` FOREIGN KEY (`recipient_id`) REFERENCES `users_user` (`id`),
  ADD CONSTRAINT `groups_groupinvitation_sender_id_db9216ce_fk_users_user_id` FOREIGN KEY (`sender_id`) REFERENCES `users_user` (`id`);

--
-- Limiti per la tabella `groups_groupmembership`
--
ALTER TABLE `groups_groupmembership`
  ADD CONSTRAINT `groups_groupmembership_group_id_01c2a50a_fk_groups_group_id` FOREIGN KEY (`group_id`) REFERENCES `groups_group` (`id`),
  ADD CONSTRAINT `groups_groupmembership_user_id_c6a6fbcb_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);

--
-- Limiti per la tabella `photos_photo`
--
ALTER TABLE `photos_photo`
  ADD CONSTRAINT `photos_photo_post_id_69415d03_fk_posts_post_id` FOREIGN KEY (`post_id`) REFERENCES `posts_post` (`id`);

--
-- Limiti per la tabella `posts_like`
--
ALTER TABLE `posts_like`
  ADD CONSTRAINT `posts_like_author_id_7ad7e87a_fk_users_user_id` FOREIGN KEY (`author_id`) REFERENCES `users_user` (`id`),
  ADD CONSTRAINT `posts_like_post_id_127195b7_fk_posts_post_id` FOREIGN KEY (`post_id`) REFERENCES `posts_post` (`id`);

--
-- Limiti per la tabella `posts_post`
--
ALTER TABLE `posts_post`
  ADD CONSTRAINT `posts_post_author_id_fe5487bf_fk_users_user_id` FOREIGN KEY (`author_id`) REFERENCES `users_user` (`id`),
  ADD CONSTRAINT `posts_post_group_id_c91a8485_fk_groups_group_id` FOREIGN KEY (`group_id`) REFERENCES `groups_group` (`id`);

--
-- Limiti per la tabella `users_user_groups`
--
ALTER TABLE `users_user_groups`
  ADD CONSTRAINT `users_user_groups_group_id_9afc8d0e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `users_user_groups_user_id_5f6f5a90_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);

--
-- Limiti per la tabella `users_user_user_permissions`
--
ALTER TABLE `users_user_user_permissions`
  ADD CONSTRAINT `users_user_user_perm_permission_id_0b93982e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `users_user_user_permissions_user_id_20aca447_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
