-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Server version: 5.7.33-0ubuntu0.18.04.1
-- PHP Version: 7.2.34-8+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `invoice_generator`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `line` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `address_id` int(11) NOT NULL,
  `created_date` date NOT NULL,
  `due_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoices_products`
--

CREATE TABLE `invoices_products` (
  `id` int(11) NOT NULL,
  `invoice_id` int(12) NOT NULL,
  `product_id` int(12) NOT NULL,
  `quantity` int(12) NOT NULL,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(12) NOT NULL,
  `name` varchar(255) NOT NULL,
  `unit_price` double NOT NULL,
  `quantity_in_stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `unit_price`, `quantity_in_stock`) VALUES
(1, 'cubilia Curae; Donec', 63.38, 73),
(2, 'neque', 8.14, 99),
(3, 'sodales. Mauris', 38.16, 62),
(4, 'at sem molestie sodales.', 74.21, 55),
(5, 'augue eu tellus.', 45.65, 74),
(6, 'velit. Cras lorem lorem,', 63.26, 44),
(7, 'Phasellus libero mauris,', 86.1, 18),
(8, 'commodo hendrerit. Donec porttitor', 29.07, 55),
(9, 'ultrices iaculis odio.', 24.04, 71),
(10, 'mus. Aenean eget magna.', 9.07, 61),
(11, 'sed, hendrerit a, arcu.', 46.54, 100),
(12, 'massa lobortis ultrices.', 23.37, 78),
(13, 'consequat purus.', 83.08, 48),
(14, 'magnis dis', 38.15, 62),
(15, 'erat, eget', 81.17, 21),
(16, 'sociosqu ad', 28.14, 12),
(17, 'augue scelerisque mollis. Phasellus', 13.24, 13),
(18, 'dui. Cras', 28.65, 17),
(19, 'primis in', 81.93, 62),
(20, 'pellentesque', 96.58, 81),
(21, 'dolor dolor, tempus non,', 17.41, 71),
(22, 'vel pede', 94.85, 83),
(23, 'ante,', 35.02, 71),
(24, 'aliquet odio. Etiam', 10.77, 38),
(25, 'pulvinar arcu et pede.', 62.65, 51),
(26, 'aliquam eu, accumsan sed,', 54.8, 92),
(27, 'fermentum convallis ligula. Donec', 87.75, 62),
(28, 'Mauris quis', 44.04, 98),
(29, 'lacus. Etiam bibendum', 81.73, 57),
(30, 'viverra.', 59.5, 93),
(31, 'eget, ipsum. Donec sollicitudin', 45.96, 89),
(32, 'turpis egestas.', 20.14, 44),
(33, 'nec tellus. Nunc', 75.61, 81),
(34, 'natoque', 13.75, 78),
(35, 'at lacus. Quisque', 66.07, 47),
(36, 'mattis. Integer eu lacus.', 5.1, 56),
(37, 'elit sed consequat', 19.67, 23),
(38, 'dui. Cum sociis', 40.05, 28),
(39, 'imperdiet ullamcorper. Duis at', 82.68, 81),
(40, 'et', 45.43, 34),
(41, 'tellus', 31.33, 31),
(42, 'velit. Sed malesuada augue', 30.42, 64),
(43, 'tellus non', 6.17, 63),
(44, 'cubilia Curae; Phasellus', 44.49, 50),
(45, 'pellentesque a, facilisis non,', 85.56, 13),
(46, 'mi', 39.3, 15),
(47, 'quam quis', 17.95, 86),
(48, 'libero lacus, varius et,', 93.39, 84),
(49, 'accumsan interdum', 23.04, 49),
(50, 'ornare lectus justo eu', 63.96, 81),
(51, 'volutpat', 33.12, 16),
(52, 'blandit', 55.02, 20),
(53, 'sed turpis nec mauris', 57.11, 50),
(54, 'tincidunt vehicula risus. Nulla', 42.57, 66),
(55, 'in,', 42.8, 91),
(56, 'nisi. Aenean eget metus.', 65.58, 34),
(57, 'penatibus et magnis', 62.62, 33),
(58, 'eros', 82.69, 19),
(59, 'adipiscing.', 14.52, 90),
(60, 'quis, tristique ac,', 81.77, 93),
(61, 'egestas a, scelerisque sed,', 19.2, 40),
(62, 'ornare, lectus', 56.98, 21),
(63, 'In', 39.52, 42),
(64, 'elit. Nulla facilisi. Sed', 88.15, 96),
(65, 'arcu. Sed eu', 47.88, 39),
(66, 'Cras', 88.76, 78),
(67, 'nostra, per', 76.87, 69),
(68, 'sit amet', 24.86, 20),
(69, 'parturient montes,', 7.02, 49),
(70, 'eu, ultrices sit amet,', 35.11, 68),
(71, 'In at', 11.99, 55),
(72, 'aliquam eros turpis', 71.66, 44),
(73, 'Integer eu lacus.', 69.03, 86),
(74, 'nec tellus.', 82, 20),
(75, 'ornare,', 56.22, 71),
(76, 'quis urna.', 24.5, 65),
(77, 'neque non', 77.6, 96),
(78, 'semper, dui lectus rutrum', 5.63, 73),
(79, 'Phasellus dapibus', 25.57, 98),
(80, 'amet nulla. Donec', 21.07, 71),
(81, 'eu metus. In', 8.62, 20),
(82, 'Proin dolor. Nulla semper', 55.34, 72),
(83, 'posuere vulputate, lacus. Cras', 26.19, 63),
(84, 'metus sit amet', 85.39, 63),
(85, 'habitant morbi tristique senectus', 45.25, 12),
(86, 'fringilla. Donec feugiat', 49.89, 60),
(87, 'cursus, diam', 54.42, 25),
(88, 'ullamcorper.', 38.46, 86),
(89, 'Maecenas', 82, 23),
(90, 'amet', 50.38, 61),
(91, 'tellus, imperdiet non, vestibulum', 99.87, 44),
(92, 'suscipit', 52.95, 47),
(93, 'semper. Nam', 19.94, 78),
(94, 'adipiscing fringilla, porttitor', 24.68, 68),
(95, 'sapien, cursus', 9.85, 35),
(96, 'lorem, vehicula et, rutrum', 8.74, 62),
(97, 'at, velit. Cras', 58.26, 43),
(98, 'amet ante. Vivamus non', 66.6, 77),
(99, 'tortor nibh sit amet', 27.66, 77),
(100, 'at', 97.12, 54),
(101, 'at pede. Cras vulputate', 31.35, 78),
(102, 'id, libero. Donec', 86.15, 12),
(103, 'eros turpis non', 17.69, 29),
(104, 'felis', 48.1, 57),
(105, 'consectetuer adipiscing elit. Etiam', 32.95, 24),
(106, 'urna', 56.9, 13),
(107, 'gravida sit amet, dapibus', 28.64, 43),
(108, 'sed,', 11.96, 71),
(109, 'tempus, lorem', 69.71, 25),
(110, 'faucibus', 88.53, 43);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_invoices_addresses` (`address_id`);

--
-- Indexes for table `invoices_products`
--
ALTER TABLE `invoices_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_invoices_products_products` (`product_id`),
  ADD KEY `fk_invoices_products_invoices` (`invoice_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `invoices_products`
--
ALTER TABLE `invoices_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `fk_invoices_addresses` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `invoices_products`
--
ALTER TABLE `invoices_products`
  ADD CONSTRAINT `fk_invoices_products_invoices` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_invoices_products_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
