/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for stream
CREATE DATABASE IF NOT EXISTS `stream` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `stream`;

-- Dumping structure for table stream.interaction
CREATE TABLE IF NOT EXISTS `interaction` (
  `videoid` varchar(10) NOT NULL,
  `user` varchar(50) DEFAULT NULL,
  `likes` int(32) DEFAULT NULL,
  `comment` text CHARACTER SET utf8 DEFAULT NULL,
  `type` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table stream.live
CREATE TABLE IF NOT EXISTS `live` (
  `videoid` varchar(50) NOT NULL,
  `streamkey` varchar(255) NOT NULL,
  KEY `videoid` (`videoid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table stream.metadata
CREATE TABLE IF NOT EXISTS `metadata` (
  `videoid` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `privacy` int(1) NOT NULL DEFAULT 0,
  `processing` bit(1) NOT NULL DEFAULT b'1',
  `owner` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `live` int(1) unsigned NOT NULL DEFAULT 0,
  `views` int(11) unsigned NOT NULL DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  KEY `videoid` (`videoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table stream.users
CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(50) NOT NULL,
  `password` binary(60) NOT NULL DEFAULT '0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `role` int(1) NOT NULL DEFAULT 0,
  `email` varchar(256) DEFAULT NULL,
  `otp` varchar(50) DEFAULT NULL,
  `locked` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table stream.video
CREATE TABLE IF NOT EXISTS `video` (
  `videoid` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filepath` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` int(2) DEFAULT NULL,
  `m3u8` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `videoid` (`videoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;


