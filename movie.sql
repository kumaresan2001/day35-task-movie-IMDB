

DROP TABLE IF EXISTS `movie`;

CREATE TABLE `movie` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Moviename` varchar(255) DEFAULT NULL,
  `Language` varchar(255) DEFAULT NULL,
  `Hero` int DEFAULT NULL,
  `Villan` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Hero` (`Hero`),
  KEY `Villan` (`Villan`),
  CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`Hero`) REFERENCES `artist` (`Id`),
  CONSTRAINT `movie_ibfk_2` FOREIGN KEY (`Villan`) REFERENCES `artist` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


LOCK TABLES `movie` WRITE;

INSERT INTO `movie` VALUES (1,'PonniyinSelvan','Tamil',1,6),(2,'Vikram','Tamil',2,3),(3,'Cobra','Tamil',1,1),(4,'Thiruchitrambalam','Tamil',4,6),(5,'Beast','Tamil',5,7);

UNLOCK TABLES;
============================================================================

DROP TABLE IF EXISTS `artist`;

CREATE TABLE `artist` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Experience` varchar(255) DEFAULT NULL,
  `AverageSalary` varchar(255) DEFAULT NULL,
  `ContactNumber` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `artist` WRITE;
INSERT INTO `artist` VALUES (1,'Vikram','20yrs','50L','9786543452'),(2,'KamalHassan','50yrs','90L','5678432299'),(3,'VJS','20yrs','40L','9765439082'),(4,'Dhanush','30yrs','45L','9544789782'),(5,'Vijay','60yrs','60L','9786546792'),(6,'PrakashRaj','50yrs','50L','9675745452'),(7,'Shine Tom Chacko','10yrs','30L','9656378896');

UNLOCK TABLES;
=======================================================================================
DROP TABLE IF EXISTS `artistskills`;

CREATE TABLE `artistskills` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ArtistId` int DEFAULT NULL,
  `SkillsId` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ArtistId` (`ArtistId`),
  KEY `SkillsId` (`SkillsId`),
  CONSTRAINT `artistskills_ibfk_1` FOREIGN KEY (`ArtistId`) REFERENCES `artist` (`Id`),
  CONSTRAINT `artistskills_ibfk_2` FOREIGN KEY (`SkillsId`) REFERENCES `skills` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `artistskills` WRITE;

INSERT INTO `artistskills` VALUES (1,1,1),(2,1,2),(3,2,2),(4,2,3),(5,2,4),(6,3,2),(7,3,5),(8,4,1),(9,4,2),(10,4,5),(11,5,1),(12,5,2),(13,5,5),(14,6,2),(15,6,5);

UNLOCK TABLES;
===============================================================================================================================
DROP TABLE IF EXISTS `genre`;

CREATE TABLE `genre` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


LOCK TABLES `genre` WRITE;

INSERT INTO `genre` VALUES (1,'Action'),(2,'Comedy'),(3,'Love'),(4,'Peroid');/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;
================================================================================
DROP TABLE IF EXISTS `media`;

CREATE TABLE `media` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `Size` varchar(255) DEFAULT NULL,
  `MovieId` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `MovieId` (`MovieId`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`MovieId`) REFERENCES `movie` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `media` WRITE;
INSERT INTO `media` VALUES (1,'Video1','Video','50MB',1),(2,'Image1','Image','0.1MB',1),(3,'Video2','Video','100MB',2),(4,'Image2','Image','0.5MB',2),(5,'Video3','Video','250MB',3),(6,'Image3','Image','1MB',3),(7,'Video4','Video','55MB',4),(8,'Image4','Image','0.2MB',4),(9,'Video5','Video','65MB',5),(10,'Image5','Image','0.9MB',5);
UNLOCK TABLES;
===========================================================================

DROP TABLE IF EXISTS `moviegenre`;

CREATE TABLE `moviegenre` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `MovieId` int DEFAULT NULL,
  `GenreId` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `MovieId` (`MovieId`),
  KEY `GenreId` (`GenreId`),
  CONSTRAINT `moviegenre_ibfk_1` FOREIGN KEY (`MovieId`) REFERENCES `movie` (`Id`),
  CONSTRAINT `moviegenre_ibfk_2` FOREIGN KEY (`GenreId`) REFERENCES `genre` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `moviegenre` WRITE;
INSERT INTO `moviegenre` VALUES (1,1,1),(2,1,4),(3,2,1),(4,3,1),(5,4,2),(6,4,3),(7,5,1),(8,5,2);

UNLOCK TABLES;
====================================================
DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Point` int DEFAULT NULL,
  `MovieId` int DEFAULT NULL,
  `UserId` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `MovieId` (`MovieId`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`MovieId`) REFERENCES `movie` (`Id`),
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


LOCK TABLES `review` WRITE;

INSERT INTO `review` VALUES (1,5,1,1),(2,5,1,2),(3,4,2,3),(4,3,3,4),(5,4,4,4),(6,3,5,5);

UNLOCK TABLES;
==================================================================================================

DROP TABLE IF EXISTS `skills`;
/
CREATE TABLE `skills` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


LOCK TABLES `skills` WRITE;

INSERT INTO `skills` VALUES (1,'Dancer'),(2,'Fighter'),(3,'Director'),(4,'Politician'),(5,'Comedian');

UNLOCK TABLES;

=======================================================================================

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



LOCK TABLES `user` WRITE;

INSERT INTO `user` VALUES (1,'AAA',23),(2,'BBB',34),(3,'CCC',45),(4,'DDD',21),(5,'EEE',44);

UNLOCK TABLES;





