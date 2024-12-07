-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2024 at 11:52 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movieprojectdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `castandcrew`
--

CREATE TABLE `castandcrew` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `tmdbId` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `overview` text NOT NULL,
  `popularity` float NOT NULL,
  `releaseDate` date NOT NULL,
  `voteAverage` float NOT NULL,
  `backdropPath` varchar(255) NOT NULL,
  `posterPath` varchar(255) NOT NULL,
  `isFeatured` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `dateUpdated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `userId`, `tmdbId`, `title`, `overview`, `popularity`, `releaseDate`, `voteAverage`, `backdropPath`, `posterPath`, `isFeatured`, `dateCreated`, `dateUpdated`) VALUES
(1, 0, 301528, 'Toy Story 4', 'Woody has always been confident about his place in the world and that his priority is taking care of his kid, whether that\'s Andy or Bonnie. But when Bonnie adds a reluctant new toy called \"Forky\" to her room, a road trip adventure alongside old and new friends will show Woody how big the world can be for a toy.', 63.151, '2019-06-19', 7.487, 'https://image.tmdb.org/t/p/original//q62bpQ67qaXY0u6b2wFEnQYIbPd.jpg', 'https://image.tmdb.org/t/p/original//w9kR8qbmQ01HwnvK4alvnQ2ca0L.jpg', 0, '2024-12-02 16:51:56', '2024-12-02 17:02:51'),
(2, 0, 330457, 'Frozen II', 'Elsa, Anna, Kristoff and Olaf head far into the forest to learn the truth about an ancient mystery of their kingdom.', 110.919, '2019-11-20', 7.3, 'https://image.tmdb.org/t/p/original//ou1mmzUkFEgGp6b2ghMpW8FlHG4.jpg', 'https://image.tmdb.org/t/p/original//mINJaa34MtknCYl5AjtNJzWj8cD.jpg', 0, '2024-12-02 16:55:48', '2024-12-02 17:03:01'),
(3, 0, 976573, 'Elemental', 'In a city where fire, water, land and air residents live together, a fiery young woman and a go-with-the-flow guy will discover something elemental: how much they have in common.', 151.699, '2023-06-14', 7.627, 'https://image.tmdb.org/t/p/original//5luaIi1lLzLfgl8oywifeUtPN6W.jpg', 'https://image.tmdb.org/t/p/original//4Y1WNkd88JXmGfhtWR7dmDAo1T2.jpg', 0, '2024-12-02 16:58:23', '2024-12-02 17:03:17'),
(4, 0, 585511, 'Luck', 'Suddenly finding herself in the never-before-seen Land of Luck, the unluckiest person in the world must unite with the magical creatures there to turn her luck around.', 77.67, '2022-08-05', 7.771, 'https://image.tmdb.org/t/p/original//sKvQUSyqsFq8e1ts6oo3Xp3dPH2.jpg', 'https://image.tmdb.org/t/p/original//1HOYvwGFioUFL58UVvDRG6beEDm.jpg', 0, '2024-12-02 16:59:38', '2024-12-02 17:03:25'),
(5, 0, 508442, 'Soul', 'Joe Gardner is a middle school teacher with a love for jazz music. After a successful audition at the Half Note Club, he suddenly gets into an accident that separates his soul from his body and is transported to the You Seminar, a center in which souls develop and gain passions before being transported to a newborn child. Joe must enlist help from the other souls-in-training, like 22, a soul who has spent eons in the You Seminar, in order to get back to Earth.', 68.961, '2020-12-25', 8.123, 'https://image.tmdb.org/t/p/original//rQaHA74pevnGsxcKGaoZVGWe9TC.jpg', 'https://image.tmdb.org/t/p/original//hm58Jw4Lw8OIeECIq5qyPYhAeRJ.jpg', 0, '2024-12-02 16:59:54', '2024-12-02 17:03:35'),
(6, 0, 354912, 'Coco', 'Despite his family’s baffling generations-old ban on music, Miguel dreams of becoming an accomplished musician like his idol, Ernesto de la Cruz. Desperate to prove his talent, Miguel finds himself in the stunning and colorful Land of the Dead following a mysterious chain of events. Along the way, he meets charming trickster Hector, and together, they set off on an extraordinary journey to unlock the real story behind Miguel\'s family history.', 160.505, '2017-10-27', 8.209, 'https://image.tmdb.org/t/p/original//askg3SMvhqEl4OL52YuvdtY40Yb.jpg', 'https://image.tmdb.org/t/p/original//gGEsBPAijhVUFoiNpgZXqRVWJt2.jpg', 0, '2024-12-02 17:00:21', '2024-12-02 17:03:43'),
(7, 0, 629542, 'The Bad Guys', 'When the Bad Guys, a crew of criminal animals, are finally caught after years of heists and being the world’s most-wanted villains, Mr. Wolf brokers a deal to save them all from prison.', 88.811, '2022-03-17', 7.6, 'https://image.tmdb.org/t/p/original//9IDJpHROaC0S1ZlIxrvzOcOX5yC.jpg', 'https://image.tmdb.org/t/p/original//7qop80YfuO0BwJa1uXk1DXUUEwv.jpg', 0, '2024-12-02 17:01:19', '2024-12-02 17:03:50'),
(8, 0, 508943, 'Luca', 'Luca and his best friend Alberto experience an unforgettable summer on the Italian Riviera. But all the fun is threatened by a deeply-held secret: they are sea monsters from another world just below the water’s surface.', 81.248, '2021-06-17', 7.8, 'https://image.tmdb.org/t/p/original//620hnMVLu6RSZW6a5rwO8gqpt0t.jpg', 'https://image.tmdb.org/t/p/original//9x4i9uKGXt8IiiIF5Ey0DIoY738.jpg', 0, '2024-12-02 17:01:43', '2024-12-02 17:03:56'),
(9, 0, 364689, 'Ferdinand', 'Ferdinand, a little bull, prefers sitting quietly under a cork tree just smelling the flowers versus jumping around, snorting, and butting heads with other bulls. As Ferdinand grows big and strong, his temperament remains mellow, but one day five men come to choose the \"biggest, fastest, roughest bull\" for the bullfights in Madrid and Ferdinand is mistakenly chosen.  Based on the classic 1936 children\'s book by Munro Leaf.', 75.474, '2017-12-09', 7.21, 'https://image.tmdb.org/t/p/original//sTOhZruocNubL0HxjvdouwCEL9I.jpg', 'https://image.tmdb.org/t/p/original//rMm94JsRfcOPiPVsTRcBiiVBOhz.jpg', 0, '2024-12-02 17:04:35', '2024-12-02 17:05:26'),
(10, 0, 529203, 'The Croods: A New Age', 'Searching for a safer habitat, the prehistoric Crood family discovers an idyllic, walled-in paradise that meets all of its needs. Unfortunately, they must also learn to live with the Bettermans -- a family that\'s a couple of steps above the Croods on the evolutionary ladder. As tensions between the new neighbors start to rise, a new threat soon propels both clans on an epic adventure that forces them to embrace their differences, draw strength from one another, and survive together.', 71.713, '2020-11-25', 7.48, 'https://image.tmdb.org/t/p/original//ytTQoYkdpsgtfDWrNFCei8Mfbxu.jpg', 'https://image.tmdb.org/t/p/original//tbVZ3Sq88dZaCANlUcewQuHQOaE.jpg', 0, '2024-12-02 17:04:59', '2024-12-02 17:05:35');

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `movieId` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `dateUpdated` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`id`, `userId`, `movieId`, `url`, `description`, `dateCreated`, `dateUpdated`) VALUES
(1, 0, 2, 'https://image.tmdb.org/t/p/original/rMm94JsRfcOPiPVsTRcBiiVBOhz.jpg', 'Ferdinand ', '2024-12-06 15:45:11', NULL),
(2, 0, 2, 'https://image.tmdb.org/t/p/original/1HOYvwGFioUFL58UVvDRG6beEDm.jpg', 'Sam Greenfield', '2024-12-06 15:47:54', NULL),
(3, 0, 2, 'https://image.tmdb.org/t/p/original/gGEsBPAijhVUFoiNpgZXqRVWJt2.jpg', 'Disney/Pixar animated movie', '2024-12-06 15:48:49', NULL),
(5, 0, 2, 'https://image.tmdb.org/t/p/original/4Y1WNkd88JXmGfhtWR7dmDAo1T2.jpg', ' comedy-drama', '2024-12-06 15:51:04', NULL),
(6, 0, 2, 'https://image.tmdb.org/t/p/original/mINJaa34MtknCYl5AjtNJzWj8cD.jpg', 'Frozen II is a sequel to the popular animated film Frozen. In this movie, Anna, Elsa, Kristoff, Olaf, and Sven leave Arendelle to travel to an ancient, autumn-bound forest of an enchanted land. Their mission is to find the origin of Elsa\'s powers in order to save their kingdom', '2024-12-06 15:52:28', NULL),
(7, 0, 2, 'https://image.tmdb.org/t/p/original/9x4i9uKGXt8IiiIF5Ey0DIoY738.jpg', ' animated ', '2024-12-06 15:54:08', NULL),
(8, 0, 2, 'https://image.tmdb.org/t/p/original/w9kR8qbmQ01HwnvK4alvnQ2ca0L.jpg', 'Toy Story 4', '2024-12-06 15:55:11', NULL),
(9, 0, 2, 'https://image.tmdb.org/t/p/original/7qop80YfuO0BwJa1uXk1DXUUEwv.jpg', 'pickpocket Mr. Wolf leads the Bad Guys, an infamous gang of criminal', '2024-12-06 15:56:47', NULL),
(10, 0, 2, 'https://image.tmdb.org/t/p/original/tbVZ3Sq88dZaCANlUcewQuHQOaE.jpg', ' 2020 animated film set in prehistoric times that explores the feudalism in the Croods community through two different families.', '2024-12-06 15:57:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstName` varchar(128) NOT NULL,
  `middleName` varchar(128) NOT NULL,
  `lastName` varchar(128) NOT NULL,
  `contactNo` varchar(15) NOT NULL,
  `role` enum('admin','user') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `firstName`, `middleName`, `lastName`, `contactNo`, `role`) VALUES
(0, 'tristancasili18@gmail.con', '827ccb0eea8a706c4c34a16891f84e7b', 'Tristan James', 'Fernandez', 'Casili', '098716254435', 'admin'),
(0, 'john@example.com', '482c811da5d5b4bc6d497ffa98491e38', 'John', 'Taran', 'Doe', '097363878276', 'admin'),
(0, 'tristancasili18@gmail.con', '827ccb0eea8a706c4c34a16891f84e7b', 'Tristan James', 'Fernandez', 'Casili', '98716254435', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` text NOT NULL,
  `movie_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `castandcrew`
--
ALTER TABLE `castandcrew`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `castandcrew`
--
ALTER TABLE `castandcrew`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `videos_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
