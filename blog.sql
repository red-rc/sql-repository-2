-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Час створення: Лип 04 2024 р., 15:39
-- Версія сервера: 5.7.24
-- Версія PHP: 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- Створення бази даних
CREATE DATABASE IF NOT EXISTS `blog`;
USE `blog`;

--
-- База даних: `blog`
--

-- --------------------------------------------------------

--
-- Структура таблиці `categories`
--

CREATE TABLE `categories` (
  `categoryId` int(10) UNSIGNED NOT NULL,
  `categoryName` varchar(50) NOT NULL,
  `categoryDescription` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `categories`
--

INSERT INTO `categories` (`categoryId`, `categoryName`, `categoryDescription`) VALUES
(1, 'IT', 'Все про IT'),
(2, 'Новини', 'Новини світу'),
(3, 'Товари', 'Популярні товари та інформація про акції');

-- --------------------------------------------------------

--
-- Структура таблиці `comments`
--

CREATE TABLE `comments` (
  `commentId` int(10) UNSIGNED NOT NULL,
  `userId` int(10) UNSIGNED NOT NULL,
  `commentLikes` int(10) UNSIGNED NOT NULL,
  `commentDislikes` int(10) UNSIGNED NOT NULL,
  `postId` int(10) UNSIGNED NOT NULL,
  `commentText` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `comments`
--

INSERT INTO `comments` (`commentId`, `userId`, `commentLikes`, `commentDislikes`, `postId`, `commentText`) VALUES
(1, 3, 554, 29, 1, 'Мені не сподобалось'),
(2, 4, 346, 72, 2, 'Цікаво');

-- --------------------------------------------------------

--
-- Структура таблиці `posts`
--

CREATE TABLE `posts` (
  `postId` int(10) UNSIGNED NOT NULL,
  `caption` varchar(50) NOT NULL,
  `userId` int(10) UNSIGNED NOT NULL,
  `text` varchar(10000) NOT NULL,
  `categoryId` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `posts`
--

INSERT INTO `posts` (`postId`, `caption`, `userId`, `text`, `categoryId`) VALUES
(1, 'Заголовок', 2, 'Текст', 1),
(2, 'Заголовок', 2, 'Текст', 2),
(3, 'Заголовок', 1, 'Текст', 2);

-- --------------------------------------------------------

--
-- Структура таблиці `users`
--

CREATE TABLE `users` (
  `userId` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `users`
--

INSERT INTO `users` (`userId`, `name`, `email`, `password`, `createdAt`, `updatedAt`) VALUES
(1, 'Іван', 'example@gmail.com', '12345678', '2024-06-27 15:53:43', '2024-06-27 15:53:43'),
(2, 'Андрій', 'newemail@gmail.com', '11111111', '2024-07-04 12:52:17', '2024-07-04 12:52:17'),
(3, 'Кирило', 'email@gmail.com', '12121212', '2024-07-04 12:54:07', '2024-07-04 12:54:07'),
(4, 'Богдан', 'em@gmail.com', '12341234', '2024-07-04 12:54:23', '2024-07-04 12:54:23');

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categoryId`),
  ADD UNIQUE KEY `categoryName` (`categoryName`);

--
-- Індекси таблиці `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`commentId`);

--
-- Індекси таблиці `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`postId`);

--
-- Індекси таблиці `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `updatedAt` (`updatedAt`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `categories`
--
ALTER TABLE `categories`
  MODIFY `categoryId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `comments`
--
ALTER TABLE `comments`
  MODIFY `commentId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблиці `posts`
--
ALTER TABLE `posts`
  MODIFY `postId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
