-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 14, 2025 at 09:16 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Type` varchar(255) NOT NULL,
  `Author` varchar(255) NOT NULL,
  `Publisher` varchar(255) NOT NULL,
  `Synopsis` text NOT NULL,
  `GenreId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`Id`, `Name`, `Type`, `Author`, `Publisher`, `Synopsis`, `GenreId`) VALUES
(1, 'Power of Pray', 'Release', 'Imam Moechammad', 'Mediatama Indotech', 'lorem ipsum', 2),
(8, 'Learning ASP.NET Core', 'Education', 'Jane Doe', 'TechBooks Publishing', 'lorem ipsum', 2),
(9, 'Mystery at the Manor', 'Mystery', 'Agatha Christie', 'Mystery House', 'lorem ipsum', 2),
(12, 'The Art of War', 'Hold-Release', 'Sun Tzu', 'Ancient Wisdom Publishers', 'lorem ipsum', 2),
(13, 'Meditations', 'Non-Release', 'Marcus Aurelius', 'Philosophy Press', 'lorem ipsum', 2),
(14, 'The Startup on The Way', 'Release', 'Eric Ries Temb', 'Tech Innovators Press World', 'lorem ipsum', 2),
(21, ' Last of the World', 'Hold-Release', 'M.C Artos', 'Digimedia', 'lorem ipsum', 2),
(22, 'Wonder Woman', 'Non-Release', 'Smith Adam', 'Media Press Jakarta', 'lorem ipsum', 2),
(23, 'book', 'Release', 'saAScafeADVzdtjdz', 'srhgszfdcsEdAHgbhgdzfaEgSD', 'lorem ipsum', 2),
(25, 'The Great Adventure', 'Fiction', 'John Smith', 'Adventure Press', 'lorem ipsum', 2);

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `Id` int(11) NOT NULL,
  `Name_Genre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`Id`, `Name_Genre`) VALUES
(2, 'Mystery'),
(3, 'Romance'),
(4, 'Fantasy'),
(5, 'Horror'),
(6, 'Science Fiction'),
(7, 'Biography'),
(8, 'History'),
(9, 'Adventure'),
(11, 'Drama'),
(12, 'Comedy'),
(13, 'Thriller'),
(14, 'Children'),
(15, 'Young Adult'),
(16, 'Classics'),
(17, 'Adult'),
(18, 'Educational'),
(19, 'Self-Help'),
(20, 'Health'),
(21, 'Religious'),
(22, 'Psychology'),
(23, 'Philosophy'),
(24, 'Inspirational'),
(25, 'Business'),
(26, 'Technology'),
(27, 'Cooking'),
(28, 'Art'),
(29, 'Sports'),
(30, 'Travel'),
(31, 'Photography'),
(32, 'Hobbies'),
(33, 'Parenting'),
(34, 'Motivational'),
(35, 'Cooking'),
(36, 'Music'),
(37, 'Literature'),
(38, 'Politics'),
(39, 'Economics'),
(40, 'Environment'),
(41, 'Design'),
(42, 'Architecture'),
(43, 'Language'),
(44, 'Social'),
(45, 'Culture'),
(47, 'Mythology'),
(49, 'Fiction'),
(54, 'Study');

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `Id` int(11) NOT NULL,
  `Name_Store` varchar(255) NOT NULL,
  `Location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`Id`, `Name_Store`, `Location`) VALUES
(6, 'Supermarket Sejahtera', 'Bandung'),
(7, 'Kafe Santai', 'Surabaya'),
(11, 'Apotek Sehat', 'Makassar'),
(12, 'Toko Serba Ada', 'Balikpapan'),
(13, 'Warung Makan', 'Semarang'),
(14, 'Klinik Kesehatan', 'Malang'),
(15, 'Toko Elektronik Terdepan', 'Jakarta'),
(16, 'Bengkel Mobil Sejahtera', 'Bandung'),
(17, 'Toko Sepatu Sporty', 'Surabaya'),
(18, 'Galeri Seni Modern', 'Medan'),
(19, 'Butik Elegan', 'Yogyakarta'),
(20, 'Restoran Mewah', 'Bali'),
(21, 'Klinik Gigi Berseri', 'Makassar'),
(22, 'Toko Serba Murah', 'Balikpapan'),
(23, 'Warung Sederhana', 'Semarang'),
(24, 'Pusat Kebugaran', 'Malang'),
(25, 'Pasar Tradisional', 'Jakarta'),
(26, 'Toko Pakaian Anak', 'Bandung'),
(27, 'Kafe Kopi Klasik', 'Surabaya'),
(28, 'Pusat Perbelanjaan', 'Medan'),
(29, 'Toko Aksesoris', 'Yogyakarta'),
(30, 'Restoran Keluarga', 'Bali'),
(31, 'Apotek Terpercaya', 'Makassar'),
(32, 'Toko Serbaguna', 'Balikpapan'),
(33, 'Warung Nasi', 'Semarang'),
(34, 'Pusat Pelayanan Kesehatan', 'Malang'),
(35, 'Toko Mebel', 'Jakarta'),
(36, 'Butik Eksklusif', 'Bandung'),
(37, 'Kafe Roti Bakar', 'Surabaya'),
(38, 'Toko Perhiasan', 'Medan'),
(39, 'Restoran Internasional', 'Yogyakarta'),
(40, 'Klinik Mata', 'Bali'),
(41, 'Toko Gadget', 'Makassar'),
(42, 'Pasar Swalayan', 'Balikpapan'),
(43, 'Warung Kopi', 'Semarang'),
(44, 'Pusat Layanan Kesehatan', 'Malang'),
(45, 'Toko Serba Maju', 'Jakarta'),
(46, 'Bengkel Motor', 'Bandung'),
(47, 'Galeri Seni Rupa', 'Surabaya'),
(49, 'Restoran Cepat Saji', 'Yogyakarta'),
(50, 'Apotek Keluarga', 'Bali'),
(51, 'Toko Perlengkapan Bayi', 'Makassar'),
(52, 'Warung Seafood', 'Balikpapan'),
(53, 'Pusat Grosir', 'Semarang'),
(54, 'Klinik Umum', 'Malang'),
(55, 'Toko Kosmetik', 'Jakarta'),
(56, 'Pasar Malam', 'Bandung'),
(57, 'Kafe Modern', 'Surabaya'),
(58, 'Butik Vintage', 'Medan'),
(59, 'Restoran Tradisional', 'Yogyakarta'),
(60, 'Klinik Hewan', 'Bali'),
(61, 'Toko Elektronik', 'Makassar'),
(62, 'Warung Bakso', 'Balikpapan'),
(63, 'Pusat Layanan Pelanggan', 'Semarang'),
(64, 'Toko Pakaian', 'Malang'),
(69, 'Jakarta Book Store', 'Jakarta'),
(70, 'Surabaya Store', 'Surabaya'),
(71, 'Buku Sejahtera', 'Jakarta');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `Id` int(11) NOT NULL,
  `Name_User` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Id`, `Name_User`, `Email`, `Username`, `Password`) VALUES
(1, 'Aditya', 'aditya@mail.com', 'aditya', 'aditya');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_Books_Genres` (`GenreId`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `username` (`Username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `FK_Books_Genres` FOREIGN KEY (`GenreId`) REFERENCES `genres` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
