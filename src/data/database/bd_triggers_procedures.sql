CREATE DATABASE  IF NOT EXISTS `projeto_ong` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `projeto_ong`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: projeto_ong
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `idAddress` int NOT NULL AUTO_INCREMENT,
  `publicPlace` varchar(100) NOT NULL,
  `neighborhood` varchar(50) NOT NULL,
  `number` varchar(10) NOT NULL,
  `complement` varchar(100) DEFAULT NULL,
  `States_idState` int NOT NULL,
  `Cities_idCity` int NOT NULL,
  PRIMARY KEY (`idAddress`),
  KEY `fk_Addresses_States1_idx` (`States_idState`),
  KEY `fk_Addresses_Cities1_idx` (`Cities_idCity`),
  CONSTRAINT `fk_Addresses_Cities1` FOREIGN KEY (`Cities_idCity`) REFERENCES `cities` (`idCity`),
  CONSTRAINT `fk_Addresses_States1` FOREIGN KEY (`States_idState`) REFERENCES `states` (`idState`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (2,'123 Main St','Downtown','456','Apartment 2A',1,10),(3,'123 Main St','Downtown','456','Apartment 2A',1,10),(4,'123 Main St','Downtown','456','Apartment 2A',1,10);
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adoptions`
--

DROP TABLE IF EXISTS `adoptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adoptions` (
  `idAdoption` int NOT NULL AUTO_INCREMENT,
  `dateAdoption` date NOT NULL,
  `statusAdoption` varchar(50) NOT NULL,
  `Animals_idAnimal` int NOT NULL,
  `Users_idUser` int NOT NULL,
  PRIMARY KEY (`idAdoption`),
  KEY `fk_Adoptions_Animals1_idx` (`Animals_idAnimal`),
  KEY `fk_Adoptions_Users1_idx` (`Users_idUser`),
  CONSTRAINT `fk_Adoptions_Animals1` FOREIGN KEY (`Animals_idAnimal`) REFERENCES `animals` (`idAnimal`),
  CONSTRAINT `fk_Adoptions_Users1` FOREIGN KEY (`Users_idUser`) REFERENCES `users` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adoptions`
--

LOCK TABLES `adoptions` WRITE;
/*!40000 ALTER TABLE `adoptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `adoptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animals`
--

DROP TABLE IF EXISTS `animals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animals` (
  `idAnimal` int NOT NULL AUTO_INCREMENT,
  `nameAnimal` varchar(50) DEFAULT NULL,
  `size` varchar(50) NOT NULL,
  `statusAnimal` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `Species_idSpecies` int NOT NULL,
  `Races_idRace` int NOT NULL,
  PRIMARY KEY (`idAnimal`),
  KEY `fk_Animals_Species1_idx` (`Species_idSpecies`),
  KEY `fk_Animals_Races1_idx` (`Races_idRace`),
  CONSTRAINT `fk_Animals_Races1` FOREIGN KEY (`Races_idRace`) REFERENCES `races` (`idRace`),
  CONSTRAINT `fk_Animals_Species1` FOREIGN KEY (`Species_idSpecies`) REFERENCES `species` (`idSpecies`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animals`
--

LOCK TABLES `animals` WRITE;
/*!40000 ALTER TABLE `animals` DISABLE KEYS */;
/*!40000 ALTER TABLE `animals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `idCity` int NOT NULL AUTO_INCREMENT,
  `nameCity` varchar(100) NOT NULL,
  `States_idState` int NOT NULL,
  PRIMARY KEY (`idCity`),
  KEY `fk_Cities_States1_idx` (`States_idState`),
  CONSTRAINT `fk_Cities_States1` FOREIGN KEY (`States_idState`) REFERENCES `states` (`idState`)
) ENGINE=InnoDB AUTO_INCREMENT=5571 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Alta Floresta D\'Oeste',22),(2,'Ariquemes',22),(3,'Cabixi',22),(4,'Cacoal',22),(5,'Cerejeiras',22),(6,'Colorado do Oeste',22),(7,'Corumbiara',22),(8,'Costa Marques',22),(9,'Espigão D\'Oeste',22),(10,'Guajará-Mirim',22),(11,'Jaru',22),(12,'Ji-Paraná',22),(13,'Machadinho D\'Oeste',22),(14,'Nova Brasilândia D\'Oeste',22),(15,'Ouro Preto do Oeste',22),(16,'Pimenta Bueno',22),(17,'Porto Velho',22),(18,'Presidente Médici',22),(19,'Rio Crespo',22),(20,'Rolim de Moura',22),(21,'Santa Luzia D\'Oeste',22),(22,'Vilhena',22),(23,'São Miguel do Guaporé',22),(24,'Nova Mamoré',22),(25,'Alvorada D\'Oeste',22),(26,'Alto Alegre dos Parecis',22),(27,'Alto Paraíso',22),(28,'Buritis',22),(29,'Novo Horizonte do Oeste',22),(30,'Cacaulândia',22),(31,'Campo Novo de Rondônia',22),(32,'Candeias do Jamari',22),(33,'Castanheiras',22),(34,'Chupinguaia',22),(35,'Cujubim',22),(36,'Governador Jorge Teixeira',22),(37,'Itapuã do Oeste',22),(38,'Ministro Andreazza',22),(39,'Mirante da Serra',22),(40,'Monte Negro',22),(41,'Nova União',22),(42,'Parecis',22),(43,'Pimenteiras do Oeste',22),(44,'Primavera de Rondônia',22),(45,'São Felipe D\'Oeste',22),(46,'São Francisco do Guaporé',22),(47,'Seringueiras',22),(48,'Teixeirópolis',22),(49,'Theobroma',22),(50,'Urupá',22),(51,'Vale do Anari',22),(52,'Vale do Paraíso',22),(53,'Acrelândia',1),(54,'Assis Brasil',1),(55,'Brasiléia',1),(56,'Bujari',1),(57,'Capixaba',1),(58,'Cruzeiro do Sul',1),(59,'Epitaciolândia',1),(60,'Feijó',1),(61,'Jordão',1),(62,'Mâncio Lima',1),(63,'Manoel Urbano',1),(64,'Marechal Thaumaturgo',1),(65,'Plácido de Castro',1),(66,'Porto Walter',1),(67,'Rio Branco',1),(68,'Rodrigues Alves',1),(69,'Santa Rosa do Purus',1),(70,'Senador Guiomard',1),(71,'Sena Madureira',1),(72,'Tarauacá',1),(73,'Xapuri',1),(74,'Porto Acre',1),(75,'Alvarães',4),(76,'Amaturá',4),(77,'Anamã',4),(78,'Anori',4),(79,'Apuí',4),(80,'Atalaia do Norte',4),(81,'Autazes',4),(82,'Barcelos',4),(83,'Barreirinha',4),(84,'Benjamin Constant',4),(85,'Beruri',4),(86,'Boa Vista do Ramos',4),(87,'Boca do Acre',4),(88,'Borba',4),(89,'Caapiranga',4),(90,'Canutama',4),(91,'Carauari',4),(92,'Careiro',4),(93,'Careiro da Várzea',4),(94,'Coari',4),(95,'Codajás',4),(96,'Eirunepé',4),(97,'Envira',4),(98,'Fonte Boa',4),(99,'Guajará',4),(100,'Humaitá',4),(101,'Ipixuna',4),(102,'Iranduba',4),(103,'Itacoatiara',4),(104,'Itamarati',4),(105,'Itapiranga',4),(106,'Japurá',4),(107,'Juruá',4),(108,'Jutaí',4),(109,'Lábrea',4),(110,'Manacapuru',4),(111,'Manaquiri',4),(112,'Manaus',4),(113,'Manicoré',4),(114,'Maraã',4),(115,'Maués',4),(116,'Nhamundá',4),(117,'Nova Olinda do Norte',4),(118,'Novo Airão',4),(119,'Novo Aripuanã',4),(120,'Parintins',4),(121,'Pauini',4),(122,'Presidente Figueiredo',4),(123,'Rio Preto da Eva',4),(124,'Santa Isabel do Rio Negro',4),(125,'Santo Antônio do Içá',4),(126,'São Gabriel da Cachoeira',4),(127,'São Paulo de Olivença',4),(128,'São Sebastião do Uatumã',4),(129,'Silves',4),(130,'Tabatinga',4),(131,'Tapauá',4),(132,'Tefé',4),(133,'Tonantins',4),(134,'Uarini',4),(135,'Urucará',4),(136,'Urucurituba',4),(137,'Amajari',23),(138,'Alto Alegre',23),(139,'Boa Vista',23),(140,'Bonfim',23),(141,'Cantá',23),(142,'Caracaraí',23),(143,'Caroebe',23),(144,'Iracema',23),(145,'Mucajaí',23),(146,'Normandia',23),(147,'Pacaraima',23),(148,'Rorainópolis',23),(149,'São João da Baliza',23),(150,'São Luiz',23),(151,'Uiramutã',23),(152,'Abaetetuba',14),(153,'Abel Figueiredo',14),(154,'Acará',14),(155,'Afuá',14),(156,'Água Azul do Norte',14),(157,'Alenquer',14),(158,'Almeirim',14),(159,'Altamira',14),(160,'Anajás',14),(161,'Ananindeua',14),(162,'Anapu',14),(163,'Augusto Corrêa',14),(164,'Aurora do Pará',14),(165,'Aveiro',14),(166,'Bagre',14),(167,'Baião',14),(168,'Bannach',14),(169,'Barcarena',14),(170,'Belém',14),(171,'Belterra',14),(172,'Benevides',14),(173,'Bom Jesus do Tocantins',14),(174,'Bonito',14),(175,'Bragança',14),(176,'Brasil Novo',14),(177,'Brejo Grande do Araguaia',14),(178,'Breu Branco',14),(179,'Breves',14),(180,'Bujaru',14),(181,'Cachoeira do Piriá',14),(182,'Cachoeira do Arari',14),(183,'Cametá',14),(184,'Canaã dos Carajás',14),(185,'Capanema',14),(186,'Capitão Poço',14),(187,'Castanhal',14),(188,'Chaves',14),(189,'Colares',14),(190,'Conceição do Araguaia',14),(191,'Concórdia do Pará',14),(192,'Cumaru do Norte',14),(193,'Curionópolis',14),(194,'Curralinho',14),(195,'Curuá',14),(196,'Curuçá',14),(197,'Dom Eliseu',14),(198,'Eldorado dos Carajás',14),(199,'Faro',14),(200,'Floresta do Araguaia',14),(201,'Garrafão do Norte',14),(202,'Goianésia do Pará',14),(203,'Gurupá',14),(204,'Igarapé-Açu',14),(205,'Igarapé-Miri',14),(206,'Inhangapi',14),(207,'Ipixuna do Pará',14),(208,'Irituia',14),(209,'Itaituba',14),(210,'Itupiranga',14),(211,'Jacareacanga',14),(212,'Jacundá',14),(213,'Juruti',14),(214,'Limoeiro do Ajuru',14),(215,'Mãe do Rio',14),(216,'Magalhães Barata',14),(217,'Marabá',14),(218,'Maracanã',14),(219,'Marapanim',14),(220,'Marituba',14),(221,'Medicilândia',14),(222,'Melgaço',14),(223,'Mocajuba',14),(224,'Moju',14),(225,'Mojuí dos Campos',14),(226,'Monte Alegre',14),(227,'Muaná',14),(228,'Nova Esperança do Piriá',14),(229,'Nova Ipixuna',14),(230,'Nova Timboteua',14),(231,'Novo Progresso',14),(232,'Novo Repartimento',14),(233,'Óbidos',14),(234,'Oeiras do Pará',14),(235,'Oriximiná',14),(236,'Ourém',14),(237,'Ourilândia do Norte',14),(238,'Pacajá',14),(239,'Palestina do Pará',14),(240,'Paragominas',14),(241,'Parauapebas',14),(242,'Pau D\'Arco',14),(243,'Peixe-Boi',14),(244,'Piçarra',14),(245,'Placas',14),(246,'Ponta de Pedras',14),(247,'Portel',14),(248,'Porto de Moz',14),(249,'Prainha',14),(250,'Primavera',14),(251,'Quatipuru',14),(252,'Redenção',14),(253,'Rio Maria',14),(254,'Rondon do Pará',14),(255,'Rurópolis',14),(256,'Salinópolis',14),(257,'Salvaterra',14),(258,'Santa Bárbara do Pará',14),(259,'Santa Cruz do Arari',14),(260,'Santa Isabel do Pará',14),(261,'Santa Luzia do Pará',14),(262,'Santa Maria das Barreiras',14),(263,'Santa Maria do Pará',14),(264,'Santana do Araguaia',14),(265,'Santarém',14),(266,'Santarém Novo',14),(267,'Santo Antônio do Tauá',14),(268,'São Caetano de Odivelas',14),(269,'São Domingos do Araguaia',14),(270,'São Domingos do Capim',14),(271,'São Félix do Xingu',14),(272,'São Francisco do Pará',14),(273,'São Geraldo do Araguaia',14),(274,'São João da Ponta',14),(275,'São João de Pirabas',14),(276,'São João do Araguaia',14),(277,'São Miguel do Guamá',14),(278,'São Sebastião da Boa Vista',14),(279,'Sapucaia',14),(280,'Senador José Porfírio',14),(281,'Soure',14),(282,'Tailândia',14),(283,'Terra Alta',14),(284,'Terra Santa',14),(285,'Tomé-Açu',14),(286,'Tracuateua',14),(287,'Trairão',14),(288,'Tucumã',14),(289,'Tucuruí',14),(290,'Ulianópolis',14),(291,'Uruará',14),(292,'Vigia',14),(293,'Viseu',14),(294,'Vitória do Xingu',14),(295,'Xinguara',14),(296,'Serra do Navio',3),(297,'Amapá',3),(298,'Pedra Branca do Amapari',3),(299,'Calçoene',3),(300,'Cutias',3),(301,'Ferreira Gomes',3),(302,'Itaubal',3),(303,'Laranjal do Jari',3),(304,'Macapá',3),(305,'Mazagão',3),(306,'Oiapoque',3),(307,'Porto Grande',3),(308,'Pracuúba',3),(309,'Santana',3),(310,'Tartarugalzinho',3),(311,'Vitória do Jari',3),(312,'Abreulândia',27),(313,'Aguiarnópolis',27),(314,'Aliança do Tocantins',27),(315,'Almas',27),(316,'Alvorada',27),(317,'Ananás',27),(318,'Angico',27),(319,'Aparecida do Rio Negro',27),(320,'Aragominas',27),(321,'Araguacema',27),(322,'Araguaçu',27),(323,'Araguaína',27),(324,'Araguanã',27),(325,'Araguatins',27),(326,'Arapoema',27),(327,'Arraias',27),(328,'Augustinópolis',27),(329,'Aurora do Tocantins',27),(330,'Axixá do Tocantins',27),(331,'Babaçulândia',27),(332,'Bandeirantes do Tocantins',27),(333,'Barra do Ouro',27),(334,'Barrolândia',27),(335,'Bernardo Sayão',27),(336,'Bom Jesus do Tocantins',27),(337,'Brasilândia do Tocantins',27),(338,'Brejinho de Nazaré',27),(339,'Buriti do Tocantins',27),(340,'Cachoeirinha',27),(341,'Campos Lindos',27),(342,'Cariri do Tocantins',27),(343,'Carmolândia',27),(344,'Carrasco Bonito',27),(345,'Caseara',27),(346,'Centenário',27),(347,'Chapada de Areia',27),(348,'Chapada da Natividade',27),(349,'Colinas do Tocantins',27),(350,'Combinado',27),(351,'Conceição do Tocantins',27),(352,'Couto Magalhães',27),(353,'Cristalândia',27),(354,'Crixás do Tocantins',27),(355,'Darcinópolis',27),(356,'Dianópolis',27),(357,'Divinópolis do Tocantins',27),(358,'Dois Irmãos do Tocantins',27),(359,'Dueré',27),(360,'Esperantina',27),(361,'Fátima',27),(362,'Figueirópolis',27),(363,'Filadélfia',27),(364,'Formoso do Araguaia',27),(365,'Fortaleza do Tabocão',27),(366,'Goianorte',27),(367,'Goiatins',27),(368,'Guaraí',27),(369,'Gurupi',27),(370,'Ipueiras',27),(371,'Itacajá',27),(372,'Itaguatins',27),(373,'Itapiratins',27),(374,'Itaporã do Tocantins',27),(375,'Jaú do Tocantins',27),(376,'Juarina',27),(377,'Lagoa da Confusão',27),(378,'Lagoa do Tocantins',27),(379,'Lajeado',27),(380,'Lavandeira',27),(381,'Lizarda',27),(382,'Luzinópolis',27),(383,'Marianópolis do Tocantins',27),(384,'Mateiros',27),(385,'Maurilândia do Tocantins',27),(386,'Miracema do Tocantins',27),(387,'Miranorte',27),(388,'Monte do Carmo',27),(389,'Monte Santo do Tocantins',27),(390,'Palmeiras do Tocantins',27),(391,'Muricilândia',27),(392,'Natividade',27),(393,'Nazaré',27),(394,'Nova Olinda',27),(395,'Nova Rosalândia',27),(396,'Novo Acordo',27),(397,'Novo Alegre',27),(398,'Novo Jardim',27),(399,'Oliveira de Fátima',27),(400,'Palmeirante',27),(401,'Palmeirópolis',27),(402,'Paraíso do Tocantins',27),(403,'Paranã',27),(404,'Pau D\'Arco',27),(405,'Pedro Afonso',27),(406,'Peixe',27),(407,'Pequizeiro',27),(408,'Colméia',27),(409,'Pindorama do Tocantins',27),(410,'Piraquê',27),(411,'Pium',27),(412,'Ponte Alta do Bom Jesus',27),(413,'Ponte Alta do Tocantins',27),(414,'Porto Alegre do Tocantins',27),(415,'Porto Nacional',27),(416,'Praia Norte',27),(417,'Presidente Kennedy',27),(418,'Pugmil',27),(419,'Recursolândia',27),(420,'Riachinho',27),(421,'Rio da Conceição',27),(422,'Rio dos Bois',27),(423,'Rio Sono',27),(424,'Sampaio',27),(425,'Sandolândia',27),(426,'Santa Fé do Araguaia',27),(427,'Santa Maria do Tocantins',27),(428,'Santa Rita do Tocantins',27),(429,'Santa Rosa do Tocantins',27),(430,'Santa Tereza do Tocantins',27),(431,'Santa Terezinha do Tocantins',27),(432,'São Bento do Tocantins',27),(433,'São Félix do Tocantins',27),(434,'São Miguel do Tocantins',27),(435,'São Salvador do Tocantins',27),(436,'São Sebastião do Tocantins',27),(437,'São Valério',27),(438,'Silvanópolis',27),(439,'Sítio Novo do Tocantins',27),(440,'Sucupira',27),(441,'Taguatinga',27),(442,'Taipas do Tocantins',27),(443,'Talismã',27),(444,'Palmas',27),(445,'Tocantínia',27),(446,'Tocantinópolis',27),(447,'Tupirama',27),(448,'Tupiratins',27),(449,'Wanderlândia',27),(450,'Xambioá',27),(451,'Açailândia',10),(452,'Afonso Cunha',10),(453,'Água Doce do Maranhão',10),(454,'Alcântara',10),(455,'Aldeias Altas',10),(456,'Altamira do Maranhão',10),(457,'Alto Alegre do Maranhão',10),(458,'Alto Alegre do Pindaré',10),(459,'Alto Parnaíba',10),(460,'Amapá do Maranhão',10),(461,'Amarante do Maranhão',10),(462,'Anajatuba',10),(463,'Anapurus',10),(464,'Apicum-Açu',10),(465,'Araguanã',10),(466,'Araioses',10),(467,'Arame',10),(468,'Arari',10),(469,'Axixá',10),(470,'Bacabal',10),(471,'Bacabeira',10),(472,'Bacuri',10),(473,'Bacurituba',10),(474,'Balsas',10),(475,'Barão de Grajaú',10),(476,'Barra do Corda',10),(477,'Barreirinhas',10),(478,'Belágua',10),(479,'Bela Vista do Maranhão',10),(480,'Benedito Leite',10),(481,'Bequimão',10),(482,'Bernardo do Mearim',10),(483,'Boa Vista do Gurupi',10),(484,'Bom Jardim',10),(485,'Bom Jesus das Selvas',10),(486,'Bom Lugar',10),(487,'Brejo',10),(488,'Brejo de Areia',10),(489,'Buriti',10),(490,'Buriti Bravo',10),(491,'Buriticupu',10),(492,'Buritirana',10),(493,'Cachoeira Grande',10),(494,'Cajapió',10),(495,'Cajari',10),(496,'Campestre do Maranhão',10),(497,'Cândido Mendes',10),(498,'Cantanhede',10),(499,'Capinzal do Norte',10),(500,'Carolina',10),(501,'Carutapera',10),(502,'Caxias',10),(503,'Cedral',10),(504,'Central do Maranhão',10),(505,'Centro do Guilherme',10),(506,'Centro Novo do Maranhão',10),(507,'Chapadinha',10),(508,'Cidelândia',10),(509,'Codó',10),(510,'Coelho Neto',10),(511,'Colinas',10),(512,'Conceição do Lago-Açu',10),(513,'Coroatá',10),(514,'Cururupu',10),(515,'Davinópolis',10),(516,'Dom Pedro',10),(517,'Duque Bacelar',10),(518,'Esperantinópolis',10),(519,'Estreito',10),(520,'Feira Nova do Maranhão',10),(521,'Fernando Falcão',10),(522,'Formosa da Serra Negra',10),(523,'Fortaleza dos Nogueiras',10),(524,'Fortuna',10),(525,'Godofredo Viana',10),(526,'Gonçalves Dias',10),(527,'Governador Archer',10),(528,'Governador Edison Lobão',10),(529,'Governador Eugênio Barros',10),(530,'Governador Luiz Rocha',10),(531,'Governador Newton Bello',10),(532,'Governador Nunes Freire',10),(533,'Graça Aranha',10),(534,'Grajaú',10),(535,'Guimarães',10),(536,'Humberto de Campos',10),(537,'Icatu',10),(538,'Igarapé do Meio',10),(539,'Igarapé Grande',10),(540,'Imperatriz',10),(541,'Itaipava do Grajaú',10),(542,'Itapecuru Mirim',10),(543,'Itinga do Maranhão',10),(544,'Jatobá',10),(545,'Jenipapo dos Vieiras',10),(546,'João Lisboa',10),(547,'Joselândia',10),(548,'Junco do Maranhão',10),(549,'Lago da Pedra',10),(550,'Lago do Junco',10),(551,'Lago Verde',10),(552,'Lagoa do Mato',10),(553,'Lago dos Rodrigues',10),(554,'Lagoa Grande do Maranhão',10),(555,'Lajeado Novo',10),(556,'Lima Campos',10),(557,'Loreto',10),(558,'Luís Domingues',10),(559,'Magalhães de Almeida',10),(560,'Maracaçumé',10),(561,'Marajá do Sena',10),(562,'Maranhãozinho',10),(563,'Mata Roma',10),(564,'Matinha',10),(565,'Matões',10),(566,'Matões do Norte',10),(567,'Milagres do Maranhão',10),(568,'Mirador',10),(569,'Miranda do Norte',10),(570,'Mirinzal',10),(571,'Monção',10),(572,'Montes Altos',10),(573,'Morros',10),(574,'Nina Rodrigues',10),(575,'Nova Colinas',10),(576,'Nova Iorque',10),(577,'Nova Olinda do Maranhão',10),(578,'Olho D\'Água das Cunhãs',10),(579,'Olinda Nova do Maranhão',10),(580,'Paço do Lumiar',10),(581,'Palmeirândia',10),(582,'Paraibano',10),(583,'Parnarama',10),(584,'Passagem Franca',10),(585,'Pastos Bons',10),(586,'Paulino Neves',10),(587,'Paulo Ramos',10),(588,'Pedreiras',10),(589,'Pedro do Rosário',10),(590,'Penalva',10),(591,'Peri Mirim',10),(592,'Peritoró',10),(593,'Pindaré-Mirim',10),(594,'Pinheiro',10),(595,'Pio XII',10),(596,'Pirapemas',10),(597,'Poção de Pedras',10),(598,'Porto Franco',10),(599,'Porto Rico do Maranhão',10),(600,'Presidente Dutra',10),(601,'Presidente Juscelino',10),(602,'Presidente Médici',10),(603,'Presidente Sarney',10),(604,'Presidente Vargas',10),(605,'Primeira Cruz',10),(606,'Raposa',10),(607,'Riachão',10),(608,'Ribamar Fiquene',10),(609,'Rosário',10),(610,'Sambaíba',10),(611,'Santa Filomena do Maranhão',10),(612,'Santa Helena',10),(613,'Santa Inês',10),(614,'Santa Luzia',10),(615,'Santa Luzia do Paruá',10),(616,'Santa Quitéria do Maranhão',10),(617,'Santa Rita',10),(618,'Santana do Maranhão',10),(619,'Santo Amaro do Maranhão',10),(620,'Santo Antônio dos Lopes',10),(621,'São Benedito do Rio Preto',10),(622,'São Bento',10),(623,'São Bernardo',10),(624,'São Domingos do Azeitão',10),(625,'São Domingos do Maranhão',10),(626,'São Félix de Balsas',10),(627,'São Francisco do Brejão',10),(628,'São Francisco do Maranhão',10),(629,'São João Batista',10),(630,'São João do Carú',10),(631,'São João do Paraíso',10),(632,'São João do Soter',10),(633,'São João dos Patos',10),(634,'São José de Ribamar',10),(635,'São José dos Basílios',10),(636,'São Luís',10),(637,'São Luís Gonzaga do Maranhão',10),(638,'São Mateus do Maranhão',10),(639,'São Pedro da Água Branca',10),(640,'São Pedro dos Crentes',10),(641,'São Raimundo das Mangabeiras',10),(642,'São Raimundo do Doca Bezerra',10),(643,'São Roberto',10),(644,'São Vicente Ferrer',10),(645,'Satubinha',10),(646,'Senador Alexandre Costa',10),(647,'Senador La Rocque',10),(648,'Serrano do Maranhão',10),(649,'Sítio Novo',10),(650,'Sucupira do Norte',10),(651,'Sucupira do Riachão',10),(652,'Tasso Fragoso',10),(653,'Timbiras',10),(654,'Timon',10),(655,'Trizidela do Vale',10),(656,'Tufilândia',10),(657,'Tuntum',10),(658,'Turiaçu',10),(659,'Turilândia',10),(660,'Tutóia',10),(661,'Urbano Santos',10),(662,'Vargem Grande',10),(663,'Viana',10),(664,'Vila Nova dos Martírios',10),(665,'Vitória do Mearim',10),(666,'Vitorino Freire',10),(667,'Zé Doca',10),(668,'Acauã',18),(669,'Agricolândia',18),(670,'Água Branca',18),(671,'Alagoinha do Piauí',18),(672,'Alegrete do Piauí',18),(673,'Alto Longá',18),(674,'Altos',18),(675,'Alvorada do Gurguéia',18),(676,'Amarante',18),(677,'Angical do Piauí',18),(678,'Anísio de Abreu',18),(679,'Antônio Almeida',18),(680,'Aroazes',18),(681,'Aroeiras do Itaim',18),(682,'Arraial',18),(683,'Assunção do Piauí',18),(684,'Avelino Lopes',18),(685,'Baixa Grande do Ribeiro',18),(686,'Barra D\'Alcântara',18),(687,'Barras',18),(688,'Barreiras do Piauí',18),(689,'Barro Duro',18),(690,'Batalha',18),(691,'Bela Vista do Piauí',18),(692,'Belém do Piauí',18),(693,'Beneditinos',18),(694,'Bertolínia',18),(695,'Betânia do Piauí',18),(696,'Boa Hora',18),(697,'Bocaina',18),(698,'Bom Jesus',18),(699,'Bom Princípio do Piauí',18),(700,'Bonfim do Piauí',18),(701,'Boqueirão do Piauí',18),(702,'Brasileira',18),(703,'Brejo do Piauí',18),(704,'Buriti dos Lopes',18),(705,'Buriti dos Montes',18),(706,'Cabeceiras do Piauí',18),(707,'Cajazeiras do Piauí',18),(708,'Cajueiro da Praia',18),(709,'Caldeirão Grande do Piauí',18),(710,'Campinas do Piauí',18),(711,'Campo Alegre do Fidalgo',18),(712,'Campo Grande do Piauí',18),(713,'Campo Largo do Piauí',18),(714,'Campo Maior',18),(715,'Canavieira',18),(716,'Canto do Buriti',18),(717,'Capitão de Campos',18),(718,'Capitão Gervásio Oliveira',18),(719,'Caracol',18),(720,'Caraúbas do Piauí',18),(721,'Caridade do Piauí',18),(722,'Castelo do Piauí',18),(723,'Caxingó',18),(724,'Cocal',18),(725,'Cocal de Telha',18),(726,'Cocal dos Alves',18),(727,'Coivaras',18),(728,'Colônia do Gurguéia',18),(729,'Colônia do Piauí',18),(730,'Conceição do Canindé',18),(731,'Coronel José Dias',18),(732,'Corrente',18),(733,'Cristalândia do Piauí',18),(734,'Cristino Castro',18),(735,'Curimatá',18),(736,'Currais',18),(737,'Curralinhos',18),(738,'Curral Novo do Piauí',18),(739,'Demerval Lobão',18),(740,'Dirceu Arcoverde',18),(741,'Dom Expedito Lopes',18),(742,'Domingos Mourão',18),(743,'Dom Inocêncio',18),(744,'Elesbão Veloso',18),(745,'Eliseu Martins',18),(746,'Esperantina',18),(747,'Fartura do Piauí',18),(748,'Flores do Piauí',18),(749,'Floresta do Piauí',18),(750,'Floriano',18),(751,'Francinópolis',18),(752,'Francisco Ayres',18),(753,'Francisco Macedo',18),(754,'Francisco Santos',18),(755,'Fronteiras',18),(756,'Geminiano',18),(757,'Gilbués',18),(758,'Guadalupe',18),(759,'Guaribas',18),(760,'Hugo Napoleão',18),(761,'Ilha Grande',18),(762,'Inhuma',18),(763,'Ipiranga do Piauí',18),(764,'Isaías Coelho',18),(765,'Itainópolis',18),(766,'Itaueira',18),(767,'Jacobina do Piauí',18),(768,'Jaicós',18),(769,'Jardim do Mulato',18),(770,'Jatobá do Piauí',18),(771,'Jerumenha',18),(772,'João Costa',18),(773,'Joaquim Pires',18),(774,'Joca Marques',18),(775,'José de Freitas',18),(776,'Juazeiro do Piauí',18),(777,'Júlio Borges',18),(778,'Jurema',18),(779,'Lagoinha do Piauí',18),(780,'Lagoa Alegre',18),(781,'Lagoa do Barro do Piauí',18),(782,'Lagoa de São Francisco',18),(783,'Lagoa do Piauí',18),(784,'Lagoa do Sítio',18),(785,'Landri Sales',18),(786,'Luís Correia',18),(787,'Luzilândia',18),(788,'Madeiro',18),(789,'Manoel Emídio',18),(790,'Marcolândia',18),(791,'Marcos Parente',18),(792,'Massapê do Piauí',18),(793,'Matias Olímpio',18),(794,'Miguel Alves',18),(795,'Miguel Leão',18),(796,'Milton Brandão',18),(797,'Monsenhor Gil',18),(798,'Monsenhor Hipólito',18),(799,'Monte Alegre do Piauí',18),(800,'Morro Cabeça no Tempo',18),(801,'Morro do Chapéu do Piauí',18),(802,'Murici dos Portelas',18),(803,'Nazaré do Piauí',18),(804,'Nazária',18),(805,'Nossa Senhora de Nazaré',18),(806,'Nossa Senhora dos Remédios',18),(807,'Novo Oriente do Piauí',18),(808,'Novo Santo Antônio',18),(809,'Oeiras',18),(810,'Olho D\'Água do Piauí',18),(811,'Padre Marcos',18),(812,'Paes Landim',18),(813,'Pajeú do Piauí',18),(814,'Palmeira do Piauí',18),(815,'Palmeirais',18),(816,'Paquetá',18),(817,'Parnaguá',18),(818,'Parnaíba',18),(819,'Passagem Franca do Piauí',18),(820,'Patos do Piauí',18),(821,'Pau D\'Arco do Piauí',18),(822,'Paulistana',18),(823,'Pavussu',18),(824,'Pedro II',18),(825,'Pedro Laurentino',18),(826,'Nova Santa Rita',18),(827,'Picos',18),(828,'Pimenteiras',18),(829,'Pio IX',18),(830,'Piracuruca',18),(831,'Piripiri',18),(832,'Porto',18),(833,'Porto Alegre do Piauí',18),(834,'Prata do Piauí',18),(835,'Queimada Nova',18),(836,'Redenção do Gurguéia',18),(837,'Regeneração',18),(838,'Riacho Frio',18),(839,'Ribeira do Piauí',18),(840,'Ribeiro Gonçalves',18),(841,'Rio Grande do Piauí',18),(842,'Santa Cruz do Piauí',18),(843,'Santa Cruz dos Milagres',18),(844,'Santa Filomena',18),(845,'Santa Luz',18),(846,'Santana do Piauí',18),(847,'Santa Rosa do Piauí',18),(848,'Santo Antônio de Lisboa',18),(849,'Santo Antônio dos Milagres',18),(850,'Santo Inácio do Piauí',18),(851,'São Braz do Piauí',18),(852,'São Félix do Piauí',18),(853,'São Francisco de Assis do Piauí',18),(854,'São Francisco do Piauí',18),(855,'São Gonçalo do Gurguéia',18),(856,'São Gonçalo do Piauí',18),(857,'São João da Canabrava',18),(858,'São João da Fronteira',18),(859,'São João da Serra',18),(860,'São João da Varjota',18),(861,'São João do Arraial',18),(862,'São João do Piauí',18),(863,'São José do Divino',18),(864,'São José do Peixe',18),(865,'São José do Piauí',18),(866,'São Julião',18),(867,'São Lourenço do Piauí',18),(868,'São Luis do Piauí',18),(869,'São Miguel da Baixa Grande',18),(870,'São Miguel do Fidalgo',18),(871,'São Miguel do Tapuio',18),(872,'São Pedro do Piauí',18),(873,'São Raimundo Nonato',18),(874,'Sebastião Barros',18),(875,'Sebastião Leal',18),(876,'Sigefredo Pacheco',18),(877,'Simões',18),(878,'Simplício Mendes',18),(879,'Socorro do Piauí',18),(880,'Sussuapara',18),(881,'Tamboril do Piauí',18),(882,'Tanque do Piauí',18),(883,'Teresina',18),(884,'União',18),(885,'Uruçuí',18),(886,'Valença do Piauí',18),(887,'Várzea Branca',18),(888,'Várzea Grande',18),(889,'Vera Mendes',18),(890,'Vila Nova do Piauí',18),(891,'Wall Ferraz',18),(892,'Abaiara',6),(893,'Acarape',6),(894,'Acaraú',6),(895,'Acopiara',6),(896,'Aiuaba',6),(897,'Alcântaras',6),(898,'Altaneira',6),(899,'Alto Santo',6),(900,'Amontada',6),(901,'Antonina do Norte',6),(902,'Apuiarés',6),(903,'Aquiraz',6),(904,'Aracati',6),(905,'Aracoiaba',6),(906,'Ararendá',6),(907,'Araripe',6),(908,'Aratuba',6),(909,'Arneiroz',6),(910,'Assaré',6),(911,'Aurora',6),(912,'Baixio',6),(913,'Banabuiú',6),(914,'Barbalha',6),(915,'Barreira',6),(916,'Barro',6),(917,'Barroquinha',6),(918,'Baturité',6),(919,'Beberibe',6),(920,'Bela Cruz',6),(921,'Boa Viagem',6),(922,'Brejo Santo',6),(923,'Camocim',6),(924,'Campos Sales',6),(925,'Canindé',6),(926,'Capistrano',6),(927,'Caridade',6),(928,'Cariré',6),(929,'Caririaçu',6),(930,'Cariús',6),(931,'Carnaubal',6),(932,'Cascavel',6),(933,'Catarina',6),(934,'Catunda',6),(935,'Caucaia',6),(936,'Cedro',6),(937,'Chaval',6),(938,'Choró',6),(939,'Chorozinho',6),(940,'Coreaú',6),(941,'Crateús',6),(942,'Crato',6),(943,'Croatá',6),(944,'Cruz',6),(945,'Deputado Irapuan Pinheiro',6),(946,'Ererê',6),(947,'Eusébio',6),(948,'Farias Brito',6),(949,'Forquilha',6),(950,'Fortaleza',6),(951,'Fortim',6),(952,'Frecheirinha',6),(953,'General Sampaio',6),(954,'Graça',6),(955,'Granja',6),(956,'Granjeiro',6),(957,'Groaíras',6),(958,'Guaiúba',6),(959,'Guaraciaba do Norte',6),(960,'Guaramiranga',6),(961,'Hidrolândia',6),(962,'Horizonte',6),(963,'Ibaretama',6),(964,'Ibiapina',6),(965,'Ibicuitinga',6),(966,'Icapuí',6),(967,'Icó',6),(968,'Iguatu',6),(969,'Independência',6),(970,'Ipaporanga',6),(971,'Ipaumirim',6),(972,'Ipu',6),(973,'Ipueiras',6),(974,'Iracema',6),(975,'Irauçuba',6),(976,'Itaiçaba',6),(977,'Itaitinga',6),(978,'Itapagé',6),(979,'Itapipoca',6),(980,'Itapiúna',6),(981,'Itarema',6),(982,'Itatira',6),(983,'Jaguaretama',6),(984,'Jaguaribara',6),(985,'Jaguaribe',6),(986,'Jaguaruana',6),(987,'Jardim',6),(988,'Jati',6),(989,'Jijoca de Jericoacoara',6),(990,'Juazeiro do Norte',6),(991,'Jucás',6),(992,'Lavras da Mangabeira',6),(993,'Limoeiro do Norte',6),(994,'Madalena',6),(995,'Maracanaú',6),(996,'Maranguape',6),(997,'Marco',6),(998,'Martinópole',6),(999,'Massapê',6),(1000,'Mauriti',6),(1001,'Meruoca',6),(1002,'Milagres',6),(1003,'Milhã',6),(1004,'Miraíma',6),(1005,'Missão Velha',6),(1006,'Mombaça',6),(1007,'Monsenhor Tabosa',6),(1008,'Morada Nova',6),(1009,'Moraújo',6),(1010,'Morrinhos',6),(1011,'Mucambo',6),(1012,'Mulungu',6),(1013,'Nova Olinda',6),(1014,'Nova Russas',6),(1015,'Novo Oriente',6),(1016,'Ocara',6),(1017,'Orós',6),(1018,'Pacajus',6),(1019,'Pacatuba',6),(1020,'Pacoti',6),(1021,'Pacujá',6),(1022,'Palhano',6),(1023,'Palmácia',6),(1024,'Paracuru',6),(1025,'Paraipaba',6),(1026,'Parambu',6),(1027,'Paramoti',6),(1028,'Pedra Branca',6),(1029,'Penaforte',6),(1030,'Pentecoste',6),(1031,'Pereiro',6),(1032,'Pindoretama',6),(1033,'Piquet Carneiro',6),(1034,'Pires Ferreira',6),(1035,'Poranga',6),(1036,'Porteiras',6),(1037,'Potengi',6),(1038,'Potiretama',6),(1039,'Quiterianópolis',6),(1040,'Quixadá',6),(1041,'Quixelô',6),(1042,'Quixeramobim',6),(1043,'Quixeré',6),(1044,'Redenção',6),(1045,'Reriutaba',6),(1046,'Russas',6),(1047,'Saboeiro',6),(1048,'Salitre',6),(1049,'Santana do Acaraú',6),(1050,'Santana do Cariri',6),(1051,'Santa Quitéria',6),(1052,'São Benedito',6),(1053,'São Gonçalo do Amarante',6),(1054,'São João do Jaguaribe',6),(1055,'São Luís do Curu',6),(1056,'Senador Pompeu',6),(1057,'Senador Sá',6),(1058,'Sobral',6),(1059,'Solonópole',6),(1060,'Tabuleiro do Norte',6),(1061,'Tamboril',6),(1062,'Tarrafas',6),(1063,'Tauá',6),(1064,'Tejuçuoca',6),(1065,'Tianguá',6),(1066,'Trairi',6),(1067,'Tururu',6),(1068,'Ubajara',6),(1069,'Umari',6),(1070,'Umirim',6),(1071,'Uruburetama',6),(1072,'Uruoca',6),(1073,'Varjota',6),(1074,'Várzea Alegre',6),(1075,'Viçosa do Ceará',6),(1076,'Acari',20),(1077,'Açu',20),(1078,'Afonso Bezerra',20),(1079,'Água Nova',20),(1080,'Alexandria',20),(1081,'Almino Afonso',20),(1082,'Alto do Rodrigues',20),(1083,'Angicos',20),(1084,'Antônio Martins',20),(1085,'Apodi',20),(1086,'Areia Branca',20),(1087,'Arês',20),(1088,'Augusto Severo',20),(1089,'Baía Formosa',20),(1090,'Baraúna',20),(1091,'Barcelona',20),(1092,'Bento Fernandes',20),(1093,'Bodó',20),(1094,'Bom Jesus',20),(1095,'Brejinho',20),(1096,'Caiçara do Norte',20),(1097,'Caiçara do Rio do Vento',20),(1098,'Caicó',20),(1099,'Campo Redondo',20),(1100,'Canguaretama',20),(1101,'Caraúbas',20),(1102,'Carnaúba dos Dantas',20),(1103,'Carnaubais',20),(1104,'Ceará-Mirim',20),(1105,'Cerro Corá',20),(1106,'Coronel Ezequiel',20),(1107,'Coronel João Pessoa',20),(1108,'Cruzeta',20),(1109,'Currais Novos',20),(1110,'Doutor Severiano',20),(1111,'Parnamirim',20),(1112,'Encanto',20),(1113,'Equador',20),(1114,'Espírito Santo',20),(1115,'Extremoz',20),(1116,'Felipe Guerra',20),(1117,'Fernando Pedroza',20),(1118,'Florânia',20),(1119,'Francisco Dantas',20),(1120,'Frutuoso Gomes',20),(1121,'Galinhos',20),(1122,'Goianinha',20),(1123,'Governador Dix-Sept Rosado',20),(1124,'Grossos',20),(1125,'Guamaré',20),(1126,'Ielmo Marinho',20),(1127,'Ipanguaçu',20),(1128,'Ipueira',20),(1129,'Itajá',20),(1130,'Itaú',20),(1131,'Jaçanã',20),(1132,'Jandaíra',20),(1133,'Janduís',20),(1134,'Januário Cicco',20),(1135,'Japi',20),(1136,'Jardim de Angicos',20),(1137,'Jardim de Piranhas',20),(1138,'Jardim do Seridó',20),(1139,'João Câmara',20),(1140,'João Dias',20),(1141,'José da Penha',20),(1142,'Jucurutu',20),(1143,'Jundiá',20),(1144,'Lagoa D\'Anta',20),(1145,'Lagoa de Pedras',20),(1146,'Lagoa de Velhos',20),(1147,'Lagoa Nova',20),(1148,'Lagoa Salgada',20),(1149,'Lajes',20),(1150,'Lajes Pintadas',20),(1151,'Lucrécia',20),(1152,'Luís Gomes',20),(1153,'Macaíba',20),(1154,'Macau',20),(1155,'Major Sales',20),(1156,'Marcelino Vieira',20),(1157,'Martins',20),(1158,'Maxaranguape',20),(1159,'Messias Targino',20),(1160,'Montanhas',20),(1161,'Monte Alegre',20),(1162,'Monte das Gameleiras',20),(1163,'Mossoró',20),(1164,'Natal',20),(1165,'Nísia Floresta',20),(1166,'Nova Cruz',20),(1167,'Olho-D\'Água do Borges',20),(1168,'Ouro Branco',20),(1169,'Paraná',20),(1170,'Paraú',20),(1171,'Parazinho',20),(1172,'Parelhas',20),(1173,'Rio do Fogo',20),(1174,'Passa e Fica',20),(1175,'Passagem',20),(1176,'Patu',20),(1177,'Santa Maria',20),(1178,'Pau dos Ferros',20),(1179,'Pedra Grande',20),(1180,'Pedra Preta',20),(1181,'Pedro Avelino',20),(1182,'Pedro Velho',20),(1183,'Pendências',20),(1184,'Pilões',20),(1185,'Poço Branco',20),(1186,'Portalegre',20),(1187,'Porto do Mangue',20),(1188,'Presidente Juscelino',20),(1189,'Pureza',20),(1190,'Rafael Fernandes',20),(1191,'Rafael Godeiro',20),(1192,'Riacho da Cruz',20),(1193,'Riacho de Santana',20),(1194,'Riachuelo',20),(1195,'Rodolfo Fernandes',20),(1196,'Tibau',20),(1197,'Ruy Barbosa',20),(1198,'Santa Cruz',20),(1199,'Santana do Matos',20),(1200,'Santana do Seridó',20),(1201,'Santo Antônio',20),(1202,'São Bento do Norte',20),(1203,'São Bento do Trairí',20),(1204,'São Fernando',20),(1205,'São Francisco do Oeste',20),(1206,'São Gonçalo do Amarante',20),(1207,'São João do Sabugi',20),(1208,'São José de Mipibu',20),(1209,'São José do Campestre',20),(1210,'São José do Seridó',20),(1211,'São Miguel',20),(1212,'São Miguel do Gostoso',20),(1213,'São Paulo do Potengi',20),(1214,'São Pedro',20),(1215,'São Rafael',20),(1216,'São Tomé',20),(1217,'São Vicente',20),(1218,'Senador Elói de Souza',20),(1219,'Senador Georgino Avelino',20),(1220,'Serra de São Bento',20),(1221,'Serra do Mel',20),(1222,'Serra Negra do Norte',20),(1223,'Serrinha',20),(1224,'Serrinha dos Pintos',20),(1225,'Severiano Melo',20),(1226,'Sítio Novo',20),(1227,'Taboleiro Grande',20),(1228,'Taipu',20),(1229,'Tangará',20),(1230,'Tenente Ananias',20),(1231,'Tenente Laurentino Cruz',20),(1232,'Tibau do Sul',20),(1233,'Timbaúba dos Batistas',20),(1234,'Touros',20),(1235,'Triunfo Potiguar',20),(1236,'Umarizal',20),(1237,'Upanema',20),(1238,'Várzea',20),(1239,'Venha-Ver',20),(1240,'Vera Cruz',20),(1241,'Viçosa',20),(1242,'Vila Flor',20),(1243,'Água Branca',15),(1244,'Aguiar',15),(1245,'Alagoa Grande',15),(1246,'Alagoa Nova',15),(1247,'Alagoinha',15),(1248,'Alcantil',15),(1249,'Algodão de Jandaíra',15),(1250,'Alhandra',15),(1251,'São João do Rio do Peixe',15),(1252,'Amparo',15),(1253,'Aparecida',15),(1254,'Araçagi',15),(1255,'Arara',15),(1256,'Araruna',15),(1257,'Areia',15),(1258,'Areia de Baraúnas',15),(1259,'Areial',15),(1260,'Aroeiras',15),(1261,'Assunção',15),(1262,'Baía da Traição',15),(1263,'Bananeiras',15),(1264,'Baraúna',15),(1265,'Barra de Santana',15),(1266,'Barra de Santa Rosa',15),(1267,'Barra de São Miguel',15),(1268,'Bayeux',15),(1269,'Belém',15),(1270,'Belém do Brejo do Cruz',15),(1271,'Bernardino Batista',15),(1272,'Boa Ventura',15),(1273,'Boa Vista',15),(1274,'Bom Jesus',15),(1275,'Bom Sucesso',15),(1276,'Bonito de Santa Fé',15),(1277,'Boqueirão',15),(1278,'Igaracy',15),(1279,'Borborema',15),(1280,'Brejo do Cruz',15),(1281,'Brejo dos Santos',15),(1282,'Caaporã',15),(1283,'Cabaceiras',15),(1284,'Cabedelo',15),(1285,'Cachoeira dos Índios',15),(1286,'Cacimba de Areia',15),(1287,'Cacimba de Dentro',15),(1288,'Cacimbas',15),(1289,'Caiçara',15),(1290,'Cajazeiras',15),(1291,'Cajazeirinhas',15),(1292,'Caldas Brandão',15),(1293,'Camalaú',15),(1294,'Campina Grande',15),(1295,'Capim',15),(1296,'Caraúbas',15),(1297,'Carrapateira',15),(1298,'Casserengue',15),(1299,'Catingueira',15),(1300,'Catolé do Rocha',15),(1301,'Caturité',15),(1302,'Conceição',15),(1303,'Condado',15),(1304,'Conde',15),(1305,'Congo',15),(1306,'Coremas',15),(1307,'Coxixola',15),(1308,'Cruz do Espírito Santo',15),(1309,'Cubati',15),(1310,'Cuité',15),(1311,'Cuitegi',15),(1312,'Cuité de Mamanguape',15),(1313,'Curral de Cima',15),(1314,'Curral Velho',15),(1315,'Damião',15),(1316,'Desterro',15),(1317,'Vista Serrana',15),(1318,'Diamante',15),(1319,'Dona Inês',15),(1320,'Duas Estradas',15),(1321,'Emas',15),(1322,'Esperança',15),(1323,'Fagundes',15),(1324,'Frei Martinho',15),(1325,'Gado Bravo',15),(1326,'Guarabira',15),(1327,'Gurinhém',15),(1328,'Gurjão',15),(1329,'Ibiara',15),(1330,'Imaculada',15),(1331,'Ingá',15),(1332,'Itabaiana',15),(1333,'Itaporanga',15),(1334,'Itapororoca',15),(1335,'Itatuba',15),(1336,'Jacaraú',15),(1337,'Jericó',15),(1338,'João Pessoa',15),(1339,'Juarez Távora',15),(1340,'Juazeirinho',15),(1341,'Junco do Seridó',15),(1342,'Juripiranga',15),(1343,'Juru',15),(1344,'Lagoa',15),(1345,'Lagoa de Dentro',15),(1346,'Lagoa Seca',15),(1347,'Lastro',15),(1348,'Livramento',15),(1349,'Logradouro',15),(1350,'Lucena',15),(1351,'Mãe D\'Água',15),(1352,'Malta',15),(1353,'Mamanguape',15),(1354,'Manaíra',15),(1355,'Marcação',15),(1356,'Mari',15),(1357,'Marizópolis',15),(1358,'Massaranduba',15),(1359,'Mataraca',15),(1360,'Matinhas',15),(1361,'Mato Grosso',15),(1362,'Maturéia',15),(1363,'Mogeiro',15),(1364,'Montadas',15),(1365,'Monte Horebe',15),(1366,'Monteiro',15),(1367,'Mulungu',15),(1368,'Natuba',15),(1369,'Nazarezinho',15),(1370,'Nova Floresta',15),(1371,'Nova Olinda',15),(1372,'Nova Palmeira',15),(1373,'Olho D\'Água',15),(1374,'Olivedos',15),(1375,'Ouro Velho',15),(1376,'Parari',15),(1377,'Passagem',15),(1378,'Patos',15),(1379,'Paulista',15),(1380,'Pedra Branca',15),(1381,'Pedra Lavrada',15),(1382,'Pedras de Fogo',15),(1383,'Piancó',15),(1384,'Picuí',15),(1385,'Pilar',15),(1386,'Pilões',15),(1387,'Pilõezinhos',15),(1388,'Pirpirituba',15),(1389,'Pitimbu',15),(1390,'Pocinhos',15),(1391,'Poço Dantas',15),(1392,'Poço de José de Moura',15),(1393,'Pombal',15),(1394,'Prata',15),(1395,'Princesa Isabel',15),(1396,'Puxinanã',15),(1397,'Queimadas',15),(1398,'Quixabá',15),(1399,'Remígio',15),(1400,'Pedro Régis',15),(1401,'Riachão',15),(1402,'Riachão do Bacamarte',15),(1403,'Riachão do Poço',15),(1404,'Riacho de Santo Antônio',15),(1405,'Riacho dos Cavalos',15),(1406,'Rio Tinto',15),(1407,'Salgadinho',15),(1408,'Salgado de São Félix',15),(1409,'Santa Cecília',15),(1410,'Santa Cruz',15),(1411,'Santa Helena',15),(1412,'Santa Inês',15),(1413,'Santa Luzia',15),(1414,'Santana de Mangueira',15),(1415,'Santana dos Garrotes',15),(1416,'Joca Claudino',15),(1417,'Santa Rita',15),(1418,'Santa Teresinha',15),(1419,'Santo André',15),(1420,'São Bento',15),(1421,'São Bentinho',15),(1422,'São Domingos do Cariri',15),(1423,'São Domingos',15),(1424,'São Francisco',15),(1425,'São João do Cariri',15),(1426,'São João do Tigre',15),(1427,'São José da Lagoa Tapada',15),(1428,'São José de Caiana',15),(1429,'São José de Espinharas',15),(1430,'São José dos Ramos',15),(1431,'São José de Piranhas',15),(1432,'São José de Princesa',15),(1433,'São José do Bonfim',15),(1434,'São José do Brejo do Cruz',15),(1435,'São José do Sabugi',15),(1436,'São José dos Cordeiros',15),(1437,'São Mamede',15),(1438,'São Miguel de Taipu',15),(1439,'São Sebastião de Lagoa de Roça',15),(1440,'São Sebastião do Umbuzeiro',15),(1441,'Sapé',15),(1442,'São Vicente do Seridó',15),(1443,'Serra Branca',15),(1444,'Serra da Raiz',15),(1445,'Serra Grande',15),(1446,'Serra Redonda',15),(1447,'Serraria',15),(1448,'Sertãozinho',15),(1449,'Sobrado',15),(1450,'Solânea',15),(1451,'Soledade',15),(1452,'Sossêgo',15),(1453,'Sousa',15),(1454,'Sumé',15),(1455,'Tacima',15),(1456,'Taperoá',15),(1457,'Tavares',15),(1458,'Teixeira',15),(1459,'Tenório',15),(1460,'Triunfo',15),(1461,'Uiraúna',15),(1462,'Umbuzeiro',15),(1463,'Várzea',15),(1464,'Vieirópolis',15),(1465,'Zabelê',15),(1466,'Abreu e Lima',17),(1467,'Afogados da Ingazeira',17),(1468,'Afrânio',17),(1469,'Agrestina',17),(1470,'Água Preta',17),(1471,'Águas Belas',17),(1472,'Alagoinha',17),(1473,'Aliança',17),(1474,'Altinho',17),(1475,'Amaraji',17),(1476,'Angelim',17),(1477,'Araçoiaba',17),(1478,'Araripina',17),(1479,'Arcoverde',17),(1480,'Barra de Guabiraba',17),(1481,'Barreiros',17),(1482,'Belém de Maria',17),(1483,'Belém do São Francisco',17),(1484,'Belo Jardim',17),(1485,'Betânia',17),(1486,'Bezerros',17),(1487,'Bodocó',17),(1488,'Bom Conselho',17),(1489,'Bom Jardim',17),(1490,'Bonito',17),(1491,'Brejão',17),(1492,'Brejinho',17),(1493,'Brejo da Madre de Deus',17),(1494,'Buenos Aires',17),(1495,'Buíque',17),(1496,'Cabo de Santo Agostinho',17),(1497,'Cabrobó',17),(1498,'Cachoeirinha',17),(1499,'Caetés',17),(1500,'Calçado',17),(1501,'Calumbi',17),(1502,'Camaragibe',17),(1503,'Camocim de São Félix',17),(1504,'Camutanga',17),(1505,'Canhotinho',17),(1506,'Capoeiras',17),(1507,'Carnaíba',17),(1508,'Carnaubeira da Penha',17),(1509,'Carpina',17),(1510,'Caruaru',17),(1511,'Casinhas',17),(1512,'Catende',17),(1513,'Cedro',17),(1514,'Chã de Alegria',17),(1515,'Chã Grande',17),(1516,'Condado',17),(1517,'Correntes',17),(1518,'Cortês',17),(1519,'Cumaru',17),(1520,'Cupira',17),(1521,'Custódia',17),(1522,'Dormentes',17),(1523,'Escada',17),(1524,'Exu',17),(1525,'Feira Nova',17),(1526,'Fernando de Noronha',17),(1527,'Ferreiros',17),(1528,'Flores',17),(1529,'Floresta',17),(1530,'Frei Miguelinho',17),(1531,'Gameleira',17),(1532,'Garanhuns',17),(1533,'Glória do Goitá',17),(1534,'Goiana',17),(1535,'Granito',17),(1536,'Gravatá',17),(1537,'Iati',17),(1538,'Ibimirim',17),(1539,'Ibirajuba',17),(1540,'Igarassu',17),(1541,'Iguaraci',17),(1542,'Inajá',17),(1543,'Ingazeira',17),(1544,'Ipojuca',17),(1545,'Ipubi',17),(1546,'Itacuruba',17),(1547,'Itaíba',17),(1548,'Ilha de Itamaracá',17),(1549,'Itambé',17),(1550,'Itapetim',17),(1551,'Itapissuma',17),(1552,'Itaquitinga',17),(1553,'Jaboatão dos Guararapes',17),(1554,'Jaqueira',17),(1555,'Jataúba',17),(1556,'Jatobá',17),(1557,'João Alfredo',17),(1558,'Joaquim Nabuco',17),(1559,'Jucati',17),(1560,'Jupi',17),(1561,'Jurema',17),(1562,'Lagoa do Carro',17),(1563,'Lagoa de Itaenga',17),(1564,'Lagoa do Ouro',17),(1565,'Lagoa dos Gatos',17),(1566,'Lagoa Grande',17),(1567,'Lajedo',17),(1568,'Limoeiro',17),(1569,'Macaparana',17),(1570,'Machados',17),(1571,'Manari',17),(1572,'Maraial',17),(1573,'Mirandiba',17),(1574,'Moreno',17),(1575,'Nazaré da Mata',17),(1576,'Olinda',17),(1577,'Orobó',17),(1578,'Orocó',17),(1579,'Ouricuri',17),(1580,'Palmares',17),(1581,'Palmeirina',17),(1582,'Panelas',17),(1583,'Paranatama',17),(1584,'Parnamirim',17),(1585,'Passira',17),(1586,'Paudalho',17),(1587,'Paulista',17),(1588,'Pedra',17),(1589,'Pesqueira',17),(1590,'Petrolândia',17),(1591,'Petrolina',17),(1592,'Poção',17),(1593,'Pombos',17),(1594,'Primavera',17),(1595,'Quipapá',17),(1596,'Quixaba',17),(1597,'Recife',17),(1598,'Riacho das Almas',17),(1599,'Ribeirão',17),(1600,'Rio Formoso',17),(1601,'Sairé',17),(1602,'Salgadinho',17),(1603,'Salgueiro',17),(1604,'Saloá',17),(1605,'Sanharó',17),(1606,'Santa Cruz',17),(1607,'Santa Cruz da Baixa Verde',17),(1608,'Santa Cruz do Capibaribe',17),(1609,'Santa Filomena',17),(1610,'Santa Maria da Boa Vista',17),(1611,'Santa Maria do Cambucá',17),(1612,'Santa Terezinha',17),(1613,'São Benedito do Sul',17),(1614,'São Bento do Una',17),(1615,'São Caitano',17),(1616,'São João',17),(1617,'São Joaquim do Monte',17),(1618,'São José da Coroa Grande',17),(1619,'São José do Belmonte',17),(1620,'São José do Egito',17),(1621,'São Lourenço da Mata',17),(1622,'São Vicente Ferrer',17),(1623,'Serra Talhada',17),(1624,'Serrita',17),(1625,'Sertânia',17),(1626,'Sirinhaém',17),(1627,'Moreilândia',17),(1628,'Solidão',17),(1629,'Surubim',17),(1630,'Tabira',17),(1631,'Tacaimbó',17),(1632,'Tacaratu',17),(1633,'Tamandaré',17),(1634,'Taquaritinga do Norte',17),(1635,'Terezinha',17),(1636,'Terra Nova',17),(1637,'Timbaúba',17),(1638,'Toritama',17),(1639,'Tracunhaém',17),(1640,'Trindade',17),(1641,'Triunfo',17),(1642,'Tupanatinga',17),(1643,'Tuparetama',17),(1644,'Venturosa',17),(1645,'Verdejante',17),(1646,'Vertente do Lério',17),(1647,'Vertentes',17),(1648,'Vicência',17),(1649,'Vitória de Santo Antão',17),(1650,'Xexéu',17),(1651,'Água Branca',2),(1652,'Anadia',2),(1653,'Arapiraca',2),(1654,'Atalaia',2),(1655,'Barra de Santo Antônio',2),(1656,'Barra de São Miguel',2),(1657,'Batalha',2),(1658,'Belém',2),(1659,'Belo Monte',2),(1660,'Boca da Mata',2),(1661,'Branquinha',2),(1662,'Cacimbinhas',2),(1663,'Cajueiro',2),(1664,'Campestre',2),(1665,'Campo Alegre',2),(1666,'Campo Grande',2),(1667,'Canapi',2),(1668,'Capela',2),(1669,'Carneiros',2),(1670,'Chã Preta',2),(1671,'Coité do Nóia',2),(1672,'Colônia Leopoldina',2),(1673,'Coqueiro Seco',2),(1674,'Coruripe',2),(1675,'Craíbas',2),(1676,'Delmiro Gouveia',2),(1677,'Dois Riachos',2),(1678,'Estrela de Alagoas',2),(1679,'Feira Grande',2),(1680,'Feliz Deserto',2),(1681,'Flexeiras',2),(1682,'Girau do Ponciano',2),(1683,'Ibateguara',2),(1684,'Igaci',2),(1685,'Igreja Nova',2),(1686,'Inhapi',2),(1687,'Jacaré dos Homens',2),(1688,'Jacuípe',2),(1689,'Japaratinga',2),(1690,'Jaramataia',2),(1691,'Jequiá da Praia',2),(1692,'Joaquim Gomes',2),(1693,'Jundiá',2),(1694,'Junqueiro',2),(1695,'Lagoa da Canoa',2),(1696,'Limoeiro de Anadia',2),(1697,'Maceió',2),(1698,'Major Isidoro',2),(1699,'Maragogi',2),(1700,'Maravilha',2),(1701,'Marechal Deodoro',2),(1702,'Maribondo',2),(1703,'Mar Vermelho',2),(1704,'Mata Grande',2),(1705,'Matriz de Camaragibe',2),(1706,'Messias',2),(1707,'Minador do Negrão',2),(1708,'Monteirópolis',2),(1709,'Murici',2),(1710,'Novo Lino',2),(1711,'Olho D\'Água das Flores',2),(1712,'Olho D\'Água do Casado',2),(1713,'Olho D\'Água Grande',2),(1714,'Olivença',2),(1715,'Ouro Branco',2),(1716,'Palestina',2),(1717,'Palmeira dos Índios',2),(1718,'Pão de Açúcar',2),(1719,'Pariconha',2),(1720,'Paripueira',2),(1721,'Passo de Camaragibe',2),(1722,'Paulo Jacinto',2),(1723,'Penedo',2),(1724,'Piaçabuçu',2),(1725,'Pilar',2),(1726,'Pindoba',2),(1727,'Piranhas',2),(1728,'Poço das Trincheiras',2),(1729,'Porto Calvo',2),(1730,'Porto de Pedras',2),(1731,'Porto Real do Colégio',2),(1732,'Quebrangulo',2),(1733,'Rio Largo',2),(1734,'Roteiro',2),(1735,'Santa Luzia do Norte',2),(1736,'Santana do Ipanema',2),(1737,'Santana do Mundaú',2),(1738,'São Brás',2),(1739,'São José da Laje',2),(1740,'São José da Tapera',2),(1741,'São Luís do Quitunde',2),(1742,'São Miguel dos Campos',2),(1743,'São Miguel dos Milagres',2),(1744,'São Sebastião',2),(1745,'Satuba',2),(1746,'Senador Rui Palmeira',2),(1747,'Tanque D\'Arca',2),(1748,'Taquarana',2),(1749,'Teotônio Vilela',2),(1750,'Traipu',2),(1751,'União dos Palmares',2),(1752,'Viçosa',2),(1753,'Amparo de São Francisco',26),(1754,'Aquidabã',26),(1755,'Aracaju',26),(1756,'Arauá',26),(1757,'Areia Branca',26),(1758,'Barra dos Coqueiros',26),(1759,'Boquim',26),(1760,'Brejo Grande',26),(1761,'Campo do Brito',26),(1762,'Canhoba',26),(1763,'Canindé de São Francisco',26),(1764,'Capela',26),(1765,'Carira',26),(1766,'Carmópolis',26),(1767,'Cedro de São João',26),(1768,'Cristinápolis',26),(1769,'Cumbe',26),(1770,'Divina Pastora',26),(1771,'Estância',26),(1772,'Feira Nova',26),(1773,'Frei Paulo',26),(1774,'Gararu',26),(1775,'General Maynard',26),(1776,'Gracho Cardoso',26),(1777,'Ilha das Flores',26),(1778,'Indiaroba',26),(1779,'Itabaiana',26),(1780,'Itabaianinha',26),(1781,'Itabi',26),(1782,'Itaporanga D\'Ajuda',26),(1783,'Japaratuba',26),(1784,'Japoatã',26),(1785,'Lagarto',26),(1786,'Laranjeiras',26),(1787,'Macambira',26),(1788,'Malhada dos Bois',26),(1789,'Malhador',26),(1790,'Maruim',26),(1791,'Moita Bonita',26),(1792,'Monte Alegre de Sergipe',26),(1793,'Muribeca',26),(1794,'Neópolis',26),(1795,'Nossa Senhora Aparecida',26),(1796,'Nossa Senhora da Glória',26),(1797,'Nossa Senhora das Dores',26),(1798,'Nossa Senhora de Lourdes',26),(1799,'Nossa Senhora do Socorro',26),(1800,'Pacatuba',26),(1801,'Pedra Mole',26),(1802,'Pedrinhas',26),(1803,'Pinhão',26),(1804,'Pirambu',26),(1805,'Poço Redondo',26),(1806,'Poço Verde',26),(1807,'Porto da Folha',26),(1808,'Propriá',26),(1809,'Riachão do Dantas',26),(1810,'Riachuelo',26),(1811,'Ribeirópolis',26),(1812,'Rosário do Catete',26),(1813,'Salgado',26),(1814,'Santa Luzia do Itanhy',26),(1815,'Santana do São Francisco',26),(1816,'Santa Rosa de Lima',26),(1817,'Santo Amaro das Brotas',26),(1818,'São Cristóvão',26),(1819,'São Domingos',26),(1820,'São Francisco',26),(1821,'São Miguel do Aleixo',26),(1822,'Simão Dias',26),(1823,'Siriri',26),(1824,'Telha',26),(1825,'Tobias Barreto',26),(1826,'Tomar do Geru',26),(1827,'Umbaúba',26),(1828,'Abaíra',5),(1829,'Abaré',5),(1830,'Acajutiba',5),(1831,'Adustina',5),(1832,'Água Fria',5),(1833,'Érico Cardoso',5),(1834,'Aiquara',5),(1835,'Alagoinhas',5),(1836,'Alcobaça',5),(1837,'Almadina',5),(1838,'Amargosa',5),(1839,'Amélia Rodrigues',5),(1840,'América Dourada',5),(1841,'Anagé',5),(1842,'Andaraí',5),(1843,'Andorinha',5),(1844,'Angical',5),(1845,'Anguera',5),(1846,'Antas',5),(1847,'Antônio Cardoso',5),(1848,'Antônio Gonçalves',5),(1849,'Aporá',5),(1850,'Apuarema',5),(1851,'Aracatu',5),(1852,'Araças',5),(1853,'Araci',5),(1854,'Aramari',5),(1855,'Arataca',5),(1856,'Aratuípe',5),(1857,'Aurelino Leal',5),(1858,'Baianópolis',5),(1859,'Baixa Grande',5),(1860,'Banzaê',5),(1861,'Barra',5),(1862,'Barra da Estiva',5),(1863,'Barra do Choça',5),(1864,'Barra do Mendes',5),(1865,'Barra do Rocha',5),(1866,'Barreiras',5),(1867,'Barro Alto',5),(1868,'Barrocas',5),(1869,'Barro Preto',5),(1870,'Belmonte',5),(1871,'Belo Campo',5),(1872,'Biritinga',5),(1873,'Boa Nova',5),(1874,'Boa Vista do Tupim',5),(1875,'Bom Jesus da Lapa',5),(1876,'Bom Jesus da Serra',5),(1877,'Boninal',5),(1878,'Bonito',5),(1879,'Boquira',5),(1880,'Botuporã',5),(1881,'Brejões',5),(1882,'Brejolândia',5),(1883,'Brotas de Macaúbas',5),(1884,'Brumado',5),(1885,'Buerarema',5),(1886,'Buritirama',5),(1887,'Caatiba',5),(1888,'Cabaceiras do Paraguaçu',5),(1889,'Cachoeira',5),(1890,'Caculé',5),(1891,'Caém',5),(1892,'Caetanos',5),(1893,'Caetité',5),(1894,'Cafarnaum',5),(1895,'Cairu',5),(1896,'Caldeirão Grande',5),(1897,'Camacan',5),(1898,'Camaçari',5),(1899,'Camamu',5),(1900,'Campo Alegre de Lourdes',5),(1901,'Campo Formoso',5),(1902,'Canápolis',5),(1903,'Canarana',5),(1904,'Canavieiras',5),(1905,'Candeal',5),(1906,'Candeias',5),(1907,'Candiba',5),(1908,'Cândido Sales',5),(1909,'Cansanção',5),(1910,'Canudos',5),(1911,'Capela do Alto Alegre',5),(1912,'Capim Grosso',5),(1913,'Caraíbas',5),(1914,'Caravelas',5),(1915,'Cardeal da Silva',5),(1916,'Carinhanha',5),(1917,'Casa Nova',5),(1918,'Castro Alves',5),(1919,'Catolândia',5),(1920,'Catu',5),(1921,'Caturama',5),(1922,'Central',5),(1923,'Chorrochó',5),(1924,'Cícero Dantas',5),(1925,'Cipó',5),(1926,'Coaraci',5),(1927,'Cocos',5),(1928,'Conceição da Feira',5),(1929,'Conceição do Almeida',5),(1930,'Conceição do Coité',5),(1931,'Conceição do Jacuípe',5),(1932,'Conde',5),(1933,'Condeúba',5),(1934,'Contendas do Sincorá',5),(1935,'Coração de Maria',5),(1936,'Cordeiros',5),(1937,'Coribe',5),(1938,'Coronel João Sá',5),(1939,'Correntina',5),(1940,'Cotegipe',5),(1941,'Cravolândia',5),(1942,'Crisópolis',5),(1943,'Cristópolis',5),(1944,'Cruz das Almas',5),(1945,'Curaçá',5),(1946,'Dário Meira',5),(1947,'Dias D\'Ávila',5),(1948,'Dom Basílio',5),(1949,'Dom Macedo Costa',5),(1950,'Elísio Medrado',5),(1951,'Encruzilhada',5),(1952,'Entre Rios',5),(1953,'Esplanada',5),(1954,'Euclides da Cunha',5),(1955,'Eunápolis',5),(1956,'Fátima',5),(1957,'Feira da Mata',5),(1958,'Feira de Santana',5),(1959,'Filadélfia',5),(1960,'Firmino Alves',5),(1961,'Floresta Azul',5),(1962,'Formosa do Rio Preto',5),(1963,'Gandu',5),(1964,'Gavião',5),(1965,'Gentio do Ouro',5),(1966,'Glória',5),(1967,'Gongogi',5),(1968,'Governador Mangabeira',5),(1969,'Guajeru',5),(1970,'Guanambi',5),(1971,'Guaratinga',5),(1972,'Heliópolis',5),(1973,'Iaçu',5),(1974,'Ibiassucê',5),(1975,'Ibicaraí',5),(1976,'Ibicoara',5),(1977,'Ibicuí',5),(1978,'Ibipeba',5),(1979,'Ibipitanga',5),(1980,'Ibiquera',5),(1981,'Ibirapitanga',5),(1982,'Ibirapuã',5),(1983,'Ibirataia',5),(1984,'Ibitiara',5),(1985,'Ibititá',5),(1986,'Ibotirama',5),(1987,'Ichu',5),(1988,'Igaporã',5),(1989,'Igrapiúna',5),(1990,'Iguaí',5),(1991,'Ilhéus',5),(1992,'Inhambupe',5),(1993,'Ipecaetá',5),(1994,'Ipiaú',5),(1995,'Ipirá',5),(1996,'Ipupiara',5),(1997,'Irajuba',5),(1998,'Iramaia',5),(1999,'Iraquara',5),(2000,'Irará',5),(2001,'Irecê',5),(2002,'Itabela',5),(2003,'Itaberaba',5),(2004,'Itabuna',5),(2005,'Itacaré',5),(2006,'Itaeté',5),(2007,'Itagi',5),(2008,'Itagibá',5),(2009,'Itagimirim',5),(2010,'Itaguaçu da Bahia',5),(2011,'Itaju do Colônia',5),(2012,'Itajuípe',5),(2013,'Itamaraju',5),(2014,'Itamari',5),(2015,'Itambé',5),(2016,'Itanagra',5),(2017,'Itanhém',5),(2018,'Itaparica',5),(2019,'Itapé',5),(2020,'Itapebi',5),(2021,'Itapetinga',5),(2022,'Itapicuru',5),(2023,'Itapitanga',5),(2024,'Itaquara',5),(2025,'Itarantim',5),(2026,'Itatim',5),(2027,'Itiruçu',5),(2028,'Itiúba',5),(2029,'Itororó',5),(2030,'Ituaçu',5),(2031,'Ituberá',5),(2032,'Iuiú',5),(2033,'Jaborandi',5),(2034,'Jacaraci',5),(2035,'Jacobina',5),(2036,'Jaguaquara',5),(2037,'Jaguarari',5),(2038,'Jaguaripe',5),(2039,'Jandaíra',5),(2040,'Jequié',5),(2041,'Jeremoabo',5),(2042,'Jiquiriçá',5),(2043,'Jitaúna',5),(2044,'João Dourado',5),(2045,'Juazeiro',5),(2046,'Jucuruçu',5),(2047,'Jussara',5),(2048,'Jussari',5),(2049,'Jussiape',5),(2050,'Lafaiete Coutinho',5),(2051,'Lagoa Real',5),(2052,'Laje',5),(2053,'Lajedão',5),(2054,'Lajedinho',5),(2055,'Lajedo do Tabocal',5),(2056,'Lamarão',5),(2057,'Lapão',5),(2058,'Lauro de Freitas',5),(2059,'Lençóis',5),(2060,'Licínio de Almeida',5),(2061,'Livramento de Nossa Senhora',5),(2062,'Luís Eduardo Magalhães',5),(2063,'Macajuba',5),(2064,'Macarani',5),(2065,'Macaúbas',5),(2066,'Macururé',5),(2067,'Madre de Deus',5),(2068,'Maetinga',5),(2069,'Maiquinique',5),(2070,'Mairi',5),(2071,'Malhada',5),(2072,'Malhada de Pedras',5),(2073,'Manoel Vitorino',5),(2074,'Mansidão',5),(2075,'Maracás',5),(2076,'Maragogipe',5),(2077,'Maraú',5),(2078,'Marcionílio Souza',5),(2079,'Mascote',5),(2080,'Mata de São João',5),(2081,'Matina',5),(2082,'Medeiros Neto',5),(2083,'Miguel Calmon',5),(2084,'Milagres',5),(2085,'Mirangaba',5),(2086,'Mirante',5),(2087,'Monte Santo',5),(2088,'Morpará',5),(2089,'Morro do Chapéu',5),(2090,'Mortugaba',5),(2091,'Mucugê',5),(2092,'Mucuri',5),(2093,'Mulungu do Morro',5),(2094,'Mundo Novo',5),(2095,'Muniz Ferreira',5),(2096,'Muquém de São Francisco',5),(2097,'Muritiba',5),(2098,'Mutuípe',5),(2099,'Nazaré',5),(2100,'Nilo Peçanha',5),(2101,'Nordestina',5),(2102,'Nova Canaã',5),(2103,'Nova Fátima',5),(2104,'Nova Ibiá',5),(2105,'Nova Itarana',5),(2106,'Nova Redenção',5),(2107,'Nova Soure',5),(2108,'Nova Viçosa',5),(2109,'Novo Horizonte',5),(2110,'Novo Triunfo',5),(2111,'Olindina',5),(2112,'Oliveira dos Brejinhos',5),(2113,'Ouriçangas',5),(2114,'Ourolândia',5),(2115,'Palmas de Monte Alto',5),(2116,'Palmeiras',5),(2117,'Paramirim',5),(2118,'Paratinga',5),(2119,'Paripiranga',5),(2120,'Pau Brasil',5),(2121,'Paulo Afonso',5),(2122,'Pé de Serra',5),(2123,'Pedrão',5),(2124,'Pedro Alexandre',5),(2125,'Piatã',5),(2126,'Pilão Arcado',5),(2127,'Pindaí',5),(2128,'Pindobaçu',5),(2129,'Pintadas',5),(2130,'Piraí do Norte',5),(2131,'Piripá',5),(2132,'Piritiba',5),(2133,'Planaltino',5),(2134,'Planalto',5),(2135,'Poções',5),(2136,'Pojuca',5),(2137,'Ponto Novo',5),(2138,'Porto Seguro',5),(2139,'Potiraguá',5),(2140,'Prado',5),(2141,'Presidente Dutra',5),(2142,'Presidente Jânio Quadros',5),(2143,'Presidente Tancredo Neves',5),(2144,'Queimadas',5),(2145,'Quijingue',5),(2146,'Quixabeira',5),(2147,'Rafael Jambeiro',5),(2148,'Remanso',5),(2149,'Retirolândia',5),(2150,'Riachão das Neves',5),(2151,'Riachão do Jacuípe',5),(2152,'Riacho de Santana',5),(2153,'Ribeira do Amparo',5),(2154,'Ribeira do Pombal',5),(2155,'Ribeirão do Largo',5),(2156,'Rio de Contas',5),(2157,'Rio do Antônio',5),(2158,'Rio do Pires',5),(2159,'Rio Real',5),(2160,'Rodelas',5),(2161,'Ruy Barbosa',5),(2162,'Salinas da Margarida',5),(2163,'Salvador',5),(2164,'Santa Bárbara',5),(2165,'Santa Brígida',5),(2166,'Santa Cruz Cabrália',5),(2167,'Santa Cruz da Vitória',5),(2168,'Santa Inês',5),(2169,'Santaluz',5),(2170,'Santa Luzia',5),(2171,'Santa Maria da Vitória',5),(2172,'Santana',5),(2173,'Santanópolis',5),(2174,'Santa Rita de Cássia',5),(2175,'Santa Teresinha',5),(2176,'Santo Amaro',5),(2177,'Santo Antônio de Jesus',5),(2178,'Santo Estêvão',5),(2179,'São Desidério',5),(2180,'São Domingos',5),(2181,'São Félix',5),(2182,'São Félix do Coribe',5),(2183,'São Felipe',5),(2184,'São Francisco do Conde',5),(2185,'São Gabriel',5),(2186,'São Gonçalo dos Campos',5),(2187,'São José da Vitória',5),(2188,'São José do Jacuípe',5),(2189,'São Miguel das Matas',5),(2190,'São Sebastião do Passé',5),(2191,'Sapeaçu',5),(2192,'Sátiro Dias',5),(2193,'Saubara',5),(2194,'Saúde',5),(2195,'Seabra',5),(2196,'Sebastião Laranjeiras',5),(2197,'Senhor do Bonfim',5),(2198,'Serra do Ramalho',5),(2199,'Sento Sé',5),(2200,'Serra Dourada',5),(2201,'Serra Preta',5),(2202,'Serrinha',5),(2203,'Serrolândia',5),(2204,'Simões Filho',5),(2205,'Sítio do Mato',5),(2206,'Sítio do Quinto',5),(2207,'Sobradinho',5),(2208,'Souto Soares',5),(2209,'Tabocas do Brejo Velho',5),(2210,'Tanhaçu',5),(2211,'Tanque Novo',5),(2212,'Tanquinho',5),(2213,'Taperoá',5),(2214,'Tapiramutá',5),(2215,'Teixeira de Freitas',5),(2216,'Teodoro Sampaio',5),(2217,'Teofilândia',5),(2218,'Teolândia',5),(2219,'Terra Nova',5),(2220,'Tremedal',5),(2221,'Tucano',5),(2222,'Uauá',5),(2223,'Ubaíra',5),(2224,'Ubaitaba',5),(2225,'Ubatã',5),(2226,'Uibaí',5),(2227,'Umburanas',5),(2228,'Una',5),(2229,'Urandi',5),(2230,'Uruçuca',5),(2231,'Utinga',5),(2232,'Valença',5),(2233,'Valente',5),(2234,'Várzea da Roça',5),(2235,'Várzea do Poço',5),(2236,'Várzea Nova',5),(2237,'Varzedo',5),(2238,'Vera Cruz',5),(2239,'Vereda',5),(2240,'Vitória da Conquista',5),(2241,'Wagner',5),(2242,'Wanderley',5),(2243,'Wenceslau Guimarães',5),(2244,'Xique-Xique',5),(2245,'Abadia dos Dourados',13),(2246,'Abaeté',13),(2247,'Abre Campo',13),(2248,'Acaiaca',13),(2249,'Açucena',13),(2250,'Água Boa',13),(2251,'Água Comprida',13),(2252,'Aguanil',13),(2253,'Águas Formosas',13),(2254,'Águas Vermelhas',13),(2255,'Aimorés',13),(2256,'Aiuruoca',13),(2257,'Alagoa',13),(2258,'Albertina',13),(2259,'Além Paraíba',13),(2260,'Alfenas',13),(2261,'Alfredo Vasconcelos',13),(2262,'Almenara',13),(2263,'Alpercata',13),(2264,'Alpinópolis',13),(2265,'Alterosa',13),(2266,'Alto Caparaó',13),(2267,'Alto Rio Doce',13),(2268,'Alvarenga',13),(2269,'Alvinópolis',13),(2270,'Alvorada de Minas',13),(2271,'Amparo do Serra',13),(2272,'Andradas',13),(2273,'Cachoeira de Pajeú',13),(2274,'Andrelândia',13),(2275,'Angelândia',13),(2276,'Antônio Carlos',13),(2277,'Antônio Dias',13),(2278,'Antônio Prado de Minas',13),(2279,'Araçaí',13),(2280,'Aracitaba',13),(2281,'Araçuaí',13),(2282,'Araguari',13),(2283,'Arantina',13),(2284,'Araponga',13),(2285,'Araporã',13),(2286,'Arapuá',13),(2287,'Araújos',13),(2288,'Araxá',13),(2289,'Arceburgo',13),(2290,'Arcos',13),(2291,'Areado',13),(2292,'Argirita',13),(2293,'Aricanduva',13),(2294,'Arinos',13),(2295,'Astolfo Dutra',13),(2296,'Ataléia',13),(2297,'Augusto de Lima',13),(2298,'Baependi',13),(2299,'Baldim',13),(2300,'Bambuí',13),(2301,'Bandeira',13),(2302,'Bandeira do Sul',13),(2303,'Barão de Cocais',13),(2304,'Barão de Monte Alto',13),(2305,'Barbacena',13),(2306,'Barra Longa',13),(2307,'Barroso',13),(2308,'Bela Vista de Minas',13),(2309,'Belmiro Braga',13),(2310,'Belo Horizonte',13),(2311,'Belo Oriente',13),(2312,'Belo Vale',13),(2313,'Berilo',13),(2314,'Bertópolis',13),(2315,'Berizal',13),(2316,'Betim',13),(2317,'Bias Fortes',13),(2318,'Bicas',13),(2319,'Biquinhas',13),(2320,'Boa Esperança',13),(2321,'Bocaina de Minas',13),(2322,'Bocaiúva',13),(2323,'Bom Despacho',13),(2324,'Bom Jardim de Minas',13),(2325,'Bom Jesus da Penha',13),(2326,'Bom Jesus do Amparo',13),(2327,'Bom Jesus do Galho',13),(2328,'Bom Repouso',13),(2329,'Bom Sucesso',13),(2330,'Bonfim',13),(2331,'Bonfinópolis de Minas',13),(2332,'Bonito de Minas',13),(2333,'Borda da Mata',13),(2334,'Botelhos',13),(2335,'Botumirim',13),(2336,'Brasilândia de Minas',13),(2337,'Brasília de Minas',13),(2338,'Brás Pires',13),(2339,'Braúnas',13),(2340,'Brazópolis',13),(2341,'Brumadinho',13),(2342,'Bueno Brandão',13),(2343,'Buenópolis',13),(2344,'Bugre',13),(2345,'Buritis',13),(2346,'Buritizeiro',13),(2347,'Cabeceira Grande',13),(2348,'Cabo Verde',13),(2349,'Cachoeira da Prata',13),(2350,'Cachoeira de Minas',13),(2351,'Cachoeira Dourada',13),(2352,'Caetanópolis',13),(2353,'Caeté',13),(2354,'Caiana',13),(2355,'Cajuri',13),(2356,'Caldas',13),(2357,'Camacho',13),(2358,'Camanducaia',13),(2359,'Cambuí',13),(2360,'Cambuquira',13),(2361,'Campanário',13),(2362,'Campanha',13),(2363,'Campestre',13),(2364,'Campina Verde',13),(2365,'Campo Azul',13),(2366,'Campo Belo',13),(2367,'Campo do Meio',13),(2368,'Campo Florido',13),(2369,'Campos Altos',13),(2370,'Campos Gerais',13),(2371,'Canaã',13),(2372,'Canápolis',13),(2373,'Cana Verde',13),(2374,'Candeias',13),(2375,'Cantagalo',13),(2376,'Caparaó',13),(2377,'Capela Nova',13),(2378,'Capelinha',13),(2379,'Capetinga',13),(2380,'Capim Branco',13),(2381,'Capinópolis',13),(2382,'Capitão Andrade',13),(2383,'Capitão Enéas',13),(2384,'Capitólio',13),(2385,'Caputira',13),(2386,'Caraí',13),(2387,'Caranaíba',13),(2388,'Carandaí',13),(2389,'Carangola',13),(2390,'Caratinga',13),(2391,'Carbonita',13),(2392,'Careaçu',13),(2393,'Carlos Chagas',13),(2394,'Carmésia',13),(2395,'Carmo da Cachoeira',13),(2396,'Carmo da Mata',13),(2397,'Carmo de Minas',13),(2398,'Carmo do Cajuru',13),(2399,'Carmo do Paranaíba',13),(2400,'Carmo do Rio Claro',13),(2401,'Carmópolis de Minas',13),(2402,'Carneirinho',13),(2403,'Carrancas',13),(2404,'Carvalhópolis',13),(2405,'Carvalhos',13),(2406,'Casa Grande',13),(2407,'Cascalho Rico',13),(2408,'Cássia',13),(2409,'Conceição da Barra de Minas',13),(2410,'Cataguases',13),(2411,'Catas Altas',13),(2412,'Catas Altas da Noruega',13),(2413,'Catuji',13),(2414,'Catuti',13),(2415,'Caxambu',13),(2416,'Cedro do Abaeté',13),(2417,'Central de Minas',13),(2418,'Centralina',13),(2419,'Chácara',13),(2420,'Chalé',13),(2421,'Chapada do Norte',13),(2422,'Chapada Gaúcha',13),(2423,'Chiador',13),(2424,'Cipotânea',13),(2425,'Claraval',13),(2426,'Claro dos Poções',13),(2427,'Cláudio',13),(2428,'Coimbra',13),(2429,'Coluna',13),(2430,'Comendador Gomes',13),(2431,'Comercinho',13),(2432,'Conceição da Aparecida',13),(2433,'Conceição das Pedras',13),(2434,'Conceição das Alagoas',13),(2435,'Conceição de Ipanema',13),(2436,'Conceição do Mato Dentro',13),(2437,'Conceição do Pará',13),(2438,'Conceição do Rio Verde',13),(2439,'Conceição dos Ouros',13),(2440,'Cônego Marinho',13),(2441,'Confins',13),(2442,'Congonhal',13),(2443,'Congonhas',13),(2444,'Congonhas do Norte',13),(2445,'Conquista',13),(2446,'Conselheiro Lafaiete',13),(2447,'Conselheiro Pena',13),(2448,'Consolação',13),(2449,'Contagem',13),(2450,'Coqueiral',13),(2451,'Coração de Jesus',13),(2452,'Cordisburgo',13),(2453,'Cordislândia',13),(2454,'Corinto',13),(2455,'Coroaci',13),(2456,'Coromandel',13),(2457,'Coronel Fabriciano',13),(2458,'Coronel Murta',13),(2459,'Coronel Pacheco',13),(2460,'Coronel Xavier Chaves',13),(2461,'Córrego Danta',13),(2462,'Córrego do Bom Jesus',13),(2463,'Córrego Fundo',13),(2464,'Córrego Novo',13),(2465,'Couto de Magalhães de Minas',13),(2466,'Crisólita',13),(2467,'Cristais',13),(2468,'Cristália',13),(2469,'Cristiano Otoni',13),(2470,'Cristina',13),(2471,'Crucilândia',13),(2472,'Cruzeiro da Fortaleza',13),(2473,'Cruzília',13),(2474,'Cuparaque',13),(2475,'Curral de Dentro',13),(2476,'Curvelo',13),(2477,'Datas',13),(2478,'Delfim Moreira',13),(2479,'Delfinópolis',13),(2480,'Delta',13),(2481,'Descoberto',13),(2482,'Desterro de Entre Rios',13),(2483,'Desterro do Melo',13),(2484,'Diamantina',13),(2485,'Diogo de Vasconcelos',13),(2486,'Dionísio',13),(2487,'Divinésia',13),(2488,'Divino',13),(2489,'Divino das Laranjeiras',13),(2490,'Divinolândia de Minas',13),(2491,'Divinópolis',13),(2492,'Divisa Alegre',13),(2493,'Divisa Nova',13),(2494,'Divisópolis',13),(2495,'Dom Bosco',13),(2496,'Dom Cavati',13),(2497,'Dom Joaquim',13),(2498,'Dom Silvério',13),(2499,'Dom Viçoso',13),(2500,'Dona Eusébia',13),(2501,'Dores de Campos',13),(2502,'Dores de Guanhães',13),(2503,'Dores do Indaiá',13),(2504,'Dores do Turvo',13),(2505,'Doresópolis',13),(2506,'Douradoquara',13),(2507,'Durandé',13),(2508,'Elói Mendes',13),(2509,'Engenheiro Caldas',13),(2510,'Engenheiro Navarro',13),(2511,'Entre Folhas',13),(2512,'Entre Rios de Minas',13),(2513,'Ervália',13),(2514,'Esmeraldas',13),(2515,'Espera Feliz',13),(2516,'Espinosa',13),(2517,'Espírito Santo do Dourado',13),(2518,'Estiva',13),(2519,'Estrela Dalva',13),(2520,'Estrela do Indaiá',13),(2521,'Estrela do Sul',13),(2522,'Eugenópolis',13),(2523,'Ewbank da Câmara',13),(2524,'Extrema',13),(2525,'Fama',13),(2526,'Faria Lemos',13),(2527,'Felício dos Santos',13),(2528,'São Gonçalo do Rio Preto',13),(2529,'Felisburgo',13),(2530,'Felixlândia',13),(2531,'Fernandes Tourinho',13),(2532,'Ferros',13),(2533,'Fervedouro',13),(2534,'Florestal',13),(2535,'Formiga',13),(2536,'Formoso',13),(2537,'Fortaleza de Minas',13),(2538,'Fortuna de Minas',13),(2539,'Francisco Badaró',13),(2540,'Francisco Dumont',13),(2541,'Francisco Sá',13),(2542,'Franciscópolis',13),(2543,'Frei Gaspar',13),(2544,'Frei Inocêncio',13),(2545,'Frei Lagonegro',13),(2546,'Fronteira',13),(2547,'Fronteira dos Vales',13),(2548,'Fruta de Leite',13),(2549,'Frutal',13),(2550,'Funilândia',13),(2551,'Galiléia',13),(2552,'Gameleiras',13),(2553,'Glaucilândia',13),(2554,'Goiabeira',13),(2555,'Goianá',13),(2556,'Gonçalves',13),(2557,'Gonzaga',13),(2558,'Gouveia',13),(2559,'Governador Valadares',13),(2560,'Grão Mogol',13),(2561,'Grupiara',13),(2562,'Guanhães',13),(2563,'Guapé',13),(2564,'Guaraciaba',13),(2565,'Guaraciama',13),(2566,'Guaranésia',13),(2567,'Guarani',13),(2568,'Guarará',13),(2569,'Guarda-Mor',13),(2570,'Guaxupé',13),(2571,'Guidoval',13),(2572,'Guimarânia',13),(2573,'Guiricema',13),(2574,'Gurinhatã',13),(2575,'Heliodora',13),(2576,'Iapu',13),(2577,'Ibertioga',13),(2578,'Ibiá',13),(2579,'Ibiaí',13),(2580,'Ibiracatu',13),(2581,'Ibiraci',13),(2582,'Ibirité',13),(2583,'Ibitiúra de Minas',13),(2584,'Ibituruna',13),(2585,'Icaraí de Minas',13),(2586,'Igarapé',13),(2587,'Igaratinga',13),(2588,'Iguatama',13),(2589,'Ijaci',13),(2590,'Ilicínea',13),(2591,'Imbé de Minas',13),(2592,'Inconfidentes',13),(2593,'Indaiabira',13),(2594,'Indianópolis',13),(2595,'Ingaí',13),(2596,'Inhapim',13),(2597,'Inhaúma',13),(2598,'Inimutaba',13),(2599,'Ipaba',13),(2600,'Ipanema',13),(2601,'Ipatinga',13),(2602,'Ipiaçu',13),(2603,'Ipuiúna',13),(2604,'Iraí de Minas',13),(2605,'Itabira',13),(2606,'Itabirinha',13),(2607,'Itabirito',13),(2608,'Itacambira',13),(2609,'Itacarambi',13),(2610,'Itaguara',13),(2611,'Itaipé',13),(2612,'Itajubá',13),(2613,'Itamarandiba',13),(2614,'Itamarati de Minas',13),(2615,'Itambacuri',13),(2616,'Itambé do Mato Dentro',13),(2617,'Itamogi',13),(2618,'Itamonte',13),(2619,'Itanhandu',13),(2620,'Itanhomi',13),(2621,'Itaobim',13),(2622,'Itapagipe',13),(2623,'Itapecerica',13),(2624,'Itapeva',13),(2625,'Itatiaiuçu',13),(2626,'Itaú de Minas',13),(2627,'Itaúna',13),(2628,'Itaverava',13),(2629,'Itinga',13),(2630,'Itueta',13),(2631,'Ituiutaba',13),(2632,'Itumirim',13),(2633,'Iturama',13),(2634,'Itutinga',13),(2635,'Jaboticatubas',13),(2636,'Jacinto',13),(2637,'Jacuí',13),(2638,'Jacutinga',13),(2639,'Jaguaraçu',13),(2640,'Jaíba',13),(2641,'Jampruca',13),(2642,'Janaúba',13),(2643,'Januária',13),(2644,'Japaraíba',13),(2645,'Japonvar',13),(2646,'Jeceaba',13),(2647,'Jenipapo de Minas',13),(2648,'Jequeri',13),(2649,'Jequitaí',13),(2650,'Jequitibá',13),(2651,'Jequitinhonha',13),(2652,'Jesuânia',13),(2653,'Joaíma',13),(2654,'Joanésia',13),(2655,'João Monlevade',13),(2656,'João Pinheiro',13),(2657,'Joaquim Felício',13),(2658,'Jordânia',13),(2659,'José Gonçalves de Minas',13),(2660,'José Raydan',13),(2661,'Josenópolis',13),(2662,'Nova União',13),(2663,'Juatuba',13),(2664,'Juiz de Fora',13),(2665,'Juramento',13),(2666,'Juruaia',13),(2667,'Juvenília',13),(2668,'Ladainha',13),(2669,'Lagamar',13),(2670,'Lagoa da Prata',13),(2671,'Lagoa dos Patos',13),(2672,'Lagoa Dourada',13),(2673,'Lagoa Formosa',13),(2674,'Lagoa Grande',13),(2675,'Lagoa Santa',13),(2676,'Lajinha',13),(2677,'Lambari',13),(2678,'Lamim',13),(2679,'Laranjal',13),(2680,'Lassance',13),(2681,'Lavras',13),(2682,'Leandro Ferreira',13),(2683,'Leme do Prado',13),(2684,'Leopoldina',13),(2685,'Liberdade',13),(2686,'Lima Duarte',13),(2687,'Limeira do Oeste',13),(2688,'Lontra',13),(2689,'Luisburgo',13),(2690,'Luislândia',13),(2691,'Luminárias',13),(2692,'Luz',13),(2693,'Machacalis',13),(2694,'Machado',13),(2695,'Madre de Deus de Minas',13),(2696,'Malacacheta',13),(2697,'Mamonas',13),(2698,'Manga',13),(2699,'Manhuaçu',13),(2700,'Manhumirim',13),(2701,'Mantena',13),(2702,'Maravilhas',13),(2703,'Mar de Espanha',13),(2704,'Maria da Fé',13),(2705,'Mariana',13),(2706,'Marilac',13),(2707,'Mário Campos',13),(2708,'Maripá de Minas',13),(2709,'Marliéria',13),(2710,'Marmelópolis',13),(2711,'Martinho Campos',13),(2712,'Martins Soares',13),(2713,'Mata Verde',13),(2714,'Materlândia',13),(2715,'Mateus Leme',13),(2716,'Matias Barbosa',13),(2717,'Matias Cardoso',13),(2718,'Matipó',13),(2719,'Mato Verde',13),(2720,'Matozinhos',13),(2721,'Matutina',13),(2722,'Medeiros',13),(2723,'Medina',13),(2724,'Mendes Pimentel',13),(2725,'Mercês',13),(2726,'Mesquita',13),(2727,'Minas Novas',13),(2728,'Minduri',13),(2729,'Mirabela',13),(2730,'Miradouro',13),(2731,'Miraí',13),(2732,'Miravânia',13),(2733,'Moeda',13),(2734,'Moema',13),(2735,'Monjolos',13),(2736,'Monsenhor Paulo',13),(2737,'Montalvânia',13),(2738,'Monte Alegre de Minas',13),(2739,'Monte Azul',13),(2740,'Monte Belo',13),(2741,'Monte Carmelo',13),(2742,'Monte Formoso',13),(2743,'Monte Santo de Minas',13),(2744,'Montes Claros',13),(2745,'Monte Sião',13),(2746,'Montezuma',13),(2747,'Morada Nova de Minas',13),(2748,'Morro da Garça',13),(2749,'Morro do Pilar',13),(2750,'Munhoz',13),(2751,'Muriaé',13),(2752,'Mutum',13),(2753,'Muzambinho',13),(2754,'Nacip Raydan',13),(2755,'Nanuque',13),(2756,'Naque',13),(2757,'Natalândia',13),(2758,'Natércia',13),(2759,'Nazareno',13),(2760,'Nepomuceno',13),(2761,'Ninheira',13),(2762,'Nova Belém',13),(2763,'Nova Era',13),(2764,'Nova Lima',13),(2765,'Nova Módica',13),(2766,'Nova Ponte',13),(2767,'Nova Porteirinha',13),(2768,'Nova Resende',13),(2769,'Nova Serrana',13),(2770,'Novo Cruzeiro',13),(2771,'Novo Oriente de Minas',13),(2772,'Novorizonte',13),(2773,'Olaria',13),(2774,'Olhos-D\'Água',13),(2775,'Olímpio Noronha',13),(2776,'Oliveira',13),(2777,'Oliveira Fortes',13),(2778,'Onça de Pitangui',13),(2779,'Oratórios',13),(2780,'Orizânia',13),(2781,'Ouro Branco',13),(2782,'Ouro Fino',13),(2783,'Ouro Preto',13),(2784,'Ouro Verde de Minas',13),(2785,'Padre Carvalho',13),(2786,'Padre Paraíso',13),(2787,'Paineiras',13),(2788,'Pains',13),(2789,'Pai Pedro',13),(2790,'Paiva',13),(2791,'Palma',13),(2792,'Palmópolis',13),(2793,'Papagaios',13),(2794,'Paracatu',13),(2795,'Pará de Minas',13),(2796,'Paraguaçu',13),(2797,'Paraisópolis',13),(2798,'Paraopeba',13),(2799,'Passabém',13),(2800,'Passa Quatro',13),(2801,'Passa Tempo',13),(2802,'Passa-Vinte',13),(2803,'Passos',13),(2804,'Patis',13),(2805,'Patos de Minas',13),(2806,'Patrocínio',13),(2807,'Patrocínio do Muriaé',13),(2808,'Paula Cândido',13),(2809,'Paulistas',13),(2810,'Pavão',13),(2811,'Peçanha',13),(2812,'Pedra Azul',13),(2813,'Pedra Bonita',13),(2814,'Pedra do Anta',13),(2815,'Pedra do Indaiá',13),(2816,'Pedra Dourada',13),(2817,'Pedralva',13),(2818,'Pedras de Maria da Cruz',13),(2819,'Pedrinópolis',13),(2820,'Pedro Leopoldo',13),(2821,'Pedro Teixeira',13),(2822,'Pequeri',13),(2823,'Pequi',13),(2824,'Perdigão',13),(2825,'Perdizes',13),(2826,'Perdões',13),(2827,'Periquito',13),(2828,'Pescador',13),(2829,'Piau',13),(2830,'Piedade de Caratinga',13),(2831,'Piedade de Ponte Nova',13),(2832,'Piedade do Rio Grande',13),(2833,'Piedade dos Gerais',13),(2834,'Pimenta',13),(2835,'Pingo-D\'Água',13),(2836,'Pintópolis',13),(2837,'Piracema',13),(2838,'Pirajuba',13),(2839,'Piranga',13),(2840,'Piranguçu',13),(2841,'Piranguinho',13),(2842,'Pirapetinga',13),(2843,'Pirapora',13),(2844,'Piraúba',13),(2845,'Pitangui',13),(2846,'Piumhi',13),(2847,'Planura',13),(2848,'Poço Fundo',13),(2849,'Poços de Caldas',13),(2850,'Pocrane',13),(2851,'Pompéu',13),(2852,'Ponte Nova',13),(2853,'Ponto Chique',13),(2854,'Ponto dos Volantes',13),(2855,'Porteirinha',13),(2856,'Porto Firme',13),(2857,'Poté',13),(2858,'Pouso Alegre',13),(2859,'Pouso Alto',13),(2860,'Prados',13),(2861,'Prata',13),(2862,'Pratápolis',13),(2863,'Pratinha',13),(2864,'Presidente Bernardes',13),(2865,'Presidente Juscelino',13),(2866,'Presidente Kubitschek',13),(2867,'Presidente Olegário',13),(2868,'Alto Jequitibá',13),(2869,'Prudente de Morais',13),(2870,'Quartel Geral',13),(2871,'Queluzito',13),(2872,'Raposos',13),(2873,'Raul Soares',13),(2874,'Recreio',13),(2875,'Reduto',13),(2876,'Resende Costa',13),(2877,'Resplendor',13),(2878,'Ressaquinha',13),(2879,'Riachinho',13),(2880,'Riacho dos Machados',13),(2881,'Ribeirão das Neves',13),(2882,'Ribeirão Vermelho',13),(2883,'Rio Acima',13),(2884,'Rio Casca',13),(2885,'Rio Doce',13),(2886,'Rio do Prado',13),(2887,'Rio Espera',13),(2888,'Rio Manso',13),(2889,'Rio Novo',13),(2890,'Rio Paranaíba',13),(2891,'Rio Pardo de Minas',13),(2892,'Rio Piracicaba',13),(2893,'Rio Pomba',13),(2894,'Rio Preto',13),(2895,'Rio Vermelho',13),(2896,'Ritápolis',13),(2897,'Rochedo de Minas',13),(2898,'Rodeiro',13),(2899,'Romaria',13),(2900,'Rosário da Limeira',13),(2901,'Rubelita',13),(2902,'Rubim',13),(2903,'Sabará',13),(2904,'Sabinópolis',13),(2905,'Sacramento',13),(2906,'Salinas',13),(2907,'Salto da Divisa',13),(2908,'Santa Bárbara',13),(2909,'Santa Bárbara do Leste',13),(2910,'Santa Bárbara do Monte Verde',13),(2911,'Santa Bárbara do Tugúrio',13),(2912,'Santa Cruz de Minas',13),(2913,'Santa Cruz de Salinas',13),(2914,'Santa Cruz do Escalvado',13),(2915,'Santa Efigênia de Minas',13),(2916,'Santa Fé de Minas',13),(2917,'Santa Helena de Minas',13),(2918,'Santa Juliana',13),(2919,'Santa Luzia',13),(2920,'Santa Margarida',13),(2921,'Santa Maria de Itabira',13),(2922,'Santa Maria do Salto',13),(2923,'Santa Maria do Suaçuí',13),(2924,'Santana da Vargem',13),(2925,'Santana de Cataguases',13),(2926,'Santana de Pirapama',13),(2927,'Santana do Deserto',13),(2928,'Santana do Garambéu',13),(2929,'Santana do Jacaré',13),(2930,'Santana do Manhuaçu',13),(2931,'Santana do Paraíso',13),(2932,'Santana do Riacho',13),(2933,'Santana dos Montes',13),(2934,'Santa Rita de Caldas',13),(2935,'Santa Rita de Jacutinga',13),(2936,'Santa Rita de Minas',13),(2937,'Santa Rita de Ibitipoca',13),(2938,'Santa Rita do Itueto',13),(2939,'Santa Rita do Sapucaí',13),(2940,'Santa Rosa da Serra',13),(2941,'Santa Vitória',13),(2942,'Santo Antônio do Amparo',13),(2943,'Santo Antônio do Aventureiro',13),(2944,'Santo Antônio do Grama',13),(2945,'Santo Antônio do Itambé',13),(2946,'Santo Antônio do Jacinto',13),(2947,'Santo Antônio do Monte',13),(2948,'Santo Antônio do Retiro',13),(2949,'Santo Antônio do Rio Abaixo',13),(2950,'Santo Hipólito',13),(2951,'Santos Dumont',13),(2952,'São Bento Abade',13),(2953,'São Brás do Suaçuí',13),(2954,'São Domingos das Dores',13),(2955,'São Domingos do Prata',13),(2956,'São Félix de Minas',13),(2957,'São Francisco',13),(2958,'São Francisco de Paula',13),(2959,'São Francisco de Sales',13),(2960,'São Francisco do Glória',13),(2961,'São Geraldo',13),(2962,'São Geraldo da Piedade',13),(2963,'São Geraldo do Baixio',13),(2964,'São Gonçalo do Abaeté',13),(2965,'São Gonçalo do Pará',13),(2966,'São Gonçalo do Rio Abaixo',13),(2967,'São Gonçalo do Sapucaí',13),(2968,'São Gotardo',13),(2969,'São João Batista do Glória',13),(2970,'São João da Lagoa',13),(2971,'São João da Mata',13),(2972,'São João da Ponte',13),(2973,'São João das Missões',13),(2974,'São João del Rei',13),(2975,'São João do Manhuaçu',13),(2976,'São João do Manteninha',13),(2977,'São João do Oriente',13),(2978,'São João do Pacuí',13),(2979,'São João do Paraíso',13),(2980,'São João Evangelista',13),(2981,'São João Nepomuceno',13),(2982,'São Joaquim de Bicas',13),(2983,'São José da Barra',13),(2984,'São José da Lapa',13),(2985,'São José da Safira',13),(2986,'São José da Varginha',13),(2987,'São José do Alegre',13),(2988,'São José do Divino',13),(2989,'São José do Goiabal',13),(2990,'São José do Jacuri',13),(2991,'São José do Mantimento',13),(2992,'São Lourenço',13),(2993,'São Miguel do Anta',13),(2994,'São Pedro da União',13),(2995,'São Pedro dos Ferros',13),(2996,'São Pedro do Suaçuí',13),(2997,'São Romão',13),(2998,'São Roque de Minas',13),(2999,'São Sebastião da Bela Vista',13),(3000,'São Sebastião da Vargem Alegre',13),(3001,'São Sebastião do Anta',13),(3002,'São Sebastião do Maranhão',13),(3003,'São Sebastião do Oeste',13),(3004,'São Sebastião do Paraíso',13),(3005,'São Sebastião do Rio Preto',13),(3006,'São Sebastião do Rio Verde',13),(3007,'São Tiago',13),(3008,'São Tomás de Aquino',13),(3009,'São Thomé das Letras',13),(3010,'São Vicente de Minas',13),(3011,'Sapucaí-Mirim',13),(3012,'Sardoá',13),(3013,'Sarzedo',13),(3014,'Setubinha',13),(3015,'Sem-Peixe',13),(3016,'Senador Amaral',13),(3017,'Senador Cortes',13),(3018,'Senador Firmino',13),(3019,'Senador José Bento',13),(3020,'Senador Modestino Gonçalves',13),(3021,'Senhora de Oliveira',13),(3022,'Senhora do Porto',13),(3023,'Senhora dos Remédios',13),(3024,'Sericita',13),(3025,'Seritinga',13),(3026,'Serra Azul de Minas',13),(3027,'Serra da Saudade',13),(3028,'Serra dos Aimorés',13),(3029,'Serra do Salitre',13),(3030,'Serrania',13),(3031,'Serranópolis de Minas',13),(3032,'Serranos',13),(3033,'Serro',13),(3034,'Sete Lagoas',13),(3035,'Silveirânia',13),(3036,'Silvianópolis',13),(3037,'Simão Pereira',13),(3038,'Simonésia',13),(3039,'Sobrália',13),(3040,'Soledade de Minas',13),(3041,'Tabuleiro',13),(3042,'Taiobeiras',13),(3043,'Taparuba',13),(3044,'Tapira',13),(3045,'Tapiraí',13),(3046,'Taquaraçu de Minas',13),(3047,'Tarumirim',13),(3048,'Teixeiras',13),(3049,'Teófilo Otoni',13),(3050,'Timóteo',13),(3051,'Tiradentes',13),(3052,'Tiros',13),(3053,'Tocantins',13),(3054,'Tocos do Moji',13),(3055,'Toledo',13),(3056,'Tombos',13),(3057,'Três Corações',13),(3058,'Três Marias',13),(3059,'Três Pontas',13),(3060,'Tumiritinga',13),(3061,'Tupaciguara',13),(3062,'Turmalina',13),(3063,'Turvolândia',13),(3064,'Ubá',13),(3065,'Ubaí',13),(3066,'Ubaporanga',13),(3067,'Uberaba',13),(3068,'Uberlândia',13),(3069,'Umburatiba',13),(3070,'Unaí',13),(3071,'União de Minas',13),(3072,'Uruana de Minas',13),(3073,'Urucânia',13),(3074,'Urucuia',13),(3075,'Vargem Alegre',13),(3076,'Vargem Bonita',13),(3077,'Vargem Grande do Rio Pardo',13),(3078,'Varginha',13),(3079,'Varjão de Minas',13),(3080,'Várzea da Palma',13),(3081,'Varzelândia',13),(3082,'Vazante',13),(3083,'Verdelândia',13),(3084,'Veredinha',13),(3085,'Veríssimo',13),(3086,'Vermelho Novo',13),(3087,'Vespasiano',13),(3088,'Viçosa',13),(3089,'Vieiras',13),(3090,'Mathias Lobato',13),(3091,'Virgem da Lapa',13),(3092,'Virgínia',13),(3093,'Virginópolis',13),(3094,'Virgolândia',13),(3095,'Visconde do Rio Branco',13),(3096,'Volta Grande',13),(3097,'Wenceslau Braz',13),(3098,'Afonso Cláudio',8),(3099,'Águia Branca',8),(3100,'Água Doce do Norte',8),(3101,'Alegre',8),(3102,'Alfredo Chaves',8),(3103,'Alto Rio Novo',8),(3104,'Anchieta',8),(3105,'Apiacá',8),(3106,'Aracruz',8),(3107,'Atilio Vivacqua',8),(3108,'Baixo Guandu',8),(3109,'Barra de São Francisco',8),(3110,'Boa Esperança',8),(3111,'Bom Jesus do Norte',8),(3112,'Brejetuba',8),(3113,'Cachoeiro de Itapemirim',8),(3114,'Cariacica',8),(3115,'Castelo',8),(3116,'Colatina',8),(3117,'Conceição da Barra',8),(3118,'Conceição do Castelo',8),(3119,'Divino de São Lourenço',8),(3120,'Domingos Martins',8),(3121,'Dores do Rio Preto',8),(3122,'Ecoporanga',8),(3123,'Fundão',8),(3124,'Governador Lindenberg',8),(3125,'Guaçuí',8),(3126,'Guarapari',8),(3127,'Ibatiba',8),(3128,'Ibiraçu',8),(3129,'Ibitirama',8),(3130,'Iconha',8),(3131,'Irupi',8),(3132,'Itaguaçu',8),(3133,'Itapemirim',8),(3134,'Itarana',8),(3135,'Iúna',8),(3136,'Jaguaré',8),(3137,'Jerônimo Monteiro',8),(3138,'João Neiva',8),(3139,'Laranja da Terra',8),(3140,'Linhares',8),(3141,'Mantenópolis',8),(3142,'Marataízes',8),(3143,'Marechal Floriano',8),(3144,'Marilândia',8),(3145,'Mimoso do Sul',8),(3146,'Montanha',8),(3147,'Mucurici',8),(3148,'Muniz Freire',8),(3149,'Muqui',8),(3150,'Nova Venécia',8),(3151,'Pancas',8),(3152,'Pedro Canário',8),(3153,'Pinheiros',8),(3154,'Piúma',8),(3155,'Ponto Belo',8),(3156,'Presidente Kennedy',8),(3157,'Rio Bananal',8),(3158,'Rio Novo do Sul',8),(3159,'Santa Leopoldina',8),(3160,'Santa Maria de Jetibá',8),(3161,'Santa Teresa',8),(3162,'São Domingos do Norte',8),(3163,'São Gabriel da Palha',8),(3164,'São José do Calçado',8),(3165,'São Mateus',8),(3166,'São Roque do Canaã',8),(3167,'Serra',8),(3168,'Sooretama',8),(3169,'Vargem Alta',8),(3170,'Venda Nova do Imigrante',8),(3171,'Viana',8),(3172,'Vila Pavão',8),(3173,'Vila Valério',8),(3174,'Vila Velha',8),(3175,'Vitória',8),(3176,'Angra dos Reis',19),(3177,'Aperibé',19),(3178,'Araruama',19),(3179,'Areal',19),(3180,'Armação dos Búzios',19),(3181,'Arraial do Cabo',19),(3182,'Barra do Piraí',19),(3183,'Barra Mansa',19),(3184,'Belford Roxo',19),(3185,'Bom Jardim',19),(3186,'Bom Jesus do Itabapoana',19),(3187,'Cabo Frio',19),(3188,'Cachoeiras de Macacu',19),(3189,'Cambuci',19),(3190,'Carapebus',19),(3191,'Comendador Levy Gasparian',19),(3192,'Campos dos Goytacazes',19),(3193,'Cantagalo',19),(3194,'Cardoso Moreira',19),(3195,'Carmo',19),(3196,'Casimiro de Abreu',19),(3197,'Conceição de Macabu',19),(3198,'Cordeiro',19),(3199,'Duas Barras',19),(3200,'Duque de Caxias',19),(3201,'Engenheiro Paulo de Frontin',19),(3202,'Guapimirim',19),(3203,'Iguaba Grande',19),(3204,'Itaboraí',19),(3205,'Itaguaí',19),(3206,'Italva',19),(3207,'Itaocara',19),(3208,'Itaperuna',19),(3209,'Itatiaia',19),(3210,'Japeri',19),(3211,'Laje do Muriaé',19),(3212,'Macaé',19),(3213,'Macuco',19),(3214,'Magé',19),(3215,'Mangaratiba',19),(3216,'Maricá',19),(3217,'Mendes',19),(3218,'Mesquita',19),(3219,'Miguel Pereira',19),(3220,'Miracema',19),(3221,'Natividade',19),(3222,'Nilópolis',19),(3223,'Niterói',19),(3224,'Nova Friburgo',19),(3225,'Nova Iguaçu',19),(3226,'Paracambi',19),(3227,'Paraíba do Sul',19),(3228,'Paraty',19),(3229,'Paty do Alferes',19),(3230,'Petrópolis',19),(3231,'Pinheiral',19),(3232,'Piraí',19),(3233,'Porciúncula',19),(3234,'Porto Real',19),(3235,'Quatis',19),(3236,'Queimados',19),(3237,'Quissamã',19),(3238,'Resende',19),(3239,'Rio Bonito',19),(3240,'Rio Claro',19),(3241,'Rio das Flores',19),(3242,'Rio das Ostras',19),(3243,'Rio de Janeiro',19),(3244,'Santa Maria Madalena',19),(3245,'Santo Antônio de Pádua',19),(3246,'São Francisco de Itabapoana',19),(3247,'São Fidélis',19),(3248,'São Gonçalo',19),(3249,'São João da Barra',19),(3250,'São João de Meriti',19),(3251,'São José de Ubá',19),(3252,'São José do Vale do Rio Preto',19),(3253,'São Pedro da Aldeia',19),(3254,'São Sebastião do Alto',19),(3255,'Sapucaia',19),(3256,'Saquarema',19),(3257,'Seropédica',19),(3258,'Silva Jardim',19),(3259,'Sumidouro',19),(3260,'Tanguá',19),(3261,'Teresópolis',19),(3262,'Trajano de Moraes',19),(3263,'Três Rios',19),(3264,'Valença',19),(3265,'Varre-Sai',19),(3266,'Vassouras',19),(3267,'Volta Redonda',19),(3268,'Adamantina',25),(3269,'Adolfo',25),(3270,'Aguaí',25),(3271,'Águas da Prata',25),(3272,'Águas de Lindóia',25),(3273,'Águas de Santa Bárbara',25),(3274,'Águas de São Pedro',25),(3275,'Agudos',25),(3276,'Alambari',25),(3277,'Alfredo Marcondes',25),(3278,'Altair',25),(3279,'Altinópolis',25),(3280,'Alto Alegre',25),(3281,'Alumínio',25),(3282,'Álvares Florence',25),(3283,'Álvares Machado',25),(3284,'Álvaro de Carvalho',25),(3285,'Alvinlândia',25),(3286,'Americana',25),(3287,'Américo Brasiliense',25),(3288,'Américo de Campos',25),(3289,'Amparo',25),(3290,'Analândia',25),(3291,'Andradina',25),(3292,'Angatuba',25),(3293,'Anhembi',25),(3294,'Anhumas',25),(3295,'Aparecida',25),(3296,'Aparecida D\'Oeste',25),(3297,'Apiaí',25),(3298,'Araçariguama',25),(3299,'Araçatuba',25),(3300,'Araçoiaba da Serra',25),(3301,'Aramina',25),(3302,'Arandu',25),(3303,'Arapeí',25),(3304,'Araraquara',25),(3305,'Araras',25),(3306,'Arco-Íris',25),(3307,'Arealva',25),(3308,'Areias',25),(3309,'Areiópolis',25),(3310,'Ariranha',25),(3311,'Artur Nogueira',25),(3312,'Arujá',25),(3313,'Aspásia',25),(3314,'Assis',25),(3315,'Atibaia',25),(3316,'Auriflama',25),(3317,'Avaí',25),(3318,'Avanhandava',25),(3319,'Avaré',25),(3320,'Bady Bassitt',25),(3321,'Balbinos',25),(3322,'Bálsamo',25),(3323,'Bananal',25),(3324,'Barão de Antonina',25),(3325,'Barbosa',25),(3326,'Bariri',25),(3327,'Barra Bonita',25),(3328,'Barra do Chapéu',25),(3329,'Barra do Turvo',25),(3330,'Barretos',25),(3331,'Barrinha',25),(3332,'Barueri',25),(3333,'Bastos',25),(3334,'Batatais',25),(3335,'Bauru',25),(3336,'Bebedouro',25),(3337,'Bento de Abreu',25),(3338,'Bernardino de Campos',25),(3339,'Bertioga',25),(3340,'Bilac',25),(3341,'Birigui',25),(3342,'Biritiba-Mirim',25),(3343,'Boa Esperança do Sul',25),(3344,'Bocaina',25),(3345,'Bofete',25),(3346,'Boituva',25),(3347,'Bom Jesus dos Perdões',25),(3348,'Bom Sucesso de Itararé',25),(3349,'Borá',25),(3350,'Boracéia',25),(3351,'Borborema',25),(3352,'Borebi',25),(3353,'Botucatu',25),(3354,'Bragança Paulista',25),(3355,'Braúna',25),(3356,'Brejo Alegre',25),(3357,'Brodowski',25),(3358,'Brotas',25),(3359,'Buri',25),(3360,'Buritama',25),(3361,'Buritizal',25),(3362,'Cabrália Paulista',25),(3363,'Cabreúva',25),(3364,'Caçapava',25),(3365,'Cachoeira Paulista',25),(3366,'Caconde',25),(3367,'Cafelândia',25),(3368,'Caiabu',25),(3369,'Caieiras',25),(3370,'Caiuá',25),(3371,'Cajamar',25),(3372,'Cajati',25),(3373,'Cajobi',25),(3374,'Cajuru',25),(3375,'Campina do Monte Alegre',25),(3376,'Campinas',25),(3377,'Campo Limpo Paulista',25),(3378,'Campos do Jordão',25),(3379,'Campos Novos Paulista',25),(3380,'Cananéia',25),(3381,'Canas',25),(3382,'Cândido Mota',25),(3383,'Cândido Rodrigues',25),(3384,'Canitar',25),(3385,'Capão Bonito',25),(3386,'Capela do Alto',25),(3387,'Capivari',25),(3388,'Caraguatatuba',25),(3389,'Carapicuíba',25),(3390,'Cardoso',25),(3391,'Casa Branca',25),(3392,'Cássia dos Coqueiros',25),(3393,'Castilho',25),(3394,'Catanduva',25),(3395,'Catiguá',25),(3396,'Cedral',25),(3397,'Cerqueira César',25),(3398,'Cerquilho',25),(3399,'Cesário Lange',25),(3400,'Charqueada',25),(3401,'Clementina',25),(3402,'Colina',25),(3403,'Colômbia',25),(3404,'Conchal',25),(3405,'Conchas',25),(3406,'Cordeirópolis',25),(3407,'Coroados',25),(3408,'Coronel Macedo',25),(3409,'Corumbataí',25),(3410,'Cosmópolis',25),(3411,'Cosmorama',25),(3412,'Cotia',25),(3413,'Cravinhos',25),(3414,'Cristais Paulista',25),(3415,'Cruzália',25),(3416,'Cruzeiro',25),(3417,'Cubatão',25),(3418,'Cunha',25),(3419,'Descalvado',25),(3420,'Diadema',25),(3421,'Dirce Reis',25),(3422,'Divinolândia',25),(3423,'Dobrada',25),(3424,'Dois Córregos',25),(3425,'Dolcinópolis',25),(3426,'Dourado',25),(3427,'Dracena',25),(3428,'Duartina',25),(3429,'Dumont',25),(3430,'Echaporã',25),(3431,'Eldorado',25),(3432,'Elias Fausto',25),(3433,'Elisiário',25),(3434,'Embaúba',25),(3435,'Embu das Artes',25),(3436,'Embu-Guaçu',25),(3437,'Emilianópolis',25),(3438,'Engenheiro Coelho',25),(3439,'Espírito Santo do Pinhal',25),(3440,'Espírito Santo do Turvo',25),(3441,'Estrela D\'Oeste',25),(3442,'Estrela do Norte',25),(3443,'Euclides da Cunha Paulista',25),(3444,'Fartura',25),(3445,'Fernandópolis',25),(3446,'Fernando Prestes',25),(3447,'Fernão',25),(3448,'Ferraz de Vasconcelos',25),(3449,'Flora Rica',25),(3450,'Floreal',25),(3451,'Flórida Paulista',25),(3452,'Florínia',25),(3453,'Franca',25),(3454,'Francisco Morato',25),(3455,'Franco da Rocha',25),(3456,'Gabriel Monteiro',25),(3457,'Gália',25),(3458,'Garça',25),(3459,'Gastão Vidigal',25),(3460,'Gavião Peixoto',25),(3461,'General Salgado',25),(3462,'Getulina',25),(3463,'Glicério',25),(3464,'Guaiçara',25),(3465,'Guaimbê',25),(3466,'Guaíra',25),(3467,'Guapiaçu',25),(3468,'Guapiara',25),(3469,'Guará',25),(3470,'Guaraçaí',25),(3471,'Guaraci',25),(3472,'Guarani D\'Oeste',25),(3473,'Guarantã',25),(3474,'Guararapes',25),(3475,'Guararema',25),(3476,'Guaratinguetá',25),(3477,'Guareí',25),(3478,'Guariba',25),(3479,'Guarujá',25),(3480,'Guarulhos',25),(3481,'Guatapará',25),(3482,'Guzolândia',25),(3483,'Herculândia',25),(3484,'Holambra',25),(3485,'Hortolândia',25),(3486,'Iacanga',25),(3487,'Iacri',25),(3488,'Iaras',25),(3489,'Ibaté',25),(3490,'Ibirá',25),(3491,'Ibirarema',25),(3492,'Ibitinga',25),(3493,'Ibiúna',25),(3494,'Icém',25),(3495,'Iepê',25),(3496,'Igaraçu do Tietê',25),(3497,'Igarapava',25),(3498,'Igaratá',25),(3499,'Iguape',25),(3500,'Ilhabela',25),(3501,'Ilha Comprida',25),(3502,'Ilha Solteira',25),(3503,'Indaiatuba',25),(3504,'Indiana',25),(3505,'Indiaporã',25),(3506,'Inúbia Paulista',25),(3507,'Ipaussu',25),(3508,'Iperó',25),(3509,'Ipeúna',25),(3510,'Ipiguá',25),(3511,'Iporanga',25),(3512,'Ipuã',25),(3513,'Iracemápolis',25),(3514,'Irapuã',25),(3515,'Irapuru',25),(3516,'Itaberá',25),(3517,'Itaí',25),(3518,'Itajobi',25),(3519,'Itaju',25),(3520,'Itanhaém',25),(3521,'Itaóca',25),(3522,'Itapecerica da Serra',25),(3523,'Itapetininga',25),(3524,'Itapeva',25),(3525,'Itapevi',25),(3526,'Itapira',25),(3527,'Itapirapuã Paulista',25),(3528,'Itápolis',25),(3529,'Itaporanga',25),(3530,'Itapuí',25),(3531,'Itapura',25),(3532,'Itaquaquecetuba',25),(3533,'Itararé',25),(3534,'Itariri',25),(3535,'Itatiba',25),(3536,'Itatinga',25),(3537,'Itirapina',25),(3538,'Itirapuã',25),(3539,'Itobi',25),(3540,'Itu',25),(3541,'Itupeva',25),(3542,'Ituverava',25),(3543,'Jaborandi',25),(3544,'Jaboticabal',25),(3545,'Jacareí',25),(3546,'Jaci',25),(3547,'Jacupiranga',25),(3548,'Jaguariúna',25),(3549,'Jales',25),(3550,'Jambeiro',25),(3551,'Jandira',25),(3552,'Jardinópolis',25),(3553,'Jarinu',25),(3554,'Jaú',25),(3555,'Jeriquara',25),(3556,'Joanópolis',25),(3557,'João Ramalho',25),(3558,'José Bonifácio',25),(3559,'Júlio Mesquita',25),(3560,'Jumirim',25),(3561,'Jundiaí',25),(3562,'Junqueirópolis',25),(3563,'Juquiá',25),(3564,'Juquitiba',25),(3565,'Lagoinha',25),(3566,'Laranjal Paulista',25),(3567,'Lavínia',25),(3568,'Lavrinhas',25),(3569,'Leme',25),(3570,'Lençóis Paulista',25),(3571,'Limeira',25),(3572,'Lindóia',25),(3573,'Lins',25),(3574,'Lorena',25),(3575,'Lourdes',25),(3576,'Louveira',25),(3577,'Lucélia',25),(3578,'Lucianópolis',25),(3579,'Luís Antônio',25),(3580,'Luiziânia',25),(3581,'Lupércio',25),(3582,'Lutécia',25),(3583,'Macatuba',25),(3584,'Macaubal',25),(3585,'Macedônia',25),(3586,'Magda',25),(3587,'Mairinque',25),(3588,'Mairiporã',25),(3589,'Manduri',25),(3590,'Marabá Paulista',25),(3591,'Maracaí',25),(3592,'Marapoama',25),(3593,'Mariápolis',25),(3594,'Marília',25),(3595,'Marinópolis',25),(3596,'Martinópolis',25),(3597,'Matão',25),(3598,'Mauá',25),(3599,'Mendonça',25),(3600,'Meridiano',25),(3601,'Mesópolis',25),(3602,'Miguelópolis',25),(3603,'Mineiros do Tietê',25),(3604,'Miracatu',25),(3605,'Mira Estrela',25),(3606,'Mirandópolis',25),(3607,'Mirante do Paranapanema',25),(3608,'Mirassol',25),(3609,'Mirassolândia',25),(3610,'Mococa',25),(3611,'Mogi das Cruzes',25),(3612,'Mogi Guaçu',25),(3613,'Moji Mirim',25),(3614,'Mombuca',25),(3615,'Monções',25),(3616,'Mongaguá',25),(3617,'Monte Alegre do Sul',25),(3618,'Monte Alto',25),(3619,'Monte Aprazível',25),(3620,'Monte Azul Paulista',25),(3621,'Monte Castelo',25),(3622,'Monteiro Lobato',25),(3623,'Monte Mor',25),(3624,'Morro Agudo',25),(3625,'Morungaba',25),(3626,'Motuca',25),(3627,'Murutinga do Sul',25),(3628,'Nantes',25),(3629,'Narandiba',25),(3630,'Natividade da Serra',25),(3631,'Nazaré Paulista',25),(3632,'Neves Paulista',25),(3633,'Nhandeara',25),(3634,'Nipoã',25),(3635,'Nova Aliança',25),(3636,'Nova Campina',25),(3637,'Nova Canaã Paulista',25),(3638,'Nova Castilho',25),(3639,'Nova Europa',25),(3640,'Nova Granada',25),(3641,'Nova Guataporanga',25),(3642,'Nova Independência',25),(3643,'Novais',25),(3644,'Nova Luzitânia',25),(3645,'Nova Odessa',25),(3646,'Novo Horizonte',25),(3647,'Nuporanga',25),(3648,'Ocauçu',25),(3649,'Óleo',25),(3650,'Olímpia',25),(3651,'Onda Verde',25),(3652,'Oriente',25),(3653,'Orindiúva',25),(3654,'Orlândia',25),(3655,'Osasco',25),(3656,'Oscar Bressane',25),(3657,'Osvaldo Cruz',25),(3658,'Ourinhos',25),(3659,'Ouroeste',25),(3660,'Ouro Verde',25),(3661,'Pacaembu',25),(3662,'Palestina',25),(3663,'Palmares Paulista',25),(3664,'Palmeira D\'Oeste',25),(3665,'Palmital',25),(3666,'Panorama',25),(3667,'Paraguaçu Paulista',25),(3668,'Paraibuna',25),(3669,'Paraíso',25),(3670,'Paranapanema',25),(3671,'Paranapuã',25),(3672,'Parapuã',25),(3673,'Pardinho',25),(3674,'Pariquera-Açu',25),(3675,'Parisi',25),(3676,'Patrocínio Paulista',25),(3677,'Paulicéia',25),(3678,'Paulínia',25),(3679,'Paulistânia',25),(3680,'Paulo de Faria',25),(3681,'Pederneiras',25),(3682,'Pedra Bela',25),(3683,'Pedranópolis',25),(3684,'Pedregulho',25),(3685,'Pedreira',25),(3686,'Pedrinhas Paulista',25),(3687,'Pedro de Toledo',25),(3688,'Penápolis',25),(3689,'Pereira Barreto',25),(3690,'Pereiras',25),(3691,'Peruíbe',25),(3692,'Piacatu',25),(3693,'Piedade',25),(3694,'Pilar do Sul',25),(3695,'Pindamonhangaba',25),(3696,'Pindorama',25),(3697,'Pinhalzinho',25),(3698,'Piquerobi',25),(3699,'Piquete',25),(3700,'Piracaia',25),(3701,'Piracicaba',25),(3702,'Piraju',25),(3703,'Pirajuí',25),(3704,'Pirangi',25),(3705,'Pirapora do Bom Jesus',25),(3706,'Pirapozinho',25),(3707,'Pirassununga',25),(3708,'Piratininga',25),(3709,'Pitangueiras',25),(3710,'Planalto',25),(3711,'Platina',25),(3712,'Poá',25),(3713,'Poloni',25),(3714,'Pompéia',25),(3715,'Pongaí',25),(3716,'Pontal',25),(3717,'Pontalinda',25),(3718,'Pontes Gestal',25),(3719,'Populina',25),(3720,'Porangaba',25),(3721,'Porto Feliz',25),(3722,'Porto Ferreira',25),(3723,'Potim',25),(3724,'Potirendaba',25),(3725,'Pracinha',25),(3726,'Pradópolis',25),(3727,'Praia Grande',25),(3728,'Pratânia',25),(3729,'Presidente Alves',25),(3730,'Presidente Bernardes',25),(3731,'Presidente Epitácio',25),(3732,'Presidente Prudente',25),(3733,'Presidente Venceslau',25),(3734,'Promissão',25),(3735,'Quadra',25),(3736,'Quatá',25),(3737,'Queiroz',25),(3738,'Queluz',25),(3739,'Quintana',25),(3740,'Rafard',25),(3741,'Rancharia',25),(3742,'Redenção da Serra',25),(3743,'Regente Feijó',25),(3744,'Reginópolis',25),(3745,'Registro',25),(3746,'Restinga',25),(3747,'Ribeira',25),(3748,'Ribeirão Bonito',25),(3749,'Ribeirão Branco',25),(3750,'Ribeirão Corrente',25),(3751,'Ribeirão do Sul',25),(3752,'Ribeirão dos Índios',25),(3753,'Ribeirão Grande',25),(3754,'Ribeirão Pires',25),(3755,'Ribeirão Preto',25),(3756,'Riversul',25),(3757,'Rifaina',25),(3758,'Rincão',25),(3759,'Rinópolis',25),(3760,'Rio Claro',25),(3761,'Rio das Pedras',25),(3762,'Rio Grande da Serra',25),(3763,'Riolândia',25),(3764,'Rosana',25),(3765,'Roseira',25),(3766,'Rubiácea',25),(3767,'Rubinéia',25),(3768,'Sabino',25),(3769,'Sagres',25),(3770,'Sales',25),(3771,'Sales Oliveira',25),(3772,'Salesópolis',25),(3773,'Salmourão',25),(3774,'Saltinho',25),(3775,'Salto',25),(3776,'Salto de Pirapora',25),(3777,'Salto Grande',25),(3778,'Sandovalina',25),(3779,'Santa Adélia',25),(3780,'Santa Albertina',25),(3781,'Santa Bárbara D\'Oeste',25),(3782,'Santa Branca',25),(3783,'Santa Clara D\'Oeste',25),(3784,'Santa Cruz da Conceição',25),(3785,'Santa Cruz da Esperança',25),(3786,'Santa Cruz das Palmeiras',25),(3787,'Santa Cruz do Rio Pardo',25),(3788,'Santa Ernestina',25),(3789,'Santa Fé do Sul',25),(3790,'Santa Gertrudes',25),(3791,'Santa Isabel',25),(3792,'Santa Lúcia',25),(3793,'Santa Maria da Serra',25),(3794,'Santa Mercedes',25),(3795,'Santana da Ponte Pensa',25),(3796,'Santana de Parnaíba',25),(3797,'Santa Rita D\'Oeste',25),(3798,'Santa Rita do Passa Quatro',25),(3799,'Santa Rosa de Viterbo',25),(3800,'Santa Salete',25),(3801,'Santo Anastácio',25),(3802,'Santo André',25),(3803,'Santo Antônio da Alegria',25),(3804,'Santo Antônio de Posse',25),(3805,'Santo Antônio do Aracanguá',25),(3806,'Santo Antônio do Jardim',25),(3807,'Santo Antônio do Pinhal',25),(3808,'Santo Expedito',25),(3809,'Santópolis do Aguapeí',25),(3810,'Santos',25),(3811,'São Bento do Sapucaí',25),(3812,'São Bernardo do Campo',25),(3813,'São Caetano do Sul',25),(3814,'São Carlos',25),(3815,'São Francisco',25),(3816,'São João da Boa Vista',25),(3817,'São João das Duas Pontes',25),(3818,'São João de Iracema',25),(3819,'São João do Pau D\'Alho',25),(3820,'São Joaquim da Barra',25),(3821,'São José da Bela Vista',25),(3822,'São José do Barreiro',25),(3823,'São José do Rio Pardo',25),(3824,'São José do Rio Preto',25),(3825,'São José dos Campos',25),(3826,'São Lourenço da Serra',25),(3827,'São Luís do Paraitinga',25),(3828,'São Manuel',25),(3829,'São Miguel Arcanjo',25),(3830,'São Paulo',25),(3831,'São Pedro',25),(3832,'São Pedro do Turvo',25),(3833,'São Roque',25),(3834,'São Sebastião',25),(3835,'São Sebastião da Grama',25),(3836,'São Simão',25),(3837,'São Vicente',25),(3838,'Sarapuí',25),(3839,'Sarutaiá',25),(3840,'Sebastianópolis do Sul',25),(3841,'Serra Azul',25),(3842,'Serrana',25),(3843,'Serra Negra',25),(3844,'Sertãozinho',25),(3845,'Sete Barras',25),(3846,'Severínia',25),(3847,'Silveiras',25),(3848,'Socorro',25),(3849,'Sorocaba',25),(3850,'Sud Mennucci',25),(3851,'Sumaré',25),(3852,'Suzano',25),(3853,'Suzanápolis',25),(3854,'Tabapuã',25),(3855,'Tabatinga',25),(3856,'Taboão da Serra',25),(3857,'Taciba',25),(3858,'Taguaí',25),(3859,'Taiaçu',25),(3860,'Taiúva',25),(3861,'Tambaú',25),(3862,'Tanabi',25),(3863,'Tapiraí',25),(3864,'Tapiratiba',25),(3865,'Taquaral',25),(3866,'Taquaritinga',25),(3867,'Taquarituba',25),(3868,'Taquarivaí',25),(3869,'Tarabai',25),(3870,'Tarumã',25),(3871,'Tatuí',25),(3872,'Taubaté',25),(3873,'Tejupá',25),(3874,'Teodoro Sampaio',25),(3875,'Terra Roxa',25),(3876,'Tietê',25),(3877,'Timburi',25),(3878,'Torre de Pedra',25),(3879,'Torrinha',25),(3880,'Trabiju',25),(3881,'Tremembé',25),(3882,'Três Fronteiras',25),(3883,'Tuiuti',25),(3884,'Tupã',25),(3885,'Tupi Paulista',25),(3886,'Turiúba',25),(3887,'Turmalina',25),(3888,'Ubarana',25),(3889,'Ubatuba',25),(3890,'Ubirajara',25),(3891,'Uchoa',25),(3892,'União Paulista',25),(3893,'Urânia',25),(3894,'Uru',25),(3895,'Urupês',25),(3896,'Valentim Gentil',25),(3897,'Valinhos',25),(3898,'Valparaíso',25),(3899,'Vargem',25),(3900,'Vargem Grande do Sul',25),(3901,'Vargem Grande Paulista',25),(3902,'Várzea Paulista',25),(3903,'Vera Cruz',25),(3904,'Vinhedo',25),(3905,'Viradouro',25),(3906,'Vista Alegre do Alto',25),(3907,'Vitória Brasil',25),(3908,'Votorantim',25),(3909,'Votuporanga',25),(3910,'Zacarias',25),(3911,'Chavantes',25),(3912,'Estiva Gerbi',25),(3913,'Abatiá',16),(3914,'Adrianópolis',16),(3915,'Agudos do Sul',16),(3916,'Almirante Tamandaré',16),(3917,'Altamira do Paraná',16),(3918,'Altônia',16),(3919,'Alto Paraná',16),(3920,'Alto Piquiri',16),(3921,'Alvorada do Sul',16),(3922,'Amaporã',16),(3923,'Ampére',16),(3924,'Anahy',16),(3925,'Andirá',16),(3926,'Ângulo',16),(3927,'Antonina',16),(3928,'Antônio Olinto',16),(3929,'Apucarana',16),(3930,'Arapongas',16),(3931,'Arapoti',16),(3932,'Arapuã',16),(3933,'Araruna',16),(3934,'Araucária',16),(3935,'Ariranha do Ivaí',16),(3936,'Assaí',16),(3937,'Assis Chateaubriand',16),(3938,'Astorga',16),(3939,'Atalaia',16),(3940,'Balsa Nova',16),(3941,'Bandeirantes',16),(3942,'Barbosa Ferraz',16),(3943,'Barracão',16),(3944,'Barra do Jacaré',16),(3945,'Bela Vista da Caroba',16),(3946,'Bela Vista do Paraíso',16),(3947,'Bituruna',16),(3948,'Boa Esperança',16),(3949,'Boa Esperança do Iguaçu',16),(3950,'Boa Ventura de São Roque',16),(3951,'Boa Vista da Aparecida',16),(3952,'Bocaiúva do Sul',16),(3953,'Bom Jesus do Sul',16),(3954,'Bom Sucesso',16),(3955,'Bom Sucesso do Sul',16),(3956,'Borrazópolis',16),(3957,'Braganey',16),(3958,'Brasilândia do Sul',16),(3959,'Cafeara',16),(3960,'Cafelândia',16),(3961,'Cafezal do Sul',16),(3962,'Califórnia',16),(3963,'Cambará',16),(3964,'Cambé',16),(3965,'Cambira',16),(3966,'Campina da Lagoa',16),(3967,'Campina do Simão',16),(3968,'Campina Grande do Sul',16),(3969,'Campo Bonito',16),(3970,'Campo do Tenente',16),(3971,'Campo Largo',16),(3972,'Campo Magro',16),(3973,'Campo Mourão',16),(3974,'Cândido de Abreu',16),(3975,'Candói',16),(3976,'Cantagalo',16),(3977,'Capanema',16),(3978,'Capitão Leônidas Marques',16),(3979,'Carambeí',16),(3980,'Carlópolis',16),(3981,'Cascavel',16),(3982,'Castro',16),(3983,'Catanduvas',16),(3984,'Centenário do Sul',16),(3985,'Cerro Azul',16),(3986,'Céu Azul',16),(3987,'Chopinzinho',16),(3988,'Cianorte',16),(3989,'Cidade Gaúcha',16),(3990,'Clevelândia',16),(3991,'Colombo',16),(3992,'Colorado',16),(3993,'Congonhinhas',16),(3994,'Conselheiro Mairinck',16),(3995,'Contenda',16),(3996,'Corbélia',16),(3997,'Cornélio Procópio',16),(3998,'Coronel Domingos Soares',16),(3999,'Coronel Vivida',16),(4000,'Corumbataí do Sul',16),(4001,'Cruzeiro do Iguaçu',16),(4002,'Cruzeiro do Oeste',16),(4003,'Cruzeiro do Sul',16),(4004,'Cruz Machado',16),(4005,'Cruzmaltina',16),(4006,'Curitiba',16),(4007,'Curiúva',16),(4008,'Diamante do Norte',16),(4009,'Diamante do Sul',16),(4010,'Diamante D\'Oeste',16),(4011,'Dois Vizinhos',16),(4012,'Douradina',16),(4013,'Doutor Camargo',16),(4014,'Enéas Marques',16),(4015,'Engenheiro Beltrão',16),(4016,'Esperança Nova',16),(4017,'Entre Rios do Oeste',16),(4018,'Espigão Alto do Iguaçu',16),(4019,'Farol',16),(4020,'Faxinal',16),(4021,'Fazenda Rio Grande',16),(4022,'Fênix',16),(4023,'Fernandes Pinheiro',16),(4024,'Figueira',16),(4025,'Floraí',16),(4026,'Flor da Serra do Sul',16),(4027,'Floresta',16),(4028,'Florestópolis',16),(4029,'Flórida',16),(4030,'Formosa do Oeste',16),(4031,'Foz do Iguaçu',16),(4032,'Francisco Alves',16),(4033,'Francisco Beltrão',16),(4034,'Foz do Jordão',16),(4035,'General Carneiro',16),(4036,'Godoy Moreira',16),(4037,'Goioerê',16),(4038,'Goioxim',16),(4039,'Grandes Rios',16),(4040,'Guaíra',16),(4041,'Guairaçá',16),(4042,'Guamiranga',16),(4043,'Guapirama',16),(4044,'Guaporema',16),(4045,'Guaraci',16),(4046,'Guaraniaçu',16),(4047,'Guarapuava',16),(4048,'Guaraqueçaba',16),(4049,'Guaratuba',16),(4050,'Honório Serpa',16),(4051,'Ibaiti',16),(4052,'Ibema',16),(4053,'Ibiporã',16),(4054,'Icaraíma',16),(4055,'Iguaraçu',16),(4056,'Iguatu',16),(4057,'Imbaú',16),(4058,'Imbituva',16),(4059,'Inácio Martins',16),(4060,'Inajá',16),(4061,'Indianópolis',16),(4062,'Ipiranga',16),(4063,'Iporã',16),(4064,'Iracema do Oeste',16),(4065,'Irati',16),(4066,'Iretama',16),(4067,'Itaguajé',16),(4068,'Itaipulândia',16),(4069,'Itambaracá',16),(4070,'Itambé',16),(4071,'Itapejara D\'Oeste',16),(4072,'Itaperuçu',16),(4073,'Itaúna do Sul',16),(4074,'Ivaí',16),(4075,'Ivaiporã',16),(4076,'Ivaté',16),(4077,'Ivatuba',16),(4078,'Jaboti',16),(4079,'Jacarezinho',16),(4080,'Jaguapitã',16),(4081,'Jaguariaíva',16),(4082,'Jandaia do Sul',16),(4083,'Janiópolis',16),(4084,'Japira',16),(4085,'Japurá',16),(4086,'Jardim Alegre',16),(4087,'Jardim Olinda',16),(4088,'Jataizinho',16),(4089,'Jesuítas',16),(4090,'Joaquim Távora',16),(4091,'Jundiaí do Sul',16),(4092,'Juranda',16),(4093,'Jussara',16),(4094,'Kaloré',16),(4095,'Lapa',16),(4096,'Laranjal',16),(4097,'Laranjeiras do Sul',16),(4098,'Leópolis',16),(4099,'Lidianópolis',16),(4100,'Lindoeste',16),(4101,'Loanda',16),(4102,'Lobato',16),(4103,'Londrina',16),(4104,'Luiziana',16),(4105,'Lunardelli',16),(4106,'Lupionópolis',16),(4107,'Mallet',16),(4108,'Mamborê',16),(4109,'Mandaguaçu',16),(4110,'Mandaguari',16),(4111,'Mandirituba',16),(4112,'Manfrinópolis',16),(4113,'Mangueirinha',16),(4114,'Manoel Ribas',16),(4115,'Marechal Cândido Rondon',16),(4116,'Maria Helena',16),(4117,'Marialva',16),(4118,'Marilândia do Sul',16),(4119,'Marilena',16),(4120,'Mariluz',16),(4121,'Maringá',16),(4122,'Mariópolis',16),(4123,'Maripá',16),(4124,'Marmeleiro',16),(4125,'Marquinho',16),(4126,'Marumbi',16),(4127,'Matelândia',16),(4128,'Matinhos',16),(4129,'Mato Rico',16),(4130,'Mauá da Serra',16),(4131,'Medianeira',16),(4132,'Mercedes',16),(4133,'Mirador',16),(4134,'Miraselva',16),(4135,'Missal',16),(4136,'Moreira Sales',16),(4137,'Morretes',16),(4138,'Munhoz de Melo',16),(4139,'Nossa Senhora das Graças',16),(4140,'Nova Aliança do Ivaí',16),(4141,'Nova América da Colina',16),(4142,'Nova Aurora',16),(4143,'Nova Cantu',16),(4144,'Nova Esperança',16),(4145,'Nova Esperança do Sudoeste',16),(4146,'Nova Fátima',16),(4147,'Nova Laranjeiras',16),(4148,'Nova Londrina',16),(4149,'Nova Olímpia',16),(4150,'Nova Santa Bárbara',16),(4151,'Nova Santa Rosa',16),(4152,'Nova Prata do Iguaçu',16),(4153,'Nova Tebas',16),(4154,'Novo Itacolomi',16),(4155,'Ortigueira',16),(4156,'Ourizona',16),(4157,'Ouro Verde do Oeste',16),(4158,'Paiçandu',16),(4159,'Palmas',16),(4160,'Palmeira',16),(4161,'Palmital',16),(4162,'Palotina',16),(4163,'Paraíso do Norte',16),(4164,'Paranacity',16),(4165,'Paranaguá',16),(4166,'Paranapoema',16),(4167,'Paranavaí',16),(4168,'Pato Bragado',16),(4169,'Pato Branco',16),(4170,'Paula Freitas',16),(4171,'Paulo Frontin',16),(4172,'Peabiru',16),(4173,'Perobal',16),(4174,'Pérola',16),(4175,'Pérola D\'Oeste',16),(4176,'Piên',16),(4177,'Pinhais',16),(4178,'Pinhalão',16),(4179,'Pinhal de São Bento',16),(4180,'Pinhão',16),(4181,'Piraí do Sul',16),(4182,'Piraquara',16),(4183,'Pitanga',16),(4184,'Pitangueiras',16),(4185,'Planaltina do Paraná',16),(4186,'Planalto',16),(4187,'Ponta Grossa',16),(4188,'Pontal do Paraná',16),(4189,'Porecatu',16),(4190,'Porto Amazonas',16),(4191,'Porto Barreiro',16),(4192,'Porto Rico',16),(4193,'Porto Vitória',16),(4194,'Prado Ferreira',16),(4195,'Pranchita',16),(4196,'Presidente Castelo Branco',16),(4197,'Primeiro de Maio',16),(4198,'Prudentópolis',16),(4199,'Quarto Centenário',16),(4200,'Quatiguá',16),(4201,'Quatro Barras',16),(4202,'Quatro Pontes',16),(4203,'Quedas do Iguaçu',16),(4204,'Querência do Norte',16),(4205,'Quinta do Sol',16),(4206,'Quitandinha',16),(4207,'Ramilândia',16),(4208,'Rancho Alegre',16),(4209,'Rancho Alegre D\'Oeste',16),(4210,'Realeza',16),(4211,'Rebouças',16),(4212,'Renascença',16),(4213,'Reserva',16),(4214,'Reserva do Iguaçu',16),(4215,'Ribeirão Claro',16),(4216,'Ribeirão do Pinhal',16),(4217,'Rio Azul',16),(4218,'Rio Bom',16),(4219,'Rio Bonito do Iguaçu',16),(4220,'Rio Branco do Ivaí',16),(4221,'Rio Branco do Sul',16),(4222,'Rio Negro',16),(4223,'Rolândia',16),(4224,'Roncador',16),(4225,'Rondon',16),(4226,'Rosário do Ivaí',16),(4227,'Sabáudia',16),(4228,'Salgado Filho',16),(4229,'Salto do Itararé',16),(4230,'Salto do Lontra',16),(4231,'Santa Amélia',16),(4232,'Santa Cecília do Pavão',16),(4233,'Santa Cruz de Monte Castelo',16),(4234,'Santa Fé',16),(4235,'Santa Helena',16),(4236,'Santa Inês',16),(4237,'Santa Isabel do Ivaí',16),(4238,'Santa Izabel do Oeste',16),(4239,'Santa Lúcia',16),(4240,'Santa Maria do Oeste',16),(4241,'Santa Mariana',16),(4242,'Santa Mônica',16),(4243,'Santana do Itararé',16),(4244,'Santa Tereza do Oeste',16),(4245,'Santa Terezinha de Itaipu',16),(4246,'Santo Antônio da Platina',16),(4247,'Santo Antônio do Caiuá',16),(4248,'Santo Antônio do Paraíso',16),(4249,'Santo Antônio do Sudoeste',16),(4250,'Santo Inácio',16),(4251,'São Carlos do Ivaí',16),(4252,'São Jerônimo da Serra',16),(4253,'São João',16),(4254,'São João do Caiuá',16),(4255,'São João do Ivaí',16),(4256,'São João do Triunfo',16),(4257,'São Jorge D\'Oeste',16),(4258,'São Jorge do Ivaí',16),(4259,'São Jorge do Patrocínio',16),(4260,'São José da Boa Vista',16),(4261,'São José das Palmeiras',16),(4262,'São José dos Pinhais',16),(4263,'São Manoel do Paraná',16),(4264,'São Mateus do Sul',16),(4265,'São Miguel do Iguaçu',16),(4266,'São Pedro do Iguaçu',16),(4267,'São Pedro do Ivaí',16),(4268,'São Pedro do Paraná',16),(4269,'São Sebastião da Amoreira',16),(4270,'São Tomé',16),(4271,'Sapopema',16),(4272,'Sarandi',16),(4273,'Saudade do Iguaçu',16),(4274,'Sengés',16),(4275,'Serranópolis do Iguaçu',16),(4276,'Sertaneja',16),(4277,'Sertanópolis',16),(4278,'Siqueira Campos',16),(4279,'Sulina',16),(4280,'Tamarana',16),(4281,'Tamboara',16),(4282,'Tapejara',16),(4283,'Tapira',16),(4284,'Teixeira Soares',16),(4285,'Telêmaco Borba',16),(4286,'Terra Boa',16),(4287,'Terra Rica',16),(4288,'Terra Roxa',16),(4289,'Tibagi',16),(4290,'Tijucas do Sul',16),(4291,'Toledo',16),(4292,'Tomazina',16),(4293,'Três Barras do Paraná',16),(4294,'Tunas do Paraná',16),(4295,'Tuneiras do Oeste',16),(4296,'Tupãssi',16),(4297,'Turvo',16),(4298,'Ubiratã',16),(4299,'Umuarama',16),(4300,'União da Vitória',16),(4301,'Uniflor',16),(4302,'Uraí',16),(4303,'Wenceslau Braz',16),(4304,'Ventania',16),(4305,'Vera Cruz do Oeste',16),(4306,'Verê',16),(4307,'Alto Paraíso',16),(4308,'Doutor Ulysses',16),(4309,'Virmond',16),(4310,'Vitorino',16),(4311,'Xambrê',16),(4312,'Abdon Batista',24),(4313,'Abelardo Luz',24),(4314,'Agrolândia',24),(4315,'Agronômica',24),(4316,'Água Doce',24),(4317,'Águas de Chapecó',24),(4318,'Águas Frias',24),(4319,'Águas Mornas',24),(4320,'Alfredo Wagner',24),(4321,'Alto Bela Vista',24),(4322,'Anchieta',24),(4323,'Angelina',24),(4324,'Anita Garibaldi',24),(4325,'Anitápolis',24),(4326,'Antônio Carlos',24),(4327,'Apiúna',24),(4328,'Arabutã',24),(4329,'Araquari',24),(4330,'Araranguá',24),(4331,'Armazém',24),(4332,'Arroio Trinta',24),(4333,'Arvoredo',24),(4334,'Ascurra',24),(4335,'Atalanta',24),(4336,'Aurora',24),(4337,'Balneário Arroio do Silva',24),(4338,'Balneário Camboriú',24),(4339,'Balneário Barra do Sul',24),(4340,'Balneário Gaivota',24),(4341,'Bandeirante',24),(4342,'Barra Bonita',24),(4343,'Barra Velha',24),(4344,'Bela Vista do Toldo',24),(4345,'Belmonte',24),(4346,'Benedito Novo',24),(4347,'Biguaçu',24),(4348,'Blumenau',24),(4349,'Bocaina do Sul',24),(4350,'Bombinhas',24),(4351,'Bom Jardim da Serra',24),(4352,'Bom Jesus',24),(4353,'Bom Jesus do Oeste',24),(4354,'Bom Retiro',24),(4355,'Botuverá',24),(4356,'Braço do Norte',24),(4357,'Braço do Trombudo',24),(4358,'Brunópolis',24),(4359,'Brusque',24),(4360,'Caçador',24),(4361,'Caibi',24),(4362,'Calmon',24),(4363,'Camboriú',24),(4364,'Capão Alto',24),(4365,'Campo Alegre',24),(4366,'Campo Belo do Sul',24),(4367,'Campo Erê',24),(4368,'Campos Novos',24),(4369,'Canelinha',24),(4370,'Canoinhas',24),(4371,'Capinzal',24),(4372,'Capivari de Baixo',24),(4373,'Catanduvas',24),(4374,'Caxambu do Sul',24),(4375,'Celso Ramos',24),(4376,'Cerro Negro',24),(4377,'Chapadão do Lageado',24),(4378,'Chapecó',24),(4379,'Cocal do Sul',24),(4380,'Concórdia',24),(4381,'Cordilheira Alta',24),(4382,'Coronel Freitas',24),(4383,'Coronel Martins',24),(4384,'Corupá',24),(4385,'Correia Pinto',24),(4386,'Criciúma',24),(4387,'Cunha Porã',24),(4388,'Cunhataí',24),(4389,'Curitibanos',24),(4390,'Descanso',24),(4391,'Dionísio Cerqueira',24),(4392,'Dona Emma',24),(4393,'Doutor Pedrinho',24),(4394,'Entre Rios',24),(4395,'Ermo',24),(4396,'Erval Velho',24),(4397,'Faxinal dos Guedes',24),(4398,'Flor do Sertão',24),(4399,'Florianópolis',24),(4400,'Formosa do Sul',24),(4401,'Forquilhinha',24),(4402,'Fraiburgo',24),(4403,'Frei Rogério',24),(4404,'Galvão',24),(4405,'Garopaba',24),(4406,'Garuva',24),(4407,'Gaspar',24),(4408,'Governador Celso Ramos',24),(4409,'Grão Pará',24),(4410,'Gravatal',24),(4411,'Guabiruba',24),(4412,'Guaraciaba',24),(4413,'Guaramirim',24),(4414,'Guarujá do Sul',24),(4415,'Guatambú',24),(4416,'Herval D\'Oeste',24),(4417,'Ibiam',24),(4418,'Ibicaré',24),(4419,'Ibirama',24),(4420,'Içara',24),(4421,'Ilhota',24),(4422,'Imaruí',24),(4423,'Imbituba',24),(4424,'Imbuia',24),(4425,'Indaial',24),(4426,'Iomerê',24),(4427,'Ipira',24),(4428,'Iporã do Oeste',24),(4429,'Ipuaçu',24),(4430,'Ipumirim',24),(4431,'Iraceminha',24),(4432,'Irani',24),(4433,'Irati',24),(4434,'Irineópolis',24),(4435,'Itá',24),(4436,'Itaiópolis',24),(4437,'Itajaí',24),(4438,'Itapema',24),(4439,'Itapiranga',24),(4440,'Itapoá',24),(4441,'Ituporanga',24),(4442,'Jaborá',24),(4443,'Jacinto Machado',24),(4444,'Jaguaruna',24),(4445,'Jaraguá do Sul',24),(4446,'Jardinópolis',24),(4447,'Joaçaba',24),(4448,'Joinville',24),(4449,'José Boiteux',24),(4450,'Jupiá',24),(4451,'Lacerdópolis',24),(4452,'Lages',24),(4453,'Laguna',24),(4454,'Lajeado Grande',24),(4455,'Laurentino',24),(4456,'Lauro Muller',24),(4457,'Lebon Régis',24),(4458,'Leoberto Leal',24),(4459,'Lindóia do Sul',24),(4460,'Lontras',24),(4461,'Luiz Alves',24),(4462,'Luzerna',24),(4463,'Macieira',24),(4464,'Mafra',24),(4465,'Major Gercino',24),(4466,'Major Vieira',24),(4467,'Maracajá',24),(4468,'Maravilha',24),(4469,'Marema',24),(4470,'Massaranduba',24),(4471,'Matos Costa',24),(4472,'Meleiro',24),(4473,'Mirim Doce',24),(4474,'Modelo',24),(4475,'Mondaí',24),(4476,'Monte Carlo',24),(4477,'Monte Castelo',24),(4478,'Morro da Fumaça',24),(4479,'Morro Grande',24),(4480,'Navegantes',24),(4481,'Nova Erechim',24),(4482,'Nova Itaberaba',24),(4483,'Nova Trento',24),(4484,'Nova Veneza',24),(4485,'Novo Horizonte',24),(4486,'Orleans',24),(4487,'Otacílio Costa',24),(4488,'Ouro',24),(4489,'Ouro Verde',24),(4490,'Paial',24),(4491,'Painel',24),(4492,'Palhoça',24),(4493,'Palma Sola',24),(4494,'Palmeira',24),(4495,'Palmitos',24),(4496,'Papanduva',24),(4497,'Paraíso',24),(4498,'Passo de Torres',24),(4499,'Passos Maia',24),(4500,'Paulo Lopes',24),(4501,'Pedras Grandes',24),(4502,'Penha',24),(4503,'Peritiba',24),(4504,'Pescaria Brava',24),(4505,'Petrolândia',24),(4506,'Balneário Piçarras',24),(4507,'Pinhalzinho',24),(4508,'Pinheiro Preto',24),(4509,'Piratuba',24),(4510,'Planalto Alegre',24),(4511,'Pomerode',24),(4512,'Ponte Alta',24),(4513,'Ponte Alta do Norte',24),(4514,'Ponte Serrada',24),(4515,'Porto Belo',24),(4516,'Porto União',24),(4517,'Pouso Redondo',24),(4518,'Praia Grande',24),(4519,'Presidente Castello Branco',24),(4520,'Presidente Getúlio',24),(4521,'Presidente Nereu',24),(4522,'Princesa',24),(4523,'Quilombo',24),(4524,'Rancho Queimado',24),(4525,'Rio das Antas',24),(4526,'Rio do Campo',24),(4527,'Rio do Oeste',24),(4528,'Rio dos Cedros',24),(4529,'Rio do Sul',24),(4530,'Rio Fortuna',24),(4531,'Rio Negrinho',24),(4532,'Rio Rufino',24),(4533,'Riqueza',24),(4534,'Rodeio',24),(4535,'Romelândia',24),(4536,'Salete',24),(4537,'Saltinho',24),(4538,'Salto Veloso',24),(4539,'Sangão',24),(4540,'Santa Cecília',24),(4541,'Santa Helena',24),(4542,'Santa Rosa de Lima',24),(4543,'Santa Rosa do Sul',24),(4544,'Santa Terezinha',24),(4545,'Santa Terezinha do Progresso',24),(4546,'Santiago do Sul',24),(4547,'Santo Amaro da Imperatriz',24),(4548,'São Bernardino',24),(4549,'São Bento do Sul',24),(4550,'São Bonifácio',24),(4551,'São Carlos',24),(4552,'São Cristovão do Sul',24),(4553,'São Domingos',24),(4554,'São Francisco do Sul',24),(4555,'São João do Oeste',24),(4556,'São João Batista',24),(4557,'São João do Itaperiú',24),(4558,'São João do Sul',24),(4559,'São Joaquim',24),(4560,'São José',24),(4561,'São José do Cedro',24),(4562,'São José do Cerrito',24),(4563,'São Lourenço do Oeste',24),(4564,'São Ludgero',24),(4565,'São Martinho',24),(4566,'São Miguel da Boa Vista',24),(4567,'São Miguel do Oeste',24),(4568,'São Pedro de Alcântara',24),(4569,'Saudades',24),(4570,'Schroeder',24),(4571,'Seara',24),(4572,'Serra Alta',24),(4573,'Siderópolis',24),(4574,'Sombrio',24),(4575,'Sul Brasil',24),(4576,'Taió',24),(4577,'Tangará',24),(4578,'Tigrinhos',24),(4579,'Tijucas',24),(4580,'Timbé do Sul',24),(4581,'Timbó',24),(4582,'Timbó Grande',24),(4583,'Três Barras',24),(4584,'Treviso',24),(4585,'Treze de Maio',24),(4586,'Treze Tílias',24),(4587,'Trombudo Central',24),(4588,'Tubarão',24),(4589,'Tunápolis',24),(4590,'Turvo',24),(4591,'União do Oeste',24),(4592,'Urubici',24),(4593,'Urupema',24),(4594,'Urussanga',24),(4595,'Vargeão',24),(4596,'Vargem',24),(4597,'Vargem Bonita',24),(4598,'Vidal Ramos',24),(4599,'Videira',24),(4600,'Vitor Meireles',24),(4601,'Witmarsum',24),(4602,'Xanxerê',24),(4603,'Xavantina',24),(4604,'Xaxim',24),(4605,'Zortéa',24),(4606,'Balneário Rincão',24),(4607,'Aceguá',21),(4608,'Água Santa',21),(4609,'Agudo',21),(4610,'Ajuricaba',21),(4611,'Alecrim',21),(4612,'Alegrete',21),(4613,'Alegria',21),(4614,'Almirante Tamandaré do Sul',21),(4615,'Alpestre',21),(4616,'Alto Alegre',21),(4617,'Alto Feliz',21),(4618,'Alvorada',21),(4619,'Amaral Ferrador',21),(4620,'Ametista do Sul',21),(4621,'André da Rocha',21),(4622,'Anta Gorda',21),(4623,'Antônio Prado',21),(4624,'Arambaré',21),(4625,'Araricá',21),(4626,'Aratiba',21),(4627,'Arroio do Meio',21),(4628,'Arroio do Sal',21),(4629,'Arroio do Padre',21),(4630,'Arroio dos Ratos',21),(4631,'Arroio do Tigre',21),(4632,'Arroio Grande',21),(4633,'Arvorezinha',21),(4634,'Augusto Pestana',21),(4635,'Áurea',21),(4636,'Bagé',21),(4637,'Balneário Pinhal',21),(4638,'Barão',21),(4639,'Barão de Cotegipe',21),(4640,'Barão do Triunfo',21),(4641,'Barracão',21),(4642,'Barra do Guarita',21),(4643,'Barra do Quaraí',21),(4644,'Barra do Ribeiro',21),(4645,'Barra do Rio Azul',21),(4646,'Barra Funda',21),(4647,'Barros Cassal',21),(4648,'Benjamin Constant do Sul',21),(4649,'Bento Gonçalves',21),(4650,'Boa Vista das Missões',21),(4651,'Boa Vista do Buricá',21),(4652,'Boa Vista do Cadeado',21),(4653,'Boa Vista do Incra',21),(4654,'Boa Vista do Sul',21),(4655,'Bom Jesus',21),(4656,'Bom Princípio',21),(4657,'Bom Progresso',21),(4658,'Bom Retiro do Sul',21),(4659,'Boqueirão do Leão',21),(4660,'Bossoroca',21),(4661,'Bozano',21),(4662,'Braga',21),(4663,'Brochier',21),(4664,'Butiá',21),(4665,'Caçapava do Sul',21),(4666,'Cacequi',21),(4667,'Cachoeira do Sul',21),(4668,'Cachoeirinha',21),(4669,'Cacique Doble',21),(4670,'Caibaté',21),(4671,'Caiçara',21),(4672,'Camaquã',21),(4673,'Camargo',21),(4674,'Cambará do Sul',21),(4675,'Campestre da Serra',21),(4676,'Campina das Missões',21),(4677,'Campinas do Sul',21),(4678,'Campo Bom',21),(4679,'Campo Novo',21),(4680,'Campos Borges',21),(4681,'Candelária',21),(4682,'Cândido Godói',21),(4683,'Candiota',21),(4684,'Canela',21),(4685,'Canguçu',21),(4686,'Canoas',21),(4687,'Canudos do Vale',21),(4688,'Capão Bonito do Sul',21),(4689,'Capão da Canoa',21),(4690,'Capão do Cipó',21),(4691,'Capão do Leão',21),(4692,'Capivari do Sul',21),(4693,'Capela de Santana',21),(4694,'Capitão',21),(4695,'Carazinho',21),(4696,'Caraá',21),(4697,'Carlos Barbosa',21),(4698,'Carlos Gomes',21),(4699,'Casca',21),(4700,'Caseiros',21),(4701,'Catuípe',21),(4702,'Caxias do Sul',21),(4703,'Centenário',21),(4704,'Cerrito',21),(4705,'Cerro Branco',21),(4706,'Cerro Grande',21),(4707,'Cerro Grande do Sul',21),(4708,'Cerro Largo',21),(4709,'Chapada',21),(4710,'Charqueadas',21),(4711,'Charrua',21),(4712,'Chiapetta',21),(4713,'Chuí',21),(4714,'Chuvisca',21),(4715,'Cidreira',21),(4716,'Ciríaco',21),(4717,'Colinas',21),(4718,'Colorado',21),(4719,'Condor',21),(4720,'Constantina',21),(4721,'Coqueiro Baixo',21),(4722,'Coqueiros do Sul',21),(4723,'Coronel Barros',21),(4724,'Coronel Bicaco',21),(4725,'Coronel Pilar',21),(4726,'Cotiporã',21),(4727,'Coxilha',21),(4728,'Crissiumal',21),(4729,'Cristal',21),(4730,'Cristal do Sul',21),(4731,'Cruz Alta',21),(4732,'Cruzaltense',21),(4733,'Cruzeiro do Sul',21),(4734,'David Canabarro',21),(4735,'Derrubadas',21),(4736,'Dezesseis de Novembro',21),(4737,'Dilermando de Aguiar',21),(4738,'Dois Irmãos',21),(4739,'Dois Irmãos das Missões',21),(4740,'Dois Lajeados',21),(4741,'Dom Feliciano',21),(4742,'Dom Pedro de Alcântara',21),(4743,'Dom Pedrito',21),(4744,'Dona Francisca',21),(4745,'Doutor Maurício Cardoso',21),(4746,'Doutor Ricardo',21),(4747,'Eldorado do Sul',21),(4748,'Encantado',21),(4749,'Encruzilhada do Sul',21),(4750,'Engenho Velho',21),(4751,'Entre-Ijuís',21),(4752,'Entre Rios do Sul',21),(4753,'Erebango',21),(4754,'Erechim',21),(4755,'Ernestina',21),(4756,'Herval',21),(4757,'Erval Grande',21),(4758,'Erval Seco',21),(4759,'Esmeralda',21),(4760,'Esperança do Sul',21),(4761,'Espumoso',21),(4762,'Estação',21),(4763,'Estância Velha',21),(4764,'Esteio',21),(4765,'Estrela',21),(4766,'Estrela Velha',21),(4767,'Eugênio de Castro',21),(4768,'Fagundes Varela',21),(4769,'Farroupilha',21),(4770,'Faxinal do Soturno',21),(4771,'Faxinalzinho',21),(4772,'Fazenda Vilanova',21),(4773,'Feliz',21),(4774,'Flores da Cunha',21),(4775,'Floriano Peixoto',21),(4776,'Fontoura Xavier',21),(4777,'Formigueiro',21),(4778,'Forquetinha',21),(4779,'Fortaleza dos Valos',21),(4780,'Frederico Westphalen',21),(4781,'Garibaldi',21),(4782,'Garruchos',21),(4783,'Gaurama',21),(4784,'General Câmara',21),(4785,'Gentil',21),(4786,'Getúlio Vargas',21),(4787,'Giruá',21),(4788,'Glorinha',21),(4789,'Gramado',21),(4790,'Gramado dos Loureiros',21),(4791,'Gramado Xavier',21),(4792,'Gravataí',21),(4793,'Guabiju',21),(4794,'Guaíba',21),(4795,'Guaporé',21),(4796,'Guarani das Missões',21),(4797,'Harmonia',21),(4798,'Herveiras',21),(4799,'Horizontina',21),(4800,'Hulha Negra',21),(4801,'Humaitá',21),(4802,'Ibarama',21),(4803,'Ibiaçá',21),(4804,'Ibiraiaras',21),(4805,'Ibirapuitã',21),(4806,'Ibirubá',21),(4807,'Igrejinha',21),(4808,'Ijuí',21),(4809,'Ilópolis',21),(4810,'Imbé',21),(4811,'Imigrante',21),(4812,'Independência',21),(4813,'Inhacorá',21),(4814,'Ipê',21),(4815,'Ipiranga do Sul',21),(4816,'Iraí',21),(4817,'Itaara',21),(4818,'Itacurubi',21),(4819,'Itapuca',21),(4820,'Itaqui',21),(4821,'Itati',21),(4822,'Itatiba do Sul',21),(4823,'Ivorá',21),(4824,'Ivoti',21),(4825,'Jaboticaba',21),(4826,'Jacuizinho',21),(4827,'Jacutinga',21),(4828,'Jaguarão',21),(4829,'Jaguari',21),(4830,'Jaquirana',21),(4831,'Jari',21),(4832,'Jóia',21),(4833,'Júlio de Castilhos',21),(4834,'Lagoa Bonita do Sul',21),(4835,'Lagoão',21),(4836,'Lagoa dos Três Cantos',21),(4837,'Lagoa Vermelha',21),(4838,'Lajeado',21),(4839,'Lajeado do Bugre',21),(4840,'Lavras do Sul',21),(4841,'Liberato Salzano',21),(4842,'Lindolfo Collor',21),(4843,'Linha Nova',21),(4844,'Machadinho',21),(4845,'Maçambará',21),(4846,'Mampituba',21),(4847,'Manoel Viana',21),(4848,'Maquiné',21),(4849,'Maratá',21),(4850,'Marau',21),(4851,'Marcelino Ramos',21),(4852,'Mariana Pimentel',21),(4853,'Mariano Moro',21),(4854,'Marques de Souza',21),(4855,'Mata',21),(4856,'Mato Castelhano',21),(4857,'Mato Leitão',21),(4858,'Mato Queimado',21),(4859,'Maximiliano de Almeida',21),(4860,'Minas do Leão',21),(4861,'Miraguaí',21),(4862,'Montauri',21),(4863,'Monte Alegre dos Campos',21),(4864,'Monte Belo do Sul',21),(4865,'Montenegro',21),(4866,'Mormaço',21),(4867,'Morrinhos do Sul',21),(4868,'Morro Redondo',21),(4869,'Morro Reuter',21),(4870,'Mostardas',21),(4871,'Muçum',21),(4872,'Muitos Capões',21),(4873,'Muliterno',21),(4874,'Não-Me-Toque',21),(4875,'Nicolau Vergueiro',21),(4876,'Nonoai',21),(4877,'Nova Alvorada',21),(4878,'Nova Araçá',21),(4879,'Nova Bassano',21),(4880,'Nova Boa Vista',21),(4881,'Nova Bréscia',21),(4882,'Nova Candelária',21),(4883,'Nova Esperança do Sul',21),(4884,'Nova Hartz',21),(4885,'Nova Pádua',21),(4886,'Nova Palma',21),(4887,'Nova Petrópolis',21),(4888,'Nova Prata',21),(4889,'Nova Ramada',21),(4890,'Nova Roma do Sul',21),(4891,'Nova Santa Rita',21),(4892,'Novo Cabrais',21),(4893,'Novo Hamburgo',21),(4894,'Novo Machado',21),(4895,'Novo Tiradentes',21),(4896,'Novo Xingu',21),(4897,'Novo Barreiro',21),(4898,'Osório',21),(4899,'Paim Filho',21),(4900,'Palmares do Sul',21),(4901,'Palmeira das Missões',21),(4902,'Palmitinho',21),(4903,'Panambi',21),(4904,'Pantano Grande',21),(4905,'Paraí',21),(4906,'Paraíso do Sul',21),(4907,'Pareci Novo',21),(4908,'Parobé',21),(4909,'Passa Sete',21),(4910,'Passo do Sobrado',21),(4911,'Passo Fundo',21),(4912,'Paulo Bento',21),(4913,'Paverama',21),(4914,'Pedras Altas',21),(4915,'Pedro Osório',21),(4916,'Pejuçara',21),(4917,'Pelotas',21),(4918,'Picada Café',21),(4919,'Pinhal',21),(4920,'Pinhal da Serra',21),(4921,'Pinhal Grande',21),(4922,'Pinheirinho do Vale',21),(4923,'Pinheiro Machado',21),(4924,'Pinto Bandeira',21),(4925,'Pirapó',21),(4926,'Piratini',21),(4927,'Planalto',21),(4928,'Poço das Antas',21),(4929,'Pontão',21),(4930,'Ponte Preta',21),(4931,'Portão',21),(4932,'Porto Alegre',21),(4933,'Porto Lucena',21),(4934,'Porto Mauá',21),(4935,'Porto Vera Cruz',21),(4936,'Porto Xavier',21),(4937,'Pouso Novo',21),(4938,'Presidente Lucena',21),(4939,'Progresso',21),(4940,'Protásio Alves',21),(4941,'Putinga',21),(4942,'Quaraí',21),(4943,'Quatro Irmãos',21),(4944,'Quevedos',21),(4945,'Quinze de Novembro',21),(4946,'Redentora',21),(4947,'Relvado',21),(4948,'Restinga Seca',21),(4949,'Rio dos Índios',21),(4950,'Rio Grande',21),(4951,'Rio Pardo',21),(4952,'Riozinho',21),(4953,'Roca Sales',21),(4954,'Rodeio Bonito',21),(4955,'Rolador',21),(4956,'Rolante',21),(4957,'Ronda Alta',21),(4958,'Rondinha',21),(4959,'Roque Gonzales',21),(4960,'Rosário do Sul',21),(4961,'Sagrada Família',21),(4962,'Saldanha Marinho',21),(4963,'Salto do Jacuí',21),(4964,'Salvador das Missões',21),(4965,'Salvador do Sul',21),(4966,'Sananduva',21),(4967,'Santa Bárbara do Sul',21),(4968,'Santa Cecília do Sul',21),(4969,'Santa Clara do Sul',21),(4970,'Santa Cruz do Sul',21),(4971,'Santa Maria',21),(4972,'Santa Maria do Herval',21),(4973,'Santa Margarida do Sul',21),(4974,'Santana da Boa Vista',21),(4975,'Sant\'Ana do Livramento',21),(4976,'Santa Rosa',21),(4977,'Santa Tereza',21),(4978,'Santa Vitória do Palmar',21),(4979,'Santiago',21),(4980,'Santo Ângelo',21),(4981,'Santo Antônio do Palma',21),(4982,'Santo Antônio da Patrulha',21),(4983,'Santo Antônio das Missões',21),(4984,'Santo Antônio do Planalto',21),(4985,'Santo Augusto',21),(4986,'Santo Cristo',21),(4987,'Santo Expedito do Sul',21),(4988,'São Borja',21),(4989,'São Domingos do Sul',21),(4990,'São Francisco de Assis',21),(4991,'São Francisco de Paula',21),(4992,'São Gabriel',21),(4993,'São Jerônimo',21),(4994,'São João da Urtiga',21),(4995,'São João do Polêsine',21),(4996,'São Jorge',21),(4997,'São José das Missões',21),(4998,'São José do Herval',21),(4999,'São José do Hortêncio',21),(5000,'São José do Inhacorá',21),(5001,'São José do Norte',21),(5002,'São José do Ouro',21),(5003,'São José do Sul',21),(5004,'São José dos Ausentes',21),(5005,'São Leopoldo',21),(5006,'São Lourenço do Sul',21),(5007,'São Luiz Gonzaga',21),(5008,'São Marcos',21),(5009,'São Martinho',21),(5010,'São Martinho da Serra',21),(5011,'São Miguel das Missões',21),(5012,'São Nicolau',21),(5013,'São Paulo das Missões',21),(5014,'São Pedro da Serra',21),(5015,'São Pedro das Missões',21),(5016,'São Pedro do Butiá',21),(5017,'São Pedro do Sul',21),(5018,'São Sebastião do Caí',21),(5019,'São Sepé',21),(5020,'São Valentim',21),(5021,'São Valentim do Sul',21),(5022,'São Valério do Sul',21),(5023,'São Vendelino',21),(5024,'São Vicente do Sul',21),(5025,'Sapiranga',21),(5026,'Sapucaia do Sul',21),(5027,'Sarandi',21),(5028,'Seberi',21),(5029,'Sede Nova',21),(5030,'Segredo',21),(5031,'Selbach',21),(5032,'Senador Salgado Filho',21),(5033,'Sentinela do Sul',21),(5034,'Serafina Corrêa',21),(5035,'Sério',21),(5036,'Sertão',21),(5037,'Sertão Santana',21),(5038,'Sete de Setembro',21),(5039,'Severiano de Almeida',21),(5040,'Silveira Martins',21),(5041,'Sinimbu',21),(5042,'Sobradinho',21),(5043,'Soledade',21),(5044,'Tabaí',21),(5045,'Tapejara',21),(5046,'Tapera',21),(5047,'Tapes',21),(5048,'Taquara',21),(5049,'Taquari',21),(5050,'Taquaruçu do Sul',21),(5051,'Tavares',21),(5052,'Tenente Portela',21),(5053,'Terra de Areia',21),(5054,'Teutônia',21),(5055,'Tio Hugo',21),(5056,'Tiradentes do Sul',21),(5057,'Toropi',21),(5058,'Torres',21),(5059,'Tramandaí',21),(5060,'Travesseiro',21),(5061,'Três Arroios',21),(5062,'Três Cachoeiras',21),(5063,'Três Coroas',21),(5064,'Três de Maio',21),(5065,'Três Forquilhas',21),(5066,'Três Palmeiras',21),(5067,'Três Passos',21),(5068,'Trindade do Sul',21),(5069,'Triunfo',21),(5070,'Tucunduva',21),(5071,'Tunas',21),(5072,'Tupanci do Sul',21),(5073,'Tupanciretã',21),(5074,'Tupandi',21),(5075,'Tuparendi',21),(5076,'Turuçu',21),(5077,'Ubiretama',21),(5078,'União da Serra',21),(5079,'Unistalda',21),(5080,'Uruguaiana',21),(5081,'Vacaria',21),(5082,'Vale Verde',21),(5083,'Vale do Sol',21),(5084,'Vale Real',21),(5085,'Vanini',21),(5086,'Venâncio Aires',21),(5087,'Vera Cruz',21),(5088,'Veranópolis',21),(5089,'Vespasiano Correa',21),(5090,'Viadutos',21),(5091,'Viamão',21),(5092,'Vicente Dutra',21),(5093,'Victor Graeff',21),(5094,'Vila Flores',21),(5095,'Vila Lângaro',21),(5096,'Vila Maria',21),(5097,'Vila Nova do Sul',21),(5098,'Vista Alegre',21),(5099,'Vista Alegre do Prata',21),(5100,'Vista Gaúcha',21),(5101,'Vitória das Missões',21),(5102,'Westfalia',21),(5103,'Xangri-lá',21),(5104,'Água Clara',12),(5105,'Alcinópolis',12),(5106,'Amambai',12),(5107,'Anastácio',12),(5108,'Anaurilândia',12),(5109,'Angélica',12),(5110,'Antônio João',12),(5111,'Aparecida do Taboado',12),(5112,'Aquidauana',12),(5113,'Aral Moreira',12),(5114,'Bandeirantes',12),(5115,'Bataguassu',12),(5116,'Batayporã',12),(5117,'Bela Vista',12),(5118,'Bodoquena',12),(5119,'Bonito',12),(5120,'Brasilândia',12),(5121,'Caarapó',12),(5122,'Camapuã',12),(5123,'Campo Grande',12),(5124,'Caracol',12),(5125,'Cassilândia',12),(5126,'Chapadão do Sul',12),(5127,'Corguinho',12),(5128,'Coronel Sapucaia',12),(5129,'Corumbá',12),(5130,'Costa Rica',12),(5131,'Coxim',12),(5132,'Deodápolis',12),(5133,'Dois Irmãos do Buriti',12),(5134,'Douradina',12),(5135,'Dourados',12),(5136,'Eldorado',12),(5137,'Fátima do Sul',12),(5138,'Figueirão',12),(5139,'Glória de Dourados',12),(5140,'Guia Lopes da Laguna',12),(5141,'Iguatemi',12),(5142,'Inocência',12),(5143,'Itaporã',12),(5144,'Itaquiraí',12),(5145,'Ivinhema',12),(5146,'Japorã',12),(5147,'Jaraguari',12),(5148,'Jardim',12),(5149,'Jateí',12),(5150,'Juti',12),(5151,'Ladário',12),(5152,'Laguna Carapã',12),(5153,'Maracaju',12),(5154,'Miranda',12),(5155,'Mundo Novo',12),(5156,'Naviraí',12),(5157,'Nioaque',12),(5158,'Nova Alvorada do Sul',12),(5159,'Nova Andradina',12),(5160,'Novo Horizonte do Sul',12),(5161,'Paraíso das Águas',12),(5162,'Paranaíba',12),(5163,'Paranhos',12),(5164,'Pedro Gomes',12),(5165,'Ponta Porã',12),(5166,'Porto Murtinho',12),(5167,'Ribas do Rio Pardo',12),(5168,'Rio Brilhante',12),(5169,'Rio Negro',12),(5170,'Rio Verde de Mato Grosso',12),(5171,'Rochedo',12),(5172,'Santa Rita do Pardo',12),(5173,'São Gabriel do Oeste',12),(5174,'Sete Quedas',12),(5175,'Selvíria',12),(5176,'Sidrolândia',12),(5177,'Sonora',12),(5178,'Tacuru',12),(5179,'Taquarussu',12),(5180,'Terenos',12),(5181,'Três Lagoas',12),(5182,'Vicentina',12),(5183,'Acorizal',11),(5184,'Água Boa',11),(5185,'Alta Floresta',11),(5186,'Alto Araguaia',11),(5187,'Alto Boa Vista',11),(5188,'Alto Garças',11),(5189,'Alto Paraguai',11),(5190,'Alto Taquari',11),(5191,'Apiacás',11),(5192,'Araguaiana',11),(5193,'Araguainha',11),(5194,'Araputanga',11),(5195,'Arenápolis',11),(5196,'Aripuanã',11),(5197,'Barão de Melgaço',11),(5198,'Barra do Bugres',11),(5199,'Barra do Garças',11),(5200,'Bom Jesus do Araguaia',11),(5201,'Brasnorte',11),(5202,'Cáceres',11),(5203,'Campinápolis',11),(5204,'Campo Novo do Parecis',11),(5205,'Campo Verde',11),(5206,'Campos de Júlio',11),(5207,'Canabrava do Norte',11),(5208,'Canarana',11),(5209,'Carlinda',11),(5210,'Castanheira',11),(5211,'Chapada dos Guimarães',11),(5212,'Cláudia',11),(5213,'Cocalinho',11),(5214,'Colíder',11),(5215,'Colniza',11),(5216,'Comodoro',11),(5217,'Confresa',11),(5218,'Conquista D\'Oeste',11),(5219,'Cotriguaçu',11),(5220,'Cuiabá',11),(5221,'Curvelândia',11),(5222,'Denise',11),(5223,'Diamantino',11),(5224,'Dom Aquino',11),(5225,'Feliz Natal',11),(5226,'Figueirópolis D\'Oeste',11),(5227,'Gaúcha do Norte',11),(5228,'General Carneiro',11),(5229,'Glória D\'Oeste',11),(5230,'Guarantã do Norte',11),(5231,'Guiratinga',11),(5232,'Indiavaí',11),(5233,'Ipiranga do Norte',11),(5234,'Itanhangá',11),(5235,'Itaúba',11),(5236,'Itiquira',11),(5237,'Jaciara',11),(5238,'Jangada',11),(5239,'Jauru',11),(5240,'Juara',11),(5241,'Juína',11),(5242,'Juruena',11),(5243,'Juscimeira',11),(5244,'Lambari D\'Oeste',11),(5245,'Lucas do Rio Verde',11),(5246,'Luciara',11),(5247,'Vila Bela da Santíssima Trindade',11),(5248,'Marcelândia',11),(5249,'Matupá',11),(5250,'Mirassol D\'Oeste',11),(5251,'Nobres',11),(5252,'Nortelândia',11),(5253,'Nossa Senhora do Livramento',11),(5254,'Nova Bandeirantes',11),(5255,'Nova Nazaré',11),(5256,'Nova Lacerda',11),(5257,'Nova Santa Helena',11),(5258,'Nova Brasilândia',11),(5259,'Nova Canaã do Norte',11),(5260,'Nova Mutum',11),(5261,'Nova Olímpia',11),(5262,'Nova Ubiratã',11),(5263,'Nova Xavantina',11),(5264,'Novo Mundo',11),(5265,'Novo Horizonte do Norte',11),(5266,'Novo São Joaquim',11),(5267,'Paranaíta',11),(5268,'Paranatinga',11),(5269,'Novo Santo Antônio',11),(5270,'Pedra Preta',11),(5271,'Peixoto de Azevedo',11),(5272,'Planalto da Serra',11),(5273,'Poconé',11),(5274,'Pontal do Araguaia',11),(5275,'Ponte Branca',11),(5276,'Pontes e Lacerda',11),(5277,'Porto Alegre do Norte',11),(5278,'Porto dos Gaúchos',11),(5279,'Porto Esperidião',11),(5280,'Porto Estrela',11),(5281,'Poxoréo',11),(5282,'Primavera do Leste',11),(5283,'Querência',11),(5284,'São José dos Quatro Marcos',11),(5285,'Reserva do Cabaçal',11),(5286,'Ribeirão Cascalheira',11),(5287,'Ribeirãozinho',11),(5288,'Rio Branco',11),(5289,'Santa Carmem',11),(5290,'Santo Afonso',11),(5291,'São José do Povo',11),(5292,'São José do Rio Claro',11),(5293,'São José do Xingu',11),(5294,'São Pedro da Cipa',11),(5295,'Rondolândia',11),(5296,'Rondonópolis',11),(5297,'Rosário Oeste',11),(5298,'Santa Cruz do Xingu',11),(5299,'Salto do Céu',11),(5300,'Santa Rita do Trivelato',11),(5301,'Santa Terezinha',11),(5302,'Santo Antônio do Leste',11),(5303,'Santo Antônio do Leverger',11),(5304,'São Félix do Araguaia',11),(5305,'Sapezal',11),(5306,'Serra Nova Dourada',11),(5307,'Sinop',11),(5308,'Sorriso',11),(5309,'Tabaporã',11),(5310,'Tangará da Serra',11),(5311,'Tapurah',11),(5312,'Terra Nova do Norte',11),(5313,'Tesouro',11),(5314,'Torixoréu',11),(5315,'União do Sul',11),(5316,'Vale de São Domingos',11),(5317,'Várzea Grande',11),(5318,'Vera',11),(5319,'Vila Rica',11),(5320,'Nova Guarita',11),(5321,'Nova Marilândia',11),(5322,'Nova Maringá',11),(5323,'Nova Monte Verde',11),(5324,'Abadia de Goiás',9),(5325,'Abadiânia',9),(5326,'Acreúna',9),(5327,'Adelândia',9),(5328,'Água Fria de Goiás',9),(5329,'Água Limpa',9),(5330,'Águas Lindas de Goiás',9),(5331,'Alexânia',9),(5332,'Aloândia',9),(5333,'Alto Horizonte',9),(5334,'Alto Paraíso de Goiás',9),(5335,'Alvorada do Norte',9),(5336,'Amaralina',9),(5337,'Americano do Brasil',9),(5338,'Amorinópolis',9),(5339,'Anápolis',9),(5340,'Anhanguera',9),(5341,'Anicuns',9),(5342,'Aparecida de Goiânia',9),(5343,'Aparecida do Rio Doce',9),(5344,'Aporé',9),(5345,'Araçu',9),(5346,'Aragarças',9),(5347,'Aragoiânia',9),(5348,'Araguapaz',9),(5349,'Arenópolis',9),(5350,'Aruanã',9),(5351,'Aurilândia',9),(5352,'Avelinópolis',9),(5353,'Baliza',9),(5354,'Barro Alto',9),(5355,'Bela Vista de Goiás',9),(5356,'Bom Jardim de Goiás',9),(5357,'Bom Jesus de Goiás',9),(5358,'Bonfinópolis',9),(5359,'Bonópolis',9),(5360,'Brazabrantes',9),(5361,'Britânia',9),(5362,'Buriti Alegre',9),(5363,'Buriti de Goiás',9),(5364,'Buritinópolis',9),(5365,'Cabeceiras',9),(5366,'Cachoeira Alta',9),(5367,'Cachoeira de Goiás',9),(5368,'Cachoeira Dourada',9),(5369,'Caçu',9),(5370,'Caiapônia',9),(5371,'Caldas Novas',9),(5372,'Caldazinha',9),(5373,'Campestre de Goiás',9),(5374,'Campinaçu',9),(5375,'Campinorte',9),(5376,'Campo Alegre de Goiás',9),(5377,'Campo Limpo de Goiás',9),(5378,'Campos Belos',9),(5379,'Campos Verdes',9),(5380,'Carmo do Rio Verde',9),(5381,'Castelândia',9),(5382,'Catalão',9),(5383,'Caturaí',9),(5384,'Cavalcante',9),(5385,'Ceres',9),(5386,'Cezarina',9),(5387,'Chapadão do Céu',9),(5388,'Cidade Ocidental',9),(5389,'Cocalzinho de Goiás',9),(5390,'Colinas do Sul',9),(5391,'Córrego do Ouro',9),(5392,'Corumbá de Goiás',9),(5393,'Corumbaíba',9),(5394,'Cristalina',9),(5395,'Cristianópolis',9),(5396,'Crixás',9),(5397,'Cromínia',9),(5398,'Cumari',9),(5399,'Damianópolis',9),(5400,'Damolândia',9),(5401,'Davinópolis',9),(5402,'Diorama',9),(5403,'Doverlândia',9),(5404,'Edealina',9),(5405,'Edéia',9),(5406,'Estrela do Norte',9),(5407,'Faina',9),(5408,'Fazenda Nova',9),(5409,'Firminópolis',9),(5410,'Flores de Goiás',9),(5411,'Formosa',9),(5412,'Formoso',9),(5413,'Gameleira de Goiás',9),(5414,'Divinópolis de Goiás',9),(5415,'Goianápolis',9),(5416,'Goiandira',9),(5417,'Goianésia',9),(5418,'Goiânia',9),(5419,'Goianira',9),(5420,'Goiás',9),(5421,'Goiatuba',9),(5422,'Gouvelândia',9),(5423,'Guapó',9),(5424,'Guaraíta',9),(5425,'Guarani de Goiás',9),(5426,'Guarinos',9),(5427,'Heitoraí',9),(5428,'Hidrolândia',9),(5429,'Hidrolina',9),(5430,'Iaciara',9),(5431,'Inaciolândia',9),(5432,'Indiara',9),(5433,'Inhumas',9),(5434,'Ipameri',9),(5435,'Ipiranga de Goiás',9),(5436,'Iporá',9),(5437,'Israelândia',9),(5438,'Itaberaí',9),(5439,'Itaguari',9),(5440,'Itaguaru',9),(5441,'Itajá',9),(5442,'Itapaci',9),(5443,'Itapirapuã',9),(5444,'Itapuranga',9),(5445,'Itarumã',9),(5446,'Itauçu',9),(5447,'Itumbiara',9),(5448,'Ivolândia',9),(5449,'Jandaia',9),(5450,'Jaraguá',9),(5451,'Jataí',9),(5452,'Jaupaci',9),(5453,'Jesúpolis',9),(5454,'Joviânia',9),(5455,'Jussara',9),(5456,'Lagoa Santa',9),(5457,'Leopoldo de Bulhões',9),(5458,'Luziânia',9),(5459,'Mairipotaba',9),(5460,'Mambaí',9),(5461,'Mara Rosa',9),(5462,'Marzagão',9),(5463,'Matrinchã',9),(5464,'Maurilândia',9),(5465,'Mimoso de Goiás',9),(5466,'Minaçu',9),(5467,'Mineiros',9),(5468,'Moiporá',9),(5469,'Monte Alegre de Goiás',9),(5470,'Montes Claros de Goiás',9),(5471,'Montividiu',9),(5472,'Montividiu do Norte',9),(5473,'Morrinhos',9),(5474,'Morro Agudo de Goiás',9),(5475,'Mossâmedes',9),(5476,'Mozarlândia',9),(5477,'Mundo Novo',9),(5478,'Mutunópolis',9),(5479,'Nazário',9),(5480,'Nerópolis',9),(5481,'Niquelândia',9),(5482,'Nova América',9),(5483,'Nova Aurora',9),(5484,'Nova Crixás',9),(5485,'Nova Glória',9),(5486,'Nova Iguaçu de Goiás',9),(5487,'Nova Roma',9),(5488,'Nova Veneza',9),(5489,'Novo Brasil',9),(5490,'Novo Gama',9),(5491,'Novo Planalto',9),(5492,'Orizona',9),(5493,'Ouro Verde de Goiás',9),(5494,'Ouvidor',9),(5495,'Padre Bernardo',9),(5496,'Palestina de Goiás',9),(5497,'Palmeiras de Goiás',9),(5498,'Palmelo',9),(5499,'Palminópolis',9),(5500,'Panamá',9),(5501,'Paranaiguara',9),(5502,'Paraúna',9),(5503,'Perolândia',9),(5504,'Petrolina de Goiás',9),(5505,'Pilar de Goiás',9),(5506,'Piracanjuba',9),(5507,'Piranhas',9),(5508,'Pirenópolis',9),(5509,'Pires do Rio',9),(5510,'Planaltina',9),(5511,'Pontalina',9),(5512,'Porangatu',9),(5513,'Porteirão',9),(5514,'Portelândia',9),(5515,'Posse',9),(5516,'Professor Jamil',9),(5517,'Quirinópolis',9),(5518,'Rialma',9),(5519,'Rianápolis',9),(5520,'Rio Quente',9),(5521,'Rio Verde',9),(5522,'Rubiataba',9),(5523,'Sanclerlândia',9),(5524,'Santa Bárbara de Goiás',9),(5525,'Santa Cruz de Goiás',9),(5526,'Santa Fé de Goiás',9),(5527,'Santa Helena de Goiás',9),(5528,'Santa Isabel',9),(5529,'Santa Rita do Araguaia',9),(5530,'Santa Rita do Novo Destino',9),(5531,'Santa Rosa de Goiás',9),(5532,'Santa Tereza de Goiás',9),(5533,'Santa Terezinha de Goiás',9),(5534,'Santo Antônio da Barra',9),(5535,'Santo Antônio de Goiás',9),(5536,'Santo Antônio do Descoberto',9),(5537,'São Domingos',9),(5538,'São Francisco de Goiás',9),(5539,'São João D\'Aliança',9),(5540,'São João da Paraúna',9),(5541,'São Luís de Montes Belos',9),(5542,'São Luíz do Norte',9),(5543,'São Miguel do Araguaia',9),(5544,'São Miguel do Passa Quatro',9),(5545,'São Patrício',9),(5546,'São Simão',9),(5547,'Senador Canedo',9),(5548,'Serranópolis',9),(5549,'Silvânia',9),(5550,'Simolândia',9),(5551,'Sítio D\'Abadia',9),(5552,'Taquaral de Goiás',9),(5553,'Teresina de Goiás',9),(5554,'Terezópolis de Goiás',9),(5555,'Três Ranchos',9),(5556,'Trindade',9),(5557,'Trombas',9),(5558,'Turvânia',9),(5559,'Turvelândia',9),(5560,'Uirapuru',9),(5561,'Uruaçu',9),(5562,'Uruana',9),(5563,'Urutaí',9),(5564,'Valparaíso de Goiás',9),(5565,'Varjão',9),(5566,'Vianópolis',9),(5567,'Vicentinópolis',9),(5568,'Vila Boa',9),(5569,'Vila Propício',9),(5570,'Brasília',7);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinicalreports`
--

DROP TABLE IF EXISTS `clinicalreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinicalreports` (
  `idClinicalReport` int NOT NULL AUTO_INCREMENT,
  `registrationDate` date NOT NULL,
  `editionDate` date DEFAULT NULL,
  `descriptionClinicalReport` varchar(255) NOT NULL,
  `Animals_idAnimal` int NOT NULL,
  `Employees_idEmployee` int NOT NULL,
  PRIMARY KEY (`idClinicalReport`),
  KEY `fk_ClinicalReports_Animals1_idx` (`Animals_idAnimal`),
  KEY `fk_ClinicalReports_Employees1_idx` (`Employees_idEmployee`),
  CONSTRAINT `fk_ClinicalReports_Animals1` FOREIGN KEY (`Animals_idAnimal`) REFERENCES `animals` (`idAnimal`),
  CONSTRAINT `fk_ClinicalReports_Employees1` FOREIGN KEY (`Employees_idEmployee`) REFERENCES `employees` (`idEmployee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinicalreports`
--

LOCK TABLES `clinicalreports` WRITE;
/*!40000 ALTER TABLE `clinicalreports` DISABLE KEYS */;
/*!40000 ALTER TABLE `clinicalreports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donationcategories`
--

DROP TABLE IF EXISTS `donationcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donationcategories` (
  `idDonationCategory` int NOT NULL AUTO_INCREMENT,
  `nameDonationCategory` varchar(50) NOT NULL,
  PRIMARY KEY (`idDonationCategory`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donationcategories`
--

LOCK TABLES `donationcategories` WRITE;
/*!40000 ALTER TABLE `donationcategories` DISABLE KEYS */;
INSERT INTO `donationcategories` VALUES (1,'DINHEIRO');
/*!40000 ALTER TABLE `donationcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donations`
--

DROP TABLE IF EXISTS `donations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donations` (
  `idDonation` int NOT NULL AUTO_INCREMENT,
  `valueDonation` float DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `donationDate` date NOT NULL,
  `Users_idUser` int DEFAULT NULL,
  `DonationCategories_idDonationCategory` int NOT NULL,
  `SupplementInputs_idSupplementInput` int DEFAULT NULL,
  PRIMARY KEY (`idDonation`),
  KEY `fk_Donations_Users1_idx` (`Users_idUser`),
  KEY `fk_Donations_DonationCategories1_idx` (`DonationCategories_idDonationCategory`),
  KEY `fk_Donations_SupplementInputs1_idx` (`SupplementInputs_idSupplementInput`),
  CONSTRAINT `fk_Donations_DonationCategories1` FOREIGN KEY (`DonationCategories_idDonationCategory`) REFERENCES `donationcategories` (`idDonationCategory`),
  CONSTRAINT `fk_Donations_SupplementInputs1` FOREIGN KEY (`SupplementInputs_idSupplementInput`) REFERENCES `supplementinputs` (`idSupplementInput`),
  CONSTRAINT `fk_Donations_Users1` FOREIGN KEY (`Users_idUser`) REFERENCES `users` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donations`
--

LOCK TABLES `donations` WRITE;
/*!40000 ALTER TABLE `donations` DISABLE KEYS */;
INSERT INTO `donations` VALUES (1,100,'Donation for school','2024-10-10',1,1,2);
/*!40000 ALTER TABLE `donations` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `donations_AFTER_INSERT` AFTER INSERT ON `donations` FOR EACH ROW BEGIN
	SET @saldo_mensal = check_monthly_billing();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `donations_AFTER_UPDATE` AFTER UPDATE ON `donations` FOR EACH ROW BEGIN
	SET @saldo_mensal = check_monthly_billing();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `donations_AFTER_DELETE` AFTER DELETE ON `donations` FOR EACH ROW BEGIN
	SET @saldo_mensal = check_monthly_billing();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `idEmployee` int NOT NULL AUTO_INCREMENT,
  `nameEmployee` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cellPhoneNumber` char(11) DEFAULT NULL,
  `passwordHash` varchar(255) NOT NULL,
  `validationToken` varchar(255) DEFAULT NULL,
  `code` char(6) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `Addresses_idAddress` int DEFAULT NULL,
  PRIMARY KEY (`idEmployee`),
  KEY `fk_Employees_Addresses1_idx` (`Addresses_idAddress`),
  CONSTRAINT `fk_Employees_Addresses1` FOREIGN KEY (`Addresses_idAddress`) REFERENCES `addresses` (`idAddress`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Carlos Silva','carlos.silva@example.com','11999998888','hashedpassword123',NULL,NULL,'Manager',4);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expensecategories`
--

DROP TABLE IF EXISTS `expensecategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expensecategories` (
  `idExpenseCategory` int NOT NULL AUTO_INCREMENT,
  `nameExpenseCategory` varchar(50) NOT NULL,
  PRIMARY KEY (`idExpenseCategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expensecategories`
--

LOCK TABLES `expensecategories` WRITE;
/*!40000 ALTER TABLE `expensecategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `expensecategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expenses` (
  `idExpense` int NOT NULL AUTO_INCREMENT,
  `valueExpense` float NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `registrationDate` date NOT NULL,
  `paymentDate` date DEFAULT NULL,
  `dueDate` date NOT NULL,
  `statusExpense` varchar(50) NOT NULL,
  `ExpenseCategories_idExpenseCategory` int NOT NULL,
  PRIMARY KEY (`idExpense`),
  KEY `fk_Expeses_ExpeseCategories1_idx` (`ExpenseCategories_idExpenseCategory`),
  CONSTRAINT `fk_Expeses_ExpeseCategories1` FOREIGN KEY (`ExpenseCategories_idExpenseCategory`) REFERENCES `expensecategories` (`idExpenseCategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `expenses_AFTER_INSERT` AFTER INSERT ON `expenses` FOR EACH ROW BEGIN
	SET @saldo_mensal = check_monthly_billing();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `expenses_AFTER_UPDATE` AFTER UPDATE ON `expenses` FOR EACH ROW BEGIN
	SET @saldo_mensal = check_monthly_billing();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `expenses_AFTER_DELETE` AFTER DELETE ON `expenses` FOR EACH ROW BEGIN
	SET @saldo_mensal = check_monthly_billing();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `races`
--

DROP TABLE IF EXISTS `races`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `races` (
  `idRace` int NOT NULL AUTO_INCREMENT,
  `nameRace` varchar(50) NOT NULL,
  PRIMARY KEY (`idRace`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `races`
--

LOCK TABLES `races` WRITE;
/*!40000 ALTER TABLE `races` DISABLE KEYS */;
/*!40000 ALTER TABLE `races` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `species`
--

DROP TABLE IF EXISTS `species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `species` (
  `idSpecies` int NOT NULL AUTO_INCREMENT,
  `nameSpecies` varchar(50) NOT NULL,
  PRIMARY KEY (`idSpecies`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `species`
--

LOCK TABLES `species` WRITE;
/*!40000 ALTER TABLE `species` DISABLE KEYS */;
/*!40000 ALTER TABLE `species` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `idState` int NOT NULL AUTO_INCREMENT,
  `nameState` varchar(50) NOT NULL,
  `UF` char(2) NOT NULL,
  PRIMARY KEY (`idState`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'Acre','AC'),(2,'Alagoas','AL'),(3,'Amapá','AP'),(4,'Amazonas','AM'),(5,'Bahia','BA'),(6,'Ceará','CE'),(7,'Distrito Federal','DF'),(8,'Espírito Santo','ES'),(9,'Goiás','GO'),(10,'Maranhão','MA'),(11,'Mato Grosso','MT'),(12,'Mato Grosso do Sul','MS'),(13,'Minas Gerais','MG'),(14,'Pará','PA'),(15,'Paraíba','PB'),(16,'Paraná','PR'),(17,'Pernambuco','PE'),(18,'Piauí','PI'),(19,'Rio de Janeiro','RJ'),(20,'Rio Grande do Norte','RN'),(21,'Rio Grande do Sul','RS'),(22,'Rondônia','RO'),(23,'Roraima','RR'),(24,'Santa Catarina','SC'),(25,'São Paulo','SP'),(26,'Sergipe','SE'),(27,'Tocantins','TO');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplementcategories`
--

DROP TABLE IF EXISTS `supplementcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplementcategories` (
  `idSupplementCategory` int NOT NULL AUTO_INCREMENT,
  `nameSupplementCategory` varchar(50) NOT NULL,
  PRIMARY KEY (`idSupplementCategory`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplementcategories`
--

LOCK TABLES `supplementcategories` WRITE;
/*!40000 ALTER TABLE `supplementcategories` DISABLE KEYS */;
INSERT INTO `supplementcategories` VALUES (1,'Medicamentos');
/*!40000 ALTER TABLE `supplementcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplementinputs`
--

DROP TABLE IF EXISTS `supplementinputs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplementinputs` (
  `idSupplementInput` int NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  `amount` float NOT NULL,
  `inputDate` date NOT NULL,
  `Supplements_idSupplement` int NOT NULL,
  PRIMARY KEY (`idSupplementInput`),
  KEY `fk_InuputSupplement_Supplements1_idx` (`Supplements_idSupplement`),
  CONSTRAINT `fk_InuputSupplement_Supplements1` FOREIGN KEY (`Supplements_idSupplement`) REFERENCES `supplements` (`idSupplement`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplementinputs`
--

LOCK TABLES `supplementinputs` WRITE;
/*!40000 ALTER TABLE `supplementinputs` DISABLE KEYS */;
INSERT INTO `supplementinputs` VALUES (2,'Wheat Supplement',50,'2024-10-09',1);
/*!40000 ALTER TABLE `supplementinputs` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `supplementinputs_AFTER_INSERT` AFTER INSERT ON `supplementinputs` FOR EACH ROW BEGIN
	declare now_stock INT;
    declare new_stock INT;
    
    SELECT stock INTO now_stock FROM supplements WHERE idSupplement = NEW.Supplements_idSupplement;
    
    SET new_stock = now_stock + NEW.amount;
    
	UPDATE supplements SET stock = new_stock WHERE idSupplement = NEW.Supplements_idSupplement;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `supplementinputs_AFTER_UPDATE` AFTER UPDATE ON `supplementinputs` FOR EACH ROW BEGIN
	declare now_stock INT;
    declare new_stock INT;
    
    IF NEW.Supplements_idSupplement = OLD.Supplements_idSupplement THEN
		SELECT stock INTO now_stock FROM supplements WHERE idSupplement = OLD.Supplements_idSupplement;
		SET new_stock = now_stock + (NEW.amount - OLD.amount);
		UPDATE supplements SET stock = new_stock WHERE idSupplement = OLD.Supplements_idSupplement;
	ELSE
		SELECT stock INTO now_stock FROM supplements WHERE idSupplement = OLD.Supplements_idSupplement;
		SET new_stock = now_stock - OLD.amount;
		UPDATE supplements SET stock = new_stock WHERE idSupplement = OLD.Supplements_idSupplement;
		
        SELECT stock INTO now_stock FROM supplements WHERE idSupplement = NEW.Supplements_idSupplement;
		SET new_stock = now_stock + NEW.amount;
		UPDATE supplements SET stock = new_stock WHERE idSupplement = NEW.Supplements_idSupplement;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `supplementinputs_AFTER_DELETE` AFTER DELETE ON `supplementinputs` FOR EACH ROW BEGIN
	declare now_stock INT;
    declare new_stock INT;
    
    SELECT stock INTO now_stock FROM supplements WHERE idSupplement = OLD.Supplements_idSupplement;
    
    SET new_stock = now_stock - OLD.amount;
    
	UPDATE supplements SET stock = new_stock WHERE idSupplement = OLD.Supplements_idSupplement;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `supplementoutputs`
--

DROP TABLE IF EXISTS `supplementoutputs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplementoutputs` (
  `idSupplementOutput` int NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  `amount` float NOT NULL,
  `outputDate` date NOT NULL,
  `Supplements_idSupplement` int NOT NULL,
  PRIMARY KEY (`idSupplementOutput`),
  KEY `fk_OutputSupplements_Supplements1_idx` (`Supplements_idSupplement`),
  CONSTRAINT `fk_OutputSupplements_Supplements1` FOREIGN KEY (`Supplements_idSupplement`) REFERENCES `supplements` (`idSupplement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplementoutputs`
--

LOCK TABLES `supplementoutputs` WRITE;
/*!40000 ALTER TABLE `supplementoutputs` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplementoutputs` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `supplementoutputs_AFTER_INSERT` AFTER INSERT ON `supplementoutputs` FOR EACH ROW BEGIN
	declare now_stock INT;
    declare new_stock INT;
    
    SELECT stock INTO now_stock FROM supplements WHERE idSupplement = NEW.Supplements_idSupplement;
    
    SET new_stock = now_stock - NEW.amount;
    
	UPDATE supplements SET stock = new_stock WHERE idSupplement = NEW.Supplements_idSupplement;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `supplementoutputs_AFTER_UPDATE` AFTER UPDATE ON `supplementoutputs` FOR EACH ROW BEGIN
	declare now_stock INT;
    declare new_stock INT;
    
    IF NEW.Supplements_idSupplement = OLD.Supplements_idSupplement THEN
		SELECT stock INTO now_stock FROM supplements WHERE idSupplement = OLD.Supplements_idSupplement;
		SET new_stock = now_stock + ((NEW.amount - OLD.amount) * -1);
		UPDATE supplements SET stock = new_stock WHERE idSupplement = OLD.Supplements_idSupplement;
	ELSE
		SELECT stock INTO now_stock FROM supplements WHERE idSupplement = OLD.Supplements_idSupplement;
		SET new_stock = now_stock + OLD.amount;
		UPDATE supplements SET stock = new_stock WHERE idSupplement = OLD.Supplements_idSupplement;
		
        SELECT stock INTO now_stock FROM supplements WHERE idSupplement = NEW.Supplements_idSupplement;
		SET new_stock = now_stock - NEW.amount;
		UPDATE supplements SET stock = new_stock WHERE idSupplement = NEW.Supplements_idSupplement;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `supplementoutputs_AFTER_DELETE` AFTER DELETE ON `supplementoutputs` FOR EACH ROW BEGIN
	declare now_stock INT;
    declare new_stock INT;
    
    SELECT stock INTO now_stock FROM supplements WHERE idSupplement = OLD.Supplements_idSupplement;
    
    SET new_stock = now_stock + OLD.amount;
    
	UPDATE supplements SET stock = new_stock WHERE idSupplement = OLD.Supplements_idSupplement;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `supplements`
--

DROP TABLE IF EXISTS `supplements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplements` (
  `idSupplement` int NOT NULL AUTO_INCREMENT,
  `nameSupplement` varchar(50) NOT NULL,
  `stock` float NOT NULL,
  `typeMensure` char(2) NOT NULL,
  `SupplementCategories_idSupplementCategory` int NOT NULL,
  PRIMARY KEY (`idSupplement`),
  KEY `fk_Supplements_SupplementCategories1_idx` (`SupplementCategories_idSupplementCategory`),
  CONSTRAINT `fk_Supplements_SupplementCategories1` FOREIGN KEY (`SupplementCategories_idSupplementCategory`) REFERENCES `supplementcategories` (`idSupplementCategory`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplements`
--

LOCK TABLES `supplements` WRITE;
/*!40000 ALTER TABLE `supplements` DISABLE KEYS */;
INSERT INTO `supplements` VALUES (1,'Antibiotioco',100,'ML',1);
/*!40000 ALTER TABLE `supplements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `idUser` int NOT NULL AUTO_INCREMENT,
  `nameUser` varchar(50) NOT NULL,
  `cellPhoneNumber` char(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `Addresses_idAddress` int DEFAULT NULL,
  PRIMARY KEY (`idUser`),
  KEY `fk_Users_Addresses1_idx` (`Addresses_idAddress`),
  CONSTRAINT `fk_Users_Addresses1` FOREIGN KEY (`Addresses_idAddress`) REFERENCES `addresses` (`idAddress`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'John Doe','11999998888','johndoe@example.com',NULL),(2,'John Doe','11999998888','johndoe@example.com',3);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'projeto_ong'
--

--
-- Dumping routines for database 'projeto_ong'
--
/*!50003 DROP FUNCTION IF EXISTS `check_monthly_billing` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `check_monthly_billing`() RETURNS int
    READS SQL DATA
BEGIN
	DECLARE totalValueDonation INT DEFAULT 0;
	DECLARE totalValueExpense INT DEFAULT 0;
    
	SELECT IFNULL(SUM(valueDonation), 0) INTO totalValueDonation
	FROM donations
	WHERE MONTH(donationDate) = MONTH(CURDATE()) 
	  AND YEAR(donationDate) = YEAR(CURDATE());

	SELECT IFNULL(SUM(valueExpense), 0) INTO totalValueExpense
	FROM expenses
	WHERE MONTH(dueDate) = MONTH(CURDATE()) 
	  AND YEAR(dueDate) = YEAR(CURDATE());
	
    RETURN totalValueDonation - totalValueExpense;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_donation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_donation`(
    IN par_valueDonation FLOAT,
    IN par_donationDescription VARCHAR(100), 
    IN par_donationDate DATE,
    IN par_Users_idUser INT,
    IN par_DonationCategories_idDonationCategory INT,
    
    IN par_supplementDescription VARCHAR(100), 
    IN par_amount FLOAT,
    IN par_inputDate DATE,
    IN par_Supplements_idSupplement INT
)
BEGIN
    DECLARE last_supplementInput_id INT;
    
    IF par_supplementDescription IS NOT NULL 
        AND par_amount IS NOT NULL 
        AND par_inputDate IS NOT NULL 
        AND par_Supplements_idSupplement IS NOT NULL 
    THEN
        INSERT INTO supplementinputs (description, amount, inputDate, Supplements_idSupplement)
        VALUES (par_supplementDescription, par_amount, par_inputDate, par_Supplements_idSupplement);
        
        SET last_supplementInput_id = LAST_INSERT_ID();
    ELSE
		SET last_supplementInput_id = NULL;
    END IF;
    
    INSERT INTO donations (
        valueDonation, 
        description, 
        donationDate, 
        Users_idUser, 
        DonationCategories_idDonationCategory, 
        SupplementInputs_idSupplementInput
    ) 
    VALUES (
        par_valueDonation, 
        par_donationDescription, 
        par_donationDate, 
        par_Users_idUser, 
        par_DonationCategories_idDonationCategory, 
        last_supplementInput_id
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_employee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_employee`(
    IN par_nameEmployee VARCHAR(50),
    IN par_cellPhoneNumber CHAR(11),
    IN par_email VARCHAR(100),
    IN par_passwordHash VARCHAR(255),
    IN par_position VARCHAR(50),
    
    IN par_publicPlace VARCHAR(100),
    IN par_neighborhood VARCHAR(50),
    IN par_number VARCHAR(10),
    IN par_complement VARCHAR(100),
    IN par_States_idState INT,
    IN par_Cities_idCity INT
)
BEGIN
    DECLARE last_address_id INT;
    
    INSERT INTO addresses (publicPlace, neighborhood, number, complement, States_idState, Cities_idCity)
    VALUES (par_publicPlace, par_neighborhood, par_number, par_complement, par_States_idState, par_Cities_idCity);
    
	SET last_address_id = LAST_INSERT_ID();
    
    INSERT INTO employees (nameEmployee, cellPhoneNumber, email, passwordHash, position, Addresses_idAddress)
    VALUES (par_nameEmployee, par_cellPhoneNumber, par_email, par_passwordHash, par_position, last_address_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_user`(
	IN par_nameUser VARCHAR(50),
    IN par_cellPhoneNumber CHAR(11),
    IN par_email VARCHAR(100),
    
    IN par_publicPlace VARCHAR(100),
    IN par_neighborhood VARCHAR(50),
    IN par_number VARCHAR(10),
    IN par_complement VARCHAR(100),
    IN par_States_idState INT,
    IN par_Cities_idCity INT
)
BEGIN
	DECLARE last_address_id INT;
    
    INSERT INTO addresses (publicPlace, neighborhood, number, complement, States_idState, Cities_idCity)
    VALUES (par_publicPlace, par_neighborhood, par_number, par_complement, par_States_idState, par_Cities_idCity);
    
    SET last_address_id = LAST_INSERT_ID();
    
	INSERT INTO users (nameUser, cellPhoneNumber, email, Addresses_idAddress)
    VALUES (par_nameUser, par_cellPhoneNumber, par_email, last_address_id);
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

-- Dump completed on 2024-10-10 16:41:40
