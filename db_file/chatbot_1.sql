-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 05, 2023 at 06:19 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chatbot_1`
--

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `id` int(11) NOT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`id`, `answer`, `category`) VALUES
(1, 'Hi there! How can I help you today?', 'Greetings'),
(2, 'Hello! How can I assist you?', 'Greetings'),
(3, 'Good morning! What can I do for you?', 'Greetings'),
(4, 'I\'m sorry, I cannot provide real-time weather information. You can check a weather website or app for the latest updates.', 'Weather'),
(5, 'I don\'t have access to real-time weather data. You can check a reliable weather forecast source for that information.', 'Weather'),
(6, 'I\'m unable to provide real-time temperature updates. You can check a weather app for the current temperature.', 'Weather'),
(7, 'I\'m just a chatbot, so I don\'t have a name. You can call me MyBot.', 'General'),
(8, 'Why did the scarecrow win an award? Because he was outstanding in his field!', 'General'),
(9, 'The Los Angeles Dodgers won the World Series in 2020.', 'General'),
(10, 'Artificial intelligence (AI) is the simulation of human intelligence processes by machines, typically computer systems.', 'Technology'),
(11, 'Self-driving cars use sensors, cameras, and machine learning algorithms to navigate and make driving decisions without human intervention.', 'Technology'),
(12, 'Blockchain is a distributed ledger technology that underlies cryptocurrencies like Bitcoin. It records transactions in a secure and transparent way.', 'Technology'),
(13, 'Popular tourist destinations in Paris include the Eiffel Tower, Louvre Museum, Notre-Dame Cathedral, and Montmartre.', 'Travel'),
(14, 'You can book a flight online through various travel websites and airline booking platforms. Just search for your desired route, choose your flights, and follow the booking process.', 'Travel'),
(15, 'The best time to visit Thailand is typically during the cool and dry season, which is from November to February.', 'Travel'),
(16, 'To make a classic margarita, mix 2 oz of tequila, 1 oz of triple sec, and 1 oz of fresh lime juice. Shake with ice and strain into a salt-rimmed glass.', 'Food'),
(17, 'A vegetarian lasagna typically includes layers of pasta, tomato sauce, ricotta cheese, mozzarella, and vegetables like spinach and zucchini. Bake until bubbly.', 'Food'),
(18, 'Famous Italian dishes include pasta (e.g., spaghetti, lasagna), pizza, risotto, and dishes like osso buco and tiramisu for dessert.', 'Food'),
(19, 'The theory of relativity, developed by Albert Einstein, includes both special relativity (1905) and general relativity (1915). It describes the relationship between space, time, and gravity.', 'Science'),
(20, 'DNA (deoxyribonucleic acid) is a molecule that contains genetic instructions for the development, functioning, and reproduction of all living things.', 'Science'),
(21, 'The greenhouse effect is a natural process where certain gases in the Earth\'s atmosphere trap heat from the sun, leading to a rise in temperature on the planet.', 'Science');

-- --------------------------------------------------------

--
-- Table structure for table `ask`
--

CREATE TABLE `ask` (
  `id` int(11) NOT NULL,
  `ask` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ask`
--

INSERT INTO `ask` (`id`, `ask`, `category`) VALUES
(1, 'Hello', 'Greetings'),
(2, 'Hi', 'Greetings'),
(3, 'Good morning', 'Greetings'),
(4, 'What\'s the weather like today?', 'Weather'),
(5, 'Is it going to rain tomorrow?', 'Weather'),
(6, 'How hot is it outside right now?', 'Weather'),
(7, 'What\'s your name?', 'General'),
(8, 'Tell me a joke', 'General'),
(9, 'Who won the World Series in 2020?', 'General'),
(10, 'What is artificial intelligence?', 'Technology'),
(11, 'How do self-driving cars work?', 'Technology'),
(12, 'What is blockchain technology?', 'Technology'),
(13, 'What are some popular tourist destinations in Paris?', 'Travel'),
(14, 'How do I book a flight online?', 'Travel'),
(15, 'What\'s the best time to visit Thailand?', 'Travel'),
(16, 'How do you make a classic margarita?', 'Food'),
(17, 'What\'s the recipe for a vegetarian lasagna?', 'Food'),
(18, 'What are some famous Italian dishes?', 'Food'),
(19, 'Explain the theory of relativity.', 'Science'),
(20, 'What is DNA and its role in genetics?', 'Science'),
(21, 'What is the greenhouse effect?', 'Science');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ask`
--
ALTER TABLE `ask`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answer`
--
ALTER TABLE `answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `ask`
--
ALTER TABLE `ask`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
