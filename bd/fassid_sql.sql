-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-01-2023 a las 14:01:04
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fassid_sql`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(10) UNSIGNED NOT NULL,
  `names` varchar(255) DEFAULT NULL,
  `descriptions` text DEFAULT NULL,
  `images_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `names`, `descriptions`, `images_url`, `created_at`, `updated_at`) VALUES
(1, 'Computadores', NULL, NULL, '2023-01-29 17:42:31', '2023-01-29 17:42:31'),
(2, 'Accesorios', NULL, NULL, '2023-01-29 23:27:42', '2023-01-29 23:27:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(2, NULL, 1, 'Category 2', 'category-2', '2023-01-29 00:28:51', '2023-01-29 00:28:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(56, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 7, 'names', 'text', 'Categoria', 0, 1, 1, 1, 1, 0, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"La categoria debe tener un nombre\"}},\"display\":{\"width\":6}}', 3),
(58, 7, 'descriptions', 'text_area', 'Descripcion', 0, 1, 1, 1, 1, 0, '{}', 4),
(59, 7, 'images_url', 'image', 'Imagen', 0, 1, 1, 1, 1, 0, '{\"display\":{\"width\":6}}', 2),
(60, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 5),
(61, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(62, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(63, 9, 'images_url', 'image', 'Images Url', 0, 1, 1, 1, 1, 0, '{\"display\":{\"width\":6}}', 2),
(64, 9, 'names', 'text', 'Names', 0, 1, 1, 1, 1, 0, '{\"display\":{\"width\":6},\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"La mmarca debe tener un nombre\"}}}', 3),
(65, 9, 'descriptions', 'text_area', 'Descriptions', 0, 0, 1, 1, 1, 0, '{}', 4),
(66, 9, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, '{}', 5),
(67, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(68, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(69, 10, 'images_url', 'image', 'imagen', 0, 1, 1, 1, 1, 0, '{\"display\":{\"width\":6}}', 9),
(70, 10, 'names', 'text', 'Producto', 0, 1, 1, 1, 1, 0, '{\"display\":{\"width\":6},\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"El producto debe tener una marca\"}}}', 3),
(71, 10, 'descriptions', 'text_area', 'Descripcion', 0, 0, 1, 1, 1, 0, '{}', 11),
(72, 10, 'status_at', 'checkbox', 'Estado', 0, 0, 1, 1, 1, 0, '{\"display\":{\"width\":6},\"on\":\"Activo\",\"off\":\"Inactivo\",\"checked\":true}', 10),
(73, 10, 'costo_compra', 'text', 'Costo de compra', 0, 0, 1, 1, 1, 0, '{\"display\":{\"width\":4},\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"El producto debe tener una marca\"}}}', 4),
(74, 10, 'precio_contado', 'text', 'Precio de Contado', 0, 1, 1, 1, 1, 0, '{\"display\":{\"width\":4},\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"El producto debe tener una marca\"}}}', 5),
(75, 10, 'precio_creadito', 'text', 'Precio de Creadito', 0, 0, 1, 1, 1, 0, '{\"display\":{\"width\":4}}', 6),
(76, 10, 'ns', 'text', 'Numero de Serie', 0, 0, 1, 1, 1, 0, '{\"display\":{\"width\":6}}', 2),
(77, 10, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, '{}', 12),
(78, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 13),
(79, 10, 'product_belongstomany_categoria_relationship', 'relationship', 'Categoria', 0, 0, 1, 1, 1, 0, '{\"foreign_pivot_key\":\"productos_id\",\"related_pivot_key\":\"categorias_id\",\"parent_key\":\"id\",\"display\":{\"width\":6},\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"El producto debe tener una categoria\"}},\"model\":\"App\\\\Categoria\",\"table\":\"categorias\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"names\",\"pivot_table\":\"productos_categorias\",\"pivot\":\"1\",\"taggable\":\"on\"}', 7),
(80, 10, 'product_belongstomany_marca_relationship', 'relationship', 'Marca', 0, 1, 1, 1, 1, 1, '{\"foreign_pivot_key\":\"productos_id\",\"related_pivot_key\":\"marcas_id\",\"parent_key\":\"id\",\"display\":{\"width\":6},\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"El producto debe tener una marca\"}},\"model\":\"App\\\\Marca\",\"table\":\"marcas\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"names\",\"pivot_table\":\"productos_marcas\",\"pivot\":\"1\",\"taggable\":\"on\"}', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `display_name_singular` varchar(255) NOT NULL,
  `display_name_plural` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `model_name` varchar(255) DEFAULT NULL,
  `policy_name` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(7, 'categorias', 'categorias', 'Categoria', 'Categorias', 'voyager-bag', 'App\\Categoria', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2023-01-29 16:50:46', '2023-01-29 16:50:46'),
(9, 'marcas', 'marcas', 'Marca', 'Marcas', 'voyager-ticket', 'App\\Marca', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2023-01-29 17:12:55', '2023-01-29 17:12:55'),
(10, 'products', 'productos', 'Producto', 'Productos', 'voyager-laptop', 'App\\Product', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-01-29 17:22:22', '2023-01-30 05:13:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id` int(10) UNSIGNED NOT NULL,
  `images_url` varchar(255) DEFAULT NULL,
  `names` varchar(255) DEFAULT NULL,
  `descriptions` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id`, `images_url`, `names`, `descriptions`, `created_at`, `updated_at`) VALUES
(1, NULL, 'HP', NULL, '2023-01-29 17:42:49', '2023-01-29 17:42:49'),
(2, NULL, 'Genius', NULL, '2023-01-29 23:27:49', '2023-01-29 23:27:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(2, 'site', '2023-01-29 18:25:06', '2023-01-29 18:25:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `parameters` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Inicio', '', '_self', 'voyager-boat', '#000000', NULL, 1, '2023-01-29 00:28:51', '2023-01-29 17:53:24', 'voyager.dashboard', 'null'),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, 20, 4, '2023-01-29 00:28:51', '2023-01-29 17:50:52', 'voyager.media.index', NULL),
(3, 1, 'Usuarios', '', '_self', 'voyager-person', '#000000', 19, 2, '2023-01-29 00:28:51', '2023-01-29 17:53:04', 'voyager.users.index', 'null'),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, 19, 1, '2023-01-29 00:28:51', '2023-01-29 17:46:58', 'voyager.roles.index', NULL),
(5, 1, 'herramientas', '', '_self', 'voyager-tools', '#000000', NULL, 5, '2023-01-29 00:28:51', '2023-01-29 17:48:57', NULL, ''),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2023-01-29 00:28:51', '2023-01-29 17:50:52', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2023-01-29 00:28:51', '2023-01-29 17:50:52', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2023-01-29 00:28:51', '2023-01-29 17:50:52', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2023-01-29 00:28:51', '2023-01-29 17:50:52', 'voyager.bread.index', NULL),
(10, 1, 'Ajustes', '', '_self', 'voyager-settings', '#000000', NULL, 4, '2023-01-29 00:28:51', '2023-01-29 17:49:12', 'voyager.settings.index', 'null'),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, 20, 1, '2023-01-29 00:28:51', '2023-01-29 17:50:44', 'voyager.categories.index', NULL),
(12, 1, 'Pulicaciones', '', '_self', 'voyager-news', '#000000', 20, 2, '2023-01-29 00:28:51', '2023-01-29 17:51:45', 'voyager.posts.index', 'null'),
(13, 1, 'Paginas', '', '_self', 'voyager-file-text', '#000000', 20, 3, '2023-01-29 00:28:52', '2023-01-29 17:51:06', 'voyager.pages.index', 'null'),
(14, 1, 'Categorias', '', '_self', 'voyager-bag', NULL, 18, 1, '2023-01-29 16:50:46', '2023-01-29 17:44:42', 'voyager.categorias.index', NULL),
(16, 1, 'Marcas', '', '_self', 'voyager-ticket', NULL, 18, 2, '2023-01-29 17:12:55', '2023-01-29 17:44:45', 'voyager.marcas.index', NULL),
(17, 1, 'Productos', '', '_self', 'voyager-laptop', NULL, 18, 3, '2023-01-29 17:22:22', '2023-01-29 17:44:47', 'voyager.productos.index', NULL),
(18, 1, 'Inventario', '', '_self', 'voyager-archive', '#000000', NULL, 2, '2023-01-29 17:44:32', '2023-01-29 17:44:55', NULL, ''),
(19, 1, 'Seguridad', '', '_self', 'voyager-key', '#000000', NULL, 3, '2023-01-29 17:46:24', '2023-01-29 17:46:58', NULL, ''),
(20, 1, 'Paginas y Post', '', '_self', 'voyager-html5', '#000000', NULL, 6, '2023-01-29 17:50:37', '2023-01-29 17:50:37', NULL, ''),
(21, 2, 'Home', '', '_self', NULL, '#000000', NULL, 7, '2023-01-29 18:25:53', '2023-01-29 18:41:17', 'welcome', 'null'),
(22, 2, 'Productos', '', '_self', NULL, '#000000', NULL, 8, '2023-01-29 18:26:45', '2023-01-30 00:49:25', 'policy', 'null'),
(23, 2, 'Terminos y Condiciones', 'terms', '_self', NULL, '#000000', NULL, 9, '2023-01-29 18:27:06', '2023-01-29 18:27:06', NULL, ''),
(24, 2, 'Login', '', '_self', NULL, '#000000', NULL, 10, '2023-01-29 21:42:14', '2023-01-29 21:48:56', 'login', 'null');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_01_28_202035_create_sessions_table', 1),
(7, '2016_01_01_000000_add_voyager_user_fields', 2),
(8, '2016_01_01_000000_create_data_types_table', 2),
(9, '2016_05_19_173453_create_menu_table', 2),
(10, '2016_10_21_190000_create_roles_table', 2),
(11, '2016_10_21_190000_create_settings_table', 2),
(12, '2016_11_30_135954_create_permission_table', 2),
(13, '2016_11_30_141208_create_permission_role_table', 2),
(14, '2016_12_26_201236_data_types__add__server_side', 2),
(15, '2017_01_13_000000_add_route_to_menu_items_table', 2),
(16, '2017_01_14_005015_create_translations_table', 2),
(17, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 2),
(18, '2017_03_06_000000_add_controller_to_data_types_table', 2),
(19, '2017_04_21_000000_add_order_to_data_rows_table', 2),
(20, '2017_07_05_210000_add_policyname_to_data_types_table', 2),
(21, '2017_08_05_000000_add_group_to_settings_table', 2),
(22, '2017_11_26_013050_add_user_role_relationship', 2),
(23, '2017_11_26_015000_create_user_roles_table', 2),
(24, '2018_03_11_000000_add_user_settings', 2),
(25, '2018_03_14_000000_add_details_to_data_types_table', 2),
(26, '2018_03_16_000000_make_settings_value_nullable', 2),
(27, '2016_01_01_000000_create_pages_table', 3),
(28, '2016_01_01_000000_create_posts_table', 3),
(29, '2016_02_15_204651_create_categories_table', 3),
(30, '2017_04_11_000000_alter_post_nullable_fields_table', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `excerpt` text DEFAULT NULL,
  `body` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2023-01-29 00:28:52', '2023-01-29 00:28:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(2, 'browse_bread', NULL, '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(3, 'browse_database', NULL, '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(4, 'browse_media', NULL, '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(5, 'browse_compass', NULL, '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(6, 'browse_menus', 'menus', '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(7, 'read_menus', 'menus', '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(8, 'edit_menus', 'menus', '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(9, 'add_menus', 'menus', '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(10, 'delete_menus', 'menus', '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(11, 'browse_roles', 'roles', '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(12, 'read_roles', 'roles', '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(13, 'edit_roles', 'roles', '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(14, 'add_roles', 'roles', '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(15, 'delete_roles', 'roles', '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(16, 'browse_users', 'users', '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(17, 'read_users', 'users', '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(18, 'edit_users', 'users', '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(19, 'add_users', 'users', '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(20, 'delete_users', 'users', '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(21, 'browse_settings', 'settings', '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(22, 'read_settings', 'settings', '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(23, 'edit_settings', 'settings', '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(24, 'add_settings', 'settings', '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(25, 'delete_settings', 'settings', '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(26, 'browse_categories', 'categories', '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(27, 'read_categories', 'categories', '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(28, 'edit_categories', 'categories', '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(29, 'add_categories', 'categories', '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(30, 'delete_categories', 'categories', '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(31, 'browse_posts', 'posts', '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(32, 'read_posts', 'posts', '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(33, 'edit_posts', 'posts', '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(34, 'add_posts', 'posts', '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(35, 'delete_posts', 'posts', '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(36, 'browse_pages', 'pages', '2023-01-29 00:28:52', '2023-01-29 00:28:52'),
(37, 'read_pages', 'pages', '2023-01-29 00:28:52', '2023-01-29 00:28:52'),
(38, 'edit_pages', 'pages', '2023-01-29 00:28:52', '2023-01-29 00:28:52'),
(39, 'add_pages', 'pages', '2023-01-29 00:28:52', '2023-01-29 00:28:52'),
(40, 'delete_pages', 'pages', '2023-01-29 00:28:52', '2023-01-29 00:28:52'),
(41, 'browse_categorias', 'categorias', '2023-01-29 16:50:46', '2023-01-29 16:50:46'),
(42, 'read_categorias', 'categorias', '2023-01-29 16:50:46', '2023-01-29 16:50:46'),
(43, 'edit_categorias', 'categorias', '2023-01-29 16:50:46', '2023-01-29 16:50:46'),
(44, 'add_categorias', 'categorias', '2023-01-29 16:50:46', '2023-01-29 16:50:46'),
(45, 'delete_categorias', 'categorias', '2023-01-29 16:50:46', '2023-01-29 16:50:46'),
(51, 'browse_marcas', 'marcas', '2023-01-29 17:12:55', '2023-01-29 17:12:55'),
(52, 'read_marcas', 'marcas', '2023-01-29 17:12:55', '2023-01-29 17:12:55'),
(53, 'edit_marcas', 'marcas', '2023-01-29 17:12:55', '2023-01-29 17:12:55'),
(54, 'add_marcas', 'marcas', '2023-01-29 17:12:55', '2023-01-29 17:12:55'),
(55, 'delete_marcas', 'marcas', '2023-01-29 17:12:55', '2023-01-29 17:12:55'),
(56, 'browse_products', 'products', '2023-01-29 17:22:22', '2023-01-29 17:22:22'),
(57, 'read_products', 'products', '2023-01-29 17:22:22', '2023-01-29 17:22:22'),
(58, 'edit_products', 'products', '2023-01-29 17:22:22', '2023-01-29 17:22:22'),
(59, 'add_products', 'products', '2023-01-29 17:22:22', '2023-01-29 17:22:22'),
(60, 'delete_products', 'products', '2023-01-29 17:22:22', '2023-01-29 17:22:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `excerpt` text DEFAULT NULL,
  `body` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-01-29 00:28:51', '2023-01-29 00:28:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_categorias`
--

CREATE TABLE `productos_categorias` (
  `id` int(10) UNSIGNED NOT NULL,
  `productos_id` int(11) DEFAULT NULL,
  `categorias_id` int(11) DEFAULT NULL,
  `status_at` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos_categorias`
--

INSERT INTO `productos_categorias` (`id`, `productos_id`, `categorias_id`, `status_at`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, NULL, NULL),
(2, 2, 1, 1, NULL, NULL),
(3, 3, 1, 1, NULL, NULL),
(4, 4, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_marcas`
--

CREATE TABLE `productos_marcas` (
  `id` int(10) UNSIGNED NOT NULL,
  `productos_id` int(11) DEFAULT NULL,
  `marcas_id` int(11) DEFAULT NULL,
  `status_at` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos_marcas`
--

INSERT INTO `productos_marcas` (`id`, `productos_id`, `marcas_id`, `status_at`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, NULL, NULL),
(2, 2, 1, 1, NULL, NULL),
(3, 3, 1, 1, NULL, NULL),
(4, 4, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `images_url` text DEFAULT NULL,
  `names` varchar(255) DEFAULT NULL,
  `descriptions` text DEFAULT NULL,
  `status_at` int(11) DEFAULT 1,
  `costo_compra` float DEFAULT NULL,
  `precio_contado` float DEFAULT NULL,
  `precio_creadito` float DEFAULT NULL,
  `ns` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `images_url`, `names`, `descriptions`, `status_at`, `costo_compra`, `precio_contado`, `precio_creadito`, `ns`, `created_at`, `updated_at`) VALUES
(1, 'productos\\January2023\\1zvcpNJyaDDR5kfCzp2w.webp', 'Mouse USB', 'Mouse Genius VL 205 tiene un sensor sensible, fácil instalación, no se necesitan controladores adicionales para funcionar. Le permite trabajar en casi cualquier superficie.\r\n\r\nTipo de ratón: LED óptico\r\nDpi: 800\r\nInterfaz de conexión: USB\r\nPropósito: computadora de escritorio o portátil\r\nDe color negro\r\nNúmero de botones del ratón: 3\r\nLongitud del cable: 110 cm\r\nCompatible con: Windows 10/MacOS', 1, 50, 75, NULL, NULL, '2023-01-29 23:43:42', '2023-01-29 23:43:42'),
(2, 'productos\\January2023\\XFwCIJaiccUKYOM8qNm1.png', 'HP VICTUS 15-Ryzen 5 5600H gaming 16GB+512GB+GTX 4GB', 'HP VICTUS 15-Ryzen 5 gaming FB0100LA (6F7G5LA) AMD Ryzen™ 5 5600H Ram 16GB DDR4-3200 (SDRAM) Solido  512GB SSD M.2 PCIe®  ™ Pantalla 15.6\" Pulgadas FHD Resolucion (1920 x 1080) Nvidia GeForce® GTX 1650 4 GB GDDR6 Windows 11 Home 64 Original Wifi, Bluetooth, USB-C 5Gbps HDMI, USB Type-A 5Gbps WebCam  con microfono integrado  Teclado ILUMINADo en Español Nuevo (Garantía Hp)', 1, 6257, 6890, NULL, NULL, '2023-01-30 00:25:02', '2023-01-30 01:59:15'),
(3, 'productos\\January2023\\QsZGetEISEDc25SYLwnl.png', 'HP 15-DY2062LA ;Intel® Core™ i3-1125G4 8GB', 'HP 15-DY2062LA core i3 Intel® Core™ i3-1125G4 Ram 8GB DDR4-3200 Disco solido 256GB SSD M.2 Pantalla 15,6\" pulgadas Resolucion HD (1366 x 768) WLED \r\nWifi,HDMI, USB, Bluetooth Webcam microfono  Intel® UHD® Graphics Integrada Windows 11 Home 64 Origina Teclado Numérico en Español Nuevo Garantía HP', 1, 3265, 3760, NULL, NULL, '2023-01-30 01:27:51', '2023-01-30 01:59:28'),
(4, 'productos\\January2023\\88Vq4qOhoN65zN5rLowk.png', 'HP 15-DY2044 core i3@ Intel Core i3-1115G4 3.0GHz', 'HP 15-DY2044 core i3@ Intel Core i3-1115G4 3.0GHz 11va. Generacion Solido 256GB SSD Ram 8GB DDR4 3200 PANTALLA 15.6\" PULGADAS HD TOUCHSCREEN Tactil WINDOWS 11 HOME ORIGINAL Wifi, Bluetooth, HDMI, USB , TECLADO EN INGLES COLOR Plateada  Nuevo Garantia', 0, 430, 4450, NULL, NULL, '2023-01-30 01:58:50', '2023-01-30 05:12:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2023-01-29 00:28:51', '2023-01-29 00:28:51'),
(2, 'user', 'Normal User', '2023-01-29 00:28:51', '2023-01-29 00:28:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0dZLzBKXEblY21t8vxlTKxQI1tVx6NF0RSTELZ1j', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYjdBQ05JR0U0ajlzQlBGaUo3WDhuQllYRnlMN3hpeTl0UjdGazlZVyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wb2xpY3kiO319', 1675040483),
('1ww7TckcKoMJ1ZKvGgFQiEam3212bU1LIQvdSzNW', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYzJpVHd3QldMMXNSYlZjWjU5a2R4aE0wbTBzV3Z6T2FuR3ZieWtiNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wb2xpY3kiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1675040598),
('G8F0TdL8BIUAxJkjSThwmsEV4AD48ZB3SorCPhrd', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoib2JTQklZaUt6b09QTDk1WkVvZUhzZk5WOGlwVUNGUDNGOXJmZ2dPUSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9icmVhZC9wcm9kdWN0cy9lZGl0Ijt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCRoTloyM2haZDBhNjZjeDFPbnZRRVl1LnZVZDZDR3VyN0N3SzNmYkcvRmtycmIyNHEvamYzTyI7fQ==', 1675041817);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `details` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Fassid Soluciones y Servicios', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings\\January2023\\00wTgtQqXhsIoThk1ogs.png', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Fassid', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'sistema de Adeministracion de pagina web', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin'),
(11, 'site.telephone', 'Phone', '65203074', NULL, 'text', 6, 'Site'),
(12, 'site.garantia', 'Garantia', '<p class=\"MsoNormal\" style=\"line-height: normal; text-align: center;\" align=\"center; font-size: 24pt;\"><span style=\"text-decoration: underline;\"><span style=\"color: rgb(0, 0, 0); text-decoration: underline;\"><strong><span style=\"font-size: 12pt; font-family: \'Times New Roman\', serif;\">T&eacute;rminos y Condiciones de Garant&iacute;a</span></strong></span></span></p>\r\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-fareast-language: ES-MX;\">En el presente documento digital, le presentamos los t&eacute;rminos y condiciones para la hacer valer la garant&iacute;a del producto que haya adquirido en tiendas <strong>Fassid Soluciones y Servicios. </strong></span></p>\r\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-fareast-language: ES-MX;\">La garant&iacute;a de todos los productos es de un a&ntilde;o por parte de la marca de cualquier producto adquirido en la tienda bajo los siguientes t&eacute;rminos.</span></p>\r\n<ul type=\"disc\">\r\n<li class=\"MsoNormal\" style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; line-height: normal; mso-list: l1 level1 lfo1; tab-stops: list 36.0pt;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-fareast-language: ES-MX;\">Todo producto que presente fallas debe ser notificado de inmediato a la persona que est&aacute; encargada de la tienda o a los numero de referencia otorgados por la tienda.</span></li>\r\n<li class=\"MsoNormal\" style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; line-height: normal; mso-list: l1 level1 lfo1; tab-stops: list 36.0pt;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-fareast-language: ES-MX;\">Todos los productos al momento de ser recepcionado por el personal de la tienda es revisado minuciosamente para corroborar que el producto no ha sido alterado o hayan roto los sellos de garant&iacute;as con los que vienen los productos.</span></li>\r\n<li class=\"MsoNormal\" style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; line-height: normal; mso-list: l1 level1 lfo1; tab-stops: list 36.0pt;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-fareast-language: ES-MX;\">La garant&iacute;a quedara sin efecto bajo las siguientes condiciones:&nbsp;</span></li>\r\n</ul>\r\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; margin-left: 72.0pt; text-indent: -18.0pt; line-height: normal; mso-list: l2 level1 lfo2; tab-stops: list 36.0pt;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-fareast-language: ES-MX;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]--><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-fareast-language: ES-MX;\">&nbsp;</span></p>\r\n<ul type=\"disc\">\r\n<ul type=\"circle\">\r\n<li class=\"MsoNormal\" style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; line-height: normal; mso-list: l2 level2 lfo2; tab-stops: list 72.0pt;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-fareast-language: ES-MX;\">si el producto presenta da&ntilde;os por parte del cliente.</span></li>\r\n<li class=\"MsoNormal\" style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; line-height: normal; mso-list: l2 level2 lfo2; tab-stops: list 72.0pt;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-fareast-language: ES-MX;\">si el producto ha sido mojado.</span></li>\r\n<li class=\"MsoNormal\" style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; line-height: normal; mso-list: l2 level2 lfo2; tab-stops: list 72.0pt;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-fareast-language: ES-MX;\">si el producto fue mal manipulado por parte del cliente.</span></li>\r\n<li class=\"MsoNormal\" style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; line-height: normal; mso-list: l2 level2 lfo2; tab-stops: list 72.0pt;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-fareast-language: ES-MX;\">si el producto fue conectado a un tomade corriente no apropiada (que le pueda provocar un corto circuito).</span></li>\r\n<li class=\"MsoNormal\" style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; line-height: normal; mso-list: l2 level2 lfo2; tab-stops: list 72.0pt;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-fareast-language: ES-MX;\">si el producto fuese abierto o manipulado por t&eacute;cnicos ajenos a la empresa.</span></li>\r\n</ul>\r\n</ul>\r\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-fareast-language: ES-MX;\">El cliente debe proporcionar toda la informaci&oacute;n que se le pida sin omisiones de los detalles por cual el producto presente fallas para su funcionamiento normal, la empresa dejara sin efecto la garant&iacute;a al detectar cualquier tipo de da&ntilde;os mencionados anteriormente.</span></p>\r\n<ul type=\"disc\">\r\n<li class=\"MsoNormal\" style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; line-height: normal; mso-list: l0 level1 lfo3; tab-stops: list 36.0pt;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-fareast-language: ES-MX;\">el cliente debe conservar la caja y el recibo que se le sea entregado al momento de la compra para su respectiva presentaci&oacute;n al momento de querer hacer valer la garant&iacute;a.</span></li>\r\n<li class=\"MsoNormal\" style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; line-height: normal; mso-list: l0 level1 lfo3; tab-stops: list 36.0pt;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-fareast-language: ES-MX;\">Si el caso fuera que el cliente por fuerza mayor hubiese perdido su recibo o boleta de garanta deber&aacute; proporcionar los datos exacto para su b&uacute;squeda en el sistema de registros de la empresa.</span></li>\r\n<li class=\"MsoNormal\" style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; line-height: normal; mso-list: l0 level1 lfo3; tab-stops: list 36.0pt;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-fareast-language: ES-MX;\">para poder hacer valer la garant&iacute;a del producto debe hacerlo la persona quien hizo la compra del producto y no as&iacute; terceros</span></li>\r\n</ul>', NULL, 'rich_text_box', 7, 'Site');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) NOT NULL,
  `column_name` varchar(255) NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2023-01-29 00:28:52', '2023-01-29 00:28:52'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2023-01-29 00:28:52', '2023-01-29 00:28:52'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2023-01-29 00:28:52', '2023-01-29 00:28:52'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2023-01-29 00:28:52', '2023-01-29 00:28:52'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2023-01-29 00:28:52', '2023-01-29 00:28:52'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2023-01-29 00:28:52', '2023-01-29 00:28:52'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2023-01-29 00:28:52', '2023-01-29 00:28:52'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2023-01-29 00:28:52', '2023-01-29 00:28:52'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2023-01-29 00:28:52', '2023-01-29 00:28:52'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2023-01-29 00:28:52', '2023-01-29 00:28:52'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2023-01-29 00:28:52', '2023-01-29 00:28:52'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2023-01-29 00:28:52', '2023-01-29 00:28:52'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2023-01-29 00:28:52', '2023-01-29 00:28:52'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2023-01-29 00:28:52', '2023-01-29 00:28:52'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2023-01-29 00:28:52', '2023-01-29 00:28:52'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2023-01-29 00:28:52', '2023-01-29 00:28:52'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2023-01-29 00:28:52', '2023-01-29 00:28:52'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2023-01-29 00:28:52', '2023-01-29 00:28:52'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2023-01-29 00:28:52', '2023-01-29 00:28:52'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2023-01-29 00:28:52', '2023-01-29 00:28:52'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2023-01-29 00:28:52', '2023-01-29 00:28:52'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2023-01-29 00:28:52', '2023-01-29 00:28:52'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2023-01-29 00:28:52', '2023-01-29 00:28:52'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2023-01-29 00:28:52', '2023-01-29 00:28:52'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2023-01-29 00:28:52', '2023-01-29 00:28:52'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2023-01-29 00:28:52', '2023-01-29 00:28:52'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2023-01-29 00:28:52', '2023-01-29 00:28:52'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2023-01-29 00:28:52', '2023-01-29 00:28:52'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2023-01-29 00:28:52', '2023-01-29 00:28:52'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2023-01-29 00:28:52', '2023-01-29 00:28:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `settings`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$hNZ23hZd0a66cx1OnvQEYu.vUd6CGur7CwK3fbG/Fkrrb24q/jf3O', NULL, NULL, NULL, '909MFxknbmHgBKwl6FBAQOIcyj8LmJzaeQe5vSEPHgThQ40rmjvB8KrUN5Yh', '{\"locale\":\"es\"}', NULL, NULL, '2023-01-29 00:28:51', '2023-01-29 16:24:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indices de la tabla `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indices de la tabla `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indices de la tabla `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indices de la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indices de la tabla `productos_categorias`
--
ALTER TABLE `productos_categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos_marcas`
--
ALTER TABLE `productos_marcas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indices de la tabla `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT de la tabla `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `productos_categorias`
--
ALTER TABLE `productos_categorias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `productos_marcas`
--
ALTER TABLE `productos_marcas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
