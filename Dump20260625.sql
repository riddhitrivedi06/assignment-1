-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: quickmart_db
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Electronics','Gadgets, phones, laptops and accessories'),(2,'Clothing','Men, women and children apparel'),(3,'Groceries','Daily essentials, food and beverages'),(4,'Furniture','Home and office furniture'),(5,'Sports','Sports equipment and outdoor gear'),(6,'Electronics','Gadgets, phones, laptops and accessories'),(7,'Clothing','Men, women and children apparel'),(8,'Groceries','Daily essentials, food and beverages'),(9,'Furniture','Home and office furniture'),(10,'Sports','Sports equipment and outdoor gear');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `segment` varchar(30) DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Rahul Sharma','rahul@email.com','Mumbai','VIP','2022-01-15'),(2,'Priya Singh','priya@email.com','Delhi','Premium','2022-03-20'),(3,'Amit Patel','amit@email.com','Ahmedabad','Regular','2022-06-10'),(4,'Sneha Rao','sneha@email.com','Bangalore','Premium','2022-07-05'),(5,'Karan Mehta','karan@email.com','Mumbai','VIP','2022-08-12'),(6,'Divya Nair','divya@email.com','Chennai','Regular','2022-09-18'),(7,'Ravi Kumar','ravi@email.com','Delhi','Premium','2023-01-22'),(8,'Anita Joshi','anita@email.com','Pune','Regular','2023-02-14'),(9,'Suresh Gupta','suresh@email.com','Kolkata','VIP','2023-04-30'),(10,'Meena Pillai','meena@email.com','Chennai','Regular','2023-06-08');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `discount` decimal(4,2) DEFAULT '0.00',
  PRIMARY KEY (`item_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,1,1,74999.00,0.05),(2,1,3,2,4999.00,0.00),(3,2,4,3,999.00,0.10),(4,2,5,2,2499.00,0.05),(5,3,6,10,450.00,0.00),(6,3,7,5,280.00,0.00),(7,4,8,1,12999.00,0.08),(8,4,9,1,18999.00,0.05),(9,5,2,1,114999.00,0.03),(10,5,11,2,1299.00,0.00),(11,6,10,2,2499.00,0.00),(12,6,3,1,4999.00,0.10),(13,7,4,5,999.00,0.15),(14,7,6,20,450.00,0.05),(15,8,12,1,22999.00,0.05),(16,8,3,3,4999.00,0.00),(17,9,5,2,2499.00,0.00),(18,10,1,1,74999.00,0.02),(19,11,9,1,18999.00,0.00),(20,11,8,2,12999.00,0.10),(21,12,11,3,1299.00,0.05),(22,12,6,15,450.00,0.00),(23,13,2,1,114999.00,0.08),(24,13,4,2,999.00,0.00),(25,14,10,1,2499.00,0.00),(26,14,7,10,280.00,0.05),(27,15,1,2,74999.00,0.04),(28,15,3,4,4999.00,0.00),(29,16,2,1,114999.00,0.06),(30,16,5,3,2499.00,0.10);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `order_date` date NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Delivered',
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2023-01-05','Mumbai','Delivered'),(2,2,'2023-01-18','Delhi','Delivered'),(3,3,'2023-02-10','Ahmedabad','Delivered'),(4,4,'2023-02-25','Bangalore','Delivered'),(5,5,'2023-03-08','Mumbai','Delivered'),(6,1,'2023-03-20','Mumbai','Delivered'),(7,6,'2023-04-14','Chennai','Delivered'),(8,7,'2023-05-02','Delhi','Delivered'),(9,2,'2023-05-19','Delhi','Returned'),(10,8,'2023-06-07','Pune','Delivered'),(11,9,'2023-07-11','Kolkata','Delivered'),(12,10,'2023-08-23','Chennai','Delivered'),(13,3,'2023-09-14','Ahmedabad','Delivered'),(14,5,'2023-10-05','Mumbai','Delivered'),(15,4,'2023-11-18','Bangalore','Delivered'),(16,1,'2023-12-01','Mumbai','Delivered');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(150) NOT NULL,
  `category_id` int DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `cost_price` decimal(10,2) DEFAULT NULL,
  `stock_qty` int DEFAULT '0',
  PRIMARY KEY (`product_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Samsung Galaxy S23',1,74999.00,55000.00,50),(2,'Apple MacBook Air M2',1,114999.00,88000.00,25),(3,'Sony Wireless Earbuds',1,4999.00,2500.00,200),(4,'Cotton Formal Shirt',2,999.00,400.00,500),(5,'Denim Jeans Premium',2,2499.00,900.00,300),(6,'Basmati Rice 5kg',3,450.00,300.00,1000),(7,'Sunflower Oil 2L',3,280.00,180.00,800),(8,'Office Chair Ergonomic',4,12999.00,7000.00,40),(9,'Wooden Study Table',4,18999.00,11000.00,20),(10,'Cricket Bat Kashmir Willow',5,2499.00,1200.00,100),(11,'Yoga Mat Premium',5,1299.00,600.00,150),(12,'LG 32-inch Monitor',1,22999.00,16000.00,35);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-25  0:17:46
