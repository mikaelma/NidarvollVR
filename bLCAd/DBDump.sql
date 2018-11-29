-- MySQL dump 10.13  Distrib 8.0.13, for macos10.14 (x86_64)
--
-- Host: localhost    Database: bLCAd
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `buildingElements`
--

DROP TABLE IF EXISTS `buildingElements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `buildingElements` (
  `idbuilding_elements` int(11) NOT NULL AUTO_INCREMENT,
  `idbuildings` int(11) NOT NULL,
  `idlevels` int(11) DEFAULT NULL,
  `A1A3` decimal(10,3) DEFAULT NULL,
  `A4` decimal(10,3) DEFAULT NULL,
  `B4_m` decimal(10,3) DEFAULT NULL,
  `B4_t` decimal(10,3) DEFAULT NULL,
  `A5` decimal(10,3) DEFAULT NULL,
  `B1` decimal(10,3) DEFAULT NULL,
  `B2` decimal(10,3) DEFAULT NULL,
  `B3` decimal(10,3) DEFAULT NULL,
  `B5` decimal(10,3) DEFAULT NULL,
  `C1` decimal(10,3) DEFAULT NULL,
  `C2` decimal(10,3) DEFAULT NULL,
  `C3` decimal(10,3) DEFAULT NULL,
  `C4` decimal(10,3) DEFAULT NULL,
  `D1` decimal(10,3) DEFAULT NULL,
  `D2` decimal(10,3) DEFAULT NULL,
  `D3` decimal(10,3) DEFAULT NULL,
  `D4` decimal(10,3) DEFAULT NULL,
  PRIMARY KEY (`idbuilding_elements`),
  UNIQUE KEY `unique_level_for_building` (`idbuildings`,`idlevels`) COMMENT 'Makes sure that every building only have a maxiumum of one of each levelcategory!',
  KEY `fk_level1_buildings1_idx` (`idbuildings`),
  KEY `fk_buildingElements_levelCategories1_idx` (`idlevels`),
  CONSTRAINT `fk_buildingElements_levelCategories1` FOREIGN KEY (`idlevels`) REFERENCES `levels` (`idlevels`),
  CONSTRAINT `fk_level1_buildings1` FOREIGN KEY (`idbuildings`) REFERENCES `buildings` (`idbuildings`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=434 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buildingElements`
--

