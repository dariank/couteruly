-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 21 2026 г., 11:47
-- Версия сервера: 8.0.30
-- Версия PHP: 8.0.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `couteruly`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(8, 'Аксессуары'),
(10, 'Платья и комбинезоны'),
(11, 'Блузки и рубашки'),
(12, 'Футболки и топы'),
(13, 'Брюки'),
(14, 'Джинсы'),
(15, 'Шорты'),
(16, 'Юбки'),
(17, 'Костюмы'),
(18, 'Пиджаки и жакеты'),
(19, 'Верхняя одежда'),
(20, 'Джемперы и кардиганы'),
(21, 'Толстовки и худи'),
(22, 'Распродажа');

-- --------------------------------------------------------

--
-- Структура таблицы `colors`
--

CREATE TABLE `colors` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `hex_code` varchar(7) DEFAULT '#000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `colors`
--

INSERT INTO `colors` (`id`, `name`, `hex_code`) VALUES
(1, 'Синий', '#0000FF'),
(2, 'Белый', '#FFFFFF'),
(3, 'Черный', '#000000'),
(4, 'Красный', '#FF0000'),
(5, 'Зелёный', '#00FF00');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'Обрабатывается',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total`, `status`, `created_at`) VALUES
(1, 2, '14480.00', 'Обрабатывается', '2025-11-17 14:14:09'),
(2, 2, '2990.00', 'Обрабатывается', '2025-11-17 14:14:09'),
(3, 3, '8480.00', 'В пути', '2025-11-17 14:14:09'),
(4, 4, '5990.00', 'Обрабатывается', '2025-11-17 14:59:53'),
(5, 4, '11980.00', 'В пути', '2025-11-20 22:03:20'),
(6, 4, '5990.00', 'Отменён', '2025-11-20 23:55:20'),
(7, 6, '149000.00', 'Отменён', '2025-11-24 20:36:27'),
(8, 6, '74500.00', 'Доставлен', '2025-11-24 20:47:41'),
(9, 7, '17960.00', 'Доставлен', '2025-12-19 06:35:15'),
(10, 8, '8980.00', 'Обрабатывается', '2026-10-21 08:16:44');

-- --------------------------------------------------------

--
-- Структура таблицы `order_items`
--

CREATE TABLE `order_items` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL
) ;

--
-- Дамп данных таблицы `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(8, 5, 27, 2, '5990.00'),
(9, 6, 11, 1, '5990.00'),
(10, 7, 15, 100, '1490.00'),
(11, 8, 15, 50, '1490.00'),
(12, 9, 42, 3, '3990.00'),
(13, 9, 27, 1, '5990.00'),
(14, 10, 42, 1, '3990.00'),
(15, 10, 43, 1, '4990.00');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `composition` text,
  `price` decimal(10,2) NOT NULL,
  `old_price` decimal(10,2) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `category_id` int NOT NULL,
  `stock` int DEFAULT '10',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_new_collection` tinyint(1) DEFAULT '0' COMMENT '1 = в новой коллекции'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `composition`, `price`, `old_price`, `image`, `category_id`, `stock`, `created_at`, `is_new_collection`) VALUES
(11, 'Элегантное платье ', 'Идеально для вечеринок и свиданий', 'Хлопок 100%', '5990.00', NULL, 'dress1.jpg', 10, 99, '2025-11-17 20:26:41', 0),
(12, 'Комбинезон черный', 'Свободный крой, удобный пояс', 'Хлопок 100%', '4990.00', NULL, 'jumpsuit1.jpg', 10, 100, '2025-11-17 20:26:41', 0),
(13, 'Блузка с воланами', 'Женственная, из легкой ткани', 'Хлопок 100%', '2990.00', NULL, 'blouse1.jpg', 11, 100, '2025-11-17 20:26:41', 0),
(14, 'Рубашка oversize ', 'Универсальная, подходит под любой стиль', 'Хлопок 100%', '3490.00', NULL, 'shirt1.jpg', 11, 100, '2025-11-17 20:26:41', 0),
(15, 'Футболка с принтом', 'Удобная, мягкая, идеальна для лета', 'Хлопок 100%', '1490.00', NULL, 'tshirt1.jpg', 12, 0, '2025-11-17 20:26:41', 0),
(16, 'Топ без рукавов', 'Стильный, подчеркивает фигуру', 'Хлопок 100%', '1990.00', NULL, 'top1.jpg', 12, 100, '2025-11-17 20:26:41', 0),
(17, 'Брюки палаццо', 'Широкие, элегантные, для офиса', 'Хлопок 100%', '3990.00', NULL, 'pants1.jpg', 13, 100, '2025-11-17 20:26:41', 0),
(18, 'Джоггеры черные', 'Удобные, спортивные, на каждый день', 'Хлопок 100%', '2990.00', NULL, 'joggers1.jpg', 13, 100, '2025-11-17 20:26:41', 0),
(19, 'Джинсы мом', 'Широкие, с высокой посадкой', 'Хлопок 100%', '3990.00', NULL, 'jeans1.jpg', 14, 100, '2025-11-17 20:26:41', 0),
(20, 'Джинсы скинни', 'Облегающие, подчеркивают ноги', 'Хлопок 100%', '3490.00', NULL, 'jeans2.jpg', 14, 100, '2025-11-17 20:26:41', 0),
(21, 'Шорты джинсовые', 'Классика, под любую обувь', 'Хлопок 100%', '2490.00', NULL, 'shorts1.jpg', 15, 100, '2025-11-17 20:26:41', 0),
(22, 'Шорты хлопковые', 'Легкие, удобные, для лета', 'Хлопок 100%', '1990.00', NULL, 'shorts2.jpg', 15, 100, '2025-11-17 20:26:41', 0),
(23, 'Юбка-карандаш', 'Элегантная, для офиса', 'Хлопок 100%', '2990.00', NULL, 'skirt1.jpg', 16, 100, '2025-11-17 20:26:41', 0),
(24, 'Юбка миди', 'Свободная, с принтом', 'Хлопок 100%', '2490.00', NULL, 'skirt2.jpg', 16, 100, '2025-11-17 20:26:41', 0),
(26, 'Костюм с брюками', 'Модный, женственный', 'Хлопок 100%', '7990.00', NULL, 'suit2.jpg', 17, 100, '2025-11-17 20:26:41', 0),
(27, 'Пиджак ', 'Классика, под любую юбку или брюки', 'Хлопок 100%', '5990.00', NULL, 'blazer1.jpg', 18, 97, '2025-11-17 20:26:41', 0),
(28, 'Жакет с пуговицами', 'Легкий, для весны', 'Хлопок 100%', '4990.00', NULL, 'jacket1.jpg', 18, 100, '2025-11-17 20:26:41', 0),
(29, 'Пальто с поясом', 'Элегантное, для осени', 'Хлопок 100%', '12990.00', NULL, 'coat1.jpg', 19, 100, '2025-11-17 20:26:41', 0),
(30, 'Куртка-бомбер', 'Спортивная, для весны', 'Хлопок 100%', '6990.00', NULL, 'bomber1.jpg', 19, 100, '2025-11-17 20:26:41', 0),
(32, 'Кардиган длинный', 'Свободный, для слоёного стиля', 'Хлопок 100%', '4490.00', NULL, 'cardigan1.jpg', 20, 100, '2025-11-17 20:26:41', 0),
(33, 'Худи с капюшоном', 'Удобное, с карманом', 'Хлопок 100%', '2990.00', NULL, 'hoodie1.jpg', 21, 100, '2025-11-17 20:26:41', 0),
(34, 'Толстовка с принтом', 'Яркая, для повседневной носки', 'Хлопок 100%', '2490.00', NULL, 'sweatshirt1.jpg', 21, 100, '2025-11-17 20:26:41', 0),
(38, 'Очки', 'Классические очки с УФ-защитой', 'Хлопок 100%', '2490.00', NULL, 'sunglasses1.jpg', 8, 100, '2025-11-17 21:06:25', 0),
(39, 'Кожаный ремень', 'Универсальный, подходит к любым брюкам', 'Хлопок 100%', '1890.00', NULL, 'belt1.jpg', 8, 100, '2025-11-17 21:06:25', 0),
(40, 'Шарф шерстяной', 'Тёплый, мягкий, в клетку', 'Хлопок 100%', '2190.00', NULL, 'scarf1.jpg', 8, 100, '2025-11-17 21:06:25', 0),
(41, 'Платье черное', 'Платье черное твидовое', 'Хлопок 100%', '5990.00', NULL, 'platie.jpg', 10, 100, '2025-11-20 22:08:15', 1),
(42, 'Кардиган белый', 'Кардиган с пуговицами белый', 'Хлопок 100%', '3990.00', NULL, 'kardigan.jpg', 20, 96, '2025-11-20 22:08:15', 1),
(43, 'Брюки-клеш черные', 'Черные брюки клеш', 'Хлопок 100%', '4990.00', NULL, 'klesh.jpg', 13, 99, '2025-11-20 22:08:15', 1),
(44, 'Пиджак черный ', 'Пиджак черный твидовый с пуговицами', 'Хлопок 100%', '7990.00', NULL, 'tvidov.jpg', 18, 100, '2025-11-20 22:08:15', 1),
(45, 'Джемпер', 'Синий джемпер', 'Хлопок 100%', '2990.00', NULL, 'sweater1.jpg', 20, 100, '2025-11-21 10:03:41', 0),
(49, 'Сумка', 'Черная сумка', NULL, '5990.00', NULL, 'sumka.jpg', 8, 100, '2025-11-26 11:59:28', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `product_variants`
--

CREATE TABLE `product_variants` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `color_id` int NOT NULL,
  `size_id` int NOT NULL,
  `stock` int DEFAULT '10'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `product_variants`
--

INSERT INTO `product_variants` (`id`, `product_id`, `color_id`, `size_id`, `stock`) VALUES
(3000, 11, 3, 4, 5),
(3001, 11, 3, 3, 5),
(3002, 11, 3, 2, 5),
(3003, 11, 3, 5, 5),
(3004, 11, 3, 1, 5),
(3007, 12, 3, 4, 5),
(3008, 12, 3, 3, 5),
(3009, 12, 3, 2, 5),
(3010, 12, 3, 5, 5),
(3011, 12, 3, 1, 5),
(3014, 13, 2, 4, 5),
(3015, 13, 2, 3, 5),
(3016, 13, 2, 2, 5),
(3017, 13, 2, 5, 5),
(3018, 13, 2, 1, 5),
(3021, 14, 2, 4, 5),
(3022, 14, 2, 3, 5),
(3023, 14, 2, 2, 5),
(3024, 14, 2, 5, 5),
(3025, 14, 2, 1, 5),
(3028, 15, 1, 4, 5),
(3029, 15, 1, 3, 5),
(3030, 15, 1, 2, 5),
(3031, 15, 1, 5, 5),
(3032, 15, 1, 1, 5),
(3035, 16, 3, 4, 5),
(3036, 16, 3, 3, 5),
(3037, 16, 3, 2, 5),
(3038, 16, 3, 5, 5),
(3039, 16, 3, 1, 5),
(3042, 17, 3, 4, 5),
(3043, 17, 3, 3, 5),
(3044, 17, 3, 2, 5),
(3045, 17, 3, 5, 5),
(3046, 17, 3, 1, 5),
(3049, 18, 3, 4, 5),
(3050, 18, 3, 3, 5),
(3051, 18, 3, 2, 5),
(3052, 18, 3, 5, 5),
(3053, 18, 3, 1, 5),
(3056, 19, 1, 4, 5),
(3057, 19, 1, 3, 5),
(3058, 19, 1, 2, 5),
(3059, 19, 1, 5, 5),
(3060, 19, 1, 1, 5),
(3063, 20, 3, 4, 5),
(3064, 20, 3, 3, 5),
(3065, 20, 3, 2, 5),
(3066, 20, 3, 5, 5),
(3067, 20, 3, 1, 5),
(3070, 21, 1, 4, 5),
(3071, 21, 1, 3, 5),
(3072, 21, 1, 2, 5),
(3073, 21, 1, 5, 5),
(3074, 21, 1, 1, 5),
(3077, 22, 2, 4, 5),
(3078, 22, 2, 3, 5),
(3079, 22, 2, 2, 5),
(3080, 22, 2, 5, 5),
(3081, 22, 2, 1, 5),
(3084, 23, 4, 4, 5),
(3085, 23, 4, 3, 5),
(3086, 23, 4, 2, 5),
(3087, 23, 4, 5, 5),
(3088, 23, 4, 1, 5),
(3091, 24, 3, 4, 5),
(3092, 24, 3, 3, 5),
(3093, 24, 3, 2, 5),
(3094, 24, 3, 5, 5),
(3095, 24, 3, 1, 5),
(3098, 26, 3, 4, 5),
(3099, 26, 3, 3, 5),
(3100, 26, 3, 2, 5),
(3101, 26, 3, 5, 5),
(3102, 26, 3, 1, 5),
(3105, 27, 3, 4, 5),
(3106, 27, 3, 3, 5),
(3107, 27, 3, 2, 5),
(3108, 27, 3, 5, 5),
(3109, 27, 3, 1, 5),
(3112, 28, 4, 4, 5),
(3113, 28, 4, 3, 5),
(3114, 28, 4, 2, 5),
(3115, 28, 4, 5, 5),
(3116, 28, 4, 1, 5),
(3119, 29, 3, 4, 5),
(3120, 29, 3, 3, 5),
(3121, 29, 3, 2, 5),
(3122, 29, 3, 5, 5),
(3123, 29, 3, 1, 5),
(3126, 30, 3, 4, 5),
(3127, 30, 3, 3, 5),
(3128, 30, 3, 2, 5),
(3129, 30, 3, 5, 5),
(3130, 30, 3, 1, 5),
(3140, 32, 5, 4, 5),
(3141, 32, 5, 3, 5),
(3142, 32, 5, 2, 5),
(3143, 32, 5, 5, 5),
(3144, 32, 5, 1, 5),
(3147, 33, 3, 4, 5),
(3148, 33, 3, 3, 5),
(3149, 33, 3, 2, 5),
(3150, 33, 3, 5, 5),
(3151, 33, 3, 1, 5),
(3154, 34, 3, 4, 5),
(3155, 34, 3, 3, 5),
(3156, 34, 3, 2, 5),
(3157, 34, 3, 5, 5),
(3158, 34, 3, 1, 5),
(3161, 38, 3, 4, 5),
(3162, 38, 3, 3, 5),
(3163, 38, 3, 2, 5),
(3164, 38, 3, 5, 5),
(3165, 38, 3, 1, 5),
(3168, 39, 3, 4, 5),
(3169, 39, 3, 3, 5),
(3170, 39, 3, 2, 5),
(3171, 39, 3, 5, 5),
(3172, 39, 3, 1, 5),
(3175, 40, 2, 4, 5),
(3176, 40, 2, 3, 5),
(3177, 40, 2, 2, 5),
(3178, 40, 2, 5, 5),
(3179, 40, 2, 1, 5),
(3180, 41, 3, 2, 100),
(3181, 42, 2, 3, 100),
(3182, 43, 3, 4, 100),
(3183, 41, 3, 2, 100),
(3184, 42, 2, 3, 100),
(3185, 43, 3, 4, 100),
(3186, 44, 3, 4, 100),
(3187, 41, 3, 1, 100),
(3188, 41, 3, 2, 100),
(3189, 41, 3, 3, 100),
(3190, 41, 3, 4, 100),
(3191, 41, 3, 5, 100),
(3192, 42, 2, 1, 100),
(3193, 42, 2, 2, 100),
(3194, 42, 2, 3, 100),
(3195, 42, 2, 4, 100),
(3196, 42, 2, 5, 100),
(3197, 43, 3, 1, 100),
(3198, 43, 3, 2, 100),
(3199, 43, 3, 3, 100),
(3200, 43, 3, 4, 100),
(3201, 43, 3, 5, 100),
(3202, 44, 3, 1, 100),
(3203, 44, 3, 2, 100),
(3204, 44, 3, 3, 100),
(3205, 44, 3, 4, 100),
(3206, 44, 3, 5, 100),
(3207, 41, 3, 1, 100),
(3208, 41, 3, 2, 100),
(3209, 41, 3, 3, 100),
(3210, 41, 3, 4, 100),
(3211, 41, 3, 5, 100),
(3212, 42, 2, 1, 100),
(3213, 42, 2, 2, 100),
(3214, 42, 2, 3, 100),
(3215, 42, 2, 4, 100),
(3216, 42, 2, 5, 100),
(3217, 43, 3, 1, 100),
(3218, 43, 3, 2, 100),
(3219, 43, 3, 3, 100),
(3220, 43, 3, 4, 100),
(3221, 43, 3, 5, 100),
(3222, 44, 3, 1, 100),
(3223, 44, 3, 2, 100),
(3224, 44, 3, 3, 100),
(3225, 44, 3, 4, 100),
(3226, 44, 3, 5, 100),
(3233, 49, 3, 4, 100),
(3234, 49, 3, 3, 100),
(3235, 49, 3, 2, 100),
(3236, 49, 3, 5, 100),
(3237, 49, 3, 1, 100);

-- --------------------------------------------------------

--
-- Структура таблицы `reviews`
--

CREATE TABLE `reviews` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `user_name` varchar(100) NOT NULL,
  `rating` tinyint(1) DEFAULT '5',
  `comment` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `reviews`
--

INSERT INTO `reviews` (`id`, `product_id`, `user_id`, `user_name`, `rating`, `comment`, `created_at`) VALUES
(5, 42, 4, 'Дарья', 5, 'Все отлично', '2025-11-24 16:09:11'),
(6, 41, 4, 'Дарья', 5, 'Все супер', '2025-11-24 16:09:37'),
(7, 42, 5, 'Дарья', 4, 'Нормально', '2025-11-24 16:20:19');

-- --------------------------------------------------------

--
-- Структура таблицы `sale_products`
--

CREATE TABLE `sale_products` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `old_price` decimal(10,2) NOT NULL,
  `new_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `sale_products`
--

INSERT INTO `sale_products` (`id`, `product_id`, `old_price`, `new_price`) VALUES
(1, 11, '5990.00', '4990.00'),
(2, 18, '3990.00', '2990.00'),
(3, 27, '4990.00', '3990.00');

-- --------------------------------------------------------

--
-- Структура таблицы `sizes`
--

CREATE TABLE `sizes` (
  `id` int NOT NULL,
  `name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `sizes`
--

INSERT INTO `sizes` (`id`, `name`) VALUES
(4, 'L'),
(3, 'M'),
(2, 'S'),
(5, 'XL'),
(1, 'XS');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') DEFAULT 'user',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `created_at`) VALUES

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `color_id` (`color_id`),
  ADD KEY `size_id` (`size_id`);

--
-- Индексы таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `sale_products`
--
ALTER TABLE `sale_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT для таблицы `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3243;

--
-- AUTO_INCREMENT для таблицы `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `sale_products`
--
ALTER TABLE `sale_products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `product_variants_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_variants_ibfk_2` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_variants_ibfk_3` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Ограничения внешнего ключа таблицы `sale_products`
--
ALTER TABLE `sale_products`
  ADD CONSTRAINT `sale_products_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
