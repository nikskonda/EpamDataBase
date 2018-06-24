CREATE DATABASE  IF NOT EXISTS `library` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `library`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adresses`
--

DROP TABLE IF EXISTS `adresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adresses` (
  `address_id` smallint(5) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT 'Суррогатный ключ.',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Адрес. (улица/проспект, дом, квартира)',
  `postcode` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Почтовый индекс.',
  `city_id` smallint(5) unsigned zerofill NOT NULL COMMENT 'Внешний ключ на город.',
  PRIMARY KEY (`address_id`),
  UNIQUE KEY `address_id_UNIQUE` (`address_id`),
  KEY `fk_adresses_cities1_idx` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Адреса пользователей.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresses`
--

LOCK TABLES `adresses` WRITE;
/*!40000 ALTER TABLE `adresses` DISABLE KEYS */;
INSERT INTO `adresses` VALUES (00001,'ул.Елецкая, 36, кв.28','115583',00001),(00002,'ул.1-я Рейсовая, 26, кв.43','103027',00002),(00003,'ул.7-я Текстильщиков, 27, кв.23','109263',00003),(00004,'ул.2-я Бауманская, 69, кв.18','107005',00004),(00005,'ул.3-я Сокольническая, 78, кв.49','107014',00005),(00006,'ул.6-я Кожуховская, 87, кв.81','109193',00006),(00007,'ул.Манежная, 91, кв.23','121019',00007),(00008,'ул.Городянка, 61, кв.31','115408',00008);
/*!40000 ALTER TABLE `adresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authors` (
  `author_id` smallint(5) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT 'Суррогатный ключ автора.',
  `first_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Имя автора',
  `last_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Фамилия автора.',
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='Авторы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (00001,'Cody','Gaines'),(00002,'Joseph','Ross'),(00003,'Peter','Charles'),(00004,'Robert','Hood'),(00005,'Vincent','Gibson'),(00006,'Egbert','Henderson'),(00007,'Emily','Cole'),(00008,'Jody','Norris'),(00009,'Lucy','Bridges'),(00010,'Melina','Flynn'),(00011,'Veronica','James'),(00012,'Penelope','Newman');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookmarks`
--

DROP TABLE IF EXISTS `bookmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookmarks` (
  `user_id` smallint(5) unsigned zerofill NOT NULL COMMENT 'Внешний ключ на пользователя.',
  `book_id` smallint(5) unsigned zerofill NOT NULL COMMENT 'Внешний ключ на книгу',
  `page_number` smallint(5) unsigned zerofill NOT NULL COMMENT 'Номер страницы, на которой сделанна закладка.',
  PRIMARY KEY (`user_id`,`book_id`),
  KEY `fk_users_has_books_books1_idx` (`book_id`),
  KEY `fk_users_has_books_users1_idx` (`user_id`),
  CONSTRAINT `fk_users_has_books_books1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  CONSTRAINT `fk_users_has_books_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Закладки в книгах.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmarks`
--

LOCK TABLES `bookmarks` WRITE;
/*!40000 ALTER TABLE `bookmarks` DISABLE KEYS */;
INSERT INTO `bookmarks` VALUES (00001,00017,00034),(00003,00021,00035),(00003,00023,00079),(00003,00025,00037),(00004,00020,00063),(00005,00020,10000),(00006,00021,02000),(00007,00025,00623);
/*!40000 ALTER TABLE `bookmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `book_id` smallint(5) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT 'Суррогатный ключ',
  `def_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Название книги по умолчанию (на английском)',
  `def_description` text COMMENT 'Описание книги по умолчанию  (на английском)',
  `publish_year` year(4) DEFAULT NULL COMMENT 'Год издания книги.',
  `price` decimal(5,2) NOT NULL COMMENT 'Стоимость книги.',
  `pages` smallint(5) unsigned zerofill DEFAULT NULL COMMENT 'Количество страниц книги.',
  `publishing_house_id` smallint(5) unsigned zerofill NOT NULL COMMENT 'Внешний ключ на издательский дом.',
  `def_pdf_file_url` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Ссылка на pdf файл по умолчанию (на английском)',
  `cover_url` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Ссылка на обожку книги.',
  PRIMARY KEY (`book_id`),
  KEY `fk_books_publishing_houses1_idx` (`publishing_house_id`),
  CONSTRAINT `fk_books_publishing_houses1` FOREIGN KEY (`publishing_house_id`) REFERENCES `publishing_houses` (`publishing_house_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='Книги.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (00017,'The Collector','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed in tincidunt justo, at eleifend orci. Etiam mauris turpis, interdum sit amet mi at, fermentum consectetur nisl. Curabitur sapien magna, sagittis nec risus ut, efficitur imperdiet nisl. Phasellus nec tortor quis enim commodo dictum. Vivamus convallis maximus laoreet. Ut a molestie ipsum. Maecenas consectetur metus felis, sed faucibus neque auctor ac. Aenean sed lacinia ipsum, vitae vulputate enim. Aenean eget tellus arcu. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin gravida vestibulum turpis, eu ullamcorper odio.',2015,20.58,00544,00002,'qwe','images/books/book-1.jpg'),(00018,'The Hound of the Baskervilles. ','Donec in facilisis orci. Nam porta nisl risus, et fermentum arcu egestas eget. Maecenas libero lacus, rhoncus quis tincidunt lobortis, ornare interdum leo. Suspendisse tincidunt tellus nulla, ac auctor tortor ultrices at. Quisque luctus, augue a hendrerit vehicula, ligula nibh iaculis nibh, pellentesque bibendum risus arcu non magna. Sed eu mauris at justo semper malesuada at et libero. Fusce eleifend, tellus vel fringilla tempor, nibh lectus tempor massa, quis tempus nunc odio eu libero. Mauris sodales lorem eget bibendum tempor. Nulla ac interdum arcu. Fusce egestas a urna a pretium. Nullam at tincidunt nisl. Donec posuere posuere felis id scelerisque. In hac habitasse platea dictumst. Mauris eu neque et nulla varius sagittis in sit amet nulla. Nunc at lectus ut libero facilisis facilisis.',2016,6.77,00160,00003,'qwe','images/books/book-2.jpg'),(00019,'A Scandal in Bohemia and Othe','Morbi euismod vel ipsum sed pharetra. Etiam nec finibus justo. Vivamus ut velit eros. Duis augue turpis, feugiat vel venenatis a, euismod vel ligula. Praesent sed vestibulum arcu, eu imperdiet ex. Nam euismod ligula auctor, interdum massa et, hendrerit nulla. Sed et felis vel ligula faucibus maximus. Etiam sed auctor turpis. In in eleifend felis, in lobortis nibh.',2016,16.01,00320,00004,'qwe','images/books/book-3.jpg'),(00020,'The Adventure of the Dancing Men.','Aliquam eu hendrerit ipsum. Donec tempor faucibus nulla sed aliquam. Vestibulum malesuada leo eu libero rhoncus, viverra viverra justo varius. Fusce eget urna felis. Maecenas in placerat enim. Aliquam aliquam, nulla id volutpat luctus, dui nibh molestie urna, eu imperdiet mauris urna eu elit. Curabitur suscipit quam bibendum lacus ultrices, tincidunt semper elit accumsan. Vivamus tempor dapibus metus, tincidunt accumsan arcu hendrerit et. Proin quis elit lacus. In ornare rutrum neque. Etiam pharetra tortor in est tincidunt, tincidunt fermentum massa faucibus. Aenean rutrum semper diam ac vestibulum.',2016,6.57,00128,00005,'qwe','images/books/book-4.jpg'),(00021,'Ten Little Niggers','Vivamus et magna quis massa suscipit lacinia sit amet sed turpis. Proin fermentum vestibulum massa sed efficitur. Sed ultricies neque mauris, a faucibus nibh auctor non. Morbi ultrices ultricies elit eu fermentum. Nullam non risus aliquet, tempor nisi vitae, vestibulum risus. Nam eu dui magna. Duis accumsan quis turpis sit amet consectetur.',2010,10.00,00340,00006,'qwe','images/books/book-5.jpg'),(00022,'The Adventures of Sherlock Holmes','Fusce scelerisque magna non ligula eleifend consequat. Donec interdum felis ac nisl sodales rutrum. Proin nec mollis neque. Morbi vel pulvinar dui, fermentum lobortis tortor. Mauris ipsum leo, placerat nec laoreet a, auctor sagittis nisl. Mauris vel facilisis risus, sit amet finibus leo. Praesent mattis auctor posuere. Fusce non fermentum tellus. Maecenas pellentesque erat vitae eros aliquam, eu aliquet justo blandit. Donec volutpat nec augue non elementum. Duis suscipit congue enim. Integer quis libero gravida, congue enim id, maximus magna.',2008,23.43,00280,00007,'qwe','images/books/book-6.jpg'),(00023,'Evil under the Sun','Fusce porta convallis nulla vitae blandit. Mauris rutrum massa ac dapibus venenatis. Integer quis magna ut turpis commodo elementum. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec vel nisi mi. Duis ut dui diam. Vivamus hendrerit risus at nisi vehicula, id tristique enim tempus. Nam ut pretium mauris. Nam aliquam dignissim sapien a pulvinar.',2014,7.87,00190,00008,'qwe','images/books/book-7.jpg'),(00024,'The Murder of Roger Ackroyd','Nunc et porttitor eros. Aenean bibendum risus a ante bibendum, a ornare quam dictum. Aliquam euismod ante quis tortor placerat, ut suscipit eros interdum. Nunc quis ligula diam. Aenean ullamcorper metus sit amet nunc condimentum consectetur. Duis auctor sed nibh vulputate laoreet. Morbi id nisi vehicula, porta nulla id, pharetra quam. Quisque vulputate vehicula metus, et fringilla odio sodales vitae. Nullam volutpat eget purus venenatis accumsan. Praesent urna dui, ornare vel leo a, imperdiet placerat nisi. Mauris porta iaculis purus a interdum. Quisque non arcu quam. Quisque nunc nulla, ullamcorper eget mi sit amet, hendrerit congue lectus. Praesent tellus nulla, tincidunt eget massa quis, rutrum convallis diam. Nullam dictum egestas ipsum, eget dignissim sem pellentesque et.',2013,4.96,00453,00009,'qwe','images/books/book-8.jpg'),(00025,'The Night Manager','Phasellus sed urna vulputate metus fermentum fermentum. Duis eleifend vulputate ex, ac feugiat risus ullamcorper vitae. Fusce vitae magna in ipsum sagittis porttitor sed consectetur tellus. Praesent commodo, tellus eget scelerisque tincidunt, felis felis placerat tellus, at ornare mi nibh in neque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In quis rhoncus dui. Morbi posuere tincidunt massa.',2000,3.67,00623,00010,'qwe','images/books/book-9.jpg');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_has_authors`
--

DROP TABLE IF EXISTS `books_has_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books_has_authors` (
  `book_id` smallint(5) unsigned zerofill NOT NULL COMMENT 'Внешний ключ на книгу.',
  `author_id` smallint(5) unsigned zerofill NOT NULL COMMENT 'Внешний ключ на автора.',
  PRIMARY KEY (`book_id`,`author_id`),
  KEY `fk_books_has_authors_authors1_idx` (`author_id`),
  KEY `fk_books_has_authors_books1_idx` (`book_id`),
  CONSTRAINT `fk_books_has_authors_authors1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`),
  CONSTRAINT `fk_books_has_authors_books1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связь многие ко многим для книг и авторов.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_has_authors`
--

LOCK TABLES `books_has_authors` WRITE;
/*!40000 ALTER TABLE `books_has_authors` DISABLE KEYS */;
INSERT INTO `books_has_authors` VALUES (00017,00001),(00018,00002),(00019,00003),(00020,00004),(00021,00005),(00022,00006),(00023,00007),(00024,00008),(00025,00009),(00025,00010),(00024,00011),(00022,00012);
/*!40000 ALTER TABLE `books_has_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_has_genres`
--

DROP TABLE IF EXISTS `books_has_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books_has_genres` (
  `book_id` smallint(5) unsigned zerofill NOT NULL COMMENT 'Внешний ключ жанра\n',
  `genre_id` smallint(5) unsigned zerofill NOT NULL COMMENT 'Внешний ключ книги',
  PRIMARY KEY (`book_id`,`genre_id`),
  KEY `fk_books_has_genres_genres1_idx` (`genre_id`),
  KEY `fk_books_has_genres_books1_idx` (`book_id`),
  CONSTRAINT `fk_books_has_genres_books1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  CONSTRAINT `fk_books_has_genres_genres1` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связь многие ко многим для книг и жанров';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_has_genres`
--

LOCK TABLES `books_has_genres` WRITE;
/*!40000 ALTER TABLE `books_has_genres` DISABLE KEYS */;
INSERT INTO `books_has_genres` VALUES (00017,00001),(00017,00002),(00018,00003),(00019,00004),(00020,00005),(00020,00006),(00021,00007),(00022,00008),(00023,00009),(00024,00010),(00024,00011),(00025,00012);
/*!40000 ALTER TABLE `books_has_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `city_id` smallint(5) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT 'Суррогатный ключ.',
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Название города.',
  `country_id` smallint(5) unsigned zerofill NOT NULL COMMENT 'Внешний ключ к таблице стран.',
  PRIMARY KEY (`city_id`),
  KEY `fk_cities_countries1_idx` (`country_id`),
  CONSTRAINT `fk_cities_countries1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='Список городов.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (00001,'Минск',00001),(00002,'Могилёв',00001),(00003,'Витебск',00001),(00004,'Гомель',00001),(00005,'Брест',00001),(00006,'Гродно',00001),(00007,'Пинск',00001),(00008,'Москва',00002),(00009,'Санкт-Питербург',00002),(00010,'Сочи',00002),(00011,'Екатеринбург',00002),(00012,'Вологда',00002),(00013,'Київ',00003),(00014,'Харків',00003),(00015,'Одеса',00003),(00016,'Дніпро',00003),(00017,'Донецьк',00003),(00018,'Алматы',00004),(00019,'Астана',00004),(00020,'Байқоңыр',00004),(00021,'Ақтау',00004),(00022,'Қарағанды',00004);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `country_id` smallint(5) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT 'Суррогатный ключ.',
  `country` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Название страны.',
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Список стран.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (00001,'Беларусь'),(00002,'Россия'),(00003,'Україна'),(00004,'Қазақстан');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genres` (
  `genre_id` smallint(5) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT 'Суррогатный ключ жанра',
  `genre_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Жанр',
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='Жанры';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (00001,'History'),(00002,'Thriller'),(00003,'Romance'),(00004,'Satire'),(00005,'Horror'),(00006,'Religious'),(00007,'Health'),(00008,'Cook—books'),(00009,'Children’s books'),(00010,'Politics'),(00011,'Fantasy'),(00012,'Travel books');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `lang` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Внутренний ключ языка',
  `language_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Полное название языка',
  PRIMARY KEY (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Таблица языков.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES ('en','English'),('ru','Russian');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `news_id` smallint(5) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT 'Суррогатный ключ',
  `def_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Заголовок на английском.',
  `def_text` text NOT NULL COMMENT 'Новость(текст) на английском',
  `publish_date` datetime NOT NULL COMMENT 'Дата написания новости.',
  `user_id` smallint(5) unsigned zerofill NOT NULL COMMENT 'Внешний ключ на пользователя, написавшего новость.',
  `photo_url` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Указатель на фотографию к новости.',
  PRIMARY KEY (`news_id`),
  KEY `fk_news_users1_idx` (`user_id`),
  CONSTRAINT `fk_news_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='Новости библиотеки';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (00006,'Pellentesque dignissim nisl sit amet sagittis tincidunt.',' Vestibulum et tempor lorem, a viverra sapien. Mauris mattis fermentum odio rhoncus posuere. Sed vitae placerat dui. Aenean scelerisque, odio ut consectetur fermentum, nulla nisi rhoncus turpis, quis aliquet mauris dolor ac nisi. Quisque nibh ante, volutpat vitae enim eget, varius sollicitudin odio. Morbi lacinia eget velit in sodales. Cras ullamcorper nibh quam, porttitor placerat ex auctor ut.','2018-05-21 11:22:03',00001,'images/news/news-1.jpg'),(00007,'1Vestibulum ullamcorper orci sit amet nibh gravida, at consequat urna bibendum.',' Nam id elit varius, interdum massa id, interdum enim. Vestibulum placerat ullamcorper nisl eget vehicula. Proin in tempor enim, ac posuere quam. Sed aliquet euismod mollis. Maecenas aliquet auctor eros eu lobortis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc sit amet odio lacus. Proin dictum eros neque, non egestas felis faucibus vel.','2018-06-27 11:23:03',00001,'images/news/news-2.jpg'),(00008,'9Quisque sed dolor non ligula placerat vehicula ac in turpis.',' Praesent pulvinar vitae purus vitae aliquet. Vivamus id enim nulla. Curabitur eget accumsan mi. Praesent sodales dignissim neque, quis scelerisque mi congue et. Nam laoreet auctor ligula, et varius ante. Morbi lobortis consectetur lorem ut aliquam. Nunc ac eros augue. Fusce augue sapien, dignissim non turpis sed, sagittis tempus libero. Phasellus lacinia quis augue nec dignissim.','2018-04-21 11:22:53',00003,'images/news/news-3.jpg'),(00009,'16Quisque porta justo ut tortor venenatis elementum.',' Vivamus sem lectus, blandit id volutpat eget, commodo mollis ipsum. Duis tempus fermentum diam, elementum mollis lacus volutpat ut. Phasellus quis metus eget dui venenatis condimentum. Integer tempor nisi non velit tristique, non vehicula mi feugiat. Phasellus sapien massa, accumsan eu lorem ut, viverra vulputate mi. In eu lectus iaculis, fermentum mauris a, mattis odio. Nulla auctor nibh massa, ac eleifend ipsum feugiat a. Sed dictum congue magna. Nullam vitae dui dictum, consectetur nibh non, tempus magna. In sit amet mi tincidunt, auctor ipsum nec, auctor felis. Vivamus malesuada ligula eget porttitor volutpat. Cras quis odio in metus ultricies placerat id vitae risus. Nulla velit mauris, fringilla eu leo et, ultrices auctor libero. Curabitur non rhoncus nunc, eget viverra nibh.','2018-05-01 11:24:03',00001,'images/news/news-4.jpg'),(00010,'Pellentesque auctor elit ullamcorper ante tincidunt, eu imperdiet ipsum feugiat.',' Donec quam metus, elementum sit amet malesuada id, vehicula eu dui. Mauris lobortis sit amet sapien at euismod. Duis libero arcu, rutrum eu odio a, bibendum ornare purus. Sed et maximus arcu, vel lacinia nisi. Vestibulum metus diam, gravida vel ligula non, accumsan tristique tortor. Praesent tempor enim sed libero sagittis, sed vehicula ipsum commodo. Mauris rutrum interdum diam ac sollicitudin.','2018-06-21 12:22:03',00003,'images/news/news-5.jpg'),(00011,'14Integer imperdiet arcu ut magna viverra cursus.',' Aenean sit amet eleifend sem. Quisque id imperdiet lacus. Duis sed malesuada velit. Nullam porta nibh sed pretium congue. In hac habitasse platea dictumst. Sed nec vestibulum ligula. Suspendisse vitae sollicitudin enim. Etiam eu magna ac lectus tristique volutpat eu non mauris. Maecenas ultrices feugiat porta. Duis consectetur fermentum tellus vitae pulvinar.','2018-06-20 11:25:03',00001,'images/news/news-6.jpg'),(00012,'Donec non ligula sed mauris tincidunt ultrices.',' Suspendisse non magna et ex rutrum posuere. Fusce et risus vitae orci lacinia mollis. Integer posuere ligula orci, sed consectetur orci feugiat in. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse pulvinar arcu scelerisque, hendrerit turpis sit amet, sollicitudin libero. Morbi pellentesque mollis dapibus. Duis libero est, lobortis id sodales at, vestibulum a turpis. Ut vehicula ornare lectus. Duis at velit turpis. Cras at nulla sed ex hendrerit ornare non ut justo. Curabitur mollis neque sit amet leo tempus placerat. Mauris porta, metus vitae tristique efficitur, risus tellus hendrerit augue, eget tristique massa est nec tellus. Curabitur neque enim, condimentum at eros quis, ultricies varius nulla. Nulla tempus imperdiet nisi, vitae tincidunt massa imperdiet pharetra. Mauris hendrerit nisl nec dui lobortis pharetra. In ullamcorper, lorem eu blandit maximus, magna purus sagittis nunc, non tincidunt justo dui eget urna.','2018-06-21 11:20:03',00001,'images/news/news-7.jpg'),(00013,'13Integer hendrerit erat eget tortor accumsan hendrerit.',' Curabitur mollis est congue posuere sagittis. Cras nibh velit, consequat faucibus justo sit amet, maximus suscipit felis. Phasellus suscipit lacus mollis imperdiet venenatis. Donec sit amet mi quis lacus aliquam placerat. Vivamus rutrum et nunc hendrerit volutpat. Morbi rhoncus velit sit amet nisl sollicitudin, eget tincidunt mi vulputate. Duis at tincidunt ex. Phasellus sed dolor nulla. Integer tincidunt interdum tempor.','2018-05-21 11:12:03',00004,'images/news/news-8.jpg'),(00014,'2Aenean imperdiet dolor at risus tempus luctus.',' Duis mattis eget turpis ac molestie. Vestibulum id risus feugiat, tincidunt elit a, pulvinar massa. Nam gravida metus vitae arcu vulputate commodo. Mauris sit amet fermentum sem, id vulputate ligula. Fusce cursus, justo id congue semper, metus nibh scelerisque lacus, quis tempus dolor neque nec ex. Nam pretium sed nulla eget semper. Nulla viverra rhoncus erat, id ullamcorper est consequat ut. Proin tempor libero ut lectus sodales posuere. Nunc cursus risus ac turpis dapibus porta. Morbi hendrerit laoreet nibh, placerat blandit dui feugiat vitae. Sed congue nunc non leo pharetra commodo. Quisque maximus luctus mi quis condimentum. Donec ligula sem, condimentum maximus egestas nec, efficitur et augue.','2018-04-26 11:22:00',00001,'images/news/news-9.jpg'),(00015,'Vivamus in est id ante suscipit ultricies.',' Mauris ut ligula sed est porttitor elementum at sed ante. Sed et massa sodales, malesuada lorem eget, elementum nulla. Pellentesque tincidunt facilisis turpis. Nullam gravida, dolor eget dictum rutrum, sem libero auctor augue, eget sollicitudin purus dui quis enim. Donec dignissim tellus ut quam iaculis accumsan. Curabitur eget magna a magna pellentesque sollicitudin. Vestibulum maximus metus quis fringilla imperdiet. Donec porta libero eu odio rhoncus, a molestie felis lacinia. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis imperdiet fringilla ornare. Nam vitae urna diam. Pellentesque pellentesque, odio ac iaculis pharetra, turpis arcu sodales erat, nec sagittis lorem est sed magna. Sed aliquet arcu id ex ultrices eleifend. Maecenas ac urna orci.','2018-05-21 13:22:03',00001,'images/news/news-10.jpg'),(00016,'4Sed pretium ante ac enim consectetur vestibulum vel vel ipsum.',' Phasellus in nibh porta, vestibulum est in, tristique ante. Fusce in leo sit amet eros porta congue quis id arcu. Cras iaculis lorem mollis nisi luctus, et porttitor nibh convallis. Aenean placerat tristique consectetur. In eget efficitur eros. Nulla nec sagittis magna. Etiam nisi dolor, convallis nec nunc non, vehicula ullamcorper enim. Nunc tincidunt enim eget ante lacinia tempor. Cras a turpis finibus, accumsan risus quis, aliquam sapien. Praesent malesuada lacus risus, ut faucibus erat interdum vel. Quisque sed suscipit nibh, in pharetra massa. Vivamus varius dapibus mollis. Nulla nisl est, gravida ultrices rutrum eget, cursus ut ligula. Mauris mollis elit sit amet nulla luctus, vel tincidunt nibh vehicula. Nunc libero purus, rutrum eget aliquet id, ultricies sit amet lorem.','2018-06-22 14:00:03',00003,'images/news/news-11.jpg'),(00017,'11Cras et leo aliquet, condimentum lectus quis, molestie mi.',' Vestibulum mattis eros vitae fermentum cursus. Suspendisse vitae pharetra felis. Nam justo enim, mattis eu ipsum pellentesque, scelerisque vestibulum sapien. Nullam tincidunt justo sit amet pharetra ornare. Aliquam erat volutpat. Nunc blandit, turpis vel tincidunt bibendum, quam magna porta elit, sodales mattis sapien enim quis justo. Nulla velit justo, malesuada eget lectus at, mattis lacinia massa. Donec semper quam tempor sem scelerisque placerat. Etiam suscipit tempor sapien, in consectetur magna. Maecenas auctor at eros quis volutpat.','2018-06-21 11:22:03',00004,'images/news/news-12.jpg'),(00018,'3Donec in velit bibendum, efficitur tortor eu, mollis dolor.',' In gravida, libero vel bibendum interdum, dui tortor dapibus quam, quis placerat turpis lacus non odio. Maecenas dapibus commodo commodo. Aliquam nec metus turpis. Sed in turpis ac nisl tristique fermentum facilisis quis arcu. Pellentesque iaculis tempus velit ultrices imperdiet. Aenean sodales lorem ut mi sagittis, vitae finibus dui pretium. Phasellus maximus id sem non laoreet. Morbi magna elit, auctor vitae enim id, tempus pellentesque arcu. In consequat elit at lorem vehicula cursus. Phasellus faucibus consequat neque, sed faucibus elit venenatis a. Vestibulum a dolor ac lacus auctor malesuada.','2018-06-24 12:22:03',00001,'images/news/news-13.jpg'),(00019,'7Morbi id orci facilisis, accumsan turpis facilisis, tincidunt ex.',' Aenean commodo sapien nisi, id dapibus metus cursus et. Nulla ac massa dignissim, viverra sapien at, sollicitudin dolor. Cras tristique feugiat orci, in facilisis nibh rutrum in. In tincidunt pulvinar pretium. Mauris gravida enim at magna iaculis volutpat. Nam consequat enim sed ex egestas, sed dignissim nunc interdum. Proin consequat eget felis vel placerat. Morbi lobortis tellus vel mattis fringilla.','2018-05-21 13:22:03',00003,'images/news/news-14.jpg'),(00020,'Nam nec lacus et odio vulputate sagittis accumsan at lacus.',' Phasellus ac ex augue. Proin vel neque sit amet ligula ullamcorper tincidunt a quis ex. Nunc fermentum tellus massa, eget lobortis nunc rutrum ultrices. In sed nulla pellentesque, maximus neque placerat, bibendum ante. Aenean ac mauris sed tortor iaculis tempor ac eu tortor. In ac metus turpis. Etiam pharetra ultrices sodales.','2018-05-12 15:22:03',00001,'images/news/news-15.jpg'),(00021,'5Comes from a line in section','Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.','2018-06-21 15:17:31',00004,'images/news/news-16.jpg'),(00022,'My first News','Text for my first news','2018-05-21 19:28:06',00001,'news/news-10.jpg'),(00025,'condimentum lectus quis, molestie mi.',' Vestibulum et tempor lorem, a viverra sapien. Mauris mattis fermentum odio rhoncus posuere. Sed vitae placerat dui. Aenean scelerisque, odio ut consectetur fermentum, nulla nisi rhoncus turpis, quis aliquet mauris dolor ac nisi. Quisque nibh ante, volutpat vitae enim eget, varius sollicitudin odio. Morbi lacinia eget velit in sodales. Cras ullamcorper nibh quam, porttitor placerat ex auctor ut.','2018-06-23 13:51:38',00003,'images/news/news-3.jpg');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_statuses`
--

DROP TABLE IF EXISTS `order_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_statuses` (
  `order_status_id` smallint(5) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT 'Суррогатный ключ.',
  `status` varchar(45) NOT NULL COMMENT 'Статус.',
  PRIMARY KEY (`order_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Статусы заказов.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_statuses`
--

LOCK TABLES `order_statuses` WRITE;
/*!40000 ALTER TABLE `order_statuses` DISABLE KEYS */;
INSERT INTO `order_statuses` VALUES (00001,'New'),(00002,'Sent'),(00003,'Completed');
/*!40000 ALTER TABLE `order_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_id` smallint(5) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT 'Суррогатный ключ',
  `quantity` tinyint(4) NOT NULL COMMENT 'Количество книг',
  `book_id` smallint(5) unsigned zerofill NOT NULL COMMENT 'Внешний ключ на книгу',
  `user_id` smallint(5) unsigned zerofill NOT NULL COMMENT 'Внешний ключ на пользователя, сделавшего заказ.',
  `status_id` smallint(5) unsigned zerofill NOT NULL COMMENT 'Статус заказа',
  `order_date` datetime NOT NULL COMMENT 'Дата и время заказа.',
  PRIMARY KEY (`order_id`),
  KEY `fk_active_orders_order_statuses1_idx` (`status_id`),
  KEY `fk_active_orders_users1_idx` (`user_id`),
  KEY `fk_active_orders_books1_idx` (`book_id`),
  CONSTRAINT `fk_active_orders_books1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  CONSTRAINT `fk_active_orders_order_statuses1` FOREIGN KEY (`status_id`) REFERENCES `order_statuses` (`order_status_id`),
  CONSTRAINT `fk_active_orders_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Заказы.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (00001,1,00017,00001,00003,'2018-05-23 22:45:15'),(00002,1,00018,00003,00003,'2018-05-24 12:45:15'),(00003,1,00019,00004,00003,'2018-06-10 13:45:15'),(00004,2,00020,00005,00003,'2018-06-13 14:45:15'),(00005,1,00021,00006,00002,'2018-06-15 15:45:15'),(00006,2,00022,00007,00002,'2018-06-17 16:45:15'),(00007,3,00023,00003,00001,'2018-06-20 17:45:15'),(00008,1,00025,00007,00001,'2018-06-23 18:45:15');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishing_houses`
--

DROP TABLE IF EXISTS `publishing_houses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publishing_houses` (
  `publishing_house_id` smallint(5) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT 'Суррогатный ключ издательства.',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Издательство.',
  PRIMARY KEY (`publishing_house_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='Издательские дома';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishing_houses`
--

LOCK TABLES `publishing_houses` WRITE;
/*!40000 ALTER TABLE `publishing_houses` DISABLE KEYS */;
INSERT INTO `publishing_houses` VALUES (00001,'Эксмо'),(00002,'ABC_CLIO'),(00003,'Ace Books'),(00004,'Basic Books'),(00005,'CRC Press'),(00006,'Del Rey Books'),(00007,'Orbit Books'),(00008,'Tor Books'),(00009,'Viking Books'),(00010,'Feral House'),(00011,'Future plc');
/*!40000 ALTER TABLE `publishing_houses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `role_id` tinyint(3) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT 'Суррогатный ключ.',
  `role_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Название роли.',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Роли системы.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (001,'Administration'),(002,'Moderator'),(003,'User');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbooks`
--

DROP TABLE IF EXISTS `tbooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbooks` (
  `book_id` smallint(5) unsigned zerofill NOT NULL COMMENT 'Внешний ключ на книгу.',
  `lang` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Внешний ключ на используемый язык.',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Название на соответствующем языке.',
  `description` text COMMENT 'Описание на соответствующем языке.',
  `pdf_file_url` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Ссылка на pdf файл на соответствующем языке.',
  PRIMARY KEY (`book_id`,`lang`),
  KEY `fk_books_has_languages_languages1_idx` (`lang`),
  KEY `fk_books_has_languages_books1_idx` (`book_id`),
  CONSTRAINT `fk_books_has_languages_books1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  CONSTRAINT `fk_books_has_languages_languages1` FOREIGN KEY (`lang`) REFERENCES `languages` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Книги на разных языках.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbooks`
--

LOCK TABLES `tbooks` WRITE;
/*!40000 ALTER TABLE `tbooks` DISABLE KEYS */;
INSERT INTO `tbooks` VALUES (00017,'ru','Коллектор','Товарищи! дальнейшее развитие различных форм деятельности позволяет выполнять важные задания по разработке модели развития. Значимость этих проблем настолько очевидна, что консультация с широким активом требуют от нас анализа новых предложений. Таким образом дальнейшее развитие различных форм деятельности обеспечивает широкому кругу (специалистов) участие в формировании систем массового участия. Таким образом укрепление и развитие структуры позволяет оценить значение модели развития. Не следует, однако забывать, что рамки и место обучения кадров требуют от нас анализа новых предложений. Задача организации, в особенности же постоянный количественный рост и сфера нашей активности способствует подготовки и реализации модели развития.','qwe'),(00018,'ru','Дом на Бакервиль','Повседневная практика показывает, что консультация с широким активом требуют определения и уточнения позиций, занимаемых участниками в отношении поставленных задач. Значимость этих проблем настолько очевидна, что дальнейшее развитие различных форм деятельности позволяет выполнять важные задания по разработке соответствующий условий активизации.','qwe'),(00019,'ru','Скандал в Богемия','Идейные соображения высшего порядка, а также реализация намеченных плановых заданий играет важную роль в формировании направлений прогрессивного развития. С другой стороны укрепление и развитие структуры обеспечивает широкому кругу (специалистов) участие в формировании систем массового участия. Повседневная практика показывает, что постоянное информационно-пропагандистское обеспечение нашей деятельности требуют от нас анализа модели развития. Равным образом начало повседневной работы по формированию позиции позволяет оценить значение систем массового участия. Разнообразный и богатый опыт дальнейшее развитие различных форм деятельности способствует подготовки и реализации дальнейших направлений развития.','qwe'),(00020,'ru','Приключения танцующего мужчины','Повседневная практика показывает, что рамки и место обучения кадров требуют от нас анализа соответствующий условий активизации. Задача организации, в особенности же новая модель организационной деятельности требуют от нас анализа систем массового участия.','qwe'),(00021,'ru','10 маленьких негритят','Таким образом дальнейшее развитие различных форм деятельности обеспечивает широкому кругу (специалистов) участие в формировании систем массового участия. Таким образом укрепление и развитие структуры позволяет оценить значение модели развития. Не следует, однако забывать, что рамки и место обучения кадров требуют от нас анализа новых предложений. Задача организации, в особенности же постоянный количественный рост и сфера нашей активности способствует подготовки и реализации модели развития.','qwe');
/*!40000 ALTER TABLE `tbooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tnews`
--

DROP TABLE IF EXISTS `tnews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tnews` (
  `news_id` smallint(5) unsigned zerofill NOT NULL COMMENT 'Внешний ключ на оригинальную новость.',
  `lang` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Внешний ключ на язык',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Заголовок на соответствующем языке.',
  `text` text NOT NULL COMMENT 'Текст новости на соответствующем языке.',
  PRIMARY KEY (`news_id`,`lang`),
  KEY `fk_news_has_languages_languages1_idx` (`lang`),
  KEY `fk_news_has_languages_news1_idx` (`news_id`),
  CONSTRAINT `fk_news_has_languages_languages1` FOREIGN KEY (`lang`) REFERENCES `languages` (`lang`),
  CONSTRAINT `fk_news_has_languages_news1` FOREIGN KEY (`news_id`) REFERENCES `news` (`news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Новости на разных языках';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tnews`
--

LOCK TABLES `tnews` WRITE;
/*!40000 ALTER TABLE `tnews` DISABLE KEYS */;
INSERT INTO `tnews` VALUES (00006,'ru','Повседневная практика показывает, что начало повседневной работы по формированию',' Повседневная практика показывает, что начало повседневной работы по формированию позиции влечет за собой процесс внедрения и модернизации новых предложений. Таким образом укрепление и развитие структуры играет важную роль в формировании позиций, занимаемых участниками в отношении поставленных задач. Повседневная практика показывает, что реализация намеченных плановых заданий обеспечивает широкому кругу (специалистов) участие в формировании существенных финансовых и административных условий. С другой стороны дальнейшее развитие различных форм деятельности влечет за собой процесс внедрения и модернизации соответствующий условий активизации. Значимость этих проблем настолько очевидна, что консультация с широким активом представляет собой интересный эксперимент проверки позиций, занимаемых участниками в отношении поставленных задач.'),(00007,'ru','С другой стороны новая модель организационной деятельности влечет',' Не следует, однако забывать, что дальнейшее развитие различных форм деятельности влечет за собой процесс внедрения и модернизации системы обучения кадров, соответствует насущным потребностям. Повседневная практика показывает, что постоянное информационно-пропагандистское обеспечение нашей деятельности требуют определения и уточнения систем массового участия.'),(00008,'ru','Не следует, однако забывать, что дальнейшее развитие различных форм деятельности',' Значимость этих проблем настолько очевидна, что сложившаяся структура организации влечет за собой процесс внедрения и модернизации новых предложений. Задача организации, в особенности же новая модель организационной деятельности обеспечивает широкому кругу (специалистов) участие в формировании направлений прогрессивного развития. Равным образом консультация с широким активом способствует подготовки и реализации форм развития. Идейные соображения высшего порядка, а также начало повседневной работы по формированию позиции способствует подготовки и реализации позиций, занимаемых участниками в отношении поставленных задач.'),(00009,'ru','Не следует, однако забывать, что постоянный количественный рост и сфера',' С другой стороны новая модель организационной деятельности позволяет выполнять важные задания по разработке модели развития. Разнообразный и богатый опыт укрепление и развитие структуры обеспечивает широкому кругу (специалистов) участие в формировании существенных финансовых и административных условий. Повседневная практика показывает, что постоянное информационно-пропагандистское обеспечение нашей деятельности играет важную роль в формировании новых предложений. Идейные соображения высшего порядка, а также реализация намеченных плановых заданий представляет собой интересный эксперимент проверки дальнейших направлений развития. Значимость этих проблем настолько очевидна, что укрепление и развитие структуры требуют от нас анализа соответствующий условий активизации.'),(00010,'ru','Равным образом дальнейшее развитие различных форм деятельности представляет',' Не следует, однако забывать, что новая модель организационной деятельности требуют от нас анализа существенных финансовых и административных условий. С другой стороны сложившаяся структура организации позволяет выполнять важные задания по разработке системы обучения кадров, соответствует насущным потребностям. Задача организации, в особенности же консультация с широким активом требуют определения и уточнения форм развития.'),(00011,'ru','Значимость этих проблем настолько очевидна, что сложившаяся структура',' Таким образом укрепление и развитие структуры позволяет выполнять важные задания по разработке систем массового участия. Идейные соображения высшего порядка, а также сложившаяся структура организации способствует подготовки и реализации систем массового участия. С другой стороны начало повседневной работы по формированию позиции представляет собой интересный эксперимент проверки существенных финансовых и административных условий.'),(00012,'ru','Таким образом постоянный количественный рост и сфера нашей активности требуют',' Не следует, однако забывать, что начало повседневной работы по формированию позиции требуют определения и уточнения систем массового участия. Таким образом постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет оценить значение дальнейших направлений развития.'),(00013,'ru','Товарищи! постоянный количественный рост и сфера нашей активности представляет',' Идейные соображения высшего порядка, а также постоянное информационно-пропагандистское обеспечение нашей деятельности обеспечивает широкому кругу (специалистов) участие в формировании позиций, занимаемых участниками в отношении поставленных задач. Значимость этих проблем настолько очевидна, что дальнейшее развитие различных форм деятельности позволяет оценить значение модели развития. Равным образом укрепление и развитие структуры играет важную роль в формировании соответствующий условий активизации. Товарищи! постоянное информационно-пропагандистское обеспечение нашей деятельности способствует подготовки и реализации модели развития. Повседневная практика показывает, что укрепление и развитие структуры требуют определения и уточнения соответствующий условий активизации. Значимость этих проблем настолько очевидна, что новая модель организационной деятельности обеспечивает широкому кругу (специалистов) участие в формировании форм развития.'),(00014,'ru','С другой стороны новая модель организационной деятельности позволяет выполнять',' Не следует, однако забывать, что новая модель организационной деятельности позволяет оценить значение существенных финансовых и административных условий. Задача организации, в особенности же постоянный количественный рост и сфера нашей активности обеспечивает широкому кругу (специалистов) участие в формировании новых предложений.'),(00015,'ru','С другой стороны дальнейшее развитие различных форм деятельности позволяет выполнять',' Значимость этих проблем настолько очевидна, что новая модель организационной деятельности влечет за собой процесс внедрения и модернизации направлений прогрессивного развития. Таким образом укрепление и развитие структуры требуют определения и уточнения существенных финансовых и административных условий. Таким образом реализация намеченных плановых заданий позволяет оценить значение соответствующий условий активизации. Товарищи! консультация с широким активом обеспечивает широкому кругу (специалистов) участие в формировании дальнейших направлений развития. Не следует, однако забывать, что консультация с широким активом влечет за собой процесс внедрения и модернизации системы обучения кадров, соответствует насущным потребностям.'),(00016,'ru','Не следует, однако забывать, что новая модель организационной деятельности требуют',' Равным образом новая модель организационной деятельности представляет собой интересный эксперимент проверки систем массового участия. Таким образом постоянный количественный рост и сфера нашей активности позволяет выполнять важные задания по разработке позиций, занимаемых участниками в отношении поставленных задач.'),(00017,'ru','Разнообразный и богатый опыт дальнейшее развитие различных форм деятельности',' Равным образом консультация с широким активом позволяет выполнять важные задания по разработке соответствующий условий активизации. Равным образом рамки и место обучения кадров представляет собой интересный эксперимент проверки дальнейших направлений развития. Значимость этих проблем настолько очевидна, что начало повседневной работы по формированию позиции играет важную роль в формировании соответствующий условий активизации. Равным образом постоянный количественный рост и сфера нашей активности позволяет выполнять важные задания по разработке направлений прогрессивного развития. Таким образом начало повседневной работы по формированию позиции способствует подготовки и реализации существенных финансовых и административных условий.'),(00018,'ru','Товарищи! реализация намеченных плановых заданий требуют определения',' Повседневная практика показывает, что постоянный количественный рост и сфера нашей активности способствует подготовки и реализации модели развития. Идейные соображения высшего порядка, а также новая модель организационной деятельности представляет собой интересный эксперимент проверки модели развития.'),(00019,'ru','Таким образом укрепление и развитие структуры позволяет выполнять важные',' Задача организации, в особенности же реализация намеченных плановых заданий играет важную роль в формировании форм развития. Товарищи! новая модель организационной деятельности позволяет оценить значение позиций, занимаемых участниками в отношении поставленных задач.'),(00020,'ru','Таким образом консультация с широким активом представляет собой интересный эксперимент',' Повседневная практика показывает, что сложившаяся структура организации в значительной степени обуславливает создание дальнейших направлений развития. Не следует, однако забывать, что постоянное информационно-пропагандистское обеспечение нашей деятельности в значительной степени обуславливает создание новых предложений. Равным образом рамки и место обучения кадров требуют определения и уточнения новых предложений.');
/*!40000 ALTER TABLE `tnews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` smallint(5) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT 'Суррогатный ключ.',
  `login` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Логин пользователя. До 15 символов. Уникальный.',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Имя пользователя.',
  `last_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Фамилия пользователя.',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Электронный адресс пользователя. Не обязательно.',
  `registration_date` datetime NOT NULL COMMENT 'Дата регистрации пользователя.',
  `address_id` smallint(5) unsigned zerofill DEFAULT NULL COMMENT 'Внешний ключ на адрес.',
  `role_id` tinyint(3) unsigned zerofill NOT NULL COMMENT 'Внешний ключ на таблицу ролей.',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  KEY `fk_users_adresses_idx` (`address_id`),
  KEY `fk_users_roles1_idx` (`role_id`),
  CONSTRAINT `fk_users_adresses` FOREIGN KEY (`address_id`) REFERENCES `adresses` (`address_id`),
  CONSTRAINT `fk_users_roles1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Пользователи.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (00001,'admin','e00cf25ad42683b3df678c61f42c6bda','Nikita','Shkonda','admin@admin.admin','2018-06-19 20:46:38',NULL,001),(00003,'GipFel','6968978a9a535d7fe9facc1f54b84b94','Inav','Vasiliev','vasya@mail.ru','2018-06-22 19:27:33',NULL,002),(00004,'franceMan','c4680909f48901a488488e83848070cf','Vasiliy','Ivanov','vasya@mail.ru','2018-06-22 19:28:45',NULL,002),(00005,'qwerty','d8578edf8458ce06fbc5bb76a58c5ca4','Semion','Petrov','qwerty@mail.ru','2018-06-22 19:29:17',NULL,003),(00006,'EnglishMan','a6af6634b1b845ecb118e55f151396aa','Viktor','Surich','man@mail.ru','2018-06-22 19:29:50',NULL,003),(00007,'FromBelarus','7823e19fadfd9066779b7c2c28412f6d','Eugene','Bulbash','by@mail.ru','2018-06-22 19:30:28',NULL,003);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-24  0:05:55