LOCK TABLES `buildingElements` WRITE;
/*!40000 ALTER TABLE `buildingElements` DISABLE KEYS */;
INSERT INTO `buildingElements` VALUES (1,1,21,93060.460,0.000,0.000,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,1,23,189731.719,0.000,4505.000,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,1,24,89503.371,0.000,23851.198,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,1,22,858.000,0.000,0.000,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,1,25,433886.000,0.000,67918.388,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,1,26,220470.500,0.000,0.000,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,1,28,5337.040,0.000,0.000,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(45,1,2,1032847.090,0.000,96274.586,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,1,0,1032847.090,0.000,96274.586,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,2,21,18303.370,0.000,0.000,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,2,23,132985.234,0.000,2805.000,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(58,2,24,30411.007,0.000,9178.974,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(66,2,22,172878.720,0.000,0.000,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(70,2,25,282004.144,0.000,11094.688,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(83,2,26,10472.050,0.000,0.000,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(85,2,28,3900.000,0.000,0.000,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(87,2,2,650954.525,0.000,23078.662,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(88,2,0,650954.525,0.000,23078.662,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(89,3,215,36394.512,1158.585,0.000,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(90,3,216,32527.146,550.512,0.000,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(93,3,22,66477.328,2386.687,0.000,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(97,3,231,90826.528,13089.573,0.000,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(106,3,234,23687.642,242.535,3313.092,33.764,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(110,3,235,85692.000,26028.945,0.000,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(111,3,241,66560.541,4260.843,43026.514,2103.926,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(117,3,244,29765.071,583.217,24311.535,522.914,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(123,3,246,18011.970,344.715,18011.970,344.715,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(124,3,25,230883.572,20818.336,12727.337,408.926,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(138,3,261,129856.311,2847.425,0.000,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(142,3,28,4379.648,87.594,0.000,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(144,3,21,68921.658,1709.097,0.000,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(145,3,23,200206.170,39361.053,3313.092,33.764,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(146,3,24,114337.582,5188.775,85350.019,2971.555,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(147,3,26,129856.311,2847.425,0.000,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(148,3,2,815062.269,72398.967,101390.448,3414.245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(149,3,0,815062.269,72398.967,101390.448,3414.245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(150,4,21,59717.000,1658.000,NULL,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(151,4,22,111938.000,6443.000,NULL,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(152,4,23,426252.000,8000.000,NULL,49544.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(153,4,24,288993.000,14276.000,NULL,31558.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(154,4,25,578277.000,21196.000,NULL,48763.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(155,4,26,326720.000,8817.000,NULL,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(156,4,28,38528.000,1070.000,NULL,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(157,4,2,1830425.000,61460.000,NULL,129865.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(158,4,0,1830425.000,61460.000,NULL,129865.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(159,5,216,8590.410,124.000,NULL,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(160,5,222,679.965,182.000,NULL,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(161,5,223,7094.646,825.000,NULL,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(162,5,231,23682.956,765.000,NULL,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(163,5,232,148.312,11.000,NULL,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(164,5,233,11164.750,85.000,NULL,2232.950,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(165,5,234,14381.850,157.000,NULL,2521.514,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(166,5,235,1904.501,250.000,NULL,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(167,5,241,4989.497,300.000,NULL,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(168,5,242,9969.705,990.000,NULL,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(169,5,243,5899.534,42.000,NULL,1179.907,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(170,5,244,13837.859,236.000,NULL,11107.508,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(171,5,251,29927.858,1142.000,NULL,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(172,5,252,48594.203,367.000,NULL,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(173,5,255,3494.400,95.000,NULL,3494.400,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(174,5,257,6382.672,302.000,NULL,1276.534,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(175,5,261,17973.652,578.000,NULL,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(176,5,262,1439.287,189.000,NULL,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(177,5,21,8590.410,124.000,NULL,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(178,5,22,7774.611,1007.000,NULL,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(179,5,23,51282.369,1268.000,NULL,4754.464,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(180,5,24,34696.595,1568.000,NULL,12287.415,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(181,5,25,88399.133,1906.000,NULL,4770.934,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(182,5,26,19412.939,767.000,NULL,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(183,5,2,210156.057,6640.000,NULL,21812.813,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(184,5,0,210156.057,6640.000,NULL,21812.813,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(185,6,23,606238.600,0.000,469951.200,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(194,6,24,86294.000,0.000,104176.000,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(200,6,25,925625.965,0.000,57270.895,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(207,6,26,122365.000,0.000,13429.000,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(212,6,21,2065100.000,0.000,0.000,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(220,6,22,530965.000,0.000,0.000,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(222,6,2,4336588.565,0.000,644827.095,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(223,6,0,4336588.565,0.000,644827.095,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(224,7,21,28448.400,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(225,7,22,1041.900,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(226,7,23,60702.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(227,7,24,167202.300,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(228,7,25,29943.300,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(229,7,26,42853.800,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(230,7,28,7021.500,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(231,7,29,1132.500,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(232,7,2,338345.700,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(233,7,0,338345.700,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(234,8,21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(240,8,22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(244,8,231,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(249,8,235,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(250,8,234,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(256,9,21,8457.000,0.000,0.000,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(258,9,22,1910.852,0.000,0.000,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(261,9,23,8557.838,0.000,4637.333,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(271,9,24,3421.464,0.000,2974.959,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(280,9,25,4925.722,0.000,1701.606,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(295,9,26,1937.628,0.000,0.000,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(299,9,28,329.162,0.000,0.000,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(302,9,36,1289.922,0.000,1226.141,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(315,9,43,911.923,0.000,911.923,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(341,9,49,22920.765,0.000,22920.765,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(342,9,69,2732.425,0.000,3691.482,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(350,9,2,29539.666,0.000,9313.898,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(351,9,3,1289.922,0.000,1226.141,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(352,9,4,23832.688,0.000,23832.688,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(353,9,6,2732.425,0.000,3691.482,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(354,9,0,57394.701,0.000,38064.209,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(355,10,216,14003.611,0.000,63.578,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(359,10,223,1376.000,0.000,0.000,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(360,10,231,6534.794,0.000,0.000,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(365,10,234,1699.165,0.000,1699.165,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(368,10,235,1376.879,0.000,1376.879,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(371,10,241,235.526,0.000,0.000,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(374,10,242,1241.257,0.000,0.000,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(379,10,244,131.838,0.000,131.838,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(381,10,246,1810.358,0.000,0.000,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(382,10,251,1242.724,0.000,0.000,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(384,10,254,938.736,0.000,1177.834,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(386,10,257,325.695,0.000,0.000,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(388,10,261,149.940,0.000,0.000,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(389,10,262,3961.766,0.000,62.370,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(394,10,32,2527.060,0.000,3702.531,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(399,10,36,829.121,0.000,0.000,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(405,10,49,14503.194,0.000,8377.700,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(407,10,21,14003.611,0.000,63.578,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(408,10,22,1376.000,0.000,0.000,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(409,10,23,9610.838,0.000,3076.044,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(410,10,24,3418.979,0.000,131.838,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(411,10,25,2507.155,0.000,1177.834,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(412,10,26,4111.706,0.000,62.370,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(413,10,2,35028.289,0.000,4511.664,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(414,10,3,3356.181,0.000,3702.531,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(415,10,4,14503.194,0.000,8377.700,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(416,10,0,52887.664,0.000,16591.895,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(417,12,21,67703.400,NULL,NULL,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(418,12,22,48156.600,NULL,NULL,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(419,12,23,119606.800,NULL,NULL,64174.500,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(420,12,24,99331.900,NULL,NULL,49512.800,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(421,12,25,191839.800,NULL,NULL,25650.100,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(422,12,26,7190.200,NULL,NULL,1625.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(423,12,28,4010.300,NULL,NULL,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(424,12,2,537839.000,NULL,NULL,140962.400,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(425,12,0,537839.000,NULL,NULL,140962.400,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(426,13,21,165297.000,1984.000,NULL,0.000,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(427,13,22,1121757.000,5698.000,NULL,0.000,0.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(428,13,23,480102.000,9819.000,NULL,224630.000,6089.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(429,13,24,1138122.000,156507.000,NULL,1386114.000,284164.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(430,13,25,1890379.000,56216.000,NULL,96200.000,4047.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(431,13,26,692959.000,4845.000,NULL,27069.000,430.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(432,13,2,5488616.000,235069.000,NULL,1734013.000,294730.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(433,13,0,5488616.000,235069.000,NULL,1734013.000,294730.000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `buildingElements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buildings`
--

DROP TABLE IF EXISTS `buildings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `buildings` (
  `idbuildings` int(11) NOT NULL AUTO_INCREMENT,
  `building_identifier` varchar(45) NOT NULL COMMENT 'A coded identifier for the buildilng with a letter for the typology plus a number unique for the building, ie. R001 = Residential building number 1.',
  `building_name` varchar(45) NOT NULL COMMENT 'The name or address of the building.',
  `project` varchar(45) DEFAULT NULL COMMENT 'The study/building can be part of a project (research centre, industry program, etc) or part of a neighborhood. This column is used to group buildings together.',
  `calculation_method` varchar(45) DEFAULT NULL,
  `main_data_source` enum('EPD','Ecoinvent','Mixed') DEFAULT NULL COMMENT 'Where the majority of emission data is sourced from.',
  `study_type` enum('published research','unpublished research','industry, certification') DEFAULT NULL COMMENT 'The type/purpose of research. Is it published or unpublished research, or is it intended for certification of a building project.',
  `study_year` year(4) DEFAULT NULL,
  `lifetime` int(11) NOT NULL COMMENT 'The study reference period / lifetime used for the building in the LCA.',
  `floor_area` int(11) NOT NULL COMMENT 'The heated floor area. (Oppvarmet BRA).',
  `heated_volume` int(11) DEFAULT NULL,
  `area_footprint` int(11) DEFAULT NULL,
  `area_roof` int(11) DEFAULT NULL,
  `area_wall` int(11) DEFAULT NULL COMMENT 'External wall area (excluding or including windows and doors?)',
  `area_windowAndDoor` int(11) DEFAULT NULL COMMENT 'The total area of windows and doors (external).',
  `heatloss_number` decimal(10,5) DEFAULT NULL,
  `uval_walls` decimal(4,3) DEFAULT NULL,
  `uval_windows` decimal(4,3) DEFAULT NULL,
  `uval_doors` decimal(4,3) DEFAULT NULL,
  `uval_ground` decimal(4,3) DEFAULT NULL,
  `uval_roof` decimal(4,3) DEFAULT NULL,
  `thermal_bridges` decimal(4,3) DEFAULT NULL,
  `GWP_B6` decimal(10,5) DEFAULT NULL COMMENT 'The LCA result from the operational phase B6 in GWP per year (kgCO2e/year).',
  `GWP_B7` decimal(10,5) DEFAULT NULL,
  `storiesAB` int(11) DEFAULT NULL COMMENT 'The number of stories Above Ground, starting with 1 at the ground floor.',
  `storiesBG` int(11) DEFAULT NULL COMMENT 'The number of stories Below Ground. 0=no basement, 1=one besement story, etc...',
  `occupants` int(11) DEFAULT NULL COMMENT 'The number of occupants in the building.',
  `comments` varchar(1000) DEFAULT NULL COMMENT 'Description of the building and comments.',
  `idtypology` int(11) NOT NULL,
  `idconstruction_type` int(11) NOT NULL,
  `idlocation` int(11) NOT NULL,
  `idbuilt_status` int(11) NOT NULL,
  `idenergy_ambition_level` int(11) NOT NULL,
  PRIMARY KEY (`idbuildings`),
  UNIQUE KEY `building_identifier_UNIQUE` (`building_identifier`),
  KEY `fk_buildings_typology_idx` (`idtypology`),
  KEY `fk_buildings_construction_type1_idx` (`idconstruction_type`),
  KEY `fk_buildings_location1_idx` (`idlocation`),
  KEY `fk_buildings_built_status1_idx` (`idbuilt_status`),
  KEY `fk_buildings_energy_ambition_level1_idx` (`idenergy_ambition_level`),
  CONSTRAINT `fk_buildings_built_status1` FOREIGN KEY (`idbuilt_status`) REFERENCES `builtstatus` (`idbuilt_status`),
  CONSTRAINT `fk_buildings_construction_type1` FOREIGN KEY (`idconstruction_type`) REFERENCES `constructiontype` (`idconstruction_type`),
  CONSTRAINT `fk_buildings_energy_ambition_level1` FOREIGN KEY (`idenergy_ambition_level`) REFERENCES `energyambitionlevel` (`idenergy_ambition_level`),
  CONSTRAINT `fk_buildings_location1` FOREIGN KEY (`idlocation`) REFERENCES `location` (`idlocation`),
  CONSTRAINT `fk_buildings_typology` FOREIGN KEY (`idtypology`) REFERENCES `typology` (`idtypology`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buildings`
--

LOCK TABLES `buildings` WRITE;
/*!40000 ALTER TABLE `buildings` DISABLE KEYS */;
INSERT INTO `buildings` VALUES (1,'S001','Flesberg skole og idrettshall','Asplan Viak','Excel','EPD','industry, certification',2018,60,6664,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'This is part of an accounting for school, sportsbuilding, and swimminghall. The swimminghall is here a separate building.',3,4,17,4,6),(2,'sw001','Flesberg skole swimming hall','Asplan Viak','Excel','EPD','industry, certification',2018,60,2344,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'This is part of an accounting for school, sportsbuilding, and swimminghall. The swimminghall is here a separate building.',6,4,17,4,6),(3,'S002','Oestensjoe skole','Asplan Viak','Excel','EPD','industry, certification',2017,60,3629,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'comments',3,2,3,4,6),(4,'S003','Ruselokka','Asplan Viak','Excel',NULL,'industry, certification',NULL,60,9740,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'comments',3,4,3,1,6),(5,'S004','Prinsdal skole','Asplan Viak','Excel',NULL,'industry, certification',NULL,60,1344,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'comments',3,4,3,1,6),(6,'O001','FutureBuilt Papirbredden 2','FutureBuilt',NULL,NULL,'industry, certification',NULL,60,8536,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Hus 1 og del av kjeller (39% av total kjeller)',2,3,14,1,5),(7,'K001','FutureBuilt Fjell Barnehage','FutureBuilt','Klimagassregnskap.no','EPD','industry, certification',2015,60,755,1945,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8803.30000,NULL,1,1,NULL,'Results are including both A1A3 and B4 but it is not possible to separate these from the available report.',4,1,14,1,5),(8,'R001','ZEB Living lab','ZEB','Excel',NULL,'published research',2014,60,102,319,119,NULL,207,25,NULL,0.110,0.810,0.800,0.100,0.100,0.030,NULL,NULL,1,0,NULL,'comments',1,1,4,1,3),(9,'R002','ZEB Multikomfort','ZEB','Excel','Mixed','published research',2014,60,202,610,NULL,NULL,229,60,NULL,0.110,0.750,0.750,0.080,0.000,0.030,929.20000,NULL,2,NULL,NULL,'comments',1,1,11,1,3),(10,'R003','ZEB SFH Concept','ZEB','Excel','Mixed','published research',2013,60,160,420,80,80,189,36,NULL,0.120,0.650,0.650,0.070,0.100,0.030,808.00000,NULL,2,NULL,NULL,'comments',1,1,2,3,3),(12,'O002','ZEB Office concept','ZEB','Excel',NULL,'published research',2013,60,1980,NULL,NULL,NULL,NULL,NULL,NULL,0.120,0.750,0.750,0.110,0.090,0.030,8613.00000,NULL,4,NULL,NULL,'comments',2,4,2,3,3),(13,'S005','Heimdal skole','ZEB','Excel',NULL,'published research',2018,60,18675,NULL,NULL,NULL,NULL,NULL,NULL,0.100,0.800,0.800,0.075,0.090,0.020,66856.50000,NULL,5,NULL,NULL,'School only w/o flerbrukshall',3,4,4,1,3);
/*!40000 ALTER TABLE `buildings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `builtStatus`
--

DROP TABLE IF EXISTS `builtStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `builtStatus` (
  `idbuilt_status` int(11) NOT NULL AUTO_INCREMENT,
  `built_status` varchar(45) NOT NULL,
  PRIMARY KEY (`idbuilt_status`),
  UNIQUE KEY `built_status_UNIQUE` (`built_status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `builtStatus`
--

LOCK TABLES `builtStatus` WRITE;
/*!40000 ALTER TABLE `builtStatus` DISABLE KEYS */;
INSERT INTO `builtStatus` VALUES (1,'built'),(3,'concept'),(4,'na'),(2,'planned');
/*!40000 ALTER TABLE `builtStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `constructionType`
--

DROP TABLE IF EXISTS `constructionType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `constructionType` (
  `idconstruction_type` int(11) NOT NULL AUTO_INCREMENT,
  `construction_type` varchar(45) NOT NULL COMMENT 'The main construction type of the building, ie. timber, concrete, steel...',
  PRIMARY KEY (`idconstruction_type`),
  UNIQUE KEY `construction_type_UNIQUE` (`construction_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constructionType`
--

LOCK TABLES `constructionType` WRITE;
/*!40000 ALTER TABLE `constructionType` DISABLE KEYS */;
INSERT INTO `constructionType` VALUES (2,'concrete'),(4,'na'),(3,'steel'),(1,'timber');
/*!40000 ALTER TABLE `constructionType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `energyAmbitionLevel`
--

DROP TABLE IF EXISTS `energyAmbitionLevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `energyAmbitionLevel` (
  `idenergy_ambition_level` int(11) NOT NULL AUTO_INCREMENT,
  `energy_ambition_level` varchar(45) NOT NULL,
  PRIMARY KEY (`idenergy_ambition_level`),
  UNIQUE KEY `energy_ambition_level_UNIQUE` (`energy_ambition_level`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `energyAmbitionLevel`
--

LOCK TABLES `energyAmbitionLevel` WRITE;
/*!40000 ALTER TABLE `energyAmbitionLevel` DISABLE KEYS */;
INSERT INTO `energyAmbitionLevel` VALUES (6,'na'),(5,'Passive House'),(1,'TEK10'),(4,'ZEB-COM'),(2,'ZEB-O'),(3,'ZEB-OM');
/*!40000 ALTER TABLE `energyAmbitionLevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GWP_transport`
--

DROP TABLE IF EXISTS `GWP_transport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `GWP_transport` (
  `idGWP_transport` int(11) NOT NULL AUTO_INCREMENT,
  `mode` enum('road','sea','rail','air') NOT NULL,
  `name` varchar(100) NOT NULL,
  `GWPper_tkm` decimal(10,5) NOT NULL,
  PRIMARY KEY (`idGWP_transport`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GWP_transport`
--

LOCK TABLES `GWP_transport` WRITE;
/*!40000 ALTER TABLE `GWP_transport` DISABLE KEYS */;
INSERT INTO `GWP_transport` VALUES (1,'sea','Transport, transoceanic freight ship',0.01150),(2,'road','Transport, lorry 16-32t, EURO3',0.17000),(3,'road','Transport, lorry 16-32t, EURO5',0.17000),(4,'rail','Transport, freight, rail',0.03940),(5,'sea','AV: Skip',0.01072),(6,'road','AV: Lastebil',0.04860),(7,'road','AV: Betongbil',0.07594);
/*!40000 ALTER TABLE `GWP_transport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `levels`
--

DROP TABLE IF EXISTS `levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `levels` (
  `idlevels` int(11) NOT NULL COMMENT 'This is the digits used for the category, ie. 0, 1-9, 21-29, 211-219, ...',
  `name` varchar(45) NOT NULL,
  `hierarchy` tinyint(4) NOT NULL,
  `idparent` int(11) DEFAULT NULL,
  PRIMARY KEY (`idlevels`),
  KEY `fk_levelCategories_levelCategories1_idx` (`idparent`),
  CONSTRAINT `fk_levelCategories_levelCategories1` FOREIGN KEY (`idparent`) REFERENCES `levels` (`idlevels`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `levels`
--

LOCK TABLES `levels` WRITE;
/*!40000 ALTER TABLE `levels` DISABLE KEYS */;
INSERT INTO `levels` VALUES (0,'Whole building',0,NULL),(2,'Envelope, foundations, and structure',1,0),(3,'Heating, ventilation and sanitation',1,0),(4,'Electric power',1,0),(5,'Telecommunications and automation',1,0),(6,'Other installations',1,0),(7,'Outdoors',1,0),(21,'Groundwork and foundations',2,2),(22,'Superstructure',2,2),(23,'Outer walls',2,2),(24,'Inner walls',2,2),(25,'Slab structure',2,2),(26,'Outer roof',2,2),(27,'Fixed inventory',2,2),(28,'Stairs and balconies',2,2),(29,'Other parts main building',2,2),(31,'Sanitary',2,3),(32,'Heating',2,3),(33,'Fire safety',2,3),(36,'Ventilation and air conditioning',2,3),(39,'Other sevices: Appliances',2,3),(41,'Basic installation for electric power',2,4),(43,'Low voltage power',2,4),(44,'Lighting',2,4),(49,'Other tech.: Photovoltaic',2,4),(69,'Other technical installations',2,6),(211,'Preparation of land',3,21),(212,'Building ditch',3,21),(213,'Ground reinforcement',3,21),(214,'Supporting constructions',3,21),(215,'Pile foundations',3,21),(216,'Direct foundations',3,21),(217,'Drainage',3,21),(218,'Complementaries',3,21),(219,'Other parts of groundwork and foundations',3,21),(221,'Frames',3,22),(222,'Columns',3,22),(223,'Beams',3,22),(231,'Load-bearing outer wall',3,23),(232,'Non-bearing outer wall',3,23),(233,'Glass facades',3,23),(234,'Windows and doors',3,23),(235,'Outer cladding and surface',3,23),(241,'Load-bearing inner walls',3,24),(242,'Non-bearing inner walls',3,24),(243,'System walls, glass walls',3,24),(244,'Windows and doors',3,24),(246,'Cladding and surface',3,24),(251,'Load-bearing deck',3,25),(252,'Floor on ground',3,25),(254,'Floor system',3,25),(255,'Floor surface',3,25),(257,'Ceiling system',3,25),(261,'Primary construction',3,26),(262,'Roof covering',3,26),(263,'Glass roof, roof hatches',3,26),(268,'Equipment and complementaries',3,26),(269,'Other parts of outer roof',3,26);
/*!40000 ALTER TABLE `levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `location` (
  `idlocation` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(45) NOT NULL COMMENT 'The country where the buildilng is built / planned built.',
  `city` varchar(45) DEFAULT NULL COMMENT 'The city where the buildilng is built / planned built.',
  PRIMARY KEY (`idlocation`),
  UNIQUE KEY `unique_country_city` (`country`,`city`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (26,'Belgium','Brussels'),(33,'Czech Republic','Holesov'),(35,'Europe','Central'),(36,'Europe','na'),(19,'Finland','na'),(24,'Germany','Cologne'),(22,'Germany','Essen'),(25,'Germany','Heiligengrabe'),(20,'Germany','na'),(21,'Germany','Niestetal'),(23,'Germany','Ulm'),(37,'Global','na'),(1,'na','na'),(8,'Norway','Askim'),(16,'Norway','Brevik'),(14,'Norway','Drammen'),(17,'Norway','Flesberg'),(7,'Norway','Fredrikstad'),(5,'Norway','Gardermoen'),(9,'Norway','Gjoevik'),(13,'Norway','Hokksund'),(18,'Norway','Hurdal'),(11,'Norway','Larvik'),(15,'Norway','Moelv'),(2,'Norway','na'),(3,'Norway','Oslo'),(10,'Norway','Porsgrunn'),(12,'Norway','Skien'),(4,'Norway','Trondheim'),(6,'Norway','Vennesla'),(32,'Poland','na'),(29,'Poland','Wolsztyn'),(34,'Singapore','Tuas'),(28,'Spain','Laudio'),(31,'Sweden','Nybro'),(30,'Turkey','Can'),(27,'United Kingdom','Sheffield');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materialCat`
--

DROP TABLE IF EXISTS `materialCat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `materialCat` (
  `idmaterialCat` int(11) NOT NULL AUTO_INCREMENT,
  `materialCat` varchar(45) NOT NULL COMMENT 'The category that the material belonngs to; either material type or component type, eg. timber, metals, furniture,...',
  PRIMARY KEY (`idmaterialCat`),
  UNIQUE KEY `materialCat_UNIQUE` (`materialCat`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materialCat`
--

LOCK TABLES `materialCat` WRITE;
/*!40000 ALTER TABLE `materialCat` DISABLE KEYS */;
INSERT INTO `materialCat` VALUES (14,'aluminium'),(17,'argon'),(10,'asphalt'),(18,'bitumen'),(20,'brick'),(35,'carpet'),(2,'cement'),(15,'ceramic'),(1,'concrete'),(6,'copper'),(28,'doors'),(29,'electronics'),(34,'flooring'),(16,'glass'),(12,'granite'),(22,'gypsum'),(39,'heat pump'),(40,'hot water tank'),(30,'insulation'),(5,'iron'),(13,'linoleum'),(21,'paint'),(26,'paraffin'),(31,'photovoltaics'),(19,'plaster'),(11,'plastics'),(37,'PV panel'),(9,'rock'),(33,'roofing felt'),(24,'rubber'),(38,'ST panel'),(4,'steel'),(7,'stone'),(41,'tbd'),(36,'technical installations'),(25,'textile'),(3,'timber'),(32,'vapour/wind barrier'),(23,'vinyl'),(27,'windows'),(8,'zink');
/*!40000 ALTER TABLE `materialCat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materialInventory`
--

DROP TABLE IF EXISTS `materialInventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `materialInventory` (
  `idmaterialInventory` int(11) NOT NULL AUTO_INCREMENT COMMENT 'This is where the emissions per material for a certain building element in a certain building is calculated. One row for each material. A building element can have many materials (many rows).',
  `idbuilding_elements` int(11) NOT NULL,
  `idmaterials` int(11) NOT NULL,
  `quantity` decimal(10,3) NOT NULL COMMENT 'The quantity of the material in unit kilograms (kg).',
  `RSL_mi` tinyint(4) DEFAULT NULL,
  `idGWP_transport1` int(11) DEFAULT NULL,
  `transport1_distance` int(11) DEFAULT NULL,
  `idGWP_transport2` int(11) DEFAULT NULL,
  `transport2_distance` int(11) DEFAULT NULL,
  `idGWP_transport3` int(11) DEFAULT NULL,
  `transport3_distance` int(11) DEFAULT NULL,
  `idlocationproduction` int(11) DEFAULT NULL COMMENT 'Location of production. Only applies here if dataType of the material is ''Generic''. If dataType is ''Specific'' then this id-value is gathered from materials table.',
  `A1A3` decimal(20,10) NOT NULL,
  `A4` decimal(20,10) DEFAULT NULL,
  `B4_m` decimal(20,10) DEFAULT NULL,
  `B4_t` decimal(20,10) DEFAULT NULL,
  `A5` decimal(20,10) DEFAULT NULL,
  `B1` decimal(20,10) DEFAULT NULL,
  `B2` decimal(20,10) DEFAULT NULL,
  `B3` decimal(20,10) DEFAULT NULL,
  `B5` decimal(20,10) DEFAULT NULL,
  `C1` decimal(20,10) DEFAULT NULL,
  `C2` decimal(20,10) DEFAULT NULL,
  `C3` decimal(20,10) DEFAULT NULL,
  `C4` decimal(20,10) DEFAULT NULL,
  `D1` decimal(20,10) DEFAULT NULL,
  `D2` decimal(20,10) DEFAULT NULL,
  `D3` decimal(20,10) DEFAULT NULL,
  `D4` decimal(20,10) DEFAULT NULL,
  PRIMARY KEY (`idmaterialInventory`),
  KEY `fk_materialInventory_GWP_transport1_idx` (`idGWP_transport1`),
  KEY `fk_materialInventory_GWP_transport2_idx` (`idGWP_transport2`),
  KEY `fk_materialInventory_GWP_transport3_idx` (`idGWP_transport3`),
  KEY `fk_materialInventory_buildingElements1_idx` (`idbuilding_elements`),
  KEY `fk_materialInventory_materials1_idx` (`idmaterials`),
  KEY `fk_materialInventory_location1_idx` (`idlocationproduction`),
  CONSTRAINT `fk_materialInventory_GWP_transport1` FOREIGN KEY (`idGWP_transport1`) REFERENCES `gwp_transport` (`idgwp_transport`),
  CONSTRAINT `fk_materialInventory_GWP_transport2` FOREIGN KEY (`idGWP_transport2`) REFERENCES `gwp_transport` (`idgwp_transport`),
  CONSTRAINT `fk_materialInventory_GWP_transport3` FOREIGN KEY (`idGWP_transport3`) REFERENCES `gwp_transport` (`idgwp_transport`),
  CONSTRAINT `fk_materialInventory_buildingElements1` FOREIGN KEY (`idbuilding_elements`) REFERENCES `buildingelements` (`idbuilding_elements`) ON DELETE CASCADE,
  CONSTRAINT `fk_materialInventory_location1` FOREIGN KEY (`idlocationproduction`) REFERENCES `location` (`idlocation`),
  CONSTRAINT `fk_materialInventory_materials1` FOREIGN KEY (`idmaterials`) REFERENCES `materials` (`idmaterials`)
) ENGINE=InnoDB AUTO_INCREMENT=345 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materialInventory`
--

LOCK TABLES `materialInventory` WRITE;
/*!40000 ALTER TABLE `materialInventory` DISABLE KEYS */;
INSERT INTO `materialInventory` VALUES (1,1,1,364.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,79566.7600000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,1,2,40890.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13493.7000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,3,3,123.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,29520.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,3,2,12165.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4014.4500000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,3,4,414.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,32333.4000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,3,5,4.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,472.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,3,5,61.522,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7259.5960000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,3,6,558.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49430.4300000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,3,7,171.000,50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14535.0000000000,0.0000000000,2907.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,3,8,556.500,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42023.5410000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,3,9,15.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,795.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,3,7,94.000,50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7990.0000000000,0.0000000000,1598.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,3,10,6.383,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1358.3024000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,14,4,179.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13979.9000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,14,10,2.249,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,478.5872000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,14,12,21.630,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,53.8587000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,14,13,495.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10465.7850000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,14,14,12471.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18831.2100000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,14,15,220.000,50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19973.8000000000,0.0000000000,3994.7600000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,14,16,438.000,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15615.1380000000,0.0000000000,15615.1380000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,14,17,64.000,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4132.3520000000,0.0000000000,4132.3520000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,14,15,6.000,50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,544.7400000000,0.0000000000,108.9480000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,14,18,230.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5428.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,24,19,8.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,312.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,24,19,14.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,546.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,26,23,621.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,136620.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,26,2,44760.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14770.8000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,26,24,1014.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,93928.8480000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,26,25,71.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7164.5390000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,26,4,1124.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,87784.4000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,26,26,1094.000,50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3413.2800000000,0.0000000000,682.6560000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,26,27,1106.000,50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3992.6600000000,0.0000000000,798.5320000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,26,28,1757.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9983.2740000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,26,29,1805.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13862.4000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,26,10,8.216,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1748.3648000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,26,13,63.200,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1336.2376000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,26,30,4958.000,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33218.6000000000,0.0000000000,66437.2000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,26,31,5.182,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,438.2469220000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,26,32,81.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25624.3500000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,40,33,3950.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20105.5000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,40,34,3643.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,200365.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,42,3,10.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2400.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,42,35,750.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1500.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(44,42,4,18.400,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1437.0400000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(45,47,1,73.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15957.0700000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,47,2,7110.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2346.3000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,49,3,331.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,79440.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(48,49,2,29835.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9845.5500000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,49,4,120.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9372.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(50,49,5,30.058,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3546.8440000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(51,49,7,153.000,50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13005.0000000000,0.0000000000,2601.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(52,49,8,216.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16311.0240000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(53,49,9,5.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,265.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,49,7,12.000,50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1020.0000000000,0.0000000000,204.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(55,49,10,0.845,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,179.8160000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,58,1,37.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8087.8300000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(57,58,2,3000.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,990.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(58,58,10,0.546,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,116.1888000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(59,58,11,371.000,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6689.1300000000,0.0000000000,6689.1300000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(60,58,13,68.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1437.7240000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(61,58,14,2691.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4063.4100000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(62,58,15,90.000,50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8171.1000000000,0.0000000000,1634.2200000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(63,58,16,24.000,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,855.6240000000,0.0000000000,855.6240000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(64,66,20,40000.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,91600.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(65,66,21,60000.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,79200.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(66,66,1,8.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1748.7200000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(67,66,2,1000.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,330.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(68,70,22,602.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,150614.3800000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(69,70,2,72240.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23839.2000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(70,70,24,45.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4168.4400000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(71,70,25,150.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15136.3500000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(72,70,1,265.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,57926.3500000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(73,70,2,32000.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10560.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(74,70,26,212.000,50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,661.4400000000,0.0000000000,132.2880000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(75,70,27,200.000,50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,722.0000000000,0.0000000000,144.4000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(76,70,29,24.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,184.3200000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(77,70,10,0.260,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,55.3280000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(78,70,13,2.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42.2860000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(79,70,11,600.000,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10818.0000000000,0.0000000000,10818.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(80,70,32,23.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7276.0500000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(81,83,4,36.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2811.6000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(82,83,33,1505.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7660.4500000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(83,85,3,10.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2400.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(84,85,35,750.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1500.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(85,89,20,15892.800,60,6,1500,NULL,NULL,NULL,NULL,NULL,36394.5120000000,1158.5851200000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(86,90,36,110.900,60,7,15,NULL,NULL,NULL,NULL,NULL,23289.0000000000,303.1828560000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(87,90,2,13308.000,60,5,1600,NULL,NULL,NULL,NULL,NULL,4391.6400000000,228.2588160000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(88,90,37,52.320,60,6,500,NULL,NULL,NULL,NULL,NULL,4846.5062400000,19.0706400000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(89,93,38,7938.700,60,6,1500,NULL,NULL,NULL,NULL,NULL,22784.0690000000,578.7312300000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(90,93,21,100.100,60,6,1500,NULL,NULL,NULL,NULL,NULL,132.1320000000,7.2972900000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(91,93,20,18256.700,60,6,1500,NULL,NULL,NULL,NULL,NULL,41807.8430000000,1330.9134300000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(92,93,19,44.956,60,6,500,NULL,NULL,NULL,NULL,NULL,1753.2840000000,469.7452440000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(93,97,36,149.080,60,7,15,NULL,NULL,NULL,NULL,NULL,31306.8000000000,407.5608672000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(94,97,2,11926.400,60,5,1600,NULL,NULL,NULL,NULL,NULL,3935.7120000000,204.5616128000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(95,97,4,310.000,60,6,1500,NULL,NULL,NULL,NULL,NULL,24211.0000000000,11299.5000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(96,97,9,75.532,60,6,500,NULL,NULL,NULL,NULL,NULL,4003.1960000000,660.7539360000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(97,97,39,92.041,60,6,500,NULL,NULL,NULL,NULL,NULL,4422.9382140000,90.8058097800,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(98,97,37,113.794,60,6,500,NULL,NULL,NULL,NULL,NULL,10540.9658080000,41.4779130000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(99,97,40,79.850,60,6,500,NULL,NULL,NULL,NULL,NULL,143.7300000000,13.9705560000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(100,97,41,1534.400,60,6,500,NULL,NULL,NULL,NULL,NULL,650.5856000000,6.0776049600,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(101,97,42,5005.000,60,6,1500,NULL,NULL,NULL,NULL,NULL,11611.6000000000,364.8645000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(102,106,43,3.250,30,6,500,NULL,NULL,NULL,NULL,NULL,406.3832500000,4.5094725000,406.3832500000,4.5094725000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(103,106,44,17.840,30,6,500,NULL,NULL,NULL,NULL,NULL,1855.3600000000,21.0253320000,1855.3600000000,21.0253320000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(104,106,45,9.930,30,6,500,NULL,NULL,NULL,NULL,NULL,1051.3486800000,8.2287784980,1051.3486800000,8.2287784980,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(105,106,6,230.000,60,6,500,NULL,NULL,NULL,NULL,NULL,20374.5500000000,208.7715060000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(106,110,46,193.000,60,6,1500,NULL,NULL,NULL,NULL,NULL,85692.0000000000,26028.9450000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(107,111,36,144.370,60,7,15,NULL,NULL,NULL,NULL,NULL,30317.7000000000,394.6844808000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(108,111,2,11549.600,60,5,1600,NULL,NULL,NULL,NULL,NULL,3811.3680000000,198.0987392000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(109,111,4,68.818,60,6,1500,NULL,NULL,NULL,NULL,NULL,5374.6858000000,2508.4161000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(110,111,9,0.330,60,6,500,NULL,NULL,NULL,NULL,NULL,17.4900000000,2.8868400000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(111,111,47,36.687,20,6,500,NULL,NULL,NULL,NULL,NULL,21513.2568000000,1051.9630380000,43026.5136000000,2103.9260760000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(112,111,13,261.365,60,6,500,NULL,NULL,NULL,NULL,NULL,5526.0401950000,104.7942967500,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(113,117,16,156.580,30,6,500,NULL,NULL,NULL,NULL,NULL,5582.2335800000,118.2370810500,5582.2335800000,118.2370810500,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(114,117,48,45.460,30,6,500,NULL,NULL,NULL,NULL,NULL,2399.6061000000,65.7515392380,2399.6061000000,65.7515392380,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(115,117,49,28.000,50,6,500,NULL,NULL,NULL,NULL,NULL,2912.0000000000,32.9994000000,582.4000000000,6.5998800000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(116,117,17,237.000,30,6,500,NULL,NULL,NULL,NULL,NULL,15302.6160000000,328.8446100000,15302.6160000000,328.8446100000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(117,117,45,4.200,30,6,500,NULL,NULL,NULL,NULL,NULL,444.6792000000,3.4804501200,444.6792000000,3.4804501200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(118,117,50,113.730,60,6,500,NULL,NULL,NULL,NULL,NULL,3123.9356400000,33.9043232520,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(119,123,11,999.000,30,6,500,NULL,NULL,NULL,NULL,NULL,18011.9700000000,344.7149400000,18011.9700000000,344.7149400000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(120,124,36,465.084,60,7,15,NULL,NULL,NULL,NULL,NULL,97667.6400000000,1271.4652425600,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(121,124,2,55810.026,60,5,1600,NULL,NULL,NULL,NULL,NULL,18417.3085800000,957.2535659520,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(122,124,4,404.859,60,6,1500,NULL,NULL,NULL,NULL,NULL,31619.4879000000,14757.1105500000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(123,124,13,139.395,60,6,500,NULL,NULL,NULL,NULL,NULL,2947.2284850000,55.8904252500,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(124,124,51,2616.712,50,6,500,NULL,NULL,NULL,NULL,NULL,5280.5248160000,616.7851855200,1056.1049632000,123.3570371040,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(125,124,10,26.551,60,6,500,NULL,NULL,NULL,NULL,NULL,5650.0528000000,464.5362960000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(126,124,37,297.296,60,6,500,NULL,NULL,NULL,NULL,NULL,27539.1230720000,108.3643920000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(127,124,9,168.406,60,6,500,NULL,NULL,NULL,NULL,NULL,8925.5180000000,1473.2156880000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(128,124,52,1871.180,60,6,500,NULL,NULL,NULL,NULL,NULL,913.1358400000,4.5014977260,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(129,124,53,41.166,60,6,500,NULL,NULL,NULL,NULL,NULL,8068.5360000000,660.2203080000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(130,124,31,9.570,60,6,500,NULL,NULL,NULL,NULL,NULL,809.3444700000,15.3483660000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(131,124,54,54.164,60,7,15,NULL,NULL,NULL,NULL,NULL,11374.4400000000,148.0757097600,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(132,124,55,3357.660,30,6,500,NULL,NULL,NULL,NULL,NULL,8729.9160000000,236.6143002000,8729.9160000000,236.6143002000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(133,124,56,10.073,30,6,500,NULL,NULL,NULL,NULL,NULL,2941.3160000000,48.9547800000,2941.3160000000,48.9547800000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(134,138,36,32.458,60,7,15,NULL,NULL,NULL,NULL,NULL,6816.1800000000,88.7349787200,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(135,138,2,49230.617,60,5,1600,NULL,NULL,NULL,NULL,NULL,16246.1036100000,844.4035427840,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(136,138,37,237.585,60,6,500,NULL,NULL,NULL,NULL,NULL,22007.9737200000,86.5997325000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(137,138,57,1367.517,60,6,500,NULL,NULL,NULL,NULL,NULL,84786.0540000000,1827.6864705000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(138,142,58,18.279,60,7,15,NULL,NULL,NULL,NULL,NULL,3655.8000000000,49.9718613600,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(139,142,2,2193.480,60,5,1600,NULL,NULL,NULL,NULL,NULL,723.8484000000,37.6225689600,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(140,185,59,157000.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,259678.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(141,185,60,129000.000,25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,311406.0000000000,0.0000000000,435968.4000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(142,185,61,8000.000,25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14632.0000000000,0.0000000000,20484.8000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(143,185,62,17000.000,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6749.0000000000,0.0000000000,13498.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(144,185,63,10000.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9670.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(145,185,64,31000.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1488.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(146,185,65,100.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,192.8000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(147,185,65,100.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,192.8000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(148,185,66,5000.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2230.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(149,194,62,98000.000,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,38906.0000000000,0.0000000000,77812.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(150,194,67,21000.000,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20076.0000000000,0.0000000000,20076.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(151,194,64,7000.000,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,336.0000000000,0.0000000000,336.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(152,194,63,6000.000,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5802.0000000000,0.0000000000,5802.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(153,194,68,10000.000,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,150.0000000000,0.0000000000,150.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(154,194,69,8000.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,21024.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(155,200,70,3000.000,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3033.0000000000,0.0000000000,9099.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(156,200,71,395.000,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,381.9650000000,0.0000000000,1145.8950000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(157,200,72,21000.000,25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23310.0000000000,0.0000000000,32634.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(158,200,73,4000.000,25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10280.0000000000,0.0000000000,14392.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(159,200,74,59000.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,97586.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(160,200,75,4805000.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,562185.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(161,200,76,1990000.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,228850.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(162,207,77,4000.000,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5720.0000000000,0.0000000000,5720.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(163,207,78,2000.000,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2480.0000000000,0.0000000000,2480.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(164,207,79,3000.000,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4125.0000000000,0.0000000000,4125.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(165,207,80,89000.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,108936.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(166,207,64,23000.000,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1104.0000000000,0.0000000000,1104.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(167,212,81,1820000.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1115660.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(168,212,82,200000.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,240000.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(169,212,83,263000.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,54704.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(170,212,84,2696000.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,366656.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(171,212,85,90000.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,31500.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(172,212,84,1547000.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,210392.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(173,212,85,96000.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33600.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(174,212,86,3000.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12588.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(175,220,87,60000.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,51000.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(176,220,88,1627000.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,479965.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(177,234,89,9.330,60,3,456,NULL,NULL,NULL,NULL,5,2659.0500000000,1721.3626080000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(178,234,90,14.510,60,3,650,NULL,NULL,NULL,NULL,1,29.1651000000,1.6033550000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(179,234,91,9.330,60,3,1891,1,0,NULL,NULL,26,79.7715000000,2.9993151000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(180,234,92,166.050,60,3,1891,1,1,NULL,NULL,20,640.9530000000,53.3820030750,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(181,234,93,571.150,60,3,1456,1,14,NULL,NULL,27,828.1675000000,141.4630031500,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(182,234,94,0.310,60,2,494,NULL,NULL,NULL,NULL,3,26.4740000000,14.0582520000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(183,240,95,13.880,60,3,366,NULL,NULL,NULL,NULL,3,2845.4000000000,431.8068000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(184,240,94,1.960,60,2,494,NULL,NULL,NULL,NULL,3,167.3840000000,88.8844320000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(185,240,94,0.432,60,3,841,NULL,NULL,NULL,NULL,6,36.8928000000,33.3520416000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(186,240,96,0.960,60,3,841,NULL,NULL,NULL,NULL,6,299.5200000000,89.2132800000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(187,244,97,1.260,30,3,1785,1,49,NULL,NULL,28,627.4800000000,248.9870565000,627.4800000000,248.9870565000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(188,244,98,435.790,60,2,545,NULL,NULL,NULL,NULL,8,531.6638000000,40.3759435000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(189,244,99,140.880,60,3,378,NULL,NULL,NULL,NULL,9,271.8984000000,9.0529488000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(190,244,100,736.250,50,3,378,NULL,NULL,NULL,NULL,9,1450.4125000000,47.3114250000,290.0825000000,9.4622850000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(191,244,94,4.890,50,2,494,NULL,NULL,NULL,NULL,3,417.6060000000,221.7575880000,83.5212000000,44.3515176000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(192,249,101,203.730,20,3,4098,1,163,NULL,NULL,30,158.9094000000,142.3124336850,317.8188000000,284.6248673700,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(193,250,91,73.600,40,3,1846,1,163,NULL,NULL,23,629.2800000000,23.2351152000,314.6400000000,11.6175576000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(194,250,102,0.510,40,3,1846,1,163,NULL,NULL,23,2.2950000000,0.1610041950,1.1475000000,0.0805020975,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(195,250,103,13.160,40,3,1846,1,163,NULL,NULL,23,21.1876000000,4.1545396200,10.5938000000,2.0772698100,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(196,250,104,4.900,40,3,1846,1,163,NULL,NULL,23,43.0710000000,1.5469030500,21.5355000000,0.7734515250,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(197,250,105,8.420,40,3,1846,1,163,NULL,NULL,23,22.3130000000,2.6581476900,11.1565000000,1.3290738450,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(198,250,106,2.630,40,3,1846,1,163,NULL,NULL,23,11.5457000000,0.8302765350,5.7728500000,0.4151382675,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(199,256,135,33.000,60,NULL,NULL,NULL,NULL,NULL,NULL,16,7755.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(200,256,136,1800.000,60,NULL,NULL,NULL,NULL,NULL,NULL,19,702.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(201,258,137,28.140,60,NULL,NULL,NULL,NULL,NULL,NULL,15,1222.4016000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(202,258,138,3600.000,60,NULL,NULL,NULL,NULL,NULL,NULL,2,147.6000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(203,258,139,373.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,540.8500000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(204,261,140,332.110,60,NULL,NULL,NULL,NULL,NULL,NULL,2,876.7704000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(205,261,141,352.720,60,NULL,NULL,NULL,NULL,NULL,NULL,10,119.2193600000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(206,261,142,285.470,60,NULL,NULL,NULL,NULL,NULL,NULL,7,682.2733000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(207,261,143,3336.541,60,NULL,NULL,NULL,NULL,NULL,NULL,8,1901.8283700000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(208,261,144,255.050,30,NULL,NULL,NULL,NULL,NULL,NULL,2,541.7262000000,0.0000000000,541.7262000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(209,261,138,8302.750,60,NULL,NULL,NULL,NULL,NULL,NULL,2,340.4127500000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(210,261,145,37.690,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(211,261,146,2.070,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,185.2939800000,0.0000000000,185.2939800000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(212,261,147,56.999,30,NULL,NULL,NULL,NULL,NULL,NULL,35,3237.5432000000,0.0000000000,3237.5432000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(213,261,148,2.746,30,NULL,NULL,NULL,NULL,NULL,NULL,35,672.7700000000,0.0000000000,672.7700000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(214,271,142,289.050,60,NULL,NULL,NULL,NULL,NULL,NULL,7,690.8295000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(215,271,149,103.211,60,NULL,NULL,NULL,NULL,NULL,NULL,36,101.0435690000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(216,271,150,592.524,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,462.7612440000,0.0000000000,462.7612440000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(217,271,151,119.800,8,NULL,NULL,NULL,NULL,NULL,NULL,36,85.2976000000,0.0000000000,554.4344000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(218,271,143,155.703,60,NULL,NULL,NULL,NULL,NULL,NULL,8,88.7507100000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(219,271,138,740.500,60,NULL,NULL,NULL,NULL,NULL,NULL,2,30.3605000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(220,271,152,40.860,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4.6580400000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(221,271,153,89.590,30,NULL,NULL,NULL,NULL,NULL,NULL,2,35.8360000000,0.0000000000,35.8360000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(222,271,154,52.380,30,NULL,NULL,NULL,NULL,NULL,NULL,35,1921.9269600000,0.0000000000,1921.9269600000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(223,280,138,1060.000,60,NULL,NULL,NULL,NULL,NULL,NULL,2,43.4600000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(224,280,143,479.730,60,NULL,NULL,NULL,NULL,NULL,NULL,8,273.4461000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(225,280,155,1.560,60,NULL,NULL,NULL,NULL,NULL,NULL,2,288.6000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(226,280,142,26.000,60,NULL,NULL,NULL,NULL,NULL,NULL,7,62.1400000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(227,280,143,2067.568,60,NULL,NULL,NULL,NULL,NULL,NULL,8,1178.5137600000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(228,280,155,2.904,60,NULL,NULL,NULL,NULL,NULL,NULL,2,537.2400000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(229,280,156,132.000,60,NULL,NULL,NULL,NULL,NULL,NULL,9,241.2960000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(230,280,138,1518.000,60,NULL,NULL,NULL,NULL,NULL,NULL,2,62.2380000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(231,280,157,330.000,60,NULL,NULL,NULL,NULL,NULL,NULL,2,450.4500000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(232,280,158,7.500,25,NULL,NULL,NULL,NULL,NULL,NULL,36,307.5000000000,0.0000000000,430.5000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(233,280,159,4.000,50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,619.0000000000,0.0000000000,123.8000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(234,280,160,180.000,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,549.0000000000,0.0000000000,1098.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(235,280,161,6.000,50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,57.8400000000,0.0000000000,11.5680000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(236,280,150,48.320,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,37.7379200000,0.0000000000,37.7379200000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(237,280,162,153.000,60,NULL,NULL,NULL,NULL,NULL,NULL,7,217.2600000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(238,295,138,559.250,60,NULL,NULL,NULL,NULL,NULL,NULL,2,22.9292500000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(239,295,143,2054.054,60,NULL,NULL,NULL,NULL,NULL,NULL,8,1170.8107800000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(240,295,152,152.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17.3280000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(241,295,142,304.000,60,NULL,NULL,NULL,NULL,NULL,NULL,7,726.5600000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(242,299,138,300.000,60,NULL,NULL,NULL,NULL,NULL,NULL,2,12.3000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(243,299,149,294.037,60,NULL,NULL,NULL,NULL,NULL,NULL,36,287.8622230000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(244,299,139,20.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,29.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(245,302,163,31.050,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,196.9191000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(246,302,164,32.500,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28.4375000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(247,302,163,8.832,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,56.0125440000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(248,302,164,35.200,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30.8000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(249,302,165,6.840,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,171.7250400000,0.0000000000,171.7250400000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(250,302,166,13.750,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16.5687500000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(251,302,163,28.800,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,182.6496000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(252,302,166,14.400,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17.3520000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(253,302,165,3.000,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,75.3180000000,0.0000000000,75.3180000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(254,302,167,0.260,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49.1808200000,0.0000000000,49.1808200000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(255,302,168,100.000,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24.0000000000,0.0000000000,48.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(256,302,169,1.000,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28.4570000000,0.0000000000,56.9140000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(257,302,170,0.513,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,412.5017610000,0.0000000000,825.0035220000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(258,315,171,49.000,30,NULL,NULL,NULL,NULL,NULL,NULL,36,9.8000000000,0.0000000000,9.8000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(259,315,172,51.000,30,NULL,NULL,NULL,NULL,NULL,NULL,36,46.4610000000,0.0000000000,46.4610000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(260,315,173,57.000,30,NULL,NULL,NULL,NULL,NULL,NULL,36,30.8940000000,0.0000000000,30.8940000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(261,315,173,15.000,30,NULL,NULL,NULL,NULL,NULL,NULL,36,8.1300000000,0.0000000000,8.1300000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(262,315,171,10.000,30,NULL,NULL,NULL,NULL,NULL,NULL,36,2.0000000000,0.0000000000,2.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(263,315,172,2.400,30,NULL,NULL,NULL,NULL,NULL,NULL,36,2.1864000000,0.0000000000,2.1864000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(264,315,172,3.000,30,NULL,NULL,NULL,NULL,NULL,NULL,36,2.7330000000,0.0000000000,2.7330000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(265,315,171,6.000,30,NULL,NULL,NULL,NULL,NULL,NULL,36,1.2000000000,0.0000000000,1.2000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(266,315,171,9.000,30,NULL,NULL,NULL,NULL,NULL,NULL,36,1.8000000000,0.0000000000,1.8000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(267,315,174,7.000,30,NULL,NULL,NULL,NULL,NULL,NULL,36,104.3000000000,0.0000000000,104.3000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(268,315,175,1.000,30,NULL,NULL,NULL,NULL,NULL,NULL,36,0.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(269,315,176,1.000,30,NULL,NULL,NULL,NULL,NULL,NULL,36,2.4200000000,0.0000000000,2.4200000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(270,315,177,6.000,30,NULL,NULL,NULL,NULL,NULL,NULL,36,23.8800000000,0.0000000000,23.8800000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(271,315,178,3.000,30,NULL,NULL,NULL,NULL,NULL,NULL,36,83.1000000000,0.0000000000,83.1000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(272,315,180,1.000,30,NULL,NULL,NULL,NULL,NULL,NULL,36,3.9900000000,0.0000000000,3.9900000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(273,315,181,3.000,30,NULL,NULL,NULL,NULL,NULL,NULL,36,0.1410000000,0.0000000000,0.1410000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(274,315,174,7.000,30,NULL,NULL,NULL,NULL,NULL,NULL,36,104.3000000000,0.0000000000,104.3000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(275,315,174,1.000,30,NULL,NULL,NULL,NULL,NULL,NULL,36,14.9000000000,0.0000000000,14.9000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(276,315,182,0.400,30,NULL,NULL,NULL,NULL,NULL,NULL,37,10.4000000000,0.0000000000,10.4000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(277,315,183,6.000,30,NULL,NULL,NULL,NULL,NULL,NULL,36,64.8000000000,0.0000000000,64.8000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(278,315,179,7.000,30,NULL,NULL,NULL,NULL,NULL,NULL,36,11.5500000000,0.0000000000,11.5500000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(279,315,184,8.000,30,NULL,NULL,NULL,NULL,NULL,NULL,36,18.6880000000,0.0000000000,18.6880000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(280,315,182,0.200,30,NULL,NULL,NULL,NULL,NULL,NULL,37,5.2000000000,0.0000000000,5.2000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(281,315,185,500.000,30,NULL,NULL,NULL,NULL,NULL,NULL,36,198.0000000000,0.0000000000,198.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(282,315,186,250.000,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42.2500000000,0.0000000000,42.2500000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(283,315,185,300.000,30,NULL,NULL,NULL,NULL,NULL,NULL,36,118.8000000000,0.0000000000,118.8000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(284,341,187,115.000,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22920.7650000000,0.0000000000,22920.7650000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(285,342,188,16.000,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1658.0160000000,0.0000000000,3316.0320000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(286,342,189,2.000,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34.2020000000,0.0000000000,34.2020000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(287,342,190,2.000,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13.9120000000,0.0000000000,27.8240000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(288,342,191,1.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,650.5310000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(289,342,192,139.910,30,NULL,NULL,NULL,NULL,NULL,NULL,36,274.2236000000,0.0000000000,274.2236000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(290,342,192,20.000,30,NULL,NULL,NULL,NULL,NULL,NULL,36,39.2000000000,0.0000000000,39.2000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(291,342,139,30.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,43.5000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(292,342,193,10.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18.8400000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(293,355,194,31.900,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8333.5560000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(294,355,195,1263.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5317.2300000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(295,355,196,157.920,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,331.6320000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(296,355,197,1.045,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,21.1926000000,0.0000000000,63.5778000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(297,359,198,800.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1376.0000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(298,360,199,5691.600,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,512.2440000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(299,360,200,2480.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3695.2000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(300,360,201,3524.400,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1233.5400000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(301,360,202,334.640,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,702.7440000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(302,360,203,231.400,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,391.0660000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(303,365,204,243.540,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,31.6602000000,0.0000000000,31.6602000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(304,365,204,61.380,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7.9794000000,0.0000000000,7.9794000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(305,365,205,1522.500,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1659.5250000000,0.0000000000,1659.5250000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(306,368,206,540.000,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,588.6000000000,0.0000000000,588.6000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(307,368,207,995.280,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,636.9792000000,0.0000000000,636.9792000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(308,368,208,1.780,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,151.3000000000,0.0000000000,151.3000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(309,371,199,146.900,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13.2210000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(310,371,200,64.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,95.3600000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(311,371,201,362.700,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,126.9450000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(312,374,199,578.300,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,52.0470000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(313,374,200,252.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,375.4800000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(314,374,200,30.500,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45.4450000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(315,374,201,2106.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,737.1000000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(316,374,201,89.100,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,31.1850000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(317,379,205,62.500,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,68.1250000000,0.0000000000,68.1250000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(318,379,204,490.100,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,63.7130000000,0.0000000000,63.7130000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(319,381,209,2318.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1810.3580000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(320,382,199,1398.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,125.8200000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(321,382,200,749.600,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1116.9040000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(322,384,207,1279.980,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,819.1872000000,0.0000000000,819.1872000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(323,384,210,747.180,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,119.5488000000,0.0000000000,358.6464000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(324,386,201,873.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,305.5500000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(325,386,208,0.237,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20.1450000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(326,388,199,1666.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,149.9400000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(327,389,211,693.000,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,62.3700000000,0.0000000000,62.3700000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(328,389,212,1069.200,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,566.6760000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(329,389,213,632.394,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2662.3787400000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(330,389,214,158.860,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,333.6060000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(331,389,201,962.100,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,336.7350000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(332,394,215,18.420,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42.9186000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(333,394,198,98.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,168.5600000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(334,394,191,1.000,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,650.5310000000,0.0000000000,650.5310000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(335,394,216,1.000,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1526.0000000000,0.0000000000,3052.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(336,394,217,1.350,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,139.0500000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(337,399,218,26.067,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,165.3169140000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(338,399,218,12.000,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,76.1040000000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(339,399,218,18.667,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,118.3861140000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(340,399,218,44.667,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,283.2781140000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(341,399,218,26.667,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,169.1221140000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(342,399,218,2.667,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16.9141140000,0.0000000000,0.0000000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(343,405,187,69.000,40,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13752.4590000000,0.0000000000,6876.2295000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(344,405,219,8.300,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,750.7350000000,0.0000000000,1501.4700000000,0.0000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `materialInventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materials`
--

DROP TABLE IF EXISTS `materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `materials` (
  `idmaterials` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `dataType` enum('Generic','Specific','na') NOT NULL COMMENT 'Data is either Generic (typical value for product group) or specific (value for a certain product).',
  `sourceType` enum('EPD','PEP','Custom','Ecoinvent','Klimatre','EMPA','Other','na') NOT NULL COMMENT 'The data can come from an EPD (Environmental Product Declaration) or from an LCA database such as Ecoinvent or other.',
  `dataYear` year(4) DEFAULT NULL,
  `FU` enum('kg','m','m2','m3','pcs') NOT NULL COMMENT 'The funtional unit of the GWP A1-A3 for the material; can be either "kg", "m2", "m3", or "pcs" (pieces).',
  `density` decimal(10,3) DEFAULT NULL,
  `EEf_A1A3` decimal(10,3) NOT NULL,
  `RSL` tinyint(4) DEFAULT NULL COMMENT 'Reference Service Lifetime (years)',
  `comments` varchar(200) DEFAULT NULL,
  `idmaterialCat` int(11) NOT NULL,
  `idlocationproduction` int(11) DEFAULT NULL COMMENT 'Where the material is produced and transported from. Transport distance is from here to building site. Only applies here if the material dataType is ''Specific''. If dataType is ''Generic'' then location must be entered into materialinventory.',
  PRIMARY KEY (`idmaterials`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_materials_materialCat1_idx` (`idmaterialCat`),
  KEY `fk_materials_location1_idx` (`idlocationproduction`),
  CONSTRAINT `fk_materials_location1` FOREIGN KEY (`idlocationproduction`) REFERENCES `location` (`idlocation`),
  CONSTRAINT `fk_materials_materialCat1` FOREIGN KEY (`idmaterialCat`) REFERENCES `materialcat` (`idmaterialcat`)
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materials`
--

LOCK TABLES `materials` WRITE;
/*!40000 ALTER TABLE `materials` DISABLE KEYS */;
INSERT INTO `materials` VALUES (1,'Betong B30M60 Lavkarbon B Unicon Kongsberg','Specific','Custom',NULL,'m3',2400.000,218.590,NULL,'Prosjektspesifikk EPD for Flesberg skole',1,NULL),(2,'Armeringsstål, 100 % resirk','Specific','EPD',NULL,'kg',1.000,0.330,NULL,'http://epd.nsp01cp.nhosp.no/getfile.php/EPDer/Byggevarer/Betongvarer/NEPD-434-305-EN_Steel-reinforcement-products-for-concrete.pdf',4,NULL),(3,'Betong B30, lavkarbon klasse B','Generic','Other',NULL,'m3',2400.000,240.000,NULL,'http://www.byggutengrenser.no/filer/nedlasting/NB%2037%20-%20Lavkarbonbetong-16juni15.pdf',1,NULL),(4,'Massivtre','Specific','EPD',NULL,'m3',500.000,78.100,NULL,'Uoffisielle tall fra ny EPD',3,NULL),(5,'Royalimpregnert trelast','Specific','EPD',NULL,'m3',528.000,118.000,NULL,'http://epd.nsp01cp.nhosp.no/getfile.php/EPDer/Byggevarer/Heltreprodukter/294_Royalimpregnert-trelast.pdf',3,NULL),(6,'Vindu, 3-lags, åpningsbart, med aluminiumbeslag','Specific','EPD',NULL,'m2',37.354,88.585,NULL,'http://epd.nsp01cp.nhosp.no/getfile.php/EPDer/Byggevarer/D%C3%B8rer%20og%20vinduer/NEPD256E_NorDan-NTech-Fully-reversible-window-105-80.pdf',27,NULL),(7,'Glassfasade','Specific','EPD',NULL,'m2',26.698,85.000,NULL,'Snitt, schüco glassfasade',16,NULL),(8,'Rockwool Redair Flex isolasjon','Specific','EPD',NULL,'m3',63.800,75.514,NULL,'Comment',30,NULL),(9,'Konstruksjonstrevirke','Specific','EPD',NULL,'m3',360.000,53.000,NULL,'http://epd-norge.no/getfile.php/EPDer/Byggevarer/Heltreprodukter/NEPD-308-179-NO_Strutural-timber--Norwegian-version_no.pdf',3,NULL),(10,'Gips','Specific','EPD',NULL,'m3',720.000,212.800,NULL,'http://epd.nsp01cp.nhosp.no/getfile.php/EPDer/Byggevarer/Bygningsplater/NEPD-113-177-EN_Norgips-Standard-type-A.pdf',22,NULL),(11,'Keramisk flis + PP-membran','Specific','Custom',NULL,'m2',14.200,18.030,NULL,'Lagt til PP og flislim + sementmørtel, ref Oddbjørn:; https://epd-online.com/EmbeddedEpdList/Download/5596',15,NULL),(12,'Trekledning','Generic','Ecoinvent',NULL,'m3',13.440,2.490,NULL,'Ecoinvent, wood cladding RER',3,NULL),(13,'Glassull','Specific','EPD',NULL,'m3',16.500,21.143,NULL,'http://www.epd-norge.no/getfile.php/PDF/EPD/Byggevarer/NEPD%20221N%20Glava%20glass%20ull.pdf',30,NULL),(14,'Stålstender','Specific','EPD',NULL,'m',0.650,1.510,NULL,'http://epd-norge.no/getfile.php/EPDer/Byggevarer/Bygningsplater/NEPD00171N_rev1_ST-LPROFIL-TIL-INNERVEGG.pdf',4,NULL),(15,'Glass Front systemvegg','Specific','EPD',NULL,'m2',26.698,90.790,NULL,'http://epd.nsp01cp.nhosp.no/getfile.php/EPDer/Byggevarer/Bygningsplater/NEPD-331-214-NO_Glass-Front-systemvegg.pdf',41,NULL),(16,'Innerdør, tre','Specific','EPD',NULL,'m2',31.075,35.651,NULL,'http://epd-norge.no/doerer-og-vinduer/nordic-inner-door-without-frame-52x825x2040-mm-article1297-319.html',28,NULL),(17,'Innerdør, glass/tre','Generic','Ecoinvent',NULL,'m2',57.100,64.568,NULL,'Comment',28,NULL),(18,'Systemvegg, Loc Wall tettvegg 42 dB','Specific','EPD',NULL,'m2',29.115,23.600,NULL,'http://epd.nsp01cp.nhosp.no/getfile.php/EPDer/Byggevarer/Bygningsplater/NEPD-1197-370_Loc-Wall-systemvegg.pdf',41,NULL),(19,'Limtre','Specific','EPD',NULL,'m3',430.000,39.000,NULL,'http://epd.nsp01cp.nhosp.no/getfile.php/EPDer/Byggevarer/Heltreprodukter/NEPD-346-236-NO_Limtre.pdf',3,NULL),(20,'Stål, hulprofil','Specific','EPD',NULL,'kg',1.000,2.290,NULL,'http://www.epd-norge.no/getfile.php/PDF/EPD/Byggevarer/NEPD%2000253%20Cold-formed-welded-structural-hollow-sections-Type-31-GODKJENT.pdf',4,NULL),(21,'Stål, I, H, U, L, T profil','Specific','EPD',NULL,'kg',1.000,1.320,NULL,'http://epd.nsp01cp.nhosp.no/getfile.php/EPDer/Byggevarer/St%C3%A5lkonstruksjoner/81_Type-22--IHULT-and-wide-flats-selections.pdf',4,NULL),(22,'Betong B35M45 Lavkarbon B Unicon Kongsberg','Specific','Custom',NULL,'m3',2400.000,250.190,NULL,'Prosjektspesifikk EPD for Flesberg skole',1,NULL),(23,'Betong B25, lavkarbon klasse B','Generic','Other',NULL,'m3',2400.000,220.000,NULL,'http://www.byggutengrenser.no/filer/nedlasting/NB%2037%20-%20Lavkarbonbetong-16juni15.pdf',1,NULL),(24,'EPS Trykkfasthet 80','Specific','EPD',NULL,'m3',15.000,92.632,NULL,'http://www.epd-norge.no/getfile.php/PDF/EPD/Byggevarer/NEPD-322-185-NO%20EPS-isolasjon%20trykkfasthet-80%20rev-June-2015%20GK.pdf',11,NULL),(25,'XPS Sundolitt Trykkfasthet 250','na','na',NULL,'m3',27.273,100.909,NULL,'Comment',30,NULL),(26,'Himlingsplate, 50 mm, Troldtekt','Specific','EPD',NULL,'m2',15.000,3.120,NULL,'http://www.troldtekt.com/~/media/Files/EPD%20and%20DoPs/Troldtekt_EPD.pdf',41,NULL),(27,'Oppheng til himling','na','Custom',NULL,'m2',3.300,3.610,NULL,'Sammensatt',41,NULL),(28,'Systemhimling med glava 20 mm','Specific','EPD',NULL,'m2',83.300,5.682,NULL,'Comment',41,NULL),(29,'Systemhimling med glava 40 mm','na','na',NULL,'m2',83.300,7.680,NULL,'Comment',41,NULL),(30,'Vinyl','Specific','EPD',NULL,'m2',4.300,6.700,NULL,'https://epd-online.com/EmbeddedEpdList/Download/8437',23,NULL),(31,'Trinnlydplate Glava','Specific','EPD',NULL,'m3',66.000,84.571,NULL,'Skaleringsfaktor 4; http://epd.nsp01cp.nhosp.no/getfile.php/EPDer/Byggevarer/Isolasjon/NEPD-221N_Glava_glass_ull_no.pdf',41,NULL),(32,'Avrettingsmasse Hey\'di Propan Basic','Specific','EPD',NULL,'m3',1850.000,316.350,NULL,'http://epd.nsp01cp.nhosp.no/getfile.php/EPDer/Byggevarer/Sement/173_Avrettingsmasse--Proplan-Basic-og-Proplan-Fin----------------------------------------------------------------------------------.pdf',41,NULL),(33,'Asfaltpapp, dobbel','Specific','EPD',NULL,'m2',8.500,5.090,NULL,'http://epd.nsp01cp.nhosp.no/getfile.php/EPDer/Byggevarer/Takbelegg_membraner/NEPD269E_Multi-layer-fully-torched-modified-bitumen-roof-waterproofing-system.pdf',41,NULL),(34,'Lett-tak med 300 mm steinull','Specific','Custom',NULL,'m2',50.000,55.000,NULL,'http://lett-tak.no/wp-content/uploads/2014/07/Aasveien_skole_klimagassregnskap_Lett-Tak.pdf',41,NULL),(35,'Stål, 20% resirkulert','Generic','Ecoinvent',NULL,'kg',1.000,2.000,NULL,'Comment',4,NULL),(36,'Betong B35, lavkarbon klasse A','Generic','Other',NULL,'m3',2400.000,210.000,NULL,'http://www.byggutengrenser.no/filer/nedlasting/NB%2037%20-%20Lavkarbonbetong-16juni15.pdf',1,NULL),(37,'EPS','Specific','EPD',NULL,'m3',15.000,92.632,NULL,'http://www.epd-norge.no/getfile.php/PDF/EPD/Byggevarer/NEPD-322-185-NO%20EPS-isolasjon%20trykkfasthet-80%20rev-June-2015%20GK.pdf',11,NULL),(38,'Stål, HSQ-profil','Specific','EPD',NULL,'kg',1.000,2.870,NULL,'http://epd.nsp01cp.nhosp.no/getfile.php/EPDer/Byggevarer/St%C3%A5lkonstruksjoner/76_Type-12--Welded-plated-beams--like-hat-profile--HSQ-beam.pdf',4,NULL),(39,'Steinull Rockwool murplate','Specific','EPD',NULL,'m3',40.600,48.054,NULL,'Skaleringsfaktor 1,4; http://epd.nsp01cp.nhosp.no/getfile.php/EPDer/Byggevarer/Isolasjon/NEPD-00131E_rev1_ROCKWOOL-isolering%281%29.pdf',41,NULL),(40,'Vindsperre Nordgips Windliner','Specific','EPD',NULL,'m2',7.200,1.800,NULL,'http://epd.nsp01cp.nhosp.no/getfile.php/EPDer/Byggevarer/Bygningsplater/NEPD-109-177-EN_Norgips-Windliner-X-utvendig-X-type-EH2.pdf',32,NULL),(41,'Dampsperre Baca','Specific','EPD',NULL,'m2',0.163,0.424,NULL,'http://epd.nsp01cp.nhosp.no/getfile.php/EPDer/Byggevarer/Takbelegg_membraner/273N_Baca-Dampsperre.pdf',32,NULL),(42,'Stål, 0% resirkulert','Generic','Ecoinvent',NULL,'kg',1.000,2.320,NULL,'Comment',4,NULL),(43,'Ytterdør, tre/aluminium','Generic','Ecoinvent',NULL,'m2',57.100,125.041,NULL,'Comment',28,NULL),(44,'Ytterdør, glass/aluminium','Specific','EPD',NULL,'m2',48.500,104.000,NULL,'www.jansen.com%2Fen%2Fbuilding-systems%2Fdownload-centre%2Fcertificates%2Fdownload%2Fepd-tueren-212%2F&usg=AFQjCNGly-_JfgSEuQ4QIU-6VFKQB38Gkw&sig2=bHO99SBnKQnX16YZ-UiVwQ',28,NULL),(45,'Skyvedør, glass','Specific','EPD',NULL,'m2',34.102,105.876,NULL,'https://www.dormakaba.com/resource/blob/17246/6a88ba0da4aadecb38dd08a92cbeb3a1/epd-st-flex-green-en-data.pdf',28,NULL),(46,'Teglstein','Generic','Other',NULL,'m3',1850.000,444.000,NULL,'kgr.no',7,NULL),(47,'Fermacell fibergips','Specific','EPD',NULL,'m3',1180.000,586.400,NULL,'http://www.hunton.no/wp-content/uploads/2016/05/EPD-Fermacell_Gypsum_Fibreboard-1.pdf',22,NULL),(48,'Innerdør, stål','Specific','EPD',NULL,'m2',59.521,52.785,NULL,'Comment',28,NULL),(49,'Innerdør, glass/stål','Specific','EPD',NULL,'m2',48.500,104.000,NULL,'www.jansen.com%2Fen%2Fbuilding-systems%2Fdownload-centre%2Fcertificates%2Fdownload%2Fepd-tueren-212%2F&usg=AFQjCNGly-_JfgSEuQ4QIU-6VFKQB38Gkw&sig2=bHO99SBnKQnX16YZ-UiVwQ',28,NULL),(50,'Vindu, 1-lags, ikke åpningsbart, med aluminiumbeslag','Specific','EPD',NULL,'m2',12.268,27.468,NULL,'http://epd.nsp01cp.nhosp.no/getfile.php/EPDer/Byggevarer/D%C3%B8rer%20og%20vinduer/NEPD256E_NorDan-NTech-Fully-reversible-window-105-80.pdf',27,NULL),(51,'Treullsementplate, 25 mm, Troldtekt','Specific','EPD',NULL,'m2',9.700,2.018,NULL,'http://www.troldtekt.com/~/media/Files/EPD%20and%20DoPs/Troldtekt_EPD.pdf',41,NULL),(52,'Grønne sylomerklosser','Generic','Ecoinvent',NULL,'m2',0.099,0.488,NULL,'Ecoinvent, PUR, 4 puter per m2',11,NULL),(53,'Sponplate','Specific','EPD',NULL,'m3',660.000,196.000,NULL,'http://epd.nsp01cp.nhosp.no/getfile.php/EPDer/Byggevarer/Bygningsplater/274N_Forestia-sponplater.pdf',3,NULL),(54,'Påstøp','Generic','Other',NULL,'m3',2400.000,210.000,NULL,'Betong B35, lavkarbon klasse A (NBF Publikasjon 37)',1,NULL),(55,'Linoleum','Specific','EPD',NULL,'m2',2.900,2.600,NULL,'http://construction-environment.com/download/Cffb648dX13dea6483bcX24d6/EPD_ERF_2013811_E.pdf',13,NULL),(56,'Trinnlydsdempende belegg i kork','na','na',NULL,'m3',200.000,292.000,NULL,'Simapro, http://www.kork24.no/shop/37-vibrasjonsdempere-kork-isolasjon-korkfliser-hoey-tetthet/371-kork-termisk-og-lydisolering-isolasjonsplater-vegg-high-density-50x500x1000mm/',41,NULL),(57,'Lett-tak','Specific','Custom',NULL,'m2',55.000,62.000,NULL,'http://lett-tak.no/wp-content/uploads/2014/07/Aasveien_skole_klimagassregnskap_Lett-Tak.pdf',41,NULL),(58,'Betong B30, lavkarbon klasse A','Generic','Other',NULL,'m3',2400.000,200.000,NULL,'http://www.byggutengrenser.no/filer/nedlasting/NB%2037%20-%20Lavkarbonbetong-16juni15.pdf',1,NULL),(59,'PB2: Naturstein','na','na',NULL,'kg',1.000,1.654,NULL,'FutureBuilt Papirbredden 2',9,NULL),(60,'PB2: Aluvinduer','na','na',NULL,'kg',1.000,2.414,NULL,'FutureBuilt Papirbredden 2',27,NULL),(61,'PB2: Vinduer trekarm m/alubeslag','na','na',NULL,'kg',1.000,1.829,NULL,'FutureBuilt Papirbredden 2',27,NULL),(62,'PB2: Gips','na','na',NULL,'kg',1.000,0.397,NULL,'FutureBuilt Papirbredden 2',22,NULL),(63,'PB2: Isolasjon, Glava 350mm','na','na',NULL,'kg',1.000,0.967,NULL,'FutureBuilt Papirbredden 2',30,NULL),(64,'PB2: Tre','na','na',NULL,'kg',1.000,0.048,NULL,'FutureBuilt Papirbredden 2',3,NULL),(65,'PB2: Vind- /damp-sperre','na','na',NULL,'kg',1.000,1.928,NULL,'FutureBuilt Papirbredden 2',32,NULL),(66,'PB2: OSB-plate','na','na',NULL,'kg',1.000,0.446,NULL,'FutureBuilt Papirbredden 2',3,NULL),(67,'PB2: Tre + glass kontorfront','na','na',NULL,'kg',1.000,0.956,NULL,'FutureBuilt Papirbredden 2',41,NULL),(68,'PB2: Stålprofiler innvendige vegger','na','na',NULL,'kg',1.000,0.015,NULL,'FutureBuilt Papirbredden 2',4,NULL),(69,'PB2: Maling','na','na',NULL,'kg',1.000,2.628,NULL,'FutureBuilt Papirbredden 2',21,NULL),(70,'PB2: Himling, mineralull T-profil (glava aqx-venu)','na','na',NULL,'kg',1.000,1.011,NULL,'FutureBuilt Papirbredden 2',30,NULL),(71,'PB2: Himling, mineralull limt','na','na',NULL,'kg',1.000,0.967,NULL,'FutureBuilt Papirbredden 2',30,NULL),(72,'PB2: Linoleum (Forbo)','na','na',NULL,'kg',1.000,1.110,NULL,'FutureBuilt Papirbredden 2',13,NULL),(73,'PB2: Tepper (tiska tiara)','na','na',NULL,'kg',1.000,2.570,NULL,'FutureBuilt Papirbredden 2',35,NULL),(74,'PB2: Granitt','na','na',NULL,'kg',1.000,1.654,NULL,'FutureBuilt Papirbredden 2',12,NULL),(75,'PB2: Betong HD inkl terrazzo trapp (Vanlig) inkl armering','na','na',NULL,'kg',1.000,0.117,NULL,'FutureBuilt Papirbredden 2',1,NULL),(76,'PB2: Betong HDinkl terrazzo trapp (FA) inkl armering','na','na',NULL,'kg',1.000,0.115,NULL,'FutureBuilt Papirbredden 2',1,NULL),(77,'PB2: Takpapp,skråtak, 1 lag mono','na','na',NULL,'kg',1.000,1.430,NULL,'FutureBuilt Papirbredden 2',41,NULL),(78,'PB2: Takpapp terrasse, 1 lag base','na','na',NULL,'kg',1.000,1.240,NULL,'FutureBuilt Papirbredden 2',41,NULL),(79,'PB2: Takpapp terrasse, 1 lag top','na','na',NULL,'kg',1.000,1.375,NULL,'FutureBuilt Papirbredden 2',41,NULL),(80,'PB2: Isolasjon, rockwool','na','na',NULL,'kg',1.000,1.224,NULL,'FutureBuilt Papirbredden 2',30,NULL),(81,'PB2: Multicem','na','na',NULL,'kg',1.000,0.613,NULL,'FutureBuilt Papirbredden 2',2,NULL),(82,'PB2: Spunt','na','na',NULL,'kg',1.000,1.200,NULL,'FutureBuilt Papirbredden 2',4,NULL),(83,'PB2: Søyler og dragere FA','na','na',NULL,'kg',1.000,0.208,NULL,'FutureBuilt Papirbredden 2',41,NULL),(84,'PB2: Betong','na','na',NULL,'kg',1.000,0.136,NULL,'FutureBuilt Papirbredden 2',1,NULL),(85,'PB2: Armering','na','na',NULL,'kg',1.000,0.350,NULL,'FutureBuilt Papirbredden 2',41,NULL),(86,'PB2: Isolasjon EPS','na','na',NULL,'kg',1.000,4.196,NULL,'FutureBuilt Papirbredden 2',30,NULL),(87,'PB2: Bæresystem stål','na','na',NULL,'kg',1.000,0.850,NULL,'FutureBuilt Papirbredden 2',4,NULL),(88,'PB2: Søyler og dragere Vanlig','na','na',NULL,'kg',1.000,0.295,NULL,'FutureBuilt Papirbredden 2',41,NULL),(89,'concrete, normal, at plant/ CH/ m3','Generic','Ecoinvent',1997,'m3',2380.000,285.000,60,'Comment',1,36),(90,'polyvinylchloride, at regional storage/ RER/ kg','Generic','Ecoinvent',1998,'kg',1.000,2.010,60,'Comment',11,36),(91,'aluminium, production mix, at plant/ RER/ kg','Specific','na',1998,'kg',1.000,8.550,60,'Comment',14,26),(92,'polystyrene, extruded (XPS) CO2 blown, at plant/ RER/ kg','Generic','Ecoinvent',1994,'kg',1.000,3.860,60,'Comment',30,20),(93,'reinforcing steel, at plant/ RER/ kg','Generic','Ecoinvent',2000,'kg',1.000,1.450,60,'Comment',4,36),(94,'sawn timber, softwood, planed, air dried, at plant/ RER/ m3','Generic','Ecoinvent',1986,'m3',540.000,85.400,60,'Comment',3,NULL),(95,'glued laminated timber, indoor use, at plant/ RER/ m3','Generic','Ecoinvent',1986,'m3',500.000,205.000,60,'Comment',3,NULL),(96,'oriented strand board, at plant/ RER/ m3','Generic','Ecoinvent',2000,'m3',650.000,312.000,60,'Comment',3,NULL),(97,'plywood, indoor use, at plant/ RER/ m3','Generic','Ecoinvent',1996,'m3',650.000,498.000,30,'Comment',3,NULL),(98,'glass wool mat, at plant/ CH/ kg','Specific','na',1993,'kg',1.000,1.220,60,'Comment',30,NULL),(99,'polyethylene, HDPE, granulate, at plant/ RER/ kg','Generic','Ecoinvent',1999,'kg',1.000,1.930,60,'Comment',32,NULL),(100,'polypropylene, granulate, at plant/ RER/ kg','Generic','Ecoinvent',1999,'kg',1.000,1.970,60,'Comment',32,NULL),(101,'ceramic tiles, at regional storage/ CH/ kg','Generic','Ecoinvent',1998,'kg',1.000,0.780,20,'Comment',15,NULL),(102,'chromium steel 18/8, at plant/ RER/ kg','Generic','Ecoinvent',2001,'kg',1.000,4.500,40,'Comment',4,NULL),(103,'steel, converter, unalloyed, at plant/ RER/ kg','Generic','Ecoinvent',2012,'kg',1.000,1.610,40,'Comment',4,NULL),(104,'glass fibre reinforced plastic, polyamide, injection moulding, at plant/ RER/ kg','Generic','Ecoinvent',2000,'kg',1.000,8.790,60,'Comment',11,NULL),(105,'synthetic rubber, at plant/ RER/ kg','Generic','Ecoinvent',1995,'kg',1.000,2.650,40,'Comment',24,NULL),(106,'acrylonitrile-butadiene-styrene copolymer, ABS, at plant/ RER/ kg','Generic','Ecoinvent',2012,'kg',1.000,4.390,40,'Comment',11,NULL),(107,'powder coating, aluminium sheet/ RER/ m2','Generic','Ecoinvent',2012,'m2',NULL,3.780,40,'Comment',21,NULL),(108,'flat glass, coated, at plant/ RER/ kg','Generic','Ecoinvent',2000,'kg',1.000,1.090,60,'Comment',16,NULL),(109,'argon, liquid, at plant/ RER/ kg','Generic','Ecoinvent',1997,'kg',1.000,0.310,NULL,'Comment',17,NULL),(110,'sealing tape, aluminum/PE, 50 mm wide, at plant/ RER/ m','Generic','Ecoinvent',2003,'m',NULL,0.268,30,'Comment',14,NULL),(111,'expanded perlite, at plant/ CH/ kg','Generic','Ecoinvent',2012,'kg',1.000,1.000,30,'Comment',16,NULL),(112,'polystyrene, expandable, at plant/ RER/ kg','Generic','Ecoinvent',2001,'kg',1.000,3.380,30,'Comment',11,NULL),(113,'anhydrite floor, at plant/ CH/ kg','Generic','Ecoinvent',2000,'kg',1.000,0.043,30,'Comment',17,NULL),(114,'bitumen adhesive compound, hot, at plant/ RER/ kg','Specific','Custom',1994,'kg',1.000,0.600,60,'Comment',33,NULL),(115,'textile, woven cotton, at plant/ GLO/ kg','Generic','Ecoinvent',2005,'kg',1.000,24.800,60,'Comment',25,NULL),(116,'bitumen seal, alu80, production / RER / kg','Generic','Ecoinvent',1994,'kg',1.000,2.030,60,'Comment',14,NULL),(117,'Polyurethane, flexible foam, at plant / RER / kg','Generic','Ecoinvent',1997,'kg',1.000,4.310,60,'Comment',11,NULL),(118,'paraffin, at plant/ RER/ kg','Generic','Ecoinvent',2012,'kg',1.000,0.830,60,'Comment',26,NULL),(119,'sawn timber, hardwood, planed, air / kiln dried, u=10%, at plant/ RER/ m3','Generic','Ecoinvent',1986,'m3',540.000,63.900,60,'Comment',3,NULL),(120,'sanitary ceramics, at regional storage/ CH/ kg','Generic','Ecoinvent',1998,'kg',1.000,1.020,60,'Comment',15,NULL),(121,'ethylene, pipeline system, at plant/ RER/ kg','Generic','Ecoinvent',2012,'kg',1.000,1.460,60,'Comment',41,NULL),(122,'flat plate collector, at plant/ CH/ m2','Generic','Ecoinvent',2001,'m2',39.000,104.000,60,'Density is uncertain because weight formula in excel is wrong',38,NULL),(123,'hot water tank 600l, at plant/ CH/ unit','Generic','Ecoinvent',2012,'pcs',95.000,326.000,60,'Comment',40,NULL),(124,'heat pump 30kW/ RER/ unit','Generic','Ecoinvent',2012,'pcs',150.000,505.000,60,'Comment',39,NULL),(125,'flexible duct, aluminum/PET, DN of 125, at plant/ RER/ m','Generic','Ecoinvent',2003,'m',0.170,1.380,60,'Comment',36,NULL),(126,'air distribution housing, steel, 120 m3/h, at plant/ CH/ unit','Generic','Ecoinvent',2003,'pcs',67.000,30.500,60,'Comment',4,NULL),(127,'supply air inlet, steel/SS, DN 75, at plant/ RER/ unit','Generic','Ecoinvent',2003,'pcs',0.300,11.200,60,'Comment',4,NULL),(128,'exhaust air valve, in-wall housing, plastic/steel, DN 125, at plant/ CH/ unit','Generic','Ecoinvent',2003,'pcs',0.300,2.090,60,'Comment',36,NULL),(129,'exhaust air outlet, steel/aluminum, 85x365 mm, at plant/ CH/ unit','Generic','Ecoinvent',2003,'pcs',0.500,16.700,60,'Comment',36,NULL),(130,'outside air intake, stainless steel, DN 370, at plant/ RER/ unit','Generic','Ecoinvent',2003,'pcs',0.500,197.000,60,'Comment',4,NULL),(131,'plugs, inlet and outlet, for computer cable, at plant/ GLO/ unit','Generic','Ecoinvent',2006,'pcs',1.300,0.328,60,'Comment',36,NULL),(132,'photovoltaic panel, multi-Si, at plant/ ROW/ m2','Generic','Ecoinvent',2005,'m2',18.000,129.000,30,'Density is uncertain because weight formula in excel is wrong',37,NULL),(133,'electronic component, unspecified, at plant/ GLO/ kg','Generic','Ecoinvent',2012,'kg',1.000,64.500,30,'Comment',36,NULL),(134,'cable, three-conductor cable / GLO / m','Generic','Ecoinvent',2005,'m',0.086,4.380,30,'Comment',36,NULL),(135,'Low carbon concrete type B','Specific','EPD',2014,'m3',NULL,235.000,NULL,'Comment',2,16),(136,'Celca Steel Service OY, EPD: Reinforcement','Specific','EPD',2011,'kg',NULL,0.390,NULL,'100% scrap-based steel',4,19),(137,'Gluelaminated beam from Moelven (EPD-Mikado)','Specific','EPD',2007,'m3',500.000,43.440,NULL,'Comment',3,15),(138,'Tømmer produksjon, MIKADO, med interntransport','Specific','EPD',2009,'kg',NULL,0.041,NULL,'http://www.epd-norge.no/getfile.php/PDF/EPD/Byggevarer/NEPD084N%20rev1%20H%C3%B8vellast.pdf',3,2),(139,'Steel, low-alloyed, at plant/RER U','Generic','Ecoinvent',NULL,'kg',1.000,1.450,NULL,'Comment',4,NULL),(140,'Glasroc storm EPD','Specific','EPD',2012,'m2',NULL,2.640,NULL,'EPD- NO 227D',19,2),(141,'UV wind barrier Isola PET','Generic','Ecoinvent',NULL,'m2',0.195,0.338,NULL,'Based on SINTEF Technical approval number 2043, where it is stated that the weight is 195 grams/m2, and the PET foil weigh 60 grams/m2 and that the UV also has carbon fiber.',32,10),(142,'12,5 plasterboard gyproc','Specific','EPD',2010,'m2',NULL,2.390,NULL,'http://www.epd-norge.no/getfile.php/PDF/EPD/Byggevarer/NEPD223GyprocGN13.pdf',19,7),(143,'Glava, EPDnr 221: Glass wool, Cradle-to-gate','Specific','EPD',2005,'m2',16.600,0.570,NULL,'www.epd-norge.no',30,8),(144,'EPD-Norwegian timber cladding painted','Specific','EPD',2009,'m2',NULL,2.124,NULL,'EPD- NO 137N',3,2),(145,'Brick wall  (old reused bricks)','Generic','EPD',NULL,'m2',NULL,0.000,NULL,'No emissions from production',20,NULL),(146,'Door, outer, wood-glass, at plant/RER U','Generic','Ecoinvent',NULL,'m2',NULL,89.514,NULL,'Comment',28,NULL),(147,'Glazing, triple (3-IV), U<0.5 W/m2K, at plant/RER U ZEB','Generic','Ecoinvent',2009,'m2',NULL,56.800,NULL,'Comment',16,35),(148,'Window frame, wood-metal, U=1.6 W/m2K, at plant/RER U','Generic','Ecoinvent',2010,'m2',NULL,245.000,NULL,'Comment',3,35),(149,'Flat glass, uncoated, at plant/RER U (of project KlimaTre - yttervegg)','Generic','Klimatre',NULL,'kg',1.000,0.979,NULL,'Comment',16,36),(150,'Ceramic tiles, at regional storage/CH U','Generic','Ecoinvent',NULL,'kg',NULL,0.781,NULL,'Comment',15,NULL),(151,'Alkyd paint, white, 60% in H2O, at plant/RER U','Generic','Ecoinvent',2003,'m2',NULL,0.712,NULL,'Comment',21,36),(152,'Vapour barrier','Generic','Ecoinvent',2010,'m2',0.139,0.114,NULL,'0,139 kg/m2 (15mm) is taken from http://www.icopal.no/Produkter/Dampsperre.aspx',11,NULL),(153,'Inner panel timber (Norwegian)','Generic','EPD',2010,'m2',7.000,0.400,NULL,'EPD E 085; NB! To grave',3,2),(154,'Door, inner, wood, at plant/RER U','Generic','Ecoinvent',2007,'m2',30.000,36.692,NULL,'comment',3,35),(155,'Fibreboard - Forrestia 2011- Analysis Kari Sørnes','Specific','Custom',2011,'m3',765.000,185.000,NULL,'(Forestia, 2012)',3,2),(156,'Hunton, EPD: Asphalt wind barrier','Specific','EPD',2008,'m2',4.860,1.828,NULL,'www.epd-norge.no',18,9),(157,'Norwegian I-beam from Byggma EPD','Specific','EPD',2009,'m',NULL,1.365,NULL,'http://www.masonite.no/media/93306/EPD88N-I-bjelke.pdf; 400 millimeter high, Included - raw materials, production and 50 of transport emissions from the EPD',3,2),(158,'Expanded Polystyrene (EPS) Foam Insulation','Specific','EPD',2011,'m3',15.000,41.000,NULL,'ECO-EPS-00050101-1106 ',30,36),(159,'XPS - Extruded Polystyrene Foam','Specific','EPD',NULL,'m3',34.000,154.750,NULL,'http://bau-umwelt.de/download/C2cb5f20aX138928500d0X6962/EPD_FPX_2010111_E.pdf?ITServ=CY1f3ceb6X139c3f2661aX6fad',30,NULL),(160,'Laminate flooring EGGER Flooring EPD 2011','Specific','EPD',NULL,'m2',NULL,3.050,NULL,'P O Box 750, DK-9100 Aalborg',34,NULL),(161,'Carpet- EPD-BauUmwelt Desso - 100 % PA6  fra nov. 2011','Specific','EPD',2011,'m2',0.400,9.640,NULL,'EPD-CEM-2012111-E Declaration number',34,NULL),(162,'Gyproc Gypsum Rehab 6,5 millimeter','Specific','EPD',2010,'m2',5.600,1.420,NULL,'http://www.epd-norge.no/getfile.php/PDF/EPD/Byggevarer/NEPD222GyprocGN6.pdf',22,7),(163,'Ventilation duct, steel, 100x50 mm, at plant/RER U ZEB','Generic','Ecoinvent',2007,'m',1.500,6.342,NULL,'comment',4,NULL),(164,'Connection piece, steel, 100x50 mm, at plant/RER U','Generic','Ecoinvent',NULL,'pcs',0.200,0.875,NULL,'comment',4,NULL),(165,'Silencer, steel, DN 125, at plant/CH U','Generic','Ecoinvent',NULL,'pcs',8.300,25.106,NULL,'Comment',4,NULL),(166,'Elbow 90°, steel, 100x50 mm, at plant/RER U','Generic','Ecoinvent',NULL,'pcs',0.270,1.205,NULL,'Comment',4,NULL),(167,'Outside air intake, stainless steel, DN 370, at plant/RER U','Specific','Ecoinvent',NULL,'pcs',32.000,189.157,NULL,'Comment',4,NULL),(168,'Sealing tape, aluminum/PE, 50 mm wide, at plant/RER U','Generic','Ecoinvent',NULL,'m',NULL,0.240,NULL,'comment',14,NULL),(169,'Control and wiring, central unit, at plant/RER U','Generic','Ecoinvent',NULL,'pcs',4.200,28.457,NULL,'comment',36,NULL),(170,'Ventilation equipment, central, 600-1200 m3/h, at plant/RER U','Generic','Ecoinvent',NULL,'pcs',142.000,804.097,NULL,'comment',36,NULL),(171,'Exxact Frames - Schneider Electrics (steel frame)','Specific','PEP',2010,'pcs',0.025,0.200,NULL,'http://ecatalogue.schneider-electric.no/ProductSheet.aspx?productId=1348714&groupid=144472&navid=65533&navoption=6',4,36),(172,'Exxact 2-stikk m/j+bv 1,5 sk a Schneider Electrics (stikkkontakt)','Specific','PEP',2010,'pcs',0.110,0.911,NULL,'comment',36,36),(173,'Multifix flush mounted boxes (Schneider Electrics)','Specific','PEP',2013,'pcs',NULL,0.542,NULL,'comment',36,36),(174,'Exxact KNX push-buttons Schneider Electrics','Specific','PEP',2010,'pcs',0.105,14.900,NULL,'comment',36,36),(175,'Push-Button Interfaces','Specific','PEP',2010,'pcs',0.028,0.000,NULL,'http://ecatalogue.schneider-electric.no/ProductSheet.aspx?productId=729894&groupid=154845&navid=81056&navoption=6',36,36),(176,'KNX ARGUS Presence pw','Specific','PEP',2013,'pcs',0.195,2.420,NULL,'http://ecatalogue.schneider-electric.no/ProductSheet.aspx?productId=729808&groupid=154814&navid=81054&navoption=6',36,36),(177,'Exxact Movement Detectors (PIRs)','Specific','PEP',2010,'pcs',0.125,3.980,NULL,'http://ecatalogue.schneider-electric.no/ProductSheet.aspx?productId=1348895&groupid=144604&navid=57993&navoption=6',36,36),(178,'KNX DALI-Gateway REG-K/1/16(64)/64/IP1','Specific','PEP',2012,'pcs',0.251,27.700,NULL,'http://ecatalogue.schneider-electric.no/ProductSheet.aspx?productId=3655074&groupid=154791&navid=81052&navoption=6',36,36),(179,'Exxact Connect RF push-buttons','Specific','PEP',2010,'pcs',0.110,1.650,NULL,'Schneider Electric Industries SAS',36,36),(180,'KNX flush mounted Actuators','Specific','PEP',2014,'pcs',0.150,3.990,NULL,'comment',36,36),(181,'KNX Switch Actuators','Specific','PEP',2012,'pcs',0.550,0.047,NULL,'http://ecatalogue.schneider-electric.no/ProductSheet.aspx?productId=729858&groupid=154831&navid=81068&navoption=6',36,36),(182,'Electronics for control units /RER /U','Generic','Ecoinvent',2007,'kg',1.000,26.000,NULL,'comment',36,37),(183,'KNX CO2-, Humidity and Temperature sensors','Specific','PEP',2014,'pcs',0.150,10.800,NULL,'Schneider Electric Industries SAS',36,36),(184,'KNX LOGIC MODUL BASIC REG-K REF: 676090 OR MTN676090','Specific','PEP',2009,'pcs',0.122,2.336,NULL,'Schneider Electric Industries SAS',36,36),(185,'100 meter Cable from Ole Erik Berges Master Thesis (see Figure Below, Figure is how ever 100 m)','Generic','Custom',NULL,'m',1.000,0.396,NULL,'Ole Erik Berget Master Thesis, HiOA, 2013',36,36),(186,'Cable, data cable in infrastructure, at plant/GLO U','Generic','Ecoinvent',NULL,'m',0.060,0.169,NULL,'comment',36,NULL),(187,'Photovoltaic panel, single-Si, at plant/RER/I U','Generic','Ecoinvent',NULL,'m2',NULL,199.311,NULL,'comment',37,NULL),(188,'Flat plate collector, at plant/CH/I U','Generic','Ecoinvent',NULL,'m2',NULL,103.626,NULL,'comment',38,NULL),(189,'Expansion vessel 25l, at plant/CH/I U','Generic','Ecoinvent',NULL,'pcs',NULL,17.101,NULL,'comment',36,NULL),(190,'Pump 40W, at plant/CH/I U','Generic','Ecoinvent',NULL,'pcs',NULL,6.956,NULL,'comment',36,NULL),(191,'Hot water tank 600l, at plant/CH/I U','Generic','Ecoinvent',NULL,'pcs',NULL,650.531,NULL,'comment',40,NULL),(192,'High densitiy polyethylene (EPD-Plastics Europe)','Specific','EPD',2008,'kg',NULL,1.960,NULL,'http://www.plasticseurope.org/Documents/Document/20100312112214-FINAL_HDPE_280409-20081215-017-EN-v1.pdf',11,36),(193,'Copper, at regional storage/RER U','Generic','Ecoinvent',NULL,'kg',NULL,1.884,NULL,'comment',6,NULL),(194,'Concrete, normal, at plant/CH U ZEB','Generic','Ecoinvent',NULL,'m3',2380.000,261.240,NULL,'comment',1,NULL),(195,'Polystyrene foam slab, at plant/RER','Generic','Ecoinvent',NULL,'kg',1.000,4.210,NULL,'comment',11,NULL),(196,'Plastic polyethylene (LDPE)','Generic','Ecoinvent',NULL,'kg',1.000,2.100,NULL,'comment',11,NULL),(197,'Massivholz Buche, Eiche, kammergetrocknet, gehobelt (EMPA)','Generic','EMPA',NULL,'m3',715.000,20.280,NULL,'comment',3,NULL),(198,'Steel, low-alloyed, at plant/RER U ZEB','Generic','Ecoinvent',NULL,'kg',1.000,1.720,NULL,'comment',4,NULL),(199,'Massivholz Fichte / Tanne / Lärche, Skandinavien, sägerau, entrindet (EMPA - row 297)','Generic','EMPA',NULL,'kg',1.000,0.090,NULL,'comment',3,NULL),(200,'Glass wool mat, at plant/CH U ZEB and Glava EPD','Generic','Ecoinvent',NULL,'kg',1.000,1.490,NULL,'comment',30,NULL),(201,'Gypsum plaster board, at plant/CH U ZEB and Norgips EPD','Generic','Ecoinvent',NULL,'kg',1.000,0.350,NULL,'comment',19,NULL),(202,'Polyethylene,LDPE, granulate, at plant/RERU','Generic','Ecoinvent',NULL,'kg',1.000,2.100,NULL,'comment',32,NULL),(203,'Wind barrier (kraftpapier - okologische EMPA)','Generic','EMPA',NULL,'kg',1.000,1.690,NULL,'comment',32,NULL),(204,'Massivholz Fichte / Tanne / Lärche Schweiz, kammergetrocknet, gehobelt','Generic','EMPA',NULL,'kg',1.000,0.130,NULL,'comment',3,NULL),(205,'Flat glass, coated, at plant/RER U','Generic','Ecoinvent',NULL,'kg',1.000,1.090,NULL,'comment',16,NULL),(206,'EPD- Cembrit Etna True- Fiber cement  To gate -Finland - 2012  (Data input EMPA Faserzementplatte gross','Generic','EMPA',NULL,'kg',1.000,1.090,NULL,'comment',2,NULL),(207,'medium density fibreboard, at plant/m3/RER (okologische EMPA)','Generic','EMPA',NULL,'kg',1.000,0.640,NULL,'comment',3,NULL),(208,'Sawn timber, softwood, planed, air dried, at plant / RER U','Generic','Ecoinvent',NULL,'m3',500.000,85.000,NULL,'comment',3,NULL),(209,'Ceramic tiles, at regional storage / CH U','Generic','Ecoinvent',NULL,'kg',1.000,0.781,NULL,'comment',15,NULL),(210,'Planed timber, softwood, at plant/ NO U or Massivholz Buche, Eiche, kammergetrocknet, gehobelt (EMPA)','Generic','EMPA',NULL,'kg',1.000,0.160,NULL,'comment',3,NULL),(211,'Asfalt (ATB) (Asphaltdeckschicht - EMPA row 438)','Generic','EMPA',NULL,'kg',1.000,0.090,NULL,'comment',10,NULL),(212,'OSB/ 3 plate (15mm) (EMPA row 299)','Generic','EMPA',NULL,'kg',1.000,0.530,NULL,'comment',3,NULL),(213,'EPS 400mm (0,036 W/Mk) (EMPA row 336)','Generic','EMPA',NULL,'kg',1.000,4.210,NULL,'comment',30,NULL),(214,'PE Foil (0,2mm) Tyvek el. tilsvarende','na','na',NULL,'kg',1.000,2.100,NULL,'comment',32,NULL),(215,'PEX - High density polyethylene (HDPE)','na','na',NULL,'kg',1.000,2.330,NULL,'comment',11,NULL),(216,'Bosch EHP 7 LW/M','Specific','Other',NULL,'pcs',NULL,1526.000,NULL,'comment',39,NULL),(217,'Refrigirator fluid (R-407)','na','na',NULL,'kg',1.000,103.000,NULL,'comment',41,NULL),(218,'Ventilation duct, steel, 100x50 mm, at plant/RER U','Generic','Ecoinvent',NULL,'m',1.500,6.342,NULL,'comment',4,NULL),(219,'Evacuated tube collector, at plant','Generic','Ecoinvent',NULL,'m2',NULL,90.450,NULL,'comment',38,NULL);
/*!40000 ALTER TABLE `materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typology`
--

DROP TABLE IF EXISTS `typology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `typology` (
  `idtypology` int(11) NOT NULL AUTO_INCREMENT,
  `typology` varchar(45) NOT NULL COMMENT 'Each building has a building type (typology), ie. residential, office, educational...',
  PRIMARY KEY (`idtypology`),
  UNIQUE KEY `typology_UNIQUE` (`typology`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typology`
--

LOCK TABLES `typology` WRITE;
/*!40000 ALTER TABLE `typology` DISABLE KEYS */;
INSERT INTO `typology` VALUES (4,'kindergarden'),(2,'office'),(1,'residential'),(3,'school'),(6,'swimming hall'),(5,'university');
/*!40000 ALTER TABLE `typology` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'bLCAd'
--
/*!50003 DROP PROCEDURE IF EXISTS `calculate_all_leafbuildingElements` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `calculate_all_leafbuildingElements`( in ibuilding int(11) )
BEGIN
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- Calculate the leaf buildingElements as the sum of its materials -- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
DECLARE done INT DEFAULT 0;
DECLARE beID int(11);
DECLARE cur CURSOR FOR
    SELECT idbuilding_elements
    FROM buildingElements
    WHERE idbuildings=ibuilding;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

OPEN cur;

read_loop: LOOP
 
    FETCH cur INTO beID;  -- Fetch one record from CURSOR and set to some variable(If not found then done will be set to 1 by continue handler)
    IF done THEN
        LEAVE read_loop;  -- If done set to 1 then exit the loop else continue
    END IF;
 
    /* Do work */
    CALL calculate_leafBuildingElements(beID);
 
END LOOP;
CLOSE cur; -- Closing the cursor

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `calculate_all_parentbuildingElements` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `calculate_all_parentbuildingElements`( 	in ibuilding int(11),
															in ihierarchy tinyint(4))
BEGIN
-- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Calculate the parent buildingElemtents -- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- --
declare dparentID int(11);
declare didparent int(11);

DECLARE done INT DEFAULT 0;
DECLARE beID int(11);
DECLARE cur CURSOR FOR
    SELECT be.idbuilding_elements
    FROM buildingElements be
    JOIN levels l on be.idlevels=l.idlevels
    WHERE be.idbuildings=ibuilding
    AND l.hierarchy=ihierarchy; -- choosing all existing building elements for a hierarchy and building

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
OPEN cur;

read_loop: LOOP

    FETCH cur INTO beID;  -- Fetch one record from CURSOR and set to some variable(If not found then done will be set to 1 by continue handler)
    IF done THEN
        LEAVE read_loop;  -- If done set to 1 then exit the loop else continue
    END IF;
 
 
-- need this separete begin/end with c"ontinue handler for not found" so that loop will continue and not terminate prematurely
begin 
	declare continue handler for not found begin end;
    /* Do work */
    -- select parent idlevel
    select  l.idparent
    into didparent
	from buildingElements ch
	join levels l on ch.idlevels=l.idlevels
	where ch.idbuilding_elements = beID;
    
-- BEGIN COMMENT: This chunk can probably be replaced by an INSERT ... ON DUPLICATE ENTRY UPDATE ...
    -- select parent ID for building element, NULL if does not exist
    set dparentID=NULL; -- reseting to NULL for new beID before check
    
    select pa.idbuilding_elements
    into dparentID
	from buildingElements pa
	join levels l on pa.idlevels=l.idparent
	join buildingElements ch on ch.idlevels=l.idlevels
	where ch.idbuilding_elements = beID
    and pa.idbuildings=ibuilding;

    -- create parent if not exists, calculate parent
    IF dparentID is null THEN
		
		INSERT INTO buildingElements (idbuildings, idlevels)
        VALUES (ibuilding, didparent);
        
        select pa.idbuilding_elements
		into dparentID
		from buildingElements pa
		join levels l on pa.idlevels=l.idparent
		join buildingElements ch on ch.idlevels=l.idlevels
		where ch.idbuilding_elements = beID
		and pa.idbuildings=ibuilding;
        
        CALL calculate_parentBuildingElements(dparentID);
    
	ELSE
		CALL calculate_parentBuildingElements(dparentID);
    END IF;
end;
-- END COMMENT.
    
END LOOP read_loop;
CLOSE cur; -- Closing the cursor

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `calculate_building` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `calculate_building`( in ibuilding_identifier varchar(45) )
BEGIN

DECLARE dbuilding int(11);
SELECT idbuildings INTO dbuilding FROM buildings WHERE building_identifier=ibuilding_identifier;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- Calculate the leaf buildingElements as the sum of its materials -- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
/* Select all building elements for a specified building and do the following for all
CALL calculate_leafBuildingElements(ibuilding_element);
When a materialInventory is inserted, the building element is created, therefore it exists and can be found as belonging to the building.
Iterate through the building's buildingElements and run the calculation for all in no particular order.
*/
CALL calculate_all_leafbuildingElements(dbuilding);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Calculate the parent buildingElemtents from lowest level to highest -- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  --
/* Calculates all the parents of all existing building elements by calling: 
CALL calculate_parentbuildingElements(ibuilding_element);
Building elements exist if (1) material inventory was inserted or if (2) building element results was inserted.
If parent building element does not exist it will be created.
Starts with hierarchy 3, then 2, then 1.
 */
CALL calculate_all_parentbuildingElements(dbuilding,3);
CALL calculate_all_parentbuildingElements(dbuilding,2);
CALL calculate_all_parentbuildingElements(dbuilding,1);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `calculate_leafbuildingElements` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `calculate_leafbuildingElements`(	in ibuilding_element int(11)
													)
BEGIN
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Declaring the variables to be used in the calculation -- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
declare sumA1A3mi decimal(20,10); 
declare sumA4mi decimal(20,10);
declare sumB4_mmi decimal(20,10);
declare sumB4_tmi decimal(20,10);

declare sumA5mi decimal(20,10);
declare sumB1mi decimal(20,10);
declare sumB2mi decimal(20,10);
declare sumB3mi decimal(20,10);
declare sumB5mi decimal(20,10);
declare sumC1mi decimal(20,10);
declare sumC2mi decimal(20,10);
declare sumC3mi decimal(20,10);
declare sumC4mi decimal(20,10);
declare sumD1mi decimal(20,10);
declare sumD2mi decimal(20,10);
declare sumD3mi decimal(20,10);
declare sumD4mi decimal(20,10);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Calculate the building elemtent as the sum of its materials -- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
select 	sum(mi.A1A3), sum(mi.A4), sum(mi.B4_m), sum(mi.B4_t),
		sum(mi.A5), sum(mi.B1), sum(mi.B2), sum(mi.B3), sum(mi.B5), 
		sum(mi.C1), sum(mi.C2), sum(mi.C3), sum(mi.C4), 
		sum(mi.D1), sum(mi.D2), sum(mi.D3), sum(mi.D4)
into 	sumA1A3mi, sumA4mi, sumB4_mmi, sumB4_tmi,
		sumA5mi, sumB1mi, sumB2mi, sumB3mi, sumB5mi,
		sumC1mi, sumC2mi, sumC3mi, sumC4mi,
		sumD1mi, sumD2mi, sumD3mi, sumD4mi  
from 	materialInventory mi
where 	mi.idbuilding_elements=ibuilding_element;

-- -- -- -- -- -- -- -- -- --
-- Update  building element -- 
-- -- -- -- -- -- -- -- -- --
-- inserting / updating these values into the building element
update 	buildingElements be
set 	be.A1A3 = IF(sumA1A3mi is not null, sumA1A3mi, be.A1A3),
		be.A4 = IF(sumA4mi is not null, sumA4mi, be.A4),
		be.B4_m = IF(sumB4_mmi is not null, sumB4_mmi, be.B4_m),
        be.B4_t = IF(sumB4_tmi is not null, sumB4_tmi, be.B4_t),
        
        be.A5 = IF(sumA5mi is not null, sumA5mi, be.A5),
        be.B1 = IF(sumB1mi is not null, sumB1mi, be.B1),
        be.B2 = IF(sumB2mi is not null, sumB2mi, be.B2),
        be.B3 = IF(sumB3mi is not null, sumB3mi, be.B3),
        be.B5 = IF(sumB5mi is not null, sumB5mi, be.B5),
        be.C1 = IF(sumC1mi is not null, sumC1mi, be.C1),
        be.C2 = IF(sumC2mi is not null, sumC2mi, be.C2),
        be.C3 = IF(sumC3mi is not null, sumC3mi, be.C3),
        be.C4 = IF(sumC4mi is not null, sumC4mi, be.C4),
        be.D1 = IF(sumD1mi is not null, sumD1mi, be.D1),
        be.D2 = IF(sumD2mi is not null, sumD2mi, be.D2),
        be.D3 = IF(sumD3mi is not null, sumD3mi, be.D3),
        be.D4 = IF(sumD4mi is not null, sumD4mi, be.D4)

where 	be.idbuilding_elements=ibuilding_element;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `calculate_parentbuildingElements` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `calculate_parentbuildingElements`(	in ibuilding_element int(11)
                                                    )
BEGIN
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Declaring the variables to be used in the calculation -- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
declare sumA1A3ch decimal(20,10);
declare sumA4ch decimal(20,10);
declare sumB4_mch decimal(20,10);
declare sumB4_tch decimal(20,10);

declare sumA5ch decimal(20,10);
declare sumB1ch decimal(20,10);
declare sumB2ch decimal(20,10);
declare sumB3ch decimal(20,10);
declare sumB5ch decimal(20,10);
declare sumC1ch decimal(20,10);
declare sumC2ch decimal(20,10);
declare sumC3ch decimal(20,10);
declare sumC4ch decimal(20,10);
declare sumD1ch decimal(20,10);
declare sumD2ch decimal(20,10);
declare sumD3ch decimal(20,10);
declare sumD4ch decimal(20,10);

declare ibuilding int(11);
declare ilevels int(11);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Importing values into the declared variables -- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
select 	idbuildings, idlevels 
into 	ibuilding, ilevels
from 	buildingelements
where 	idbuilding_elements=ibuilding_element;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Calculate the parent as sum of children -- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- --
select 	sum(be.A1A3), sum(be.A4), sum(be.B4_m), sum(be.B4_t),
        sum(be.A5), sum(be.B1), sum(be.B2), sum(be.B3), sum(be.B5),
        sum(be.C1), sum(be.C2), sum(be.C3), sum(be.C4),
        sum(be.D1), sum(be.D2), sum(be.D3), sum(be.D4)
into 	sumA1A3ch, sumA4ch, sumB4_mch, sumB4_tch,
		sumA5ch, sumB1ch, sumB2ch, sumB3ch, sumB5ch,
		sumC1ch, sumC2ch, sumC3ch, sumC4ch,
		sumD1ch, sumD2ch, sumD3ch, sumD4ch
from 	buildingElements be
join 	levels l on be.idlevels=l.idlevels
where 	l.idparent=ilevels
and 	be.idbuildings=ibuilding;

-- -- -- -- -- -- --
-- Update  parent -- 
-- -- -- -- -- -- --
-- inserting / updating these values into the building element

UPDATE 	buildingElements be
SET 	be.A1A3 = IF(sumA1A3ch is not null, sumA1A3ch, be.A1A3),
		be.A4 = IF(sumA4ch is not null, sumA4ch, be.A4),
		be.B4_m = IF(sumB4_mch is not null, sumB4_mch, be.B4_m),
        be.B4_t = IF(sumB4_tch is not null, sumB4_tch, be.B4_t),

        be.A5 = IF(sumA5ch is not null, sumA5ch, be.A5),
        be.B1 = IF(sumB1ch is not null, sumB1ch, be.B1),
        be.B2 = IF(sumB2ch is not null, sumB2ch, be.B2),
        be.B3 = IF(sumB3ch is not null, sumB3ch, be.B3),
        be.B5 = IF(sumB5ch is not null, sumB5ch, be.B5),
        be.C1 = IF(sumC1ch is not null, sumC1ch, be.C1),
        be.C2 = IF(sumC2ch is not null, sumC2ch, be.C2),
        be.C3 = IF(sumC3ch is not null, sumC3ch, be.C3),
        be.C4 = IF(sumC4ch is not null, sumC4ch, be.C4),
        be.D1 = IF(sumD1ch is not null, sumD1ch, be.D1),
        be.D2 = IF(sumD2ch is not null, sumD2ch, be.D2),
        be.D3 = IF(sumD3ch is not null, sumD3ch, be.D3),
        be.D4 = IF(sumD4ch is not null, sumD4ch, be.D4)

WHERE 	be.idbuilding_elements=ibuilding_element;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_building` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_building`(	in ibuilding_identifier varchar(45),
										in ibuilding_name varchar(45),
                                        in iproject varchar(45),
										in icalculation_method varchar(45),
                                        in imain_data_source enum('EPD','Ecoinvent','Mixed'),
                                        in istudy_type enum('published research','unpublished research','industry, certification'), 
                                        in istudy_year year,
										in ilifetime int(11),
										in ifloor_area int(11),
										in iheated_volume int(11),
                                        in iarea_footprint int(11),
										in iarea_roof int(11),
										in iarea_wall int(11),
										in iarea_windowAndDoor int(11),
										
										in iheatloss_number decimal(10,5),
										in iuval_walls decimal(4,3),
										in iuval_windows decimal(4,3),
										in iuval_doors decimal(4,3),
										in iuval_ground decimal(4,3),
										in iuval_roof decimal(4,3),
										in ithermal_bridges decimal(4,3),

										in iGWP_B6 decimal(10,5),
										in iGWP_B7 decimal(10,5),
										in istoriesAB int(11),
										in istoriesBG int(11),
										in icomments varchar(1000),
										in itypology varchar(45),
										in iconstruction_type varchar(45),
                                        in icountry varchar(45),
										in icity varchar(45),
										in ibuilt_status varchar(45),
										in ienergy_ambition_level varchar(45)
										)
BEGIN
-- -- -- -- -- -- -- 
-- Insert values --
-- -- -- -- -- -- -- 
INSERT INTO buildings
(
	building_identifier, 
    building_name,
    project,
    calculation_method,
    main_data_source,
    study_type,
    study_year,
    lifetime, 
    floor_area, 
    heated_volume, 
    area_footprint,
	area_roof, 
    area_wall, 
    area_windowAndDoor, 
    
    heatloss_number, 
	uval_walls,
	uval_windows,
	uval_doors,
	uval_ground,
	uval_roof,
	thermal_bridges,

    GWP_B6, 
    GWP_B7, 
    storiesAB, 
    storiesBG, 
    comments, 
	idtypology, 
    idconstruction_type,
    idlocation,
    idbuilt_status,
    idenergy_ambition_level)
VALUES 
(

    ibuilding_identifier,
    ibuilding_name, 
    iproject,
    icalculation_method,
	imain_data_source,
	istudy_type,
    istudy_year,
	ilifetime, 
	ifloor_area, 
	iheated_volume, 
    iarea_footprint,
	iarea_roof, 
    iarea_wall, 
	iarea_windowAndDoor, 
	
	iheatloss_number, 
	iuval_walls,
	iuval_windows,
	iuval_doors,
	iuval_ground,
	iuval_roof,
	ithermal_bridges,
	
	iGWP_B6,
	iGWP_B7, 
	istoriesAB, 
	istoriesBG, 
    icomments, 
    (SELECT idtypology from typology t where t.typology=itypology),
	(SELECT idconstruction_type from constructiontype c where c.construction_type=iconstruction_type),
	(SELECT idlocation from location l where l.country=icountry and l.city=icity),
	(SELECT idbuilt_status from builtstatus b where b.built_status=ibuilt_status),
	(SELECT idenergy_ambition_level from energyambitionlevel e where e.energy_ambition_level=ienergy_ambition_level)
);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_GWP_BE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_GWP_BE`(	in ibuilding_identifier varchar(45),
										in ilevel int(11),
                                        in iA1A3 decimal(20,10),
                                        in iA4 decimal(20,10),
                                        in iB4_m decimal(20,10),
                                        in iB4_t decimal(20,10),

                                        in iA5 decimal(20,10),
                                        in iB1 decimal(20,10),
                                        in iB2 decimal(20,10),
                                        in iB3 decimal(20,10),
                                        in iB5 decimal(20,10),
                                        in iC1 decimal(20,10),
                                        in iC2 decimal(20,10),
                                        in iC3 decimal(20,10),
                                        in iC4 decimal(20,10),
                                        in iD1 decimal(20,10),
                                        in iD2 decimal(20,10),
                                        in iD3 decimal(20,10),
                                        in iD4 decimal(20,10)
									)
BEGIN
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Insert building element with emission values --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
INSERT INTO buildingelements (idbuildings, idlevels, A1A3, A4, A5, B4_m, B4_t,
                                                        B1,B2,B3,B5,
                                                        C1,C2,C3,C4,
                                                        D1,D2,D3,D4)
	VALUES (
				(
                SELECT idbuildings FROM buildings WHERE building_identifier=
                /*identifier*/ ibuilding_identifier
                ),
				/*idlevels*/	ilevel,
                
                /*A1A3*/ 		iA1A3,
                /*A4*/ 			iA4,
                /*A5*/ 			iA5,
                /*B4*/ 			iB4_m, iB4_t,
                                iB1,iB2,iB3,iB5,
                                iC1,iC2,iC3,iC4,
                                iD1,iD2,iD3,iD4
            )
	ON DUPLICATE KEY UPDATE A1A3=iA1A3, A4=iA4, A5=iA5, B4_m=iB4_m, B4_t=iB4_t,
                            B1=iB1,B2=iB2,B3=iB3,B5=iB5,
                            C1=iC1,C2=iC2,C3=iC3,C4=iC4,
                            D1=iD1,D2=iD2,D3=iD3,D4=iD4 ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_material` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_material`(	in iname varchar(200),
										in idataType enum('Generic','Specific','na'),
                                        in isourceType enum('EPD','PEP','Custom','Ecoinvent','Klimatre', 'EMPA','Other','na'),
                                        in idataYear year(4),
                                        in iFU enum('kg','m','m2','m3','pcs'),
                                        in idensity decimal(10,3),
                                        in iEEf_A1A3 decimal(10,3),
                                        in iRSL tinyint(4),
                                        in icomments varchar(200),
                                        in imaterialCat varchar(45),
                                        in ilocationproduction_country varchar(45),
                                        in ilocationproduction_city varchar(45)
									)
BEGIN
-- -- -- -- -- -- -- 
-- Insert values --
-- -- -- -- -- -- -- 
INSERT INTO materials (name, dataType, sourceType, dataYear, FU, density, EEf_A1A3, RSL, comments, idmaterialCat, idlocationproduction)
VALUES (iname,idataType,isourceType,idataYear,iFU,idensity,iEEf_A1A3,iRSL,icomments,
		(SELECT mc.idmaterialCat FROM materialCat mc WHERE mc.materialCat=imaterialCat),
        (SELECT l.idlocation FROM location l WHERE l.country=ilocationproduction_country AND l.city=ilocationproduction_city)
        );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_materialInventory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_materialInventory`(	in ibuilding_identifier varchar(45),
												in ilevel int(11),
												in inameMaterial varchar(200),
												
                                                in iquantity decimal(10,3), # Must be in the unit of the material
                                                in iFU enum('kg', 'm', 'm2','m3','pcs'),
                                                
                                                in iRSL tinyint(4),
                                                
                                                in inameT1 varchar(100),
												in idistance_T1 int(11), 
                                                
                                                in inameT2 varchar(100),
												in idistance_T2 int(11), 
                                                
                                                in inameT3 varchar(100),
												in idistance_T3 int(11),
                                                
                                                in iA5 decimal(20,10), # This one is uncertain, to be determined
                                                in iB1 decimal(20,10),
		                                        in iB2 decimal(20,10),
		                                        in iB3 decimal(20,10),
		                                        in iB5 decimal(20,10),
		                                        in iC1 decimal(20,10),
		                                        in iC2 decimal(20,10),
		                                        in iC3 decimal(20,10),
		                                        in iC4 decimal(20,10),
		                                        in iD1 decimal(20,10),
		                                        in iD2 decimal(20,10),
		                                        in iD3 decimal(20,10),
		                                        in iD4 decimal(20,10),
												
                                                in ilocationproduction_country varchar(45),
												in ilocationproduction_city varchar(45)
												)
this_proc:BEGIN
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Declaring the variables to be used in the calculation --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
declare dmaterial int(11);
declare dFU enum('kg','m','m2','m3','pcs');
declare ddensity decimal(10,3);
declare dRSL tinyint(4);
declare dlifetime int(11);
declare dA1A3_mat decimal(10,3);
declare ddataType enum('Generic','Specific','na');
declare didlocationproduction int(11);

declare dbuilding_element int(11);

declare didGWP_T1 int(11);
declare didGWP_T2 int(11);
declare didGWP_T3 int(11);

declare dGWP_T1 decimal(10,5);
declare dGWP_T2 decimal(10,5);
declare dGWP_T3 decimal(10,5);

declare dB4_factor decimal(20,10);
declare dB4_m decimal(20,10);
declare dB4_t decimal(20,10);

declare dA4_T1 decimal(20,10);
declare dA4_T2 decimal(20,10);
declare dA4_T3 decimal(20,10);

declare dA1A3 decimal(20,10);
declare dA4 decimal(20,10);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Importing values into the declared variables and controlling for wrong values --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- find idmaterial based on nameMaterial
-- import other values from materials table
SELECT 	m.idmaterials, m.FU,  m.EEf_A1A3, m.density, m.RSL, m.dataType, m.idlocationproduction
INTO 	dmaterial, dFU, dA1A3_mat, ddensity, dRSL, ddataType, didlocationproduction
FROM 	materials m
WHERE 	m.name=inameMaterial;

-- overwrite RSL if it exists in materialInventory (if entered in MI it will be prioritized over value in materials)
if iRSL is not null THEN
	set dRSL=iRSL;
END IF;

-- check that the unit is the same as in the material
	# check that dFU=iFU, if it is not then abort procedure and write error message
IF dFU NOT LIKE iFU THEN
	select concat('ERROR: Inventory not added. The unit of this entry: "',inameMaterial,'" is not the same as the unit of the material.');
	LEAVE this_proc;
END IF;

-- idlocationproduction
	# if idlocationproduction_country and city are given as inputs, then they are used for the idlocationproduction
    # if they are not given then the value from materials table will be used
		# if the material dataType is 'Generic' then the idlocationproduction must be entered into the material inventory
		# if the material dataType is 'Specific' AND values are entered in material inventory then a warning message will be printed
    # NB: idlocationproduction is not used in calculations, is only used for information storage
#IF idlocationproduction_country is not NULL THEN
IF  ilocationproduction_country IS NOT NULL AND ilocationproduction_city IS NOT NULL THEN
	set didlocationproduction = (SELECT l.idlocation FROM location l WHERE l.country=ilocationproduction_country AND l.city=ilocationproduction_city);
    IF ddataType = 'Specific' THEN
		select concat('dataType for material "',inameMaterial,'" is Specific but locationproduction is overwritten since values are entered for location');
	END IF;
END IF;

-- create the building element iff it does not already exist
INSERT INTO buildingelements (idbuildings, idlevels)
	VALUES ((SELECT idbuildings FROM buildings WHERE building_identifier=ibuilding_identifier),	ilevel)
	ON DUPLICATE KEY UPDATE idlevels=ilevel;

-- find idbuilding_elements based on building and level
SELECT 	be.idbuilding_elements, b.lifetime
INTO 	dbuilding_element, dlifetime
FROM 	buildingElements be
JOIN 	buildings b ON be.idbuildings=b.idbuildings
WHERE 	b.building_identifier=ibuilding_identifier
AND 	be.idlevels=ilevel;

-- find idGWP_transport 1/2/3 based on inameT 1/2/3
SELECT gwt.idGWP_transport INTO didGWP_T1 FROM gwp_transport gwt WHERE gwt.name=inameT1;
	-- check if transport name exist
	IF didGWP_T1 is NULL and idistance_T1 is not NULL THEN
		select concat('ERROR: Inventory not added. The transport name: "',inameT1,'" does not exist, and there is a distance entered for this transport.');
		LEAVE this_proc;
	END IF;
SELECT gwt.idGWP_transport INTO didGWP_T2 FROM gwp_transport gwt WHERE gwt.name=inameT2;
	-- check if transport name exist
	IF didGWP_T2 is NULL and idistance_T2 is not NULL THEN
		select concat('ERROR: Inventory not added. The transport name: "',inameT2,'" does not exist, and there is a distance entered for this transport.');
		LEAVE this_proc;
	END IF;
SELECT gwt.idGWP_transport INTO didGWP_T3 FROM gwp_transport gwt WHERE gwt.name=inameT3;
	-- check if transport name exist
	IF didGWP_T3 is NULL and idistance_T3 is not NULL THEN
		select concat('ERROR: Inventory not added. The transport name: "',inameT3,'" does not exist, and there is a distance entered for this transport.');
		LEAVE this_proc;
	END IF;


-- -- -- -- -- -- -- -- -- -- --
-- Calculate emission values --
-- -- -- -- -- -- -- -- -- -- --
-- calculate A1A3 --
-- -- -- -- -- --  --
SET dA1A3 = dA1A3_mat * iquantity;

-- calculate A4 --
-- -- -- -- -- --
# If there is a value in the transport 1/2/3 id, then select the emission factor from the GWP_transport table
# and calculate the transport 1/2/3 as emission factor [GWP/(t*km)] * 1/1000 [t/kg] * distance [km] * quantity [unit] * density [kg/unit] = [GWP]
IF coalesce(didGWP_T1,0) > 0 THEN
	SELECT gwt.GWPper_tkm into dGWP_T1
	FROM  gwp_transport gwt
	WHERE gwt.idGWP_transport = didGWP_T1;
	SET dA4_T1 = dGWP_T1 * idistance_T1* iquantity * ddensity * 0.001;
END IF;
IF coalesce(didGWP_T2,0) > 0 THEN
	SELECT gwt.GWPper_tkm into dGWP_T2
	FROM  gwp_transport gwt
	WHERE gwt.idGWP_transport = didGWP_T2;
	SET dA4_T2 = dGWP_T2 * idistance_T2* iquantity * ddensity * 0.001;
END IF;
IF coalesce(didGWP_T3,0) > 0 THEN
	SELECT gwt.GWPper_tkm into dGWP_T3
	FROM  gwp_transport gwt
	WHERE gwt.idGWP_transport = didGWP_T3;
	SET dA4_T3 = dGWP_T3 * idistance_T3* iquantity * ddensity * 0.001;
END IF;

SET dA4 = (coalesce(dA4_T1,0) + coalesce(dA4_T2,0) + coalesce(dA4_T3,0));

-- calculate B4 --
-- -- -- -- -- -- 
# Calculating it if the material life is shorter than the building life. If is is equal to or larger then it is set to zero, and if does not exist then it is set to NULL.
IF dRSL < dlifetime THEN
	set dB4_factor = 	dlifetime/dRSL -1 ;
	set dB4_m = 		dA1A3 * dB4_factor;
	
	set dB4_t = dA4 * dB4_factor;
ELSEIF dRSL = NULL THEN
	set dB4_m = NULL;
    set dB4_t = NULL;
ELSE
	set dB4_m = 0;
    set dB4_t = 0;
END IF;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Insert material in inventory with calculated emission values --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
INSERT INTO materialInventory (	idbuilding_elements, idmaterials, quantity, RSL_mi,
								idGWP_transport1, transport1_distance,
                                idGWP_transport2, transport2_distance,
								idGWP_transport3, transport3_distance,
								A1A3, A4, A5, B4_m, B4_t,

								B1,B2,B3,B5,C1,C2,C3,C4,D1,D2,D3,D4,

                                idlocationproduction
                                )
VALUES (						dbuilding_element, dmaterial, iquantity, iRSL,
								didGWP_T1, idistance_T1,
								didGWP_T2, idistance_T2,
								didGWP_T3, idistance_T3,
								dA1A3, dA4, iA5, dB4_m, dB4_t,

								iB1,iB2,iB3,iB5,iC1,iC2,iC3,iC4,iD1,iD2,iD3,iD4,

                                didlocationproduction
								);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-01 15:27:06
