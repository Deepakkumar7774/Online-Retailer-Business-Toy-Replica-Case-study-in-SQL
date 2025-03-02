/* CREATE "company" DATABASE.
CREATE DATABASE company;
USE company;
*/

-- Create the 'offices' table.
DROP TABLE IF EXISTS `offices`;

CREATE TABLE `offices` (
  `officeCode` int NOT NULL,
  `office_city` varchar(25) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `addressLine1` varchar(25) DEFAULT NULL,
  `addressLine2` varchar(12) DEFAULT NULL,
  `state` varchar(12) DEFAULT NULL,
  `country` varchar(12) DEFAULT NULL,
  `postalCode` varchar(12) DEFAULT NULL,
  `territory` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`officeCode`)
);

-- Dump the data into "offices" table.

INSERT INTO `offices` VALUES (1,'San Francisco','+1 650 219 4782','100 Market Street','Suite 300','CA','USA','94080','NA'),(2,'Boston','+1 215 837 0825','1550 Court Place','Suite 102','MA','USA','2107','NA'),(3,'NYC','+1 212 555 3000','523 East 53rd Street','apt. 5A','NY','USA','10022','NA'),(4,'Paris','+33 14 723 4404','43 Rue Jouffroy D\'abbans','NULL','NULL','France','75017','EMEA'),(5,'Tokyo','+81 33 224 5000','4-1 Kioicho','NULL','Chiyoda-Ku','Japan','102-8578','Japan'),(6,'Sydney','+61 2 9264 2451','5-11 Wentworth Avenue','Floor #2','NULL','Australia','NSW 2010','APAC'),(7,'London','+44 20 7877 2041','25 Old Broad Street','Level 7','NULL','UK','EC2N 1HN','EMEA');


-- Create 'employees' table.
DROP TABLE IF EXISTS `employees`;

CREATE TABLE `employees` (
  `employeeNumber` int NOT NULL,
  `lastName` varchar(12) DEFAULT NULL,
  `firstName` varchar(12) DEFAULT NULL,
  `extension` varchar(5) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `officeCode` int NOT NULL,
  `reportsTo` varchar(5) DEFAULT NULL,
  `jobTitle` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`employeeNumber`),
  CONSTRAINT `officecode` FOREIGN KEY (`officeCode`) REFERENCES `offices` (`officeCode`)
);

-- Dump the data into "employees" table.

INSERT INTO `employees` VALUES (1002,'Murphy','Diane','x5800','dmurphy@classicmodelcars.com',1,'NULL','President'),(1056,'Patterson','Mary','x4611','mpatterso@classicmodelcars.com',1,'1002','VP Sales'),(1076,'Firrelli','Jeff','x9273','jfirrelli@classicmodelcars.com',1,'1002','VP Marketing'),(1088,'Patterson','William','x4871','wpatterson@classicmodelcars.com',6,'1056','Sales Manager (APAC)'),(1143,'Bow','Anthony','x5428','abow@classicmodelcars.com',1,'1056','Sales Manager (NA)'),(1165,'Jennings','Leslie','x3291','ljennings@classicmodelcars.com',1,'1143','Sales Rep'),(1166,'Thompson','Leslie','x4065','lthompson@classicmodelcars.com',1,'1143','Sales Rep'),(1188,'Firrelli','Julie','x2173','jfirrelli@classicmodelcars.com',2,'1143','Sales Rep'),(1216,'Patterson','Steve','x4334','spatterson@classicmodelcars.com',2,'1143','Sales Rep'),(1286,'Tseng','Foon Yue','x2248','ftseng@classicmodelcars.com',3,'1143','Sales Rep'),(1323,'Vanauf','George','x4102','gvanauf@classicmodelcars.com',3,'1143','Sales Rep'),(1337,'Bondur','Loui','x6493','lbondur@classicmodelcars.com',4,'1102','Sales Rep'),(1370,'Hernandez','Gerard','x2028','ghernande@classicmodelcars.com',4,'1102','Sales Rep'),(1401,'Castillo','Pamela','x2759','pcastillo@classicmodelcars.com',4,'1102','Sales Rep'),(1501,'Bott','Larry','x2311','lbott@classicmodelcars.com',7,'1102','Sales Rep'),(1504,'Jones','Barry','x102','bjones@classicmodelcars.com',7,'1102','Sales Rep'),(1611,'Fixter','Andy','x101','afixter@classicmodelcars.com',6,'1088','Sales Rep'),(1612,'Marsh','Peter','x102','pmarsh@classicmodelcars.com',6,'1088','Sales Rep'),(1619,'King','Tom','x103','tking@classicmodelcars.com',6,'1088','Sales Rep'),(1621,'Nishi','Mami','x101','mnishi@classicmodelcars.com',5,'1056','Sales Rep'),(1625,'Kato','Yoshimi','x102','ykato@classicmodelcars.com',5,'1621','Sales Rep'),(1702,'Gerard','Martin','x2312','mgerard@classicmodelcars.com',4,'1102','Sales Rep');


-- Create 'customers' table.
DROP TABLE IF EXISTS `customers`;

SET FOREIGN_KEY_CHECKS = 0;
CREATE TABLE `customers` (
  `customerNumber` int NOT NULL,
  `customerName` varchar(45) DEFAULT NULL,
  `contactLastName` varchar(25) DEFAULT NULL,
  `contactFirstName` varchar(25) DEFAULT NULL,
  `city` varchar(25) DEFAULT NULL,
  `state` varchar(25) DEFAULT NULL,
  `postalCode` varchar(12) DEFAULT NULL,
  `country` varchar(12) DEFAULT NULL,
  `salesRepEmployeeNumber` int  DEFAULT NULL,
  `creditLimit` int NOT NULL,
  PRIMARY KEY (`customerNumber`),
  CONSTRAINT `emp_no` FOREIGN KEY (`salesRepEmployeeNumber`) REFERENCES `employees` (`employeeNumber`)
);

-- Dump the data into "customer" table.

INSERT INTO `customers` VALUES (103,'Atelier graphique','Schmitt','Carine ','Nantes',NULL,'44000','France','1370',21000),(112,'Signal Gift Stores','King','Jean','Las Vegas','NV','83030','USA','1166',71800),(114,'Australian Collectors, Co.','Ferguson','Peter','Melbourne','Victoria','3004','Australia','1611',117300),(119,'La Rochelle Gifts','Labrune','Janine ','Nantes',NULL,'44000','France','1370',118200),(121,'Baane Mini Imports','Bergulfsen','Jonas ','Stavern',NULL,'4110','Norway','1504',81700),(124,'Mini Gifts Distributors Ltd.','Nelson','Susan','San Rafael','CA','97562','USA','1165',210500),(125,'Havel & Zbyszek Co','Piestrzeniewicz','Zbyszek ','Warszawa',NULL,'01-012','Poland',NULL,0),(128,'Blauer See Auto, Co.','Keitel','Roland','Frankfurt',NULL,'60528','Germany','1504',59700),(129,'Mini Wheels Co.','Murphy','Julie','San Francisco','CA','94217','USA','1165',64600),(131,'Land of Toys Inc.','Lee','Kwai','NYC','NY','10022','USA','1323',114900),(141,'Euro+ Shopping Channel','Freyre','Diego ','Madrid',NULL,'28034','Spain','1370',227600),(144,'Volvo Model Replicas, Co','Berglund','Christina ','LuleÃ¥',NULL,'S-958 22','Sweden','1504',53100),(145,'Danish Wholesale Imports','Petersen','Jytte ','Kobenhavn',NULL,'1734','Denmark','1401',83400),(146,'Saveley & Henriot, Co.','Saveley','Mary ','Lyon',NULL,'69004','France','1337',123900),(148,'Dragon Souveniers, Ltd.','Natividad','Eric','Singapore',NULL,'79903','Singapore','1621',103800),(151,'Muscle Machine Inc','Young','Jeff','NYC','NY','10022','USA','1286',138500),(157,'Diecast Classics Inc.','Leong','Kelvin','Allentown','PA','70267','USA','1216',100600),(161,'Technics Stores Inc.','Hashimoto','Juri','Burlingame','CA','94217','USA','1165',84600),(166,'Handji Gifts& Co','Victorino','Wendy','Singapore',NULL,'69045','Singapore','1612',97900),(167,'Herkku Gifts','Oeztan','Veysel','Bergen',NULL,'N 5804','Norway  ','1504',96800),(168,'American Souvenirs Inc','Franco','Keith','New Haven','CT','97823','USA','1286',0),(169,'Porto Imports Co.','de Castro','Isabel ','Lisboa',NULL,'1756','Portugal',NULL,0),(171,'Daedalus Designs Imports','RancÃ©','Martine ','Lille',NULL,'59000','France','1370',82900),(172,'La Corne D\'abondance, Co.','Bertrand','Marie','Paris',NULL,'75012','France','1337',84300),(173,'Cambridge Collectables Co.','Tseng','Jerry','Cambridge','MA','51247','USA','1188',43400),(175,'Gift Depot Inc.','King','Julie','Bridgewater','CT','97562','USA','1323',84300),(177,'Osaka Souveniers Co.','Kentary','Mory','Kita-ku','Osaka',' 530-0003','Japan','1621',81200),(181,'Vitachrome Inc.','Frick','Michael','NYC','NY','10022','USA','1286',76400),(186,'Toys of Finland, Co.','Karttunen','Matti','Helsinki',NULL,'21240','Finland','1501',96500),(187,'AV Stores, Co.','Ashworth','Rachel','Manchester',NULL,'EC2 5NT','UK','1501',136800),(189,'Clover Collections, Co.','Cassidy','Dean','Dublin',NULL,'2','Ireland','1504',69400),(198,'Auto-Moto Classics Inc.','Taylor','Leslie','Brickhaven','MA','58339','USA','1216',23000),(201,'UK Collectables, Ltd.','Devon','Elizabeth','Liverpool',NULL,'WX1 6LT','UK','1501',92700),(202,'Canadian Gift Exchange Network','Tamuri','Yoshi ','Vancouver','BC','V3F 2K1','Canada','1323',90300),(204,'Online Mini Collectables','Barajas','Miguel','Brickhaven','MA','58339','USA','1188',68700),(205,'Toys4GrownUps.com','Young','Julie','Pasadena','CA','90003','USA','1166',90700),(206,'Asian Shopping Network, Co','Walker','Brydey','Singapore','NULL','38988','Singapore',NULL,0),(209,'Mini Caravy','Citeaux','FrÃ©dÃ©rique ','Strasbourg',NULL,'67000','France','1370',53800),(211,'King Kong Collectables, Co.','Gao','Mike','Central Hong Kong',NULL,NULL,'Hong Kong','1621',58600),(216,'Enaco Distributors','Saavedra','Eduardo ','Barcelona',NULL,'8022','Spain','1702',60300),(219,'Boards & Toys Co.','Young','Mary','Glendale','CA','92561','USA','1166',11000),(223,'NatÃ¼rlich Autos','Kloss','Horst ','Cunewalde',NULL,'1307','Germany',NULL,0),(227,'Heintze Collectables','Ibsen','Palle','Ã…rhus',NULL,'8200','Denmark','1401',120800),(233,'QuÃ©bec Home Shopping Network','FresniÃ¨re','Jean ','MontrÃ©al','QuÃ©bec','H1J 1C3','Canada','1286',48700),(237,'ANG Resellers','Camino','Alejandra ','Madrid',NULL,'28001','Spain',NULL,0),(239,'Collectable Mini Designs Co.','Thompson','Valarie','San Diego','CA','91217','USA','1166',105000),(240,'giftsbymail.co.uk','Bennett','Helen ','Cowes','Isle of Wight','PO31 7PJ','UK','1501',93900),(242,'Alpha Cognac','Roulet','Annette ','Toulouse',NULL,'31000','France','1370',61100),(247,'Messner Shopping Network','Messner','Renate ','Frankfurt',NULL,'60528','Germany',NULL,0),(249,'Amica Models & Co.','Accorti','Paolo ','Torino',NULL,'10100','Italy','1401',113000),(250,'Lyon Souveniers','Da Silva','Daniel','Paris',NULL,'75508','France','1337',68100),(256,'Auto AssociÃ©s & Cie.','Tonini','Daniel ','Versailles',NULL,'78000','France','1370',77900),(259,'Toms SpezialitÃ¤ten, Ltd','Pfalzheim','Henriette ','KÃ¶ln',NULL,'50739','Germany','1504',120400),(260,'Royal Canadian Collectables, Ltd.','Lincoln','Elizabeth ','Tsawassen','BC','T2F 8M4','Canada','1323',89600),(273,'Franken Gifts, Co','Franken','Peter ','MÃ¼nchen',NULL,'80805','Germany',NULL,0),(276,'Anna\'s Decorations, Ltd','O\'Hara','Anna','North Sydney','NSW','2060','Australia','1611',107800),(278,'Rovelli Gifts','Rovelli','Giovanni ','Bergamo',NULL,'24100','Italy','1401',119600),(282,'Souveniers And Things Co.','Huxley','Adrian','Chatswood','NSW','2067','Australia','1611',93300),(286,'Marta\'s Replicas Co.','Hernandez','Marta','Cambridge','MA','51247','USA','1216',123700),(293,'BG&E Collectables','Harrison','Ed','Fribourg',NULL,'1700','Switzerland',NULL,0),(298,'Vida Sport, Ltd','Holz','Mihael','GenÃ¨ve',NULL,'1203','Switzerland','1702',141300),(299,'Norway Gifts By Mail, Co.','Klaeboe','Jan','Oslo',NULL,'N 0106','Norway  ','1504',95100),(303,'Schuyler Imports','Schuyler','Bradley','Amsterdam',NULL,'1043 GR','Netherlands',NULL,0),(307,'Der Hund Imports','Andersen','Mel','Berlin',NULL,'12209','Germany',NULL,0),(311,'Oulu Toy Supplies, Inc.','Koskitalo','Pirkko','Oulu',NULL,'90110','Finland','1501',90500),(314,'Petit Auto','Dewey','Catherine ','Bruxelles',NULL,'B-1180','Belgium','1401',79900),(319,'Mini Classics','Frick','Steve','White Plains','NY','24067','USA','1323',102700),(320,'Mini Creations Ltd.','Huang','Wing','New Bedford','MA','50553','USA','1188',94500),(321,'Corporate Gift Ideas Co.','Brown','Julie','San Francisco','CA','94217','USA','1165',105000),(323,'Down Under Souveniers, Inc','Graham','Mike','Auckland  ',NULL,NULL,'New Zealand','1612',88000),(324,'Stylish Desk Decors, Co.','Brown','Ann ','London',NULL,'WX3 6FW','UK','1501',77000),(328,'Tekni Collectables Inc.','Brown','William','Newark','NJ','94019','USA','1323',43000),(333,'Australian Gift Network, Co','Calaghan','Ben','South Brisbane','Queensland','4101','Australia','1611',51600),(334,'Suominen Souveniers','Suominen','Kalle','Espoo',NULL,'FIN-02271','Finland','1501',98800),(335,'Cramer SpezialitÃ¤ten, Ltd','Cramer','Philip ','Brandenburg',NULL,'14776','Germany',NULL,0),(339,'Classic Gift Ideas, Inc','Cervantes','Francisca','Philadelphia','PA','71270','USA','1188',81100),(344,'CAF Imports','Fernandez','Jesus','Madrid',NULL,'28023','Spain','1702',59600),(347,'Men \'R\' US Retailers, Ltd.','Chandler','Brian','Los Angeles','CA','91003','USA','1166',57700),(348,'Asian Treasures, Inc.','McKenna','Patricia ','Cork','Co. Cork',NULL,'Ireland',NULL,0),(350,'Marseille Mini Autos','Lebihan','Laurence ','Marseille',NULL,'13008','France','1337',65000),(353,'Reims Collectables','Henriot','Paul ','Reims',NULL,'51100','France','1337',81100),(356,'SAR Distributors, Co','Kuger','Armand','Hatfield','Pretoria','28','South Africa',NULL,0),(357,'GiftsForHim.com','MacKinlay','Wales','Auckland',NULL,NULL,'New Zealand','1612',77700),(361,'Kommission Auto','Josephs','Karin','MÃ¼nster',NULL,'44087','Germany',NULL,0),(362,'Gifts4AllAges.com','Yoshido','Juri','Boston','MA','51003','USA','1216',41900),(363,'Online Diecast Creations Co.','Young','Dorothy','Nashua','NH','62005','USA','1216',114200),(369,'Lisboa Souveniers, Inc','Rodriguez','Lino ','Lisboa',NULL,'1675','Portugal',NULL,0),(376,'Precious Collectables','Urs','Braun','Bern',NULL,'3012','Switzerland','1702',0),(379,'Collectables For Less Inc.','Nelson','Allen','Brickhaven','MA','58339','USA','1188',70700),(381,'Royale Belge','Cartrain','Pascale ','Charleroi',NULL,'B-6000','Belgium','1401',23500),(382,'Salzburg Collectables','Pipps','Georg ','Salzburg','NULL','5020','Austria','1401',71700),(385,'Cruz & Sons Co.','Cruz','Arnold','Makati City','NULL','1227 MM','Philippines','1621',81500),(386,'L\'ordine Souveniers','Moroni','Maurizio ','Reggio Emilia','NULL','42100','Italy','1401',121400),(398,'Tokyo Collectables, Ltd','Shimamura','Akiko','Minato-ku','Tokyo','106-0032','Japan','1621',94400),(406,'Auto Canal+ Petit','Perrier','Dominique','Paris',NULL,'75016','France','1337',95000),(409,'Stuttgart Collectable Exchange','MÃ¼ller','Rita ','Stuttgart',NULL,'70563','Germany',NULL,0),(412,'Extreme Desk Decorations, Ltd','McRoy','Sarah','Wellington',NULL,NULL,'New Zealand','1612',86800),(415,'Bavarian Collectables Imports, Co.','Donnermeyer','Michael','Munich',NULL,'80686','Germany','1504',77000),(424,'Classic Legends Inc.','Hernandez','Maria','NYC','NY','10022','USA','1286',67500),(443,'Feuer Online Stores, Inc','Feuer','Alexander ','Leipzig',NULL,'4179','Germany',NULL,0),(447,'Gift Ideas Corp.','Lewis','Dan','Glendale','CT','97561','USA','1323',49700),(448,'Scandinavian Gift Ideas','Larsson','Martha','BrÃ¤cke',NULL,'S-844 67','Sweden','1504',116400),(450,'The Sharp Gifts Warehouse','Frick','Sue','San Jose','CA','94217','USA','1165',77600),(452,'Mini Auto Werke','Mendel','Roland ','Graz',NULL,'8010','Austria','1401',45300),(455,'Super Scale Inc.','Murphy','Leslie','New Haven','CT','97823','USA','1286',95400),(456,'Microscale Inc.','Choi','Yu','NYC','NY','10022','USA','1286',39800),(458,'Corrida Auto Replicas, Ltd','Sommer','MartÃ­n ','Madrid',NULL,'28023','Spain','1702',104600),(459,'Warburg Exchange','Ottlieb','Sven ','Aachen',NULL,'52066','Germany',NULL,0),(462,'FunGiftIdeas.com','Benitez','Violeta','New Bedford','MA','50553','USA','1216',85800),(465,'Anton Designs, Ltd.','Anton','Carmen','Madrid',NULL,'28023','Spain',NULL,0),(471,'Australian Collectables, Ltd','Clenahan','Sean','Glen Waverly','Victoria','3150','Australia','1611',60300),(473,'Frau da Collezione','Ricotti','Franco','Milan',NULL,NULL,'Italy','1401',34800),(475,'West Coast Collectables Co.','Thompson','Steve','Burbank','CA','94019','USA','1166',55400),(477,'Mit VergnÃ¼gen & Co.','Moos','Hanna ','Mannheim',NULL,'68306','Germany',NULL,0),(480,'Kremlin Collectables, Co.','Semenov','Alexander ','Saint Petersburg',NULL,'196143','Russia',NULL,0),(481,'Raanan Stores, Inc','Altagar,G M','Raanan','Herzlia',NULL,'47625','Israel',NULL,0),(484,'Iberia Gift Imports, Corp.','Roel','JosÃ© Pedro ','Sevilla',NULL,'41101','Spain','1702',65700),(486,'Motor Mint Distributors Inc.','Salazar','Rosa','Philadelphia','PA','71270','USA','1323',72600),(487,'Signal Collectibles Ltd.','Taylor','Sue','Brisbane','CA','94217','USA','1165',60300),(489,'Double Decker Gift Stores, Ltd','Smith','Thomas ','London',NULL,'WA1 1DP','UK','1501',43300);


-- Create `orders` table
DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `orderNumber` int NOT NULL,
  `orderDate` datetime DEFAULT NULL,
  `requiredDate` datetime DEFAULT NULL,
  `shippedDate` varchar(25) DEFAULT NULL,
  `status` varchar(12) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `customerNumber` int NOT NULL,
  PRIMARY KEY (`orderNumber`),
  CONSTRAINT `customer_no` FOREIGN KEY (`customerNumber`) REFERENCES `customers` (`customerNumber`)
  ) ;
  
-- Dump the data into `orders`

INSERT INTO `orders` VALUES (10100,'2003-01-06 00:00:00','2003-01-13 00:00:00','10-01-2003 00:00:00','Shipped','NULL',363),(10101,'2003-01-09 00:00:00','2003-01-18 00:00:00','11-01-2003 00:00:00','Shipped','Check on availability.',128),(10102,'2003-01-10 00:00:00','2003-01-18 00:00:00','14-01-2003 00:00:00','Shipped','NULL',181),(10103,'2003-01-29 00:00:00','2003-02-07 00:00:00','02-02-2003 00:00:00','Shipped','NULL',121),(10104,'2003-01-31 00:00:00','2003-02-09 00:00:00','01-02-2003 00:00:00','Shipped','NULL',141),(10105,'2003-02-11 00:00:00','2003-02-21 00:00:00','12-02-2003 00:00:00','Shipped','NULL',145),(10106,'2003-02-17 00:00:00','2003-02-24 00:00:00','21-02-2003 00:00:00','Shipped','NULL',278),(10107,'2003-02-24 00:00:00','2003-03-03 00:00:00','26-02-2003 00:00:00','Shipped','Difficult to negotiate with customer. We need more marketing materials',131),(10108,'2003-03-03 00:00:00','2003-03-12 00:00:00','08-03-2003 00:00:00','Shipped','NULL',385),(10109,'2003-03-10 00:00:00','2003-03-19 00:00:00','11-03-2003 00:00:00','Shipped','Customer requested that FedEx Ground is used for this shipping',486),(10110,'2003-03-18 00:00:00','2003-03-24 00:00:00','20-03-2003 00:00:00','Shipped','NULL',187),(10111,'2003-03-25 00:00:00','2003-03-31 00:00:00','30-03-2003 00:00:00','Shipped','NULL',129),(10112,'2003-03-24 00:00:00','2003-04-03 00:00:00','29-03-2003 00:00:00','Shipped','Customer requested that ad materials (such as posters, pamphlets) be included in the shippment',144),(10113,'2003-03-26 00:00:00','2003-04-02 00:00:00','27-03-2003 00:00:00','Shipped','NULL',124),(10114,'2003-04-01 00:00:00','2003-04-07 00:00:00','02-04-2003 00:00:00','Shipped','NULL',172),(10115,'2003-04-04 00:00:00','2003-04-12 00:00:00','07-04-2003 00:00:00','Shipped','NULL',424),(10116,'2003-04-11 00:00:00','2003-04-19 00:00:00','13-04-2003 00:00:00','Shipped','NULL',381),(10117,'2003-04-16 00:00:00','2003-04-24 00:00:00','17-04-2003 00:00:00','Shipped','NULL',148),(10118,'2003-04-21 00:00:00','2003-04-29 00:00:00','26-04-2003 00:00:00','Shipped','Customer has worked with some of our vendors in the past and is aware of their MSRP',216),(10119,'2003-04-28 00:00:00','2003-05-05 00:00:00','02-05-2003 00:00:00','Shipped','NULL',382),(10120,'2003-04-29 00:00:00','2003-05-08 00:00:00','01-05-2003 00:00:00','Shipped','NULL',114),(10121,'2003-05-07 00:00:00','2003-05-13 00:00:00','13-05-2003 00:00:00','Shipped','NULL',353),(10122,'2003-05-08 00:00:00','2003-05-16 00:00:00','13-05-2003 00:00:00','Shipped','NULL',350),(10123,'2003-05-20 00:00:00','2003-05-29 00:00:00','22-05-2003 00:00:00','Shipped','NULL',103),(10124,'2003-05-21 00:00:00','2003-05-29 00:00:00','25-05-2003 00:00:00','Shipped','Customer very concerned about the exact color of the models.',112),(10125,'2003-05-21 00:00:00','2003-05-27 00:00:00','24-05-2003 00:00:00','Shipped','NULL',114),(10126,'2003-05-28 00:00:00','2003-06-07 00:00:00','02-06-2003 00:00:00','Shipped','NULL',458),(10127,'2003-06-03 00:00:00','2003-06-09 00:00:00','06-06-2003 00:00:00','Shipped','Customer requested special shippment. The instructions were passed along to the warehouse',151),(10128,'2003-06-06 00:00:00','2003-06-12 00:00:00','11-06-2003 00:00:00','Shipped','NULL',141),(10129,'2003-06-12 00:00:00','2003-06-18 00:00:00','14-06-2003 00:00:00','Shipped','NULL',324),(10130,'2003-06-16 00:00:00','2003-06-24 00:00:00','21-06-2003 00:00:00','Shipped','NULL',198),(10131,'2003-06-16 00:00:00','2003-06-25 00:00:00','21-06-2003 00:00:00','Shipped','NULL',447),(10132,'2003-06-25 00:00:00','2003-07-01 00:00:00','28-06-2003 00:00:00','Shipped','NULL',323),(10133,'2003-06-27 00:00:00','2003-07-04 00:00:00','03-07-2003 00:00:00','Shipped','NULL',141),(10134,'2003-07-01 00:00:00','2003-07-10 00:00:00','05-07-2003 00:00:00','Shipped','NULL',250),(10135,'2003-07-02 00:00:00','2003-07-12 00:00:00','03-07-2003 00:00:00','Shipped','NULL',124),(10136,'2003-07-04 00:00:00','2003-07-14 00:00:00','06-07-2003 00:00:00','Shipped','Customer is interested in buying more Ferrari models',242),(10137,'2003-07-10 00:00:00','2003-07-20 00:00:00','14-07-2003 00:00:00','Shipped','NULL',353),(10138,'2003-07-07 00:00:00','2003-07-16 00:00:00','13-07-2003 00:00:00','Shipped','NULL',496),(10139,'2003-07-16 00:00:00','2003-07-23 00:00:00','21-07-2003 00:00:00','Shipped','NULL',282),(10140,'2003-07-24 00:00:00','2003-08-02 00:00:00','30-07-2003 00:00:00','Shipped','NULL',161),(10141,'2003-08-01 00:00:00','2003-08-09 00:00:00','04-08-2003 00:00:00','Shipped','NULL',334),(10142,'2003-08-08 00:00:00','2003-08-16 00:00:00','13-08-2003 00:00:00','Shipped','NULL',124),(10143,'2003-08-10 00:00:00','2003-08-18 00:00:00','12-08-2003 00:00:00','Shipped','Can we deliver the new Ford Mustang models by end-of-quarter?',320),(10144,'2003-08-13 00:00:00','2003-08-21 00:00:00','14-08-2003 00:00:00','Shipped','NULL',381),(10145,'2003-08-25 00:00:00','2003-09-02 00:00:00','31-08-2003 00:00:00','Shipped','NULL',205),(10146,'2003-09-03 00:00:00','2003-09-13 00:00:00','06-09-2003 00:00:00','Shipped','NULL',447),(10147,'2003-09-05 00:00:00','2003-09-12 00:00:00','09-09-2003 00:00:00','Shipped','NULL',379),(10148,'2003-09-11 00:00:00','2003-09-21 00:00:00','15-09-2003 00:00:00','Shipped','They want to reevaluate their terms agreement with Finance.',276),(10149,'2003-09-12 00:00:00','2003-09-18 00:00:00','17-09-2003 00:00:00','Shipped','NULL',487),(10150,'2003-09-19 00:00:00','2003-09-27 00:00:00','21-09-2003 00:00:00','Shipped','They want to reevaluate their terms agreement with Finance.',148),(10151,'2003-09-21 00:00:00','2003-09-30 00:00:00','24-09-2003 00:00:00','Shipped','NULL',311),(10152,'2003-09-25 00:00:00','2003-10-03 00:00:00','01-10-2003 00:00:00','Shipped','NULL',333),(10153,'2003-09-28 00:00:00','2003-10-05 00:00:00','03-10-2003 00:00:00','Shipped','NULL',141),(10154,'2003-10-02 00:00:00','2003-10-12 00:00:00','08-10-2003 00:00:00','Shipped','NULL',219),(10155,'2003-10-06 00:00:00','2003-10-13 00:00:00','07-10-2003 00:00:00','Shipped','NULL',186),(10156,'2003-10-08 00:00:00','2003-10-17 00:00:00','11-10-2003 00:00:00','Shipped','NULL',141),(10157,'2003-10-09 00:00:00','2003-10-15 00:00:00','14-10-2003 00:00:00','Shipped','NULL',473),(10158,'2003-10-10 00:00:00','2003-10-18 00:00:00','15-10-2003 00:00:00','Shipped','NULL',121),(10159,'2003-10-10 00:00:00','2003-10-19 00:00:00','16-10-2003 00:00:00','Shipped','NULL',321),(10160,'2003-10-11 00:00:00','2003-10-17 00:00:00','17-10-2003 00:00:00','Shipped','NULL',347),(10161,'2003-10-17 00:00:00','2003-10-25 00:00:00','20-10-2003 00:00:00','Shipped','NULL',227),(10162,'2003-10-18 00:00:00','2003-10-26 00:00:00','19-10-2003 00:00:00','Shipped','NULL',321),(10163,'2003-10-20 00:00:00','2003-10-27 00:00:00','24-10-2003 00:00:00','Shipped','NULL',424),(10164,'2003-10-21 00:00:00','2003-10-30 00:00:00','23-10-2003 00:00:00','Resolved','This order was disputed, but resolved on 11/1/2003; Customer doesn\'t like the colors and precision of the models.',452),(10165,'2003-10-22 00:00:00','2003-10-31 00:00:00','26-12-2003 00:00:00','Shipped','This order was on hold because customers\'s credit limit had been exceeded. Order will ship when payment is received',148),(10166,'2003-10-21 00:00:00','2003-10-30 00:00:00','27-10-2003 00:00:00','Shipped','NULL',462),(10167,'2003-10-23 00:00:00','2003-10-30 00:00:00','NULL','Cancelled','Customer called to cancel. The warehouse was notified in time and the order didn\'t ship.',448),(10168,'2003-10-28 00:00:00','2003-11-03 00:00:00','01-11-2003 00:00:00','Shipped','NULL',161),(10169,'2003-11-04 00:00:00','2003-11-14 00:00:00','09-11-2003 00:00:00','Shipped','NULL',276),(10170,'2003-11-04 00:00:00','2003-11-12 00:00:00','07-11-2003 00:00:00','Shipped','NULL',452),(10171,'2003-11-05 00:00:00','2003-11-13 00:00:00','07-11-2003 00:00:00','Shipped','NULL',233),(10172,'2003-11-05 00:00:00','2003-11-14 00:00:00','11-11-2003 00:00:00','Shipped','NULL',175),(10173,'2003-11-05 00:00:00','2003-11-15 00:00:00','09-11-2003 00:00:00','Shipped','Cautious optimism. We have happy customers here, if we can keep them well stocked.',278),(10174,'2003-11-06 00:00:00','2003-11-15 00:00:00','10-11-2003 00:00:00','Shipped','NULL',333),(10175,'2003-11-06 00:00:00','2003-11-14 00:00:00','09-11-2003 00:00:00','Shipped','NULL',324),(10176,'2003-11-06 00:00:00','2003-11-15 00:00:00','12-11-2003 00:00:00','Shipped','NULL',386),(10177,'2003-11-07 00:00:00','2003-11-17 00:00:00','12-11-2003 00:00:00','Shipped','NULL',344),(10178,'2003-11-08 00:00:00','2003-11-16 00:00:00','10-11-2003 00:00:00','Shipped','Custom shipping instructions sent to warehouse',242),(10179,'2003-11-11 00:00:00','2003-11-17 00:00:00','13-11-2003 00:00:00','Cancelled','Customer cancelled due to urgent budgeting issues. Must be cautious when dealing with them in the future.',496),(10180,'2003-11-11 00:00:00','2003-11-19 00:00:00','14-11-2003 00:00:00','Shipped','NULL',171),(10181,'2003-11-12 00:00:00','2003-11-19 00:00:00','15-11-2003 00:00:00','Shipped','NULL',167),(10182,'2003-11-12 00:00:00','2003-11-21 00:00:00','18-11-2003 00:00:00','Shipped','NULL',124),(10183,'2003-11-13 00:00:00','2003-11-22 00:00:00','15-11-2003 00:00:00','Shipped','We need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.',339),(10184,'2003-11-14 00:00:00','2003-11-22 00:00:00','20-11-2003 00:00:00','Shipped','NULL',484),(10185,'2003-11-14 00:00:00','2003-11-21 00:00:00','20-11-2003 00:00:00','Shipped','NULL',320),(10186,'2003-11-14 00:00:00','2003-11-20 00:00:00','18-11-2003 00:00:00','Shipped','They want to reevaluate their terms agreement with the VP of Sales',489),(10187,'2003-11-15 00:00:00','2003-11-24 00:00:00','16-11-2003 00:00:00','Shipped','NULL',211),(10188,'2003-11-18 00:00:00','2003-11-26 00:00:00','24-11-2003 00:00:00','Shipped','NULL',167),(10189,'2003-11-18 00:00:00','2003-11-25 00:00:00','24-11-2003 00:00:00','Shipped','They want to reevaluate their terms agreement with Finance.',205),(10190,'2003-11-19 00:00:00','2003-11-29 00:00:00','20-11-2003 00:00:00','Shipped','NULL',141),(10191,'2003-11-20 00:00:00','2003-11-30 00:00:00','24-11-2003 00:00:00','Shipped','We must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.',259),(10192,'2003-11-20 00:00:00','2003-11-29 00:00:00','25-11-2003 00:00:00','Shipped','NULL',363),(10193,'2003-11-21 00:00:00','2003-11-28 00:00:00','27-11-2003 00:00:00','Shipped','NULL',471),(10194,'2003-11-25 00:00:00','2003-12-02 00:00:00','26-11-2003 00:00:00','Shipped','NULL',146),(10195,'2003-11-25 00:00:00','2003-12-01 00:00:00','28-11-2003 00:00:00','Shipped','NULL',319),(10196,'2003-11-26 00:00:00','2003-12-03 00:00:00','01-12-2003 00:00:00','Shipped','NULL',455),(10197,'2003-11-26 00:00:00','2003-12-02 00:00:00','01-12-2003 00:00:00','Shipped','Customer inquired about remote controlled models and gold models.',216),(10198,'2003-11-27 00:00:00','2003-12-06 00:00:00','03-12-2003 00:00:00','Shipped','NULL',385),(10199,'2003-12-01 00:00:00','2003-12-10 00:00:00','06-12-2003 00:00:00','Shipped','NULL',475),(10200,'2003-12-01 00:00:00','2003-12-09 00:00:00','06-12-2003 00:00:00','Shipped','NULL',211),(10201,'2003-12-01 00:00:00','2003-12-11 00:00:00','02-12-2003 00:00:00','Shipped','NULL',129),(10202,'2003-12-02 00:00:00','2003-12-09 00:00:00','06-12-2003 00:00:00','Shipped','NULL',357),(10203,'2003-12-02 00:00:00','2003-12-11 00:00:00','07-12-2003 00:00:00','Shipped','NULL',141),(10204,'2003-12-02 00:00:00','2003-12-10 00:00:00','04-12-2003 00:00:00','Shipped','NULL',151),(10205,'2003-12-03 00:00:00','2003-12-09 00:00:00','07-12-2003 00:00:00','Shipped',' I need all the information I can get on our competitors.',141),(10206,'2003-12-05 00:00:00','2003-12-13 00:00:00','08-12-2003 00:00:00','Shipped','Can we renegotiate this one?',202),(10207,'2003-12-09 00:00:00','2003-12-17 00:00:00','11-12-2003 00:00:00','Shipped','Check on availability.',495),(10208,'2004-01-02 00:00:00','2004-01-11 00:00:00','04-01-2004 00:00:00','Shipped','NULL',146),(10209,'2004-01-09 00:00:00','2004-01-15 00:00:00','12-01-2004 00:00:00','Shipped','NULL',347),(10210,'2004-01-12 00:00:00','2004-01-22 00:00:00','20-01-2004 00:00:00','Shipped','NULL',177),(10211,'2004-01-15 00:00:00','2004-01-25 00:00:00','18-01-2004 00:00:00','Shipped','NULL',406),(10212,'2004-01-16 00:00:00','2004-01-24 00:00:00','18-01-2004 00:00:00','Shipped','NULL',141),(10213,'2004-01-22 00:00:00','2004-01-28 00:00:00','27-01-2004 00:00:00','Shipped','Difficult to negotiate with customer. We need more marketing materials',489),(10214,'2004-01-26 00:00:00','2004-02-04 00:00:00','29-01-2004 00:00:00','Shipped','NULL',458),(10215,'2004-01-29 00:00:00','2004-02-08 00:00:00','01-02-2004 00:00:00','Shipped','Customer requested that FedEx Ground is used for this shipping',475),(10216,'2004-02-02 00:00:00','2004-02-10 00:00:00','04-02-2004 00:00:00','Shipped','NULL',256),(10217,'2004-02-04 00:00:00','2004-02-14 00:00:00','06-02-2004 00:00:00','Shipped','NULL',166),(10218,'2004-02-09 00:00:00','2004-02-16 00:00:00','11-02-2004 00:00:00','Shipped','Customer requested that ad materials (such as posters, pamphlets) be included in the shipment',473),(10219,'2004-02-10 00:00:00','2004-02-17 00:00:00','12-02-2004 00:00:00','Shipped','NULL',487),(10220,'2004-02-12 00:00:00','2004-02-19 00:00:00','16-02-2004 00:00:00','Shipped','NULL',189),(10221,'2004-02-18 00:00:00','2004-02-26 00:00:00','19-02-2004 00:00:00','Shipped','NULL',314),(10222,'2004-02-19 00:00:00','2004-02-27 00:00:00','20-02-2004 00:00:00','Shipped','NULL',239),(10223,'2004-02-20 00:00:00','2004-02-29 00:00:00','24-02-2004 00:00:00','Shipped','NULL',114),(10224,'2004-02-21 00:00:00','2004-03-02 00:00:00','26-02-2004 00:00:00','Shipped','Customer has worked with some of our vendors in the past and is aware of their MSRP',171),(10225,'2004-02-22 00:00:00','2004-03-01 00:00:00','24-02-2004 00:00:00','Shipped','NULL',298),(10226,'2004-02-26 00:00:00','2004-03-06 00:00:00','02-03-2004 00:00:00','Shipped','NULL',239),(10227,'2004-03-02 00:00:00','2004-03-12 00:00:00','08-03-2004 00:00:00','Shipped','NULL',146),(10228,'2004-03-10 00:00:00','2004-03-18 00:00:00','13-03-2004 00:00:00','Shipped','NULL',173),(10229,'2004-03-11 00:00:00','2004-03-20 00:00:00','12-03-2004 00:00:00','Shipped','NULL',124),(10230,'2004-03-15 00:00:00','2004-03-24 00:00:00','20-03-2004 00:00:00','Shipped','Customer very concerned about the exact color of the models.',128),(10231,'2004-03-19 00:00:00','2004-03-26 00:00:00','25-03-2004 00:00:00','Shipped','NULL',344),(10232,'2004-03-20 00:00:00','2004-03-30 00:00:00','25-03-2004 00:00:00','Shipped','NULL',240),(10233,'2004-03-29 00:00:00','2004-04-04 00:00:00','02-04-2004 00:00:00','Shipped','Customer requested special shippment. The instructions were passed along to the warehouse',328),(10234,'2004-03-30 00:00:00','2004-04-05 00:00:00','02-04-2004 00:00:00','Shipped','NULL',412),(10235,'2004-04-02 00:00:00','2004-04-12 00:00:00','06-04-2004 00:00:00','Shipped','NULL',260),(10236,'2004-04-03 00:00:00','2004-04-11 00:00:00','08-04-2004 00:00:00','Shipped','NULL',486),(10237,'2004-04-05 00:00:00','2004-04-12 00:00:00','10-04-2004 00:00:00','Shipped','NULL',181),(10238,'2004-04-09 00:00:00','2004-04-16 00:00:00','10-04-2004 00:00:00','Shipped','NULL',145),(10239,'2004-04-12 00:00:00','2004-04-21 00:00:00','17-04-2004 00:00:00','Shipped','NULL',311),(10240,'2004-04-13 00:00:00','2004-04-20 00:00:00','20-04-2004 00:00:00','Shipped','NULL',177),(10241,'2004-04-13 00:00:00','2004-04-20 00:00:00','19-04-2004 00:00:00','Shipped','NULL',209),(10242,'2004-04-20 00:00:00','2004-04-28 00:00:00','25-04-2004 00:00:00','Shipped','Customer is interested in buying more Ferrari models',456),(10243,'2004-04-26 00:00:00','2004-05-03 00:00:00','28-04-2004 00:00:00','Shipped','NULL',495),(10244,'2004-04-29 00:00:00','2004-05-09 00:00:00','04-05-2004 00:00:00','Shipped','NULL',141),(10245,'2004-05-04 00:00:00','2004-05-12 00:00:00','09-05-2004 00:00:00','Shipped','NULL',455),(10246,'2004-05-05 00:00:00','2004-05-13 00:00:00','06-05-2004 00:00:00','Shipped','NULL',141),(10247,'2004-05-05 00:00:00','2004-05-11 00:00:00','08-05-2004 00:00:00','Shipped','NULL',334),(10248,'2004-05-07 00:00:00','2004-05-14 00:00:00','NULL','Cancelled','Order was mistakenly placed. The warehouse noticed the lack of documentation.',131),(10249,'2004-05-08 00:00:00','2004-05-17 00:00:00','11-05-2004 00:00:00','Shipped','Can we deliver the new Ford Mustang models by end-of-quarter?',173),(10250,'2004-05-11 00:00:00','2004-05-19 00:00:00','15-05-2004 00:00:00','Shipped','NULL',450),(10251,'2004-05-18 00:00:00','2004-05-24 00:00:00','24-05-2004 00:00:00','Shipped','NULL',328),(10252,'2004-05-26 00:00:00','2004-06-04 00:00:00','29-05-2004 00:00:00','Shipped','NULL',406),(10253,'2004-06-01 00:00:00','2004-06-09 00:00:00','02-06-2004 00:00:00','Cancelled','Customer disputed the order and we agreed to cancel it.',201),(10254,'2004-06-03 00:00:00','2004-06-13 00:00:00','04-06-2004 00:00:00','Shipped','Customer requested that DHL is used for this shipping',323),(10255,'2004-06-04 00:00:00','2004-06-12 00:00:00','09-06-2004 00:00:00','Shipped','NULL',209),(10256,'2004-06-08 00:00:00','2004-06-16 00:00:00','10-06-2004 00:00:00','Shipped','NULL',145),(10257,'2004-06-14 00:00:00','2004-06-24 00:00:00','15-06-2004 00:00:00','Shipped','NULL',450),(10258,'2004-06-15 00:00:00','2004-06-25 00:00:00','23-06-2004 00:00:00','Shipped','NULL',398),(10259,'2004-06-15 00:00:00','2004-06-22 00:00:00','17-06-2004 00:00:00','Shipped','NULL',166),(10260,'2004-06-16 00:00:00','2004-06-22 00:00:00','NULL','Cancelled','Customer heard complaints from their customers and called to cancel this order. Will notify the Sales Manager.',357),(10261,'2004-06-17 00:00:00','2004-06-25 00:00:00','22-06-2004 00:00:00','Shipped','NULL',233),(10262,'2004-06-24 00:00:00','2004-07-01 00:00:00','NULL','Cancelled','This customer found a better offer from one of our competitors. Will call back to renegotiate.',141),(10263,'2004-06-28 00:00:00','2004-07-04 00:00:00','02-07-2004 00:00:00','Shipped','NULL',175),(10264,'2004-06-30 00:00:00','2004-07-06 00:00:00','01-07-2004 00:00:00','Shipped','Customer will send a truck to our local warehouse on 7/1/2004',362),(10265,'2004-07-02 00:00:00','2004-07-09 00:00:00','07-07-2004 00:00:00','Shipped','NULL',471),(10266,'2004-07-06 00:00:00','2004-07-14 00:00:00','10-07-2004 00:00:00','Shipped','NULL',386),(10267,'2004-07-07 00:00:00','2004-07-17 00:00:00','09-07-2004 00:00:00','Shipped','NULL',151),(10268,'2004-07-12 00:00:00','2004-07-18 00:00:00','14-07-2004 00:00:00','Shipped','NULL',412),(10269,'2004-07-16 00:00:00','2004-07-22 00:00:00','18-07-2004 00:00:00','Shipped','NULL',382),(10270,'2004-07-19 00:00:00','2004-07-27 00:00:00','24-07-2004 00:00:00','Shipped','Can we renegotiate this one?',282),(10271,'2004-07-20 00:00:00','2004-07-29 00:00:00','23-07-2004 00:00:00','Shipped','NULL',124),(10272,'2004-07-20 00:00:00','2004-07-26 00:00:00','22-07-2004 00:00:00','Shipped','NULL',157),(10273,'2004-07-21 00:00:00','2004-07-28 00:00:00','22-07-2004 00:00:00','Shipped','NULL',314),(10274,'2004-07-21 00:00:00','2004-07-29 00:00:00','22-07-2004 00:00:00','Shipped','NULL',379),(10275,'2004-07-23 00:00:00','2004-08-02 00:00:00','29-07-2004 00:00:00','Shipped','NULL',119),(10276,'2004-08-02 00:00:00','2004-08-11 00:00:00','08-08-2004 00:00:00','Shipped','NULL',204),(10277,'2004-08-04 00:00:00','2004-08-12 00:00:00','05-08-2004 00:00:00','Shipped','NULL',148),(10278,'2004-08-06 00:00:00','2004-08-16 00:00:00','09-08-2004 00:00:00','Shipped','NULL',112),(10279,'2004-08-09 00:00:00','2004-08-19 00:00:00','15-08-2004 00:00:00','Shipped','Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches',141),(10280,'2004-08-17 00:00:00','2004-08-27 00:00:00','19-08-2004 00:00:00','Shipped','NULL',249),(10281,'2004-08-19 00:00:00','2004-08-28 00:00:00','23-08-2004 00:00:00','Shipped','NULL',157),(10282,'2004-08-20 00:00:00','2004-08-26 00:00:00','22-08-2004 00:00:00','Shipped','NULL',124),(10283,'2004-08-20 00:00:00','2004-08-30 00:00:00','23-08-2004 00:00:00','Shipped','NULL',260),(10284,'2004-08-21 00:00:00','2004-08-29 00:00:00','26-08-2004 00:00:00','Shipped','Custom shipping instructions sent to warehouse',299),(10285,'2004-08-27 00:00:00','2004-09-04 00:00:00','31-08-2004 00:00:00','Shipped','NULL',286),(10286,'2004-08-28 00:00:00','2004-09-06 00:00:00','01-09-2004 00:00:00','Shipped','NULL',172),(10287,'2004-08-30 00:00:00','2004-09-06 00:00:00','01-09-2004 00:00:00','Shipped','NULL',298),(10288,'2004-09-01 00:00:00','2004-09-11 00:00:00','05-09-2004 00:00:00','Shipped','NULL',166),(10289,'2004-09-03 00:00:00','2004-09-13 00:00:00','04-09-2004 00:00:00','Shipped','We need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.',167),(10290,'2004-09-07 00:00:00','2004-09-15 00:00:00','13-09-2004 00:00:00','Shipped','NULL',198),(10291,'2004-09-08 00:00:00','2004-09-17 00:00:00','14-09-2004 00:00:00','Shipped','NULL',448),(10292,'2004-09-08 00:00:00','2004-09-18 00:00:00','11-09-2004 00:00:00','Shipped','They want to reevaluate their terms agreement with Finance.',131),(10293,'2004-09-09 00:00:00','2004-09-18 00:00:00','14-09-2004 00:00:00','Shipped','NULL',249),(10294,'2004-09-10 00:00:00','2004-09-17 00:00:00','14-09-2004 00:00:00','Shipped','NULL',204),(10295,'2004-09-10 00:00:00','2004-09-17 00:00:00','14-09-2004 00:00:00','Shipped','They want to reevaluate their terms agreement with Finance.',362),(10296,'2004-09-15 00:00:00','2004-09-22 00:00:00','16-09-2004 00:00:00','Shipped','NULL',415),(10297,'2004-09-16 00:00:00','2004-09-22 00:00:00','21-09-2004 00:00:00','Shipped','We must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.',189),(10298,'2004-09-27 00:00:00','2004-10-05 00:00:00','01-10-2004 00:00:00','Shipped','NULL',103),(10299,'2004-09-30 00:00:00','2004-10-10 00:00:00','01-10-2004 00:00:00','Shipped','NULL',186),(10300,'2003-10-04 00:00:00','2003-10-13 00:00:00','09-10-2003 00:00:00','Shipped','NULL',128),(10301,'2003-10-05 00:00:00','2003-10-15 00:00:00','08-10-2003 00:00:00','Shipped','NULL',299),(10302,'2003-10-06 00:00:00','2003-10-16 00:00:00','07-10-2003 00:00:00','Shipped','NULL',201),(10303,'2004-10-06 00:00:00','2004-10-14 00:00:00','09-10-2004 00:00:00','Shipped','Customer inquired about remote controlled models and gold models.',484),(10304,'2004-10-11 00:00:00','2004-10-20 00:00:00','17-10-2004 00:00:00','Shipped','NULL',256),(10305,'2004-10-13 00:00:00','2004-10-22 00:00:00','15-10-2004 00:00:00','Shipped','Check on availability.',286),(10306,'2004-10-14 00:00:00','2004-10-21 00:00:00','17-10-2004 00:00:00','Shipped','NULL',187),(10307,'2004-10-14 00:00:00','2004-10-23 00:00:00','20-10-2004 00:00:00','Shipped','NULL',339),(10308,'2004-10-15 00:00:00','2004-10-24 00:00:00','20-10-2004 00:00:00','Shipped','Customer requested that FedEx Ground is used for this shipping',319),(10309,'2004-10-15 00:00:00','2004-10-24 00:00:00','18-10-2004 00:00:00','Shipped','NULL',121),(10310,'2004-10-16 00:00:00','2004-10-24 00:00:00','18-10-2004 00:00:00','Shipped','NULL',259),(10311,'2004-10-16 00:00:00','2004-10-23 00:00:00','20-10-2004 00:00:00','Shipped','Difficult to negotiate with customer. We need more marketing materials',141),(10312,'2004-10-21 00:00:00','2004-10-27 00:00:00','23-10-2004 00:00:00','Shipped','NULL',124),(10313,'2004-10-22 00:00:00','2004-10-28 00:00:00','25-10-2004 00:00:00','Shipped','Customer requested that FedEx Ground is used for this shipping',202),(10314,'2004-10-22 00:00:00','2004-11-01 00:00:00','23-10-2004 00:00:00','Shipped','NULL',227),(10315,'2004-10-29 00:00:00','2004-11-08 00:00:00','30-10-2004 00:00:00','Shipped','NULL',119),(10316,'2004-11-01 00:00:00','2004-11-09 00:00:00','07-11-2004 00:00:00','Shipped','Customer requested that ad materials (such as posters, pamphlets) be included in the shippment',240),(10317,'2004-11-02 00:00:00','2004-11-12 00:00:00','08-11-2004 00:00:00','Shipped','NULL',161),(10318,'2004-11-02 00:00:00','2004-11-09 00:00:00','07-11-2004 00:00:00','Shipped','NULL',157),(10319,'2004-11-03 00:00:00','2004-11-11 00:00:00','06-11-2004 00:00:00','Shipped','Customer requested that DHL is used for this shipping',456),(10320,'2004-11-03 00:00:00','2004-11-13 00:00:00','07-11-2004 00:00:00','Shipped','NULL',144),(10321,'2004-11-04 00:00:00','2004-11-12 00:00:00','07-11-2004 00:00:00','Shipped','NULL',462),(10322,'2004-11-04 00:00:00','2004-11-12 00:00:00','10-11-2004 00:00:00','Shipped','Customer has worked with some of our vendors in the past and is aware of their MSRP',363),(10323,'2004-11-05 00:00:00','2004-11-12 00:00:00','09-11-2004 00:00:00','Shipped','NULL',128),(10324,'2004-11-05 00:00:00','2004-11-11 00:00:00','08-11-2004 00:00:00','Shipped','NULL',181),(10325,'2004-11-05 00:00:00','2004-11-13 00:00:00','08-11-2004 00:00:00','Shipped','NULL',121),(10326,'2004-11-09 00:00:00','2004-11-16 00:00:00','10-11-2004 00:00:00','Shipped','NULL',144),(10327,'2004-11-10 00:00:00','2004-11-19 00:00:00','13-11-2004 00:00:00','Resolved','Order was disputed and resolved on 12/1/04. The Sales Manager was involved. Customer claims the scales of the models don\'t match what was discussed.',145),(10328,'2004-11-12 00:00:00','2004-11-21 00:00:00','18-11-2004 00:00:00','Shipped','Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch',278),(10329,'2004-11-15 00:00:00','2004-11-24 00:00:00','16-11-2004 00:00:00','Shipped','NULL',131),(10330,'2004-11-16 00:00:00','2004-11-25 00:00:00','21-11-2004 00:00:00','Shipped','NULL',385),(10331,'2004-11-17 00:00:00','2004-11-23 00:00:00','23-11-2004 00:00:00','Shipped','Customer requested special shippment. The instructions were passed along to the warehouse',486),(10332,'2004-11-17 00:00:00','2004-11-25 00:00:00','18-11-2004 00:00:00','Shipped','NULL',187),(10333,'2004-11-18 00:00:00','2004-11-27 00:00:00','20-11-2004 00:00:00','Shipped','NULL',129),(10334,'2004-11-19 00:00:00','2004-11-28 00:00:00','NULL','On Hold','The outstaniding balance for this customer exceeds their credit limit. Order will be shipped when a payment is received.',144),(10335,'2004-11-19 00:00:00','2004-11-29 00:00:00','23-11-2004 00:00:00','Shipped','NULL',124),(10336,'2004-11-20 00:00:00','2004-11-26 00:00:00','24-11-2004 00:00:00','Shipped','Customer requested that DHL is used for this shipping',172),(10337,'2004-11-21 00:00:00','2004-11-30 00:00:00','26-11-2004 00:00:00','Shipped','NULL',424),(10338,'2004-11-22 00:00:00','2004-12-02 00:00:00','27-11-2004 00:00:00','Shipped','NULL',381),(10339,'2004-11-23 00:00:00','2004-11-30 00:00:00','30-11-2004 00:00:00','Shipped','NULL',398),(10340,'2004-11-24 00:00:00','2004-12-01 00:00:00','25-11-2004 00:00:00','Shipped','Customer is interested in buying more Ferrari models',216),(10341,'2004-11-24 00:00:00','2004-12-01 00:00:00','29-11-2004 00:00:00','Shipped','NULL',382),(10342,'2004-11-24 00:00:00','2004-12-01 00:00:00','29-11-2004 00:00:00','Shipped','NULL',114),(10343,'2004-11-24 00:00:00','2004-12-01 00:00:00','26-11-2004 00:00:00','Shipped','NULL',353),(10344,'2004-11-25 00:00:00','2004-12-02 00:00:00','29-11-2004 00:00:00','Shipped','NULL',350),(10345,'2004-11-25 00:00:00','2004-12-01 00:00:00','26-11-2004 00:00:00','Shipped','NULL',103),(10346,'2004-11-29 00:00:00','2004-12-05 00:00:00','30-11-2004 00:00:00','Shipped','NULL',112),(10347,'2004-11-29 00:00:00','2004-12-07 00:00:00','30-11-2004 00:00:00','Shipped','Can we deliver the new Ford Mustang models by end-of-quarter?',114),(10348,'2004-11-01 00:00:00','2004-11-08 00:00:00','05-11-2004 00:00:00','Shipped','NULL',458),(10349,'2004-12-01 00:00:00','2004-12-07 00:00:00','03-12-2004 00:00:00','Shipped','NULL',151),(10350,'2004-12-02 00:00:00','2004-12-08 00:00:00','05-12-2004 00:00:00','Shipped','NULL',141),(10351,'2004-12-03 00:00:00','2004-12-11 00:00:00','07-12-2004 00:00:00','Shipped','NULL',324),(10352,'2004-12-03 00:00:00','2004-12-12 00:00:00','09-12-2004 00:00:00','Shipped','NULL',198),(10353,'2004-12-04 00:00:00','2004-12-11 00:00:00','05-12-2004 00:00:00','Shipped','NULL',447),(10354,'2004-12-04 00:00:00','2004-12-10 00:00:00','05-12-2004 00:00:00','Shipped','NULL',323),(10355,'2004-12-07 00:00:00','2004-12-14 00:00:00','13-12-2004 00:00:00','Shipped','NULL',141),(10356,'2004-12-09 00:00:00','2004-12-15 00:00:00','12-12-2004 00:00:00','Shipped','NULL',250),(10357,'2004-12-10 00:00:00','2004-12-16 00:00:00','14-12-2004 00:00:00','Shipped','NULL',124),(10358,'2004-12-10 00:00:00','2004-12-16 00:00:00','16-12-2004 00:00:00','Shipped','Customer requested that DHL is used for this shipping',141),(10359,'2004-12-15 00:00:00','2004-12-23 00:00:00','18-12-2004 00:00:00','Shipped','NULL',353),(10360,'2004-12-16 00:00:00','2004-12-22 00:00:00','18-12-2004 00:00:00','Shipped','NULL',496),(10361,'2004-12-17 00:00:00','2004-12-24 00:00:00','20-12-2004 00:00:00','Shipped','NULL',282),(10362,'2005-01-05 00:00:00','2005-01-16 00:00:00','10-01-2005 00:00:00','Shipped','NULL',161),(10363,'2005-01-06 00:00:00','2005-01-12 00:00:00','10-01-2005 00:00:00','Shipped','NULL',334),(10364,'2005-01-06 00:00:00','2005-01-17 00:00:00','09-01-2005 00:00:00','Shipped','NULL',350),(10365,'2005-01-07 00:00:00','2005-01-18 00:00:00','11-01-2005 00:00:00','Shipped','NULL',320),(10366,'2005-01-10 00:00:00','2005-01-19 00:00:00','12-01-2005 00:00:00','Shipped','NULL',381),(10367,'2005-01-12 00:00:00','2005-01-21 00:00:00','16-01-2005 00:00:00','Resolved','This order was disputed and resolved on 2/1/2005. Customer claimed that container with shipment was damaged. FedEx\'s investigation proved this wrong.',205),(10368,'2005-01-19 00:00:00','2005-01-27 00:00:00','24-01-2005 00:00:00','Shipped','Can we renegotiate this one?',124),(10369,'2005-01-20 00:00:00','2005-01-28 00:00:00','24-01-2005 00:00:00','Shipped','NULL',379),(10370,'2005-01-20 00:00:00','2005-02-01 00:00:00','25-01-2005 00:00:00','Shipped','NULL',276),(10371,'2005-01-23 00:00:00','2005-02-03 00:00:00','25-01-2005 00:00:00','Shipped','NULL',124),(10372,'2005-01-26 00:00:00','2005-02-05 00:00:00','28-01-2005 00:00:00','Shipped','NULL',398),(10373,'2005-01-31 00:00:00','2005-02-08 00:00:00','06-02-2005 00:00:00','Shipped','NULL',311),(10374,'2005-02-02 00:00:00','2005-02-09 00:00:00','03-02-2005 00:00:00','Shipped','NULL',333),(10375,'2005-02-03 00:00:00','2005-02-10 00:00:00','06-02-2005 00:00:00','Shipped','NULL',119),(10376,'2005-02-08 00:00:00','2005-02-18 00:00:00','13-02-2005 00:00:00','Shipped','NULL',219),(10377,'2005-02-09 00:00:00','2005-02-21 00:00:00','12-02-2005 00:00:00','Shipped','Cautious optimism. We have happy customers here, if we can keep them well stocked.',186),(10378,'2005-02-10 00:00:00','2005-02-18 00:00:00','11-02-2005 00:00:00','Shipped','NULL',141),(10379,'2005-02-10 00:00:00','2005-02-18 00:00:00','11-02-2005 00:00:00','Shipped','NULL',141),(10380,'2005-02-16 00:00:00','2005-02-24 00:00:00','18-02-2005 00:00:00','Shipped','NULL',141),(10381,'2005-02-17 00:00:00','2005-02-25 00:00:00','18-02-2005 00:00:00','Shipped','NULL',321),(10382,'2005-02-17 00:00:00','2005-02-23 00:00:00','18-02-2005 00:00:00','Shipped','Custom shipping instructions sent to warehouse',124),(10383,'2005-02-22 00:00:00','2005-03-02 00:00:00','25-02-2005 00:00:00','Shipped','NULL',141),(10384,'2005-02-23 00:00:00','2005-03-06 00:00:00','27-02-2005 00:00:00','Shipped','NULL',321),(10385,'2005-02-28 00:00:00','2005-03-09 00:00:00','01-03-2005 00:00:00','Shipped','NULL',124),(10386,'2005-03-01 00:00:00','2005-03-09 00:00:00','06-03-2005 00:00:00','Resolved','Disputed then Resolved on 3/15/2005. Customer doesn\'t like the craftsmaship of the models.',141),(10387,'2005-03-02 00:00:00','2005-03-09 00:00:00','06-03-2005 00:00:00','Shipped','We need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.',148),(10388,'2005-03-03 00:00:00','2005-03-11 00:00:00','09-03-2005 00:00:00','Shipped','NULL',462),(10389,'2005-03-03 00:00:00','2005-03-09 00:00:00','08-03-2005 00:00:00','Shipped','NULL',448),(10390,'2005-03-04 00:00:00','2005-03-11 00:00:00','07-03-2005 00:00:00','Shipped','They want to reevaluate their terms agreement with Finance.',124),(10391,'2005-03-09 00:00:00','2005-03-20 00:00:00','15-03-2005 00:00:00','Shipped','NULL',276),(10392,'2005-03-10 00:00:00','2005-03-18 00:00:00','12-03-2005 00:00:00','Shipped','NULL',452),(10393,'2005-03-11 00:00:00','2005-03-22 00:00:00','14-03-2005 00:00:00','Shipped','They want to reevaluate their terms agreement with Finance.',323),(10394,'2005-03-15 00:00:00','2005-03-25 00:00:00','19-03-2005 00:00:00','Shipped','NULL',141),(10395,'2005-03-17 00:00:00','2005-03-24 00:00:00','23-03-2005 00:00:00','Shipped','We must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.',250),(10396,'2005-03-23 00:00:00','2005-04-02 00:00:00','28-03-2005 00:00:00','Shipped','NULL',124),(10397,'2005-03-28 00:00:00','2005-04-09 00:00:00','01-04-2005 00:00:00','Shipped','NULL',242),(10398,'2005-03-30 00:00:00','2005-04-09 00:00:00','31-03-2005 00:00:00','Shipped','NULL',353),(10399,'2005-04-01 00:00:00','2005-04-12 00:00:00','03-04-2005 00:00:00','Shipped','NULL',496),(10400,'2005-04-01 00:00:00','2005-04-11 00:00:00','04-04-2005 00:00:00','Shipped','Customer requested that DHL is used for this shipping',450),(10401,'2005-04-03 00:00:00','2005-04-14 00:00:00','NULL','On Hold','Customer credit limit exceeded. Will ship when a payment is received.',328),(10402,'2005-04-07 00:00:00','2005-04-14 00:00:00','12-04-2005 00:00:00','Shipped','NULL',406),(10403,'2005-04-08 00:00:00','2005-04-18 00:00:00','11-04-2005 00:00:00','Shipped','NULL',201),(10404,'2005-04-08 00:00:00','2005-04-14 00:00:00','11-04-2005 00:00:00','Shipped','NULL',323),(10405,'2005-04-14 00:00:00','2005-04-24 00:00:00','20-04-2005 00:00:00','Shipped','NULL',209),(10406,'2005-04-15 00:00:00','2005-04-25 00:00:00','21-04-2005 00:00:00','Disputed','Customer claims container with shipment was damaged during shipping and some items were missing.',145),(10407,'2005-04-22 00:00:00','2005-05-04 00:00:00','NULL','On Hold','Customer credit limit exceeded. Will ship when a payment is received.',450),(10408,'2005-04-22 00:00:00','2005-04-29 00:00:00','27-04-2005 00:00:00','Shipped','NULL',398),(10409,'2005-04-23 00:00:00','2005-05-05 00:00:00','24-04-2005 00:00:00','Shipped','NULL',166),(10410,'2005-04-29 00:00:00','2005-05-10 00:00:00','30-04-2005 00:00:00','Shipped','NULL',357),(10411,'2005-05-01 00:00:00','2005-05-08 00:00:00','06-05-2005 00:00:00','Shipped','NULL',233),(10412,'2005-05-03 00:00:00','2005-05-13 00:00:00','05-05-2005 00:00:00','Shipped','NULL',141),(10413,'2005-05-05 00:00:00','2005-05-14 00:00:00','09-05-2005 00:00:00','Shipped','Customer requested that DHL is used for this shipping',175),(10414,'2005-05-06 00:00:00','2005-05-13 00:00:00','NULL','On Hold','Customer credit limit exceeded. Will ship when a payment is received.',362),(10415,'2005-05-09 00:00:00','2005-05-20 00:00:00','12-05-2005 00:00:00','Disputed','Customer claims the scales of the models don\'t match what was discussed.',471),(10416,'2005-05-10 00:00:00','2005-05-16 00:00:00','14-05-2005 00:00:00','Shipped','NULL',386),(10417,'2005-05-13 00:00:00','2005-05-19 00:00:00','19-05-2005 00:00:00','Disputed','Customer doesn\'t like the colors and precision of the models.',141),(10418,'2005-05-16 00:00:00','2005-05-24 00:00:00','20-05-2005 00:00:00','Shipped','NULL',412),(10419,'2005-05-17 00:00:00','2005-05-28 00:00:00','19-05-2005 00:00:00','Shipped','NULL',382),(10420,'2005-05-29 00:00:00','2005-06-07 00:00:00','NULL','In Process','NULL',282),(10421,'2005-05-29 00:00:00','2005-06-06 00:00:00','NULL','In Process','Custom shipping instructions were sent to warehouse',124),(10422,'2005-05-30 00:00:00','2005-06-11 00:00:00','NULL','In Process','NULL',157),(10423,'2005-05-30 00:00:00','2005-06-05 00:00:00','NULL','In Process','NULL',314),(10424,'2005-05-31 00:00:00','2005-06-08 00:00:00','NULL','In Process','NULL',141),(10425,'2005-05-31 00:00:00','2005-06-07 00:00:00','NULL','In Process','NULL',119);

select * from orders;


-- Create `orderdetails` table.
DROP TABLE IF EXISTS `orderdetails`;

CREATE TABLE `orderdetails` (
  `orderNumber` int NOT NULL,
  `productCode` varchar(12) NOT NULL,
  `quantityOrdered` varchar(11) NOT NULL,
  `priceEach` decimal(12,2) DEFAULT NULL,
  `orderLineNumber` int NOT NULL,
  PRIMARY KEY (`orderNumber`,`productCode`)
);

-- Dump the data in `orderdetails`

INSERT INTO `orderdetails` VALUES (10100,'S18_1749',30,136.00,3),(10100,'S18_2248',50,55.09,2),(10100,'S18_4409',22,75.46,4),(10100,'S24_3969',49,35.29,1),(10101,'S18_2325',25,108.06,4),(10101,'S18_2795',26,167.06,1),(10101,'S24_1937',45,32.53,3),(10101,'S24_2022',46,44.35,2),(10102,'S18_1342',39,95.55,2),(10102,'S18_1367',41,43.13,1),(10103,'S10_1949',26,214.30,11),(10103,'S10_4962',42,119.67,4),(10103,'S12_1666',27,121.64,8),(10103,'S18_1097',35,94.50,10),(10103,'S18_2432',22,58.34,2),(10103,'S18_2949',27,92.19,12),(10103,'S18_2957',35,61.84,14),(10103,'S18_3136',25,86.92,13),(10103,'S18_3320',46,86.31,16),(10103,'S18_4600',36,98.07,5),(10103,'S18_4668',41,40.75,9),(10103,'S24_2300',36,107.34,1),(10103,'S24_4258',25,88.62,15),(10103,'S32_1268',31,92.46,3),(10103,'S32_3522',45,63.35,7),(10103,'S700_2824',42,94.07,6),(10104,'S12_3148',34,131.44,1),(10104,'S12_4473',41,111.39,9),(10104,'S18_2238',24,135.90,8),(10104,'S18_2319',29,122.73,12),(10104,'S18_3232',23,165.95,13),(10104,'S18_4027',38,119.20,3),(10104,'S24_1444',35,52.02,6),(10104,'S24_2840',44,30.41,10),(10104,'S24_4048',26,106.45,5),(10104,'S32_2509',35,51.95,11),(10104,'S32_3207',49,56.55,4),(10104,'S50_1392',33,114.59,7),(10104,'S50_1514',32,53.31,2),(10105,'S10_4757',50,127.84,2),(10105,'S12_1108',41,205.72,15),(10105,'S12_3891',29,141.88,14),(10105,'S18_3140',22,136.59,11),(10105,'S18_3259',38,87.73,13),(10105,'S18_4522',41,75.48,10),(10105,'S24_2011',43,117.97,9),(10105,'S24_3151',44,73.46,4),(10105,'S24_3816',50,75.47,1),(10105,'S700_1138',41,54.00,5),(10105,'S700_1938',29,86.61,12),(10105,'S700_2610',31,60.72,3),(10105,'S700_3505',39,92.16,6),(10105,'S700_3962',22,99.31,7),(10105,'S72_3212',25,44.77,8),(10106,'S18_1662',36,134.04,12),(10106,'S18_2581',34,81.10,2),(10106,'S18_3029',41,80.86,18),(10106,'S18_3856',41,94.22,17),(10106,'S24_1785',28,107.23,4),(10106,'S24_2841',49,65.77,13),(10106,'S24_3420',31,55.89,14),(10106,'S24_3949',50,55.96,11),(10106,'S24_4278',26,71.00,3),(10106,'S32_4289',33,65.35,5),(10106,'S50_1341',39,35.78,6),(10106,'S700_1691',31,91.34,7),(10106,'S700_2047',30,85.09,16),(10106,'S700_2466',34,99.72,9),(10106,'S700_2834',32,113.90,1),(10106,'S700_3167',44,76.00,8),(10106,'S700_4002',48,70.33,10),(10106,'S72_1253',48,43.70,15),(10107,'S10_1678',30,81.35,2),(10107,'S10_2016',39,105.86,5),(10107,'S10_4698',27,172.36,4),(10107,'S12_2823',21,122.00,1),(10107,'S18_2625',29,52.70,6),(10107,'S24_1578',25,96.92,3),(10107,'S24_2000',38,73.12,7),(10107,'S32_1374',20,88.90,8),(10108,'S12_1099',33,165.38,6),(10108,'S12_3380',45,96.30,4),(10108,'S12_3990',39,75.81,7),(10108,'S12_4675',36,107.10,3),(10108,'S18_1889',38,67.76,2),(10108,'S18_3278',26,73.17,9),(10108,'S18_3482',29,132.29,8),(10108,'S18_3782',43,52.84,12),(10108,'S18_4721',44,139.87,11),(10108,'S24_2360',35,64.41,15),(10108,'S24_3371',30,60.01,5),(10108,'S24_3856',40,132.00,1),(10108,'S24_4620',31,67.10,10),(10108,'S32_2206',27,36.21,13),(10108,'S32_4485',31,87.76,16),(10108,'S50_4713',34,74.85,14),(10109,'S18_1129',26,117.48,4),(10109,'S18_1984',38,137.98,3),(10109,'S18_2870',26,126.72,1),(10109,'S18_3232',46,160.87,5),(10109,'S18_3685',47,125.74,2),(10109,'S24_2972',29,32.10,6),(10110,'S18_1589',37,118.22,16),(10110,'S18_1749',42,153.00,7),(10110,'S18_2248',32,51.46,6),(10110,'S18_2325',33,115.69,4),(10110,'S18_2795',31,163.69,1),(10110,'S18_4409',28,81.91,8),(10110,'S18_4933',42,62.00,9),(10110,'S24_1046',36,72.02,13),(10110,'S24_1628',29,43.27,15),(10110,'S24_1937',20,28.88,3),(10110,'S24_2022',39,40.77,2),(10110,'S24_2766',43,82.69,11),(10110,'S24_2887',46,112.74,10),(10110,'S24_3191',27,80.47,12),(10110,'S24_3432',37,96.37,14),(10110,'S24_3969',48,35.29,5),(10111,'S18_1342',33,87.33,6),(10111,'S18_1367',48,48.52,5),(10111,'S18_2957',28,53.09,2),(10111,'S18_3136',43,94.25,1),(10111,'S18_3320',39,91.27,4),(10111,'S24_4258',26,85.70,3),(10112,'S10_1949',29,197.16,1),(10112,'S18_2949',23,85.10,2),(10113,'S12_1666',21,121.64,2),(10113,'S18_1097',49,101.50,4),(10113,'S18_4668',50,43.27,3),(10113,'S32_3522',23,58.82,1),(10114,'S10_4962',31,128.53,8),(10114,'S18_2319',39,106.78,3),(10114,'S18_2432',45,53.48,6),(10114,'S18_3232',48,169.34,4),(10114,'S18_4600',41,105.34,9),(10114,'S24_2300',21,102.23,5),(10114,'S24_2840',24,28.64,1),(10114,'S32_1268',32,88.61,7),(10114,'S32_2509',28,43.83,2),(10114,'S700_2824',42,82.94,10),(10115,'S12_4473',46,111.39,5),(10115,'S18_2238',46,140.81,4),(10115,'S24_1444',47,56.64,2),(10115,'S24_4048',44,106.45,1),(10115,'S50_1392',27,100.70,3),(10116,'S32_3207',27,60.28,1),(10117,'S12_1108',33,195.33,9),(10117,'S12_3148',43,148.06,10),(10117,'S12_3891',39,173.02,8),(10117,'S18_3140',26,121.57,5),(10117,'S18_3259',21,81.68,7),(10117,'S18_4027',22,122.08,12),(10117,'S18_4522',23,73.73,4),(10117,'S24_2011',41,119.20,3),(10117,'S50_1514',21,55.65,11),(10117,'S700_1938',38,75.35,6),(10117,'S700_3962',45,89.38,1),(10117,'S72_3212',50,52.42,2),(10118,'S700_3505',36,86.15,1),(10119,'S10_4757',46,112.88,11),(10119,'S18_1662',43,151.38,3),(10119,'S18_3029',21,74.84,9),(10119,'S18_3856',27,95.28,8),(10119,'S24_2841',41,64.40,4),(10119,'S24_3151',35,72.58,13),(10119,'S24_3420',20,63.12,5),(10119,'S24_3816',35,82.18,10),(10119,'S24_3949',28,62.10,2),(10119,'S700_1138',25,57.34,14),(10119,'S700_2047',29,74.23,7),(10119,'S700_2610',38,67.22,12),(10119,'S700_4002',26,63.67,1),(10119,'S72_1253',28,40.22,6),(10120,'S10_2016',29,118.94,3),(10120,'S10_4698',46,158.80,2),(10120,'S18_2581',29,82.79,8),(10120,'S18_2625',46,57.54,4),(10120,'S24_1578',35,110.45,1),(10120,'S24_1785',39,93.01,10),(10120,'S24_2000',34,72.36,5),(10120,'S24_4278',29,71.73,9),(10120,'S32_1374',22,94.90,6),(10120,'S32_4289',29,68.79,11),(10120,'S50_1341',49,41.46,12),(10120,'S700_1691',47,91.34,13),(10120,'S700_2466',24,81.77,15),(10120,'S700_2834',24,106.79,7),(10120,'S700_3167',43,72.00,14),(10121,'S10_1678',34,86.13,5),(10121,'S12_2823',50,126.52,4),(10121,'S24_2360',32,58.18,2),(10121,'S32_4485',25,95.93,3),(10121,'S50_4713',44,72.41,1),(10122,'S12_1099',42,155.66,10),(10122,'S12_3380',37,113.92,8),(10122,'S12_3990',32,65.44,11),(10122,'S12_4675',20,104.80,7),(10122,'S18_1129',34,114.65,2),(10122,'S18_1889',43,62.37,6),(10122,'S18_1984',31,113.80,1),(10122,'S18_3232',25,137.17,3),(10122,'S18_3278',21,69.15,13),(10122,'S18_3482',21,133.76,12),(10122,'S18_3782',35,59.06,16),(10122,'S18_4721',28,145.82,15),(10122,'S24_2972',39,34.74,4),(10122,'S24_3371',34,50.82,9),(10122,'S24_3856',43,136.22,5),(10122,'S24_4620',29,67.10,14),(10122,'S32_2206',31,33.79,17),(10123,'S18_1589',26,120.71,2),(10123,'S18_2870',46,114.84,3),(10123,'S18_3685',34,117.26,4),(10123,'S24_1628',50,43.27,1),(10124,'S18_1749',21,153.00,6),(10124,'S18_2248',42,58.12,5),(10124,'S18_2325',42,111.87,3),(10124,'S18_4409',36,75.46,7),(10124,'S18_4933',23,66.28,8),(10124,'S24_1046',22,62.47,12),(10124,'S24_1937',45,30.53,2),(10124,'S24_2022',22,36.29,1),(10124,'S24_2766',32,74.51,10),(10124,'S24_2887',25,93.95,9),(10124,'S24_3191',49,76.19,11),(10124,'S24_3432',43,101.73,13),(10124,'S24_3969',46,36.11,4),(10125,'S18_1342',32,89.38,1),(10125,'S18_2795',34,138.38,2),(10126,'S10_1949',38,205.73,11),(10126,'S10_4962',22,122.62,4),(10126,'S12_1666',21,135.30,8),(10126,'S18_1097',38,116.67,10),(10126,'S18_1367',42,51.21,17),(10126,'S18_2432',43,51.05,2),(10126,'S18_2949',31,93.21,12),(10126,'S18_2957',46,61.84,14),(10126,'S18_3136',30,93.20,13),(10126,'S18_3320',38,94.25,16),(10126,'S18_4600',50,102.92,5),(10126,'S18_4668',43,47.29,9),(10126,'S24_2300',27,122.68,1),(10126,'S24_4258',34,83.76,15),(10126,'S32_1268',43,82.83,3),(10126,'S32_3522',26,62.05,7),(10126,'S700_2824',45,97.10,6),(10127,'S12_1108',46,193.25,2),(10127,'S12_3148',46,140.50,3),(10127,'S12_3891',42,169.56,1),(10127,'S12_4473',24,100.73,11),(10127,'S18_2238',45,140.81,10),(10127,'S18_2319',45,114.14,14),(10127,'S18_3232',22,149.02,15),(10127,'S18_4027',25,126.39,5),(10127,'S24_1444',20,50.86,8),(10127,'S24_2840',39,34.30,12),(10127,'S24_4048',20,107.63,7),(10127,'S32_2509',45,46.53,13),(10127,'S32_3207',29,60.90,6),(10127,'S50_1392',46,111.12,9),(10127,'S50_1514',46,55.65,4),(10128,'S18_3140',41,120.20,2),(10128,'S18_3259',41,80.67,4),(10128,'S18_4522',43,77.24,1),(10128,'S700_1938',32,72.75,3),(10129,'S10_4757',33,123.76,2),(10129,'S24_2011',45,113.06,9),(10129,'S24_3151',41,81.43,4),(10129,'S24_3816',50,76.31,1),(10129,'S700_1138',31,58.67,5),(10129,'S700_2610',45,72.28,3),(10129,'S700_3505',42,90.15,6),(10129,'S700_3962',30,94.34,7),(10129,'S72_3212',32,44.23,8),(10130,'S18_3029',40,68.82,2),(10130,'S18_3856',33,99.52,1),(10131,'S18_1662',21,141.92,4),(10131,'S24_2841',35,60.97,5),(10131,'S24_3420',29,52.60,6),(10131,'S24_3949',50,54.59,3),(10131,'S700_2047',22,76.94,8),(10131,'S700_2466',40,86.76,1),(10131,'S700_4002',26,63.67,2),(10131,'S72_1253',21,40.22,7),(10132,'S700_3167',36,80.00,1),(10133,'S18_2581',49,80.26,3),(10133,'S24_1785',41,109.42,5),(10133,'S24_4278',46,61.58,4),(10133,'S32_1374',23,80.91,1),(10133,'S32_4289',49,67.41,6),(10133,'S50_1341',27,37.09,7),(10133,'S700_1691',24,76.73,8),(10133,'S700_2834',27,115.09,2),(10134,'S10_1678',41,90.92,2),(10134,'S10_2016',27,116.56,5),(10134,'S10_4698',31,187.85,4),(10134,'S12_2823',20,131.04,1),(10134,'S18_2625',30,51.48,6),(10134,'S24_1578',35,94.67,3),(10134,'S24_2000',43,75.41,7),(10135,'S12_1099',42,173.17,7),(10135,'S12_3380',48,110.39,5),(10135,'S12_3990',24,72.62,8),(10135,'S12_4675',29,103.64,4),(10135,'S18_1889',48,66.99,3),(10135,'S18_3278',45,65.94,10),(10135,'S18_3482',42,139.64,9),(10135,'S18_3782',45,49.74,13),(10135,'S18_4721',31,133.92,12),(10135,'S24_2360',29,67.18,16),(10135,'S24_2972',20,34.36,1),(10135,'S24_3371',27,52.05,6),(10135,'S24_3856',47,139.03,2),(10135,'S24_4620',23,76.80,11),(10135,'S32_2206',33,38.62,14),(10135,'S32_4485',30,91.85,17),(10135,'S50_4713',44,78.92,15),(10136,'S18_1129',25,117.48,2),(10136,'S18_1984',36,120.91,1),(10136,'S18_3232',41,169.34,3),(10137,'S18_1589',44,115.73,2),(10137,'S18_2870',37,110.88,3),(10137,'S18_3685',31,118.68,4),(10137,'S24_1628',26,40.25,1),(10138,'S18_1749',33,149.60,6),(10138,'S18_2248',22,51.46,5),(10138,'S18_2325',38,114.42,3),(10138,'S18_4409',47,79.15,7),(10138,'S18_4933',23,64.86,8),(10138,'S24_1046',45,59.53,12),(10138,'S24_1937',22,33.19,2),(10138,'S24_2022',33,38.53,1),(10138,'S24_2766',28,73.60,10),(10138,'S24_2887',30,96.30,9),(10138,'S24_3191',49,77.05,11),(10138,'S24_3432',21,99.58,13),(10138,'S24_3969',29,32.82,4),(10139,'S18_1342',31,89.38,7),(10139,'S18_1367',49,52.83,6),(10139,'S18_2795',41,151.88,8),(10139,'S18_2949',46,91.18,1),(10139,'S18_2957',20,52.47,3),(10139,'S18_3136',20,101.58,2),(10139,'S18_3320',30,81.35,5),(10139,'S24_4258',29,93.49,4),(10140,'S10_1949',37,186.44,11),(10140,'S10_4962',26,131.49,4),(10140,'S12_1666',38,118.90,8),(10140,'S18_1097',32,95.67,10),(10140,'S18_2432',46,51.05,2),(10140,'S18_4600',40,100.50,5),(10140,'S18_4668',29,40.25,9),(10140,'S24_2300',47,118.84,1),(10140,'S32_1268',26,87.64,3),(10140,'S32_3522',28,62.05,7),(10140,'S700_2824',36,101.15,6),(10141,'S12_4473',21,114.95,5),(10141,'S18_2238',39,160.46,4),(10141,'S18_2319',47,103.09,8),(10141,'S18_3232',34,143.94,9),(10141,'S24_1444',20,50.86,2),(10141,'S24_2840',21,32.18,6),(10141,'S24_4048',40,104.09,1),(10141,'S32_2509',24,53.03,7),(10141,'S50_1392',44,94.92,3),(10142,'S12_1108',33,166.24,12),(10142,'S12_3148',33,140.50,13),(10142,'S12_3891',46,167.83,11),(10142,'S18_3140',47,129.76,8),(10142,'S18_3259',22,95.80,10),(10142,'S18_4027',24,122.08,15),(10142,'S18_4522',24,79.87,7),(10142,'S24_2011',33,114.29,6),(10142,'S24_3151',49,74.35,1),(10142,'S32_3207',42,60.90,16),(10142,'S50_1514',42,56.24,14),(10142,'S700_1138',41,55.34,2),(10142,'S700_1938',43,77.08,9),(10142,'S700_3505',21,92.16,3),(10142,'S700_3962',38,91.37,4),(10142,'S72_3212',39,46.96,5),(10143,'S10_4757',49,133.28,15),(10143,'S18_1662',32,126.15,7),(10143,'S18_3029',46,70.54,13),(10143,'S18_3856',34,99.52,12),(10143,'S24_2841',27,63.71,8),(10143,'S24_3420',33,59.83,9),(10143,'S24_3816',23,74.64,14),(10143,'S24_3949',28,55.96,6),(10143,'S50_1341',34,34.91,1),(10143,'S700_1691',36,86.77,2),(10143,'S700_2047',26,87.80,11),(10143,'S700_2466',26,79.78,4),(10143,'S700_2610',31,69.39,16),(10143,'S700_3167',28,70.40,3),(10143,'S700_4002',34,65.15,5),(10143,'S72_1253',37,49.66,10),(10144,'S32_4289',20,56.41,1),(10145,'S10_1678',45,76.56,6),(10145,'S10_2016',37,104.67,9),(10145,'S10_4698',33,154.93,8),(10145,'S12_2823',49,146.10,5),(10145,'S18_2581',30,71.81,14),(10145,'S18_2625',30,52.70,10),(10145,'S24_1578',43,103.68,7),(10145,'S24_1785',40,87.54,16),(10145,'S24_2000',47,63.98,11),(10145,'S24_2360',27,56.10,3),(10145,'S24_4278',33,71.73,15),(10145,'S32_1374',33,99.89,12),(10145,'S32_2206',31,39.43,1),(10145,'S32_4485',27,95.93,4),(10145,'S50_4713',38,73.22,2),(10145,'S700_2834',20,113.90,13),(10146,'S18_3782',47,60.30,2),(10146,'S18_4721',29,130.94,1),(10147,'S12_1099',48,161.49,7),(10147,'S12_3380',31,110.39,5),(10147,'S12_3990',21,74.21,8),(10147,'S12_4675',33,97.89,4),(10147,'S18_1889',26,70.84,3),(10147,'S18_3278',36,74.78,10),(10147,'S18_3482',37,129.35,9),(10147,'S24_2972',25,33.23,1),(10147,'S24_3371',30,48.98,6),(10147,'S24_3856',23,123.58,2),(10147,'S24_4620',31,72.76,11),(10148,'S18_1129',23,114.65,13),(10148,'S18_1589',47,108.26,9),(10148,'S18_1984',25,136.56,12),(10148,'S18_2870',27,113.52,10),(10148,'S18_3232',32,143.94,14),(10148,'S18_3685',28,135.63,11),(10148,'S18_4409',34,83.75,1),(10148,'S18_4933',29,66.28,2),(10148,'S24_1046',25,65.41,6),(10148,'S24_1628',47,46.29,8),(10148,'S24_2766',21,77.24,4),(10148,'S24_2887',34,115.09,3),(10148,'S24_3191',31,71.91,5),(10148,'S24_3432',27,96.37,7),(10149,'S18_1342',50,87.33,4),(10149,'S18_1367',30,48.52,3),(10149,'S18_1749',34,156.40,11),(10149,'S18_2248',24,50.85,10),(10149,'S18_2325',33,125.86,8),(10149,'S18_2795',23,167.06,5),(10149,'S18_3320',42,89.29,2),(10149,'S24_1937',36,31.20,7),(10149,'S24_2022',49,39.87,6),(10149,'S24_3969',26,38.57,9),(10149,'S24_4258',20,90.57,1),(10150,'S10_1949',45,182.16,8),(10150,'S10_4962',20,121.15,1),(10150,'S12_1666',30,135.30,5),(10150,'S18_1097',34,95.67,7),(10150,'S18_2949',47,93.21,9),(10150,'S18_2957',30,56.21,11),(10150,'S18_3136',26,97.39,10),(10150,'S18_4600',49,111.39,2),(10150,'S18_4668',30,47.29,6),(10150,'S32_3522',49,62.05,4),(10150,'S700_2824',20,95.08,3),(10151,'S12_4473',24,114.95,3),(10151,'S18_2238',43,152.27,2),(10151,'S18_2319',49,106.78,6),(10151,'S18_2432',39,58.34,9),(10151,'S18_3232',21,167.65,7),(10151,'S24_2300',42,109.90,8),(10151,'S24_2840',30,29.35,4),(10151,'S32_1268',27,84.75,10),(10151,'S32_2509',41,43.29,5),(10151,'S50_1392',26,108.81,1),(10152,'S18_4027',35,117.77,1),(10152,'S24_1444',25,49.13,4),(10152,'S24_4048',23,112.37,3),(10152,'S32_3207',33,57.17,2),(10153,'S12_1108',20,201.57,11),(10153,'S12_3148',42,128.42,12),(10153,'S12_3891',49,155.72,10),(10153,'S18_3140',31,125.66,7),(10153,'S18_3259',29,82.69,9),(10153,'S18_4522',22,82.50,6),(10153,'S24_2011',40,111.83,5),(10153,'S50_1514',31,53.31,13),(10153,'S700_1138',43,58.00,1),(10153,'S700_1938',31,80.55,8),(10153,'S700_3505',50,87.15,2),(10153,'S700_3962',20,85.41,3),(10153,'S72_3212',50,51.87,4),(10154,'S24_3151',31,75.23,2),(10154,'S700_2610',36,59.27,1),(10155,'S10_4757',32,129.20,13),(10155,'S18_1662',38,138.77,5),(10155,'S18_3029',44,83.44,11),(10155,'S18_3856',29,105.87,10),(10155,'S24_2841',23,62.34,6),(10155,'S24_3420',34,56.55,7),(10155,'S24_3816',37,76.31,12),(10155,'S24_3949',44,58.69,4),(10155,'S700_2047',32,89.61,9),(10155,'S700_2466',20,87.75,2),(10155,'S700_3167',43,76.80,1),(10155,'S700_4002',44,70.33,3),(10155,'S72_1253',34,49.16,8),(10156,'S50_1341',20,43.64,1),(10156,'S700_1691',48,77.64,2),(10157,'S18_2581',33,69.27,3),(10157,'S24_1785',40,89.72,5),(10157,'S24_4278',33,66.65,4),(10157,'S32_1374',34,83.91,1),(10157,'S32_4289',28,56.41,6),(10157,'S700_2834',48,109.16,2),(10158,'S24_2000',22,67.79,1),(10159,'S10_1678',49,81.35,14),(10159,'S10_2016',37,101.10,17),(10159,'S10_4698',22,170.42,16),(10159,'S12_1099',41,188.73,2),(10159,'S12_2823',38,131.04,13),(10159,'S12_3990',24,67.03,3),(10159,'S18_2625',42,51.48,18),(10159,'S18_3278',21,66.74,5),(10159,'S18_3482',25,129.35,4),(10159,'S18_3782',21,54.71,8),(10159,'S18_4721',32,142.85,7),(10159,'S24_1578',44,100.30,15),(10159,'S24_2360',27,67.18,11),(10159,'S24_3371',50,49.60,1),(10159,'S24_4620',23,80.84,6),(10159,'S32_2206',35,39.43,9),(10159,'S32_4485',23,86.74,12),(10159,'S50_4713',31,78.11,10),(10160,'S12_3380',46,96.30,6),(10160,'S12_4675',50,93.28,5),(10160,'S18_1889',38,70.84,4),(10160,'S18_3232',20,140.55,1),(10160,'S24_2972',42,30.59,2),(10160,'S24_3856',35,130.60,3),(10161,'S18_1129',28,121.72,12),(10161,'S18_1589',43,102.04,8),(10161,'S18_1984',48,139.41,11),(10161,'S18_2870',23,125.40,9),(10161,'S18_3685',36,132.80,10),(10161,'S18_4933',25,62.72,1),(10161,'S24_1046',37,73.49,5),(10161,'S24_1628',23,47.29,7),(10161,'S24_2766',20,82.69,3),(10161,'S24_2887',25,108.04,2),(10161,'S24_3191',20,72.77,4),(10161,'S24_3432',30,94.23,6),(10162,'S18_1342',48,87.33,2),(10162,'S18_1367',45,45.28,1),(10162,'S18_1749',29,141.10,9),(10162,'S18_2248',27,53.28,8),(10162,'S18_2325',38,113.15,6),(10162,'S18_2795',48,156.94,3),(10162,'S18_4409',39,86.51,10),(10162,'S24_1937',37,27.55,5),(10162,'S24_2022',43,38.98,4),(10162,'S24_3969',37,32.82,7),(10163,'S10_1949',21,212.16,1),(10163,'S18_2949',31,101.31,2),(10163,'S18_2957',48,59.96,4),(10163,'S18_3136',40,101.58,3),(10163,'S18_3320',43,80.36,6),(10163,'S24_4258',42,96.42,5),(10164,'S10_4962',21,143.31,2),(10164,'S12_1666',49,121.64,6),(10164,'S18_1097',36,103.84,8),(10164,'S18_4600',45,107.76,3),(10164,'S18_4668',25,46.29,7),(10164,'S32_1268',24,91.49,1),(10164,'S32_3522',49,57.53,5),(10164,'S700_2824',39,86.99,4),(10165,'S12_1108',44,168.32,3),(10165,'S12_3148',34,123.89,4),(10165,'S12_3891',27,152.26,2),(10165,'S12_4473',48,109.02,12),(10165,'S18_2238',29,134.26,11),(10165,'S18_2319',46,120.28,15),(10165,'S18_2432',31,60.77,18),(10165,'S18_3232',47,154.10,16),(10165,'S18_3259',50,84.71,1),(10165,'S18_4027',28,123.51,6),(10165,'S24_1444',25,46.82,9),(10165,'S24_2300',32,117.57,17),(10165,'S24_2840',27,31.12,13),(10165,'S24_4048',24,106.45,8),(10165,'S32_2509',48,50.86,14),(10165,'S32_3207',44,55.30,7),(10165,'S50_1392',48,106.49,10),(10165,'S50_1514',38,49.21,5),(10166,'S18_3140',43,136.59,2),(10166,'S18_4522',26,72.85,1),(10166,'S700_1938',29,76.22,3),(10167,'S10_4757',44,123.76,9),(10167,'S18_1662',43,141.92,1),(10167,'S18_3029',46,69.68,7),(10167,'S18_3856',34,84.70,6),(10167,'S24_2011',33,110.60,16),(10167,'S24_2841',21,54.81,2),(10167,'S24_3151',20,77.00,11),(10167,'S24_3420',32,64.44,3),(10167,'S24_3816',29,73.80,8),(10167,'S700_1138',43,66.00,12),(10167,'S700_2047',29,87.80,5),(10167,'S700_2610',46,62.16,10),(10167,'S700_3505',24,85.14,13),(10167,'S700_3962',28,83.42,14),(10167,'S72_1253',40,42.71,4),(10167,'S72_3212',38,43.68,15),(10168,'S10_1678',36,94.74,1),(10168,'S10_2016',27,97.53,4),(10168,'S10_4698',20,160.74,3),(10168,'S18_2581',21,75.19,9),(10168,'S18_2625',46,49.06,5),(10168,'S24_1578',50,103.68,2),(10168,'S24_1785',49,93.01,11),(10168,'S24_2000',29,72.36,6),(10168,'S24_3949',27,57.32,18),(10168,'S24_4278',48,68.10,10),(10168,'S32_1374',28,89.90,7),(10168,'S32_4289',31,57.78,12),(10168,'S50_1341',48,39.71,13),(10168,'S700_1691',28,91.34,14),(10168,'S700_2466',31,87.75,16),(10168,'S700_2834',36,94.92,8),(10168,'S700_3167',48,72.00,15),(10168,'S700_4002',39,67.37,17),(10169,'S12_1099',30,163.44,2),(10169,'S12_2823',35,126.52,13),(10169,'S12_3990',36,71.82,3),(10169,'S18_3278',32,65.13,5),(10169,'S18_3482',36,136.70,4),(10169,'S18_3782',38,52.84,8),(10169,'S18_4721',33,120.53,7),(10169,'S24_2360',38,66.49,11),(10169,'S24_3371',34,53.27,1),(10169,'S24_4620',24,77.61,6),(10169,'S32_2206',26,37.01,9),(10169,'S32_4485',34,83.68,12),(10169,'S50_4713',48,75.66,10),(10170,'S12_3380',47,116.27,4),(10170,'S12_4675',41,93.28,3),(10170,'S18_1889',20,70.07,2),(10170,'S24_3856',34,130.60,1),(10171,'S18_1129',35,134.46,2),(10171,'S18_1984',35,128.03,1),(10171,'S18_3232',39,165.95,3),(10171,'S24_2972',36,34.74,4),(10172,'S18_1589',42,109.51,6),(10172,'S18_2870',39,117.48,7),(10172,'S18_3685',48,139.87,8),(10172,'S24_1046',32,61.00,3),(10172,'S24_1628',34,43.27,5),(10172,'S24_2766',22,79.97,1),(10172,'S24_3191',24,77.91,2),(10172,'S24_3432',22,87.81,4),(10173,'S18_1342',43,101.71,6),(10173,'S18_1367',48,51.75,5),(10173,'S18_1749',24,168.30,13),(10173,'S18_2248',26,55.09,12),(10173,'S18_2325',31,127.13,10),(10173,'S18_2795',22,140.06,7),(10173,'S18_2957',28,56.84,2),(10173,'S18_3136',31,86.92,1),(10173,'S18_3320',29,90.28,4),(10173,'S18_4409',21,77.31,14),(10173,'S18_4933',39,58.44,15),(10173,'S24_1937',31,29.87,9),(10173,'S24_2022',27,39.42,8),(10173,'S24_2887',23,98.65,16),(10173,'S24_3969',35,35.70,11),(10173,'S24_4258',22,93.49,3),(10174,'S10_1949',34,207.87,4),(10174,'S12_1666',43,113.44,1),(10174,'S18_1097',48,108.50,3),(10174,'S18_2949',46,100.30,5),(10174,'S18_4668',49,44.27,2),(10175,'S10_4962',33,119.67,9),(10175,'S12_4473',26,109.02,1),(10175,'S18_2319',48,101.87,4),(10175,'S18_2432',41,59.55,7),(10175,'S18_3232',29,150.71,5),(10175,'S18_4600',47,102.92,10),(10175,'S24_2300',28,121.40,6),(10175,'S24_2840',37,32.18,2),(10175,'S32_1268',22,89.57,8),(10175,'S32_2509',50,50.86,3),(10175,'S32_3522',29,56.24,12),(10175,'S700_2824',42,80.92,11),(10176,'S12_1108',33,166.24,2),(10176,'S12_3148',47,145.04,3),(10176,'S12_3891',50,160.91,1),(10176,'S18_2238',20,139.17,10),(10176,'S18_4027',36,140.75,5),(10176,'S24_1444',27,55.49,8),(10176,'S24_4048',29,101.72,7),(10176,'S32_3207',22,62.14,6),(10176,'S50_1392',23,109.96,9),(10176,'S50_1514',38,52.14,4),(10177,'S18_3140',23,113.37,9),(10177,'S18_3259',29,92.77,11),(10177,'S18_4522',35,82.50,8),(10177,'S24_2011',50,115.52,7),(10177,'S24_3151',45,79.66,2),(10177,'S700_1138',24,58.67,3),(10177,'S700_1938',31,77.95,10),(10177,'S700_2610',32,64.33,1),(10177,'S700_3505',44,88.15,4),(10177,'S700_3962',24,83.42,5),(10177,'S72_3212',40,52.96,6),(10178,'S10_4757',24,131.92,12),(10178,'S18_1662',42,127.73,4),(10178,'S18_3029',41,70.54,10),(10178,'S18_3856',48,104.81,9),(10178,'S24_2841',34,67.82,5),(10178,'S24_3420',27,65.75,6),(10178,'S24_3816',21,68.77,11),(10178,'S24_3949',30,64.15,3),(10178,'S700_2047',34,86.90,8),(10178,'S700_2466',22,91.74,1),(10178,'S700_4002',45,68.11,2),(10178,'S72_1253',45,41.71,7),(10179,'S18_2581',24,82.79,3),(10179,'S24_1785',47,105.04,5),(10179,'S24_4278',27,66.65,4),(10179,'S32_1374',45,86.90,1),(10179,'S32_4289',24,63.97,6),(10179,'S50_1341',34,43.20,7),(10179,'S700_1691',23,75.81,8),(10179,'S700_2834',25,98.48,2),(10179,'S700_3167',39,80.00,9),(10180,'S10_1678',29,76.56,9),(10180,'S10_2016',42,99.91,12),(10180,'S10_4698',41,164.61,11),(10180,'S12_2823',40,131.04,8),(10180,'S18_2625',25,48.46,13),(10180,'S18_3782',21,59.06,3),(10180,'S18_4721',44,147.31,2),(10180,'S24_1578',48,98.05,10),(10180,'S24_2000',28,61.70,14),(10180,'S24_2360',35,60.95,6),(10180,'S24_4620',28,68.71,1),(10180,'S32_2206',34,33.39,4),(10180,'S32_4485',22,102.05,7),(10180,'S50_4713',21,74.85,5),(10181,'S12_1099',27,155.66,14),(10181,'S12_3380',28,113.92,12),(10181,'S12_3990',20,67.03,15),(10181,'S12_4675',36,107.10,11),(10181,'S18_1129',44,124.56,6),(10181,'S18_1589',42,124.44,2),(10181,'S18_1889',22,74.69,10),(10181,'S18_1984',21,129.45,5),(10181,'S18_2870',27,130.68,3),(10181,'S18_3232',45,147.33,7),(10181,'S18_3278',30,73.17,17),(10181,'S18_3482',22,120.53,16),(10181,'S18_3685',39,137.04,4),(10181,'S24_1628',34,45.28,1),(10181,'S24_2972',37,32.85,8),(10181,'S24_3371',23,54.49,13),(10181,'S24_3856',25,122.17,9),(10182,'S18_1342',25,83.22,3),(10182,'S18_1367',32,44.21,2),(10182,'S18_1749',44,159.80,10),(10182,'S18_2248',38,54.49,9),(10182,'S18_2325',20,105.52,7),(10182,'S18_2795',21,135.00,4),(10182,'S18_3320',33,86.31,1),(10182,'S18_4409',36,88.35,11),(10182,'S18_4933',44,61.29,12),(10182,'S24_1046',47,63.20,16),(10182,'S24_1937',39,31.86,6),(10182,'S24_2022',31,39.87,5),(10182,'S24_2766',36,87.24,14),(10182,'S24_2887',20,116.27,13),(10182,'S24_3191',33,73.62,15),(10182,'S24_3432',49,95.30,17),(10182,'S24_3969',23,34.88,8),(10183,'S10_1949',23,180.01,8),(10183,'S10_4962',28,127.06,1),(10183,'S12_1666',41,114.80,5),(10183,'S18_1097',21,108.50,7),(10183,'S18_2949',37,91.18,9),(10183,'S18_2957',39,51.22,11),(10183,'S18_3136',22,90.06,10),(10183,'S18_4600',21,118.66,2),(10183,'S18_4668',40,42.26,6),(10183,'S24_4258',47,81.81,12),(10183,'S32_3522',49,52.36,4),(10183,'S700_2824',23,85.98,3),(10184,'S12_4473',37,105.47,6),(10184,'S18_2238',46,145.72,5),(10184,'S18_2319',46,119.05,9),(10184,'S18_2432',44,60.77,12),(10184,'S18_3232',28,165.95,10),(10184,'S24_1444',31,57.22,3),(10184,'S24_2300',24,117.57,11),(10184,'S24_2840',42,30.06,7),(10184,'S24_4048',49,114.73,2),(10184,'S32_1268',46,84.75,13),(10184,'S32_2509',33,52.49,8),(10184,'S32_3207',48,59.03,1),(10184,'S50_1392',45,92.60,4),(10185,'S12_1108',21,195.33,13),(10185,'S12_3148',33,146.55,14),(10185,'S12_3891',43,147.07,12),(10185,'S18_3140',28,124.30,9),(10185,'S18_3259',49,94.79,11),(10185,'S18_4027',39,127.82,16),(10185,'S18_4522',47,87.77,8),(10185,'S24_2011',30,105.69,7),(10185,'S24_3151',33,83.20,2),(10185,'S50_1514',20,46.86,15),(10185,'S700_1138',21,64.67,3),(10185,'S700_1938',30,79.68,10),(10185,'S700_2610',39,61.44,1),(10185,'S700_3505',37,99.17,4),(10185,'S700_3962',22,93.35,5),(10185,'S72_3212',28,47.50,6),(10186,'S10_4757',26,108.80,9),(10186,'S18_1662',32,137.19,1),(10186,'S18_3029',32,73.12,7),(10186,'S18_3856',46,98.46,6),(10186,'S24_2841',22,60.29,2),(10186,'S24_3420',21,59.83,3),(10186,'S24_3816',36,68.77,8),(10186,'S700_2047',24,80.56,5),(10186,'S72_1253',28,42.71,4),(10187,'S18_2581',45,70.12,1),(10187,'S24_1785',46,96.29,3),(10187,'S24_3949',43,55.96,10),(10187,'S24_4278',33,64.48,2),(10187,'S32_4289',31,61.22,4),(10187,'S50_1341',41,39.71,5),(10187,'S700_1691',34,84.95,6),(10187,'S700_2466',44,95.73,8),(10187,'S700_3167',34,72.00,7),(10187,'S700_4002',44,70.33,9),(10188,'S10_1678',48,95.70,1),(10188,'S10_2016',38,111.80,4),(10188,'S10_4698',45,182.04,3),(10188,'S18_2625',32,52.09,5),(10188,'S24_1578',25,95.80,2),(10188,'S24_2000',40,61.70,6),(10188,'S32_1374',44,81.91,7),(10188,'S700_2834',29,96.11,8),(10189,'S12_2823',28,138.57,1),(10190,'S24_2360',42,58.87,3),(10190,'S32_2206',46,38.62,1),(10190,'S32_4485',42,89.80,4),(10190,'S50_4713',40,67.53,2),(10191,'S12_1099',21,155.66,3),(10191,'S12_3380',40,104.52,1),(10191,'S12_3990',30,70.22,4),(10191,'S18_3278',36,75.59,6),(10191,'S18_3482',23,119.06,5),(10191,'S18_3782',43,60.93,9),(10191,'S18_4721',32,136.90,8),(10191,'S24_3371',48,53.27,2),(10191,'S24_4620',44,77.61,7),(10192,'S12_4675',27,99.04,16),(10192,'S18_1129',22,140.12,11),(10192,'S18_1589',29,100.80,7),(10192,'S18_1889',45,70.84,15),(10192,'S18_1984',47,128.03,10),(10192,'S18_2870',38,110.88,8),(10192,'S18_3232',26,137.17,12),(10192,'S18_3685',45,125.74,9),(10192,'S24_1046',37,72.02,4),(10192,'S24_1628',47,49.30,6),(10192,'S24_2766',46,86.33,2),(10192,'S24_2887',23,112.74,1),(10192,'S24_2972',30,33.23,13),(10192,'S24_3191',32,69.34,3),(10192,'S24_3432',46,93.16,5),(10192,'S24_3856',45,112.34,14),(10193,'S18_1342',28,92.47,7),(10193,'S18_1367',46,46.36,6),(10193,'S18_1749',21,153.00,14),(10193,'S18_2248',42,60.54,13),(10193,'S18_2325',44,115.69,11),(10193,'S18_2795',22,143.44,8),(10193,'S18_2949',28,87.13,1),(10193,'S18_2957',24,53.09,3),(10193,'S18_3136',23,97.39,2),(10193,'S18_3320',32,79.37,5),(10193,'S18_4409',24,92.03,15),(10193,'S18_4933',25,66.28,16),(10193,'S24_1937',26,32.19,10),(10193,'S24_2022',20,44.80,9),(10193,'S24_3969',22,38.16,12),(10193,'S24_4258',20,92.52,4),(10194,'S10_1949',42,203.59,11),(10194,'S10_4962',26,134.44,4),(10194,'S12_1666',38,124.37,8),(10194,'S18_1097',21,103.84,10),(10194,'S18_2432',45,51.05,2),(10194,'S18_4600',32,113.82,5),(10194,'S18_4668',41,47.79,9),(10194,'S24_2300',49,112.46,1),(10194,'S32_1268',37,77.05,3),(10194,'S32_3522',39,61.41,7),(10194,'S700_2824',26,80.92,6),(10195,'S12_4473',49,118.50,6),(10195,'S18_2238',27,139.17,5),(10195,'S18_2319',35,112.91,9),(10195,'S18_3232',50,150.71,10),(10195,'S24_1444',44,54.33,3),(10195,'S24_2840',32,31.82,7),(10195,'S24_4048',34,95.81,2),(10195,'S32_2509',32,51.95,8),(10195,'S32_3207',33,59.03,1),(10195,'S50_1392',49,97.23,4),(10196,'S12_1108',47,203.64,5),(10196,'S12_3148',24,151.08,6),(10196,'S12_3891',38,147.07,4),(10196,'S18_3140',49,127.03,1),(10196,'S18_3259',35,81.68,3),(10196,'S18_4027',27,126.39,8),(10196,'S50_1514',46,56.82,7),(10196,'S700_1938',50,84.88,2),(10197,'S10_4757',45,118.32,6),(10197,'S18_3029',46,83.44,4),(10197,'S18_3856',22,85.75,3),(10197,'S18_4522',50,78.99,14),(10197,'S24_2011',41,109.37,13),(10197,'S24_3151',47,83.20,8),(10197,'S24_3816',22,67.93,5),(10197,'S700_1138',23,60.00,9),(10197,'S700_2047',24,78.75,2),(10197,'S700_2610',50,66.50,7),(10197,'S700_3505',27,100.17,10),(10197,'S700_3962',35,88.39,11),(10197,'S72_1253',29,39.73,1),(10197,'S72_3212',42,48.59,12),(10198,'S18_1662',42,149.81,4),(10198,'S24_2841',48,60.97,5),(10198,'S24_3420',27,61.81,6),(10198,'S24_3949',43,65.51,3),(10198,'S700_2466',42,94.73,1),(10198,'S700_4002',40,74.03,2),(10199,'S50_1341',29,37.97,1),(10199,'S700_1691',48,81.29,2),(10199,'S700_3167',38,70.40,3),(10200,'S18_2581',28,74.34,3),(10200,'S24_1785',33,99.57,5),(10200,'S24_4278',39,70.28,4),(10200,'S32_1374',35,80.91,1),(10200,'S32_4289',27,65.35,6),(10200,'S700_2834',39,115.09,2),(10201,'S10_1678',22,82.30,2),(10201,'S10_2016',24,116.56,5),(10201,'S10_4698',49,191.72,4),(10201,'S12_2823',25,126.52,1),(10201,'S18_2625',30,48.46,6),(10201,'S24_1578',39,93.54,3),(10201,'S24_2000',25,66.27,7),(10202,'S18_3782',30,55.33,3),(10202,'S18_4721',43,124.99,2),(10202,'S24_2360',50,56.10,6),(10202,'S24_4620',50,75.18,1),(10202,'S32_2206',27,33.39,4),(10202,'S32_4485',31,81.64,7),(10202,'S50_4713',40,79.73,5),(10203,'S12_1099',20,161.49,8),(10203,'S12_3380',20,111.57,6),(10203,'S12_3990',44,63.84,9),(10203,'S12_4675',47,115.16,5),(10203,'S18_1889',45,73.15,4),(10203,'S18_3232',48,157.49,1),(10203,'S18_3278',33,66.74,11),(10203,'S18_3482',32,127.88,10),(10203,'S24_2972',21,33.23,2),(10203,'S24_3371',34,56.94,7),(10203,'S24_3856',47,140.43,3),(10204,'S18_1129',42,114.65,17),(10204,'S18_1589',40,113.24,13),(10204,'S18_1749',33,153.00,4),(10204,'S18_1984',38,133.72,16),(10204,'S18_2248',23,59.33,3),(10204,'S18_2325',26,119.50,1),(10204,'S18_2870',27,106.92,14),(10204,'S18_3685',35,132.80,15),(10204,'S18_4409',29,83.75,5),(10204,'S18_4933',45,69.84,6),(10204,'S24_1046',20,69.82,10),(10204,'S24_1628',45,46.79,12),(10204,'S24_2766',47,79.06,8),(10204,'S24_2887',42,112.74,7),(10204,'S24_3191',40,84.75,9),(10204,'S24_3432',48,104.94,11),(10204,'S24_3969',39,34.88,2),(10205,'S18_1342',36,98.63,2),(10205,'S18_1367',48,45.82,1),(10205,'S18_2795',40,138.38,3),(10205,'S24_1937',32,27.88,5),(10205,'S24_2022',24,36.74,4);


-- Create `payments` table
DROP TABLE IF EXISTS `payments`;

CREATE TABLE `payments` (
  `customerNumber` int NOT NULL,
  `checkNumber` varchar(12) NOT NULL,
  `paymentDate` datetime DEFAULT NULL,
  `amount` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`customerNumber`,`checkNumber`),
  CONSTRAINT `Check` FOREIGN KEY (`customerNumber`) REFERENCES `customers` (`customerNumber`)
);

-- Dump data into `payments`

INSERT INTO `payments` VALUES (103,'HQ336336','2004-10-19 00:00:00',6066.78),(103,'JM555205','2003-06-05 00:00:00',14571.44),(103,'OM314933','2004-12-18 00:00:00',1676.14),(112,'BO864823','2004-12-17 00:00:00',14191.12),(112,'HQ55022','2003-06-06 00:00:00',32641.98),(112,'ND748579','2004-08-20 00:00:00',33347.88),(114,'GG31455','2003-05-20 00:00:00',45864.03),(114,'MA765515','2004-12-15 00:00:00',82261.22),(114,'NP603840','2003-05-31 00:00:00',7565.08),(114,'NR27552','2004-03-10 00:00:00',44894.74),(119,'DB933704','2004-11-14 00:00:00',19501.82),(119,'LN373447','2004-08-08 00:00:00',47924.19),(119,'NG94694','2005-02-22 00:00:00',49523.67),(121,'DB889831','2003-02-16 00:00:00',50218.95),(121,'FD317790','2003-10-28 00:00:00',1491.38),(121,'KI831359','2004-11-04 00:00:00',17876.32),(121,'MA302151','2004-11-28 00:00:00',34638.14),(124,'AE215433','2005-03-05 00:00:00',101244.59),(124,'BG255406','2004-08-28 00:00:00',85410.87),(124,'CQ287967','2003-04-11 00:00:00',11044.30),(124,'ET64396','2005-04-16 00:00:00',83598.04),(124,'HI366474','2004-12-27 00:00:00',47142.70),(124,'HR86578','2004-11-02 00:00:00',55639.66),(124,'KI131716','2003-08-15 00:00:00',111654.40),(124,'LF217299','2004-03-26 00:00:00',43369.30),(124,'NT141748','2003-11-25 00:00:00',45084.38),(128,'DI925118','2003-01-28 00:00:00',10549.01),(128,'FA465482','2003-10-18 00:00:00',24101.81),(128,'FH668230','2004-03-24 00:00:00',33820.62),(128,'IP383901','2004-11-18 00:00:00',7466.32),(129,'DM826140','2004-12-08 00:00:00',26248.78),(129,'ID449593','2003-12-11 00:00:00',23923.93),(129,'PI42991','2003-04-09 00:00:00',16537.85),(131,'CL442705','2003-03-12 00:00:00',22292.62),(131,'MA724562','2004-12-02 00:00:00',50025.35),(131,'NB445135','2004-09-11 00:00:00',35321.97),(141,'AU364101','2003-07-19 00:00:00',36251.03),(141,'DB583216','2004-11-01 00:00:00',36140.38),(141,'DL460618','2005-05-19 00:00:00',46895.48),(141,'HJ32686','2004-01-30 00:00:00',59830.55),(141,'ID10962','2004-12-31 00:00:00',116208.40),(141,'IN446258','2005-03-25 00:00:00',65071.26),(141,'JE105477','2005-03-18 00:00:00',120166.58),(141,'JN355280','2003-10-26 00:00:00',49539.37),(141,'JN722010','2003-02-25 00:00:00',40206.20),(141,'KT52578','2003-12-09 00:00:00',63843.55),(141,'MC46946','2004-07-09 00:00:00',35420.74),(141,'MF629602','2004-08-16 00:00:00',20009.53),(141,'NU627706','2004-05-17 00:00:00',26155.91),(144,'IR846303','2004-12-12 00:00:00',36005.71),(144,'LA685678','2003-04-09 00:00:00',7674.94),(145,'CN328545','2004-07-03 00:00:00',4710.73),(145,'ED39322','2004-04-26 00:00:00',28211.70),(145,'HR182688','2004-12-01 00:00:00',20564.86),(145,'JJ246391','2003-02-20 00:00:00',53959.21),(146,'FP549817','2004-03-18 00:00:00',40978.53),(146,'FU793410','2004-01-16 00:00:00',49614.72),(146,'LJ160635','2003-12-10 00:00:00',39712.10),(148,'BI507030','2003-04-22 00:00:00',44380.15),(148,'DD635282','2004-08-11 00:00:00',2611.84),(148,'KM172879','2003-12-26 00:00:00',105743.00),(148,'ME497970','2005-03-27 00:00:00',3516.04),(151,'BF686658','2003-12-22 00:00:00',58793.53),(151,'GB852215','2004-07-26 00:00:00',20314.44),(151,'IP568906','2003-06-18 00:00:00',58841.35),(151,'KI884577','2004-12-14 00:00:00',39964.63),(157,'HI618861','2004-11-19 00:00:00',35152.12),(157,'NN711988','2004-09-07 00:00:00',63357.13),(161,'BR352384','2004-11-14 00:00:00',2434.25),(161,'BR478494','2003-11-18 00:00:00',50743.65),(161,'KG644125','2005-02-02 00:00:00',12692.19),(161,'NI908214','2003-08-05 00:00:00',38675.13),(166,'BQ327613','2004-09-16 00:00:00',38785.48),(166,'DC979307','2004-07-07 00:00:00',44160.92),(166,'LA318629','2004-02-28 00:00:00',22474.17),(167,'ED743615','2004-09-19 00:00:00',12538.01),(167,'GN228846','2003-12-03 00:00:00',85024.46),(171,'GB878038','2004-03-15 00:00:00',18997.89),(171,'IL104425','2003-11-22 00:00:00',42783.81),(172,'AD832091','2004-09-09 00:00:00',1960.80),(172,'CE51751','2004-12-04 00:00:00',51209.58),(172,'EH208589','2003-04-20 00:00:00',33383.14),(173,'GP545698','2004-05-13 00:00:00',11843.45),(173,'IG462397','2004-03-29 00:00:00',20355.24),(175,'CITI3434344','2005-05-19 00:00:00',28500.78),(175,'IO448913','2003-11-19 00:00:00',24879.08),(175,'PI15215','2004-07-10 00:00:00',42044.77),(177,'AU750837','2004-04-17 00:00:00',15183.63),(177,'CI381435','2004-01-19 00:00:00',47177.59),(181,'CM564612','2004-04-25 00:00:00',22602.36),(181,'GQ132144','2003-01-30 00:00:00',5494.78),(181,'OH367219','2004-11-16 00:00:00',44400.50),(186,'AE192287','2005-03-10 00:00:00',23602.90),(186,'AK412714','2003-10-27 00:00:00',37602.48),(186,'KA602407','2004-10-21 00:00:00',34341.08),(187,'AM968797','2004-11-03 00:00:00',52825.29),(187,'BQ39062','2004-12-08 00:00:00',47159.11),(187,'KL124726','2003-03-27 00:00:00',48425.69),(189,'BO711618','2004-10-03 00:00:00',17359.53),(189,'NM916675','2004-03-01 00:00:00',32538.74),(198,'FI192930','2004-12-06 00:00:00',9658.74),(198,'HQ920205','2003-07-06 00:00:00',6036.96),(198,'IS946883','2004-09-21 00:00:00',5858.56),(201,'DP677013','2003-10-20 00:00:00',23908.24),(201,'OO846801','2004-06-15 00:00:00',37258.94),(202,'HI358554','2003-12-18 00:00:00',36527.61),(202,'IQ627690','2004-11-08 00:00:00',33594.58),(204,'GC697638','2004-08-13 00:00:00',51152.86),(204,'IS150005','2004-09-24 00:00:00',4424.40),(205,'GL756480','2003-12-04 00:00:00',3879.96),(205,'LL562733','2003-09-05 00:00:00',50342.74),(205,'NM739638','2005-02-06 00:00:00',39580.60),(209,'BOAF82044','2005-05-03 00:00:00',35157.75),(209,'ED520529','2004-06-21 00:00:00',4632.31),(209,'PH785937','2004-05-04 00:00:00',36069.26),(211,'BJ535230','2003-12-09 00:00:00',45480.79),(216,'BG407567','2003-05-09 00:00:00',3101.40),(216,'ML780814','2004-12-06 00:00:00',24945.21),(216,'MM342086','2003-12-14 00:00:00',40473.86),(219,'BN17870','2005-03-02 00:00:00',3452.75),(219,'BR941480','2003-10-18 00:00:00',4465.85),(227,'MQ413968','2003-10-31 00:00:00',36164.46),(227,'NU21326','2004-11-02 00:00:00',53745.34),(233,'BOFA23232','2005-05-20 00:00:00',29070.38),(233,'II180006','2004-07-01 00:00:00',22997.45),(233,'JG981190','2003-11-18 00:00:00',16909.84),(239,'NQ865547','2004-03-15 00:00:00',80375.24),(240,'IF245157','2004-11-16 00:00:00',46788.14),(240,'JO719695','2004-03-28 00:00:00',24995.61),(242,'AF40894','2003-11-22 00:00:00',33818.34),(242,'HR224331','2005-06-03 00:00:00',12432.32),(242,'KI744716','2003-07-21 00:00:00',14232.70),(249,'IJ399820','2004-09-19 00:00:00',33924.24),(249,'NE404084','2004-09-04 00:00:00',48298.99),(250,'EQ12267','2005-05-17 00:00:00',17928.09),(250,'HD284647','2004-12-30 00:00:00',26311.63),(250,'HN114306','2003-07-18 00:00:00',23419.47),(256,'EP227123','2004-02-10 00:00:00',5759.42),(256,'HE84936','2004-10-22 00:00:00',53116.99),(259,'EU280955','2004-11-06 00:00:00',61234.67),(259,'GB361972','2003-12-07 00:00:00',27988.47),(260,'IO164641','2004-08-30 00:00:00',37527.58),(260,'NH776924','2004-04-24 00:00:00',29284.42),(276,'EM979878','2005-02-09 00:00:00',27083.78),(276,'KM841847','2003-11-13 00:00:00',38547.19),(276,'LE432182','2003-09-28 00:00:00',41554.73),(276,'OJ819725','2005-04-30 00:00:00',29848.52),(278,'BJ483870','2004-12-05 00:00:00',37654.09),(278,'GP636783','2003-03-02 00:00:00',52151.81),(278,'NI983021','2003-11-24 00:00:00',37723.79),(282,'IA793562','2003-08-03 00:00:00',24013.52),(282,'JT819493','2004-08-02 00:00:00',35806.73),(282,'OD327378','2005-01-03 00:00:00',31835.36),(286,'DR578578','2004-10-28 00:00:00',47411.33),(286,'KH910279','2004-09-05 00:00:00',43134.04),(298,'AJ574927','2004-03-13 00:00:00',47375.92),(298,'LF501133','2004-09-18 00:00:00',61402.00),(299,'AD304085','2003-10-24 00:00:00',36798.88),(299,'NR157385','2004-09-05 00:00:00',32260.16),(311,'DG336041','2005-02-15 00:00:00',46770.52),(311,'FA728475','2003-10-06 00:00:00',32723.04),(311,'NQ966143','2004-04-25 00:00:00',16212.59),(314,'LQ244073','2004-08-09 00:00:00',45352.47),(314,'MD809704','2004-03-03 00:00:00',16901.38),(319,'HL685576','2004-11-06 00:00:00',42339.76),(319,'OM548174','2003-12-07 00:00:00',36092.40),(320,'GJ597719','2005-01-18 00:00:00',8307.28),(320,'HO576374','2003-08-20 00:00:00',41016.75),(320,'MU817160','2003-11-24 00:00:00',52548.49),(321,'DJ15149','2003-11-03 00:00:00',85559.12),(321,'LA556321','2005-03-15 00:00:00',46781.66),(323,'AL493079','2005-05-23 00:00:00',75020.13),(323,'ES347491','2004-06-24 00:00:00',37281.36),(323,'HG738664','2003-07-05 00:00:00',2880.00),(323,'PQ803830','2004-12-24 00:00:00',39440.59),(324,'DQ409197','2004-12-13 00:00:00',13671.82),(324,'FP443161','2003-07-07 00:00:00',29429.14),(324,'HB150714','2003-11-23 00:00:00',37455.77),(328,'EN930356','2004-04-16 00:00:00',7178.66),(328,'NR631421','2004-05-30 00:00:00',31102.85),(333,'HL209210','2003-11-15 00:00:00',23936.53),(333,'JK479662','2003-10-17 00:00:00',9821.32),(333,'NF959653','2005-03-01 00:00:00',21432.31),(334,'CS435306','2005-01-27 00:00:00',45785.34),(334,'HH517378','2003-08-16 00:00:00',29716.86),(334,'LF737277','2004-05-22 00:00:00',28394.54),(339,'AP286625','2004-10-24 00:00:00',23333.06),(339,'DA98827','2003-11-28 00:00:00',34606.28),(344,'AF246722','2003-11-24 00:00:00',31428.21),(344,'NJ906924','2004-04-02 00:00:00',15322.93),(347,'DG700707','2004-01-18 00:00:00',21053.69),(347,'LG808674','2003-10-24 00:00:00',20452.50),(350,'BQ602907','2004-12-11 00:00:00',18888.31),(350,'CI471510','2003-05-25 00:00:00',50824.66),(350,'OB648482','2005-01-29 00:00:00',1834.56),(353,'CO351193','2005-01-10 00:00:00',49705.52),(353,'ED878227','2003-07-21 00:00:00',13920.26),(353,'GT878649','2003-05-21 00:00:00',16700.47),(353,'HJ618252','2005-06-09 00:00:00',46656.94),(357,'AG240323','2003-12-16 00:00:00',20220.04),(357,'NB291497','2004-05-15 00:00:00',36442.34),(362,'FP170292','2004-07-11 00:00:00',18473.71),(362,'OG208861','2004-09-21 00:00:00',15059.76),(363,'HL575273','2004-11-17 00:00:00',50799.69),(363,'IS232033','2003-01-16 00:00:00',10223.83),(363,'PN238558','2003-12-05 00:00:00',55425.77),(379,'CA762595','2005-02-12 00:00:00',28322.83),(379,'FR499138','2003-09-16 00:00:00',32680.31),(379,'GB890854','2004-08-02 00:00:00',12530.51),(381,'BC726082','2004-12-03 00:00:00',12081.52),(381,'CC475233','2003-04-19 00:00:00',1627.56),(381,'GB117430','2005-02-03 00:00:00',14379.90),(381,'MS154481','2003-08-22 00:00:00',1128.20),(382,'CC871084','2003-05-12 00:00:00',35826.33),(382,'CT821147','2004-08-01 00:00:00',6419.84),(382,'PH29054','2004-11-27 00:00:00',42813.83),(385,'BN347084','2003-12-02 00:00:00',20644.24),(385,'CP804873','2004-11-19 00:00:00',15822.84),(385,'EK785462','2003-03-09 00:00:00',51001.22),(386,'DO106109','2003-11-18 00:00:00',38524.29),(386,'HG438769','2004-07-18 00:00:00',51619.02),(398,'AJ478695','2005-02-14 00:00:00',33967.73),(398,'DO787644','2004-06-21 00:00:00',22037.91),(398,'JPMR4544','2005-05-18 00:00:00',615.45),(398,'KB54275','2004-11-29 00:00:00',48927.64),(406,'BJMPR4545','2005-04-23 00:00:00',12190.85),(406,'HJ217687','2004-01-28 00:00:00',49165.16),(406,'NA197101','2004-06-17 00:00:00',25080.96),(412,'GH197075','2004-07-25 00:00:00',35034.57),(412,'PJ434867','2004-04-14 00:00:00',31670.37),(415,'ER54537','2004-09-28 00:00:00',31310.09),(424,'KF480160','2004-12-07 00:00:00',25505.98),(424,'LM271923','2003-04-16 00:00:00',21665.98),(424,'OA595449','2003-10-31 00:00:00',22042.37),(447,'AO757239','2003-09-15 00:00:00',6631.36),(447,'ER615123','2003-06-25 00:00:00',17032.29),(447,'OU516561','2004-12-17 00:00:00',26304.13),(448,'FS299615','2005-04-18 00:00:00',27966.54),(448,'KR822727','2004-09-30 00:00:00',48809.90),(450,'EF485824','2004-06-21 00:00:00',59551.38),(452,'ED473873','2003-11-15 00:00:00',27121.90),(452,'FN640986','2003-11-20 00:00:00',15130.97),(452,'HG635467','2005-05-03 00:00:00',8807.12),(455,'HA777606','2003-12-05 00:00:00',38139.18),(455,'IR662429','2004-05-12 00:00:00',32239.47),(456,'GJ715659','2004-11-13 00:00:00',27550.51),(456,'MO743231','2004-04-30 00:00:00',1679.92),(458,'DD995006','2004-11-15 00:00:00',33145.56),(458,'NA377824','2004-02-06 00:00:00',22162.61),(458,'OO606861','2003-06-13 00:00:00',57131.92),(462,'ED203908','2005-04-15 00:00:00',30293.77),(462,'GC60330','2003-11-08 00:00:00',9977.85),(462,'PE176846','2004-11-27 00:00:00',48355.87),(471,'AB661578','2004-07-28 00:00:00',9415.13),(471,'CO645196','2003-12-10 00:00:00',35505.63),(473,'LL427009','2004-02-17 00:00:00',7612.06),(473,'PC688499','2003-10-27 00:00:00',17746.26),(475,'JP113227','2003-12-09 00:00:00',7678.25),(475,'PB951268','2004-02-13 00:00:00',36070.47),(484,'GK294076','2004-10-26 00:00:00',3474.66),(484,'JH546765','2003-11-29 00:00:00',47513.19),(486,'BL66528','2004-04-14 00:00:00',5899.38),(486,'HS86661','2004-11-23 00:00:00',45994.07),(486,'JB117768','2003-03-20 00:00:00',25833.14),(487,'AH612904','2003-09-28 00:00:00',29997.09),(487,'PT550181','2004-02-29 00:00:00',12573.28),(489,'OC773849','2003-12-04 00:00:00',22275.73),(489,'PO860906','2004-01-31 00:00:00',7310.42),(495,'BH167026','2003-12-26 00:00:00',59265.14),(495,'FN155234','2004-05-14 00:00:00',6276.60),(496,'EU531600','2005-05-25 00:00:00',30253.75),(496,'MB342426','2003-07-16 00:00:00',32077.44),(496,'MN89921','2004-12-31 00:00:00',52166.00);


-- Create `productlines` table
DROP TABLE IF EXISTS `productlines`;

CREATE TABLE `productlines` (
  `productLine` varchar(25) NOT NULL,
  `textDescription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`productLine`)
);

-- Dump data into `productlines`

INSERT INTO `productlines` VALUES ('Classic Cars','Attention car enthusiasts: Make your wildest car ownership dreams come true.'),('Motorcycles','Our motorcycles are state of the art replicas of classic as well as contemporary motorcycle legends such as Harley Davidson, Ducati and Vespa.'),('Planes','Unique, diecast airplane and helicopter replicas suitable for collections, as well as home, office or classroom decorations.'),('Ships','The perfect holiday or anniversary gift for executives, clients, friends, and family.'),('Trains','Model trains are a rewarding hobby for enthusiasts of all ages.'),('Trucks and Buses','The Truck and Bus models are realistic replicas of buses and specialized trucks produced from the early 1920s to present.'),('Vintage Cars','Our Vintage Car models realistically portray automobiles produced from the early 1900s through the 1940s.'), ('Boats', 'Boats category is a subset of Ships category, hence there is nothing new in this bucket.');


-- Create `products` table
DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `productCode` varchar(12) NOT NULL,
  `productName` varchar(45) DEFAULT NULL,
  `productLine` varchar(25) DEFAULT NULL,
  `productScale` varchar(25) DEFAULT NULL,
  `productVendor` varchar(25) DEFAULT NULL,
  `quantityInStock` varchar(5) DEFAULT NULL,
  `buyPrice` varchar(12) DEFAULT NULL,
  `MSRP` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`productCode`),
  CONSTRAINT `product_line` FOREIGN KEY (`productLine`) REFERENCES `productlines` (`productLine`)
);

-- Dump data into `products`

INSERT INTO `products` VALUES ('S10_1678','1969 Harley Davidson Ultimate Chopper','Motorcycles','01:10:00','Min Lin Diecast','7933','48.81','95.7'),('S10_1949','1952 Alpine Renault 1300','Classic Cars','01:10:00','Classic Metal Creations','7305','98.58','214.3'),('S10_2016','1996 Moto Guzzi 1100i','Motorcycles','01:10:00','Highway 66 Mini Classics','6625','68.99','118.94'),('S10_4757','1972 Alfa Romeo GTA','Classic Cars','01:10:00','Motor City Art Classics','3252','85.68','136'),('S10_4962','1962 LanciaA Delta 16V','Classic Cars','01:10:00','Second Gear Diecast','6791','103.42','147.74'),('S12_1099','1968 Ford Mustang','Classic Cars','01:12:00','Autoart Studio Design','68','95.34','194.57'),('S12_1108','2001 Ferrari Enzo','Classic Cars','01:12:00','Second Gear Diecast','3619','95.59','207.8'),('S12_1666','1958 Setra Bus','Trucks and Buses','01:12:00','Welly Diecast Productions','1579','77.9','136.67'),('S12_2823','2002 Suzuki XREO','Motorcycles','01:12:00','Unimax Art Galleries','9997','66.27','150.62'),('S12_3148','1969 Corvair Monza','Classic Cars','01:18:00','Welly Diecast Productions','NULL','NULL','6906'),('S12_3380','1968 Dodge Charger','Classic Cars','01:12:00','Welly Diecast Productions','9123','75.16','117.44'),('S12_3891','1969 Ford Falcon','Classic Cars','01:12:00','Second Gear Diecast','1049','83.05','173.02'),('S12_3990','1970 Plymouth Hemi Cuda','Classic Cars','01:12:00','Studio M Art Models','5663','31.92','79.8'),('S12_4473','1957 Chevy Pickup','Trucks and Buses','01:12:00','Exoto Designs','NULL','6125','55.7'),('S12_4675','1969 Dodge Charger','Classic Cars','01:12:00','Welly Diecast Productions','7323','58.73','115.16'),('S18_1097','1940 Ford Pickup Truck','Trucks and Buses','01:18:00','Studio M Art Models','2613','58.33','116.67'),('S18_1129','1993 Mazda RX-7','Classic Cars','01:18:00','Highway 66 Mini Classics','3975','83.51','141.54'),('S18_1342','1937 Lincoln Berline','Vintage Cars','01:18:00','Motor City Art Classics','8693','60.62','102.74'),('S18_1367','1936 Mercedes-Benz 500K Special Roadster','Vintage Cars','01:18:00','Studio M Art Models','8635','24.26','53.91'),('S18_1589','1965 Aston Martin DB5','Classic Cars','01:18:00','Classic Metal Creations','9042','65.96','124.44'),('S18_1662','1980s Black Hawk Helicopter','Planes','01:18:00','Red Start Diecast','5330','77.27','157.69'),('S18_1749','1917 Grand Touring Sedan','Vintage Cars','01:18:00','Welly Diecast Productions','2724','86.7','170'),('S18_1889','1948 Porsche 356-A Roadster','Classic Cars','01:18:00','Gearbox Collectibles','8826','53.9','77'),('S18_1984','1995 Honda Civic','Classic Cars','01:18:00','Min Lin Diecast','9772','93.89','142.25'),('S18_2238','1998 Chrysler Plymouth Prowler','Classic Cars','01:18:00','Gearbox Collectibles','4724','101.51','163.73'),('S18_2248','1911 Ford Town Car','Vintage Cars','01:18:00','Motor City Art Classics','540','33.3','60.54'),('S18_2319','1964 Mercedes Tour Bus','Trucks and Buses','01:18:00','Unimax Art Galleries','8258','74.86','122.73'),('S18_2325','1932 Model A Ford J-Coupe','Vintage Cars','01:18:00','Autoart Studio Design','9354','58.48','127.13'),('S18_2432','1926 Ford Fire Engine','Trucks and Buses','01:18:00','Carousel DieCast Legends','2018','24.92','60.77'),('S18_2581','P-51-D Mustang','Planes','0.0916666666666667','Gearbox Collectibles','992','49','84.48'),('S18_2625','1936 Harley Davidson El Knucklehead','Motorcycles','01:18:00','Welly Diecast Productions','4357','24.23','60.57'),('S18_2795','1928 Mercedes-Benz SSK','Vintage Cars','01:18:00','Gearbox Collectibles','548','72.56','168.75'),('S18_2870','1999 Indy 500 Monte Carlo SS','Classic Cars','01:18:00','Red Start Diecast','8164','56.76','132'),('S18_2949','1913 Ford Model T Speedster','Vintage Cars','01:18:00','Carousel DieCast Legends','4189','60.78','101.31'),('S18_2957','1934 Ford V8 Coupe','Vintage Cars','01:18:00','Min Lin Diecast','5649','34.35','62.46'),('S18_3029','1999 Yamaha Speed Boat','Ships','01:18:00','Min Lin Diecast','4259','51.61','86.02'),('S18_3136','18th Century Vintage Horse Carriage','Vintage Cars','01:18:00','Red Start Diecast','5992','60.74','104.72'),('S18_3140','1903 Ford Model A','Vintage Cars','01:18:00','Unimax Art Galleries','3913','68.3','136.59'),('S18_3232','1992 Ferrari 360 Spider red','Classic Cars','01:18:00','Unimax Art Galleries','8347','77.9','169.34'),('S18_3233','1985 Toyota Supra','Classic Cars','01:18:00','Highway 66 Mini Classics','7733','57.01','107.57'),('S18_3259','Collectable Wooden Train','Trains','01:18:00','Carousel DieCast Legends','6450','67.56','100.84'),('S18_3278','1969 Dodge Super Bee','Classic Cars','01:18:00','Min Lin Diecast','1917','49.05','80.41'),('S18_3320','1917 Maxwell Touring Car','Vintage Cars','01:18:00','Exoto Designs','7913','57.54','99.21'),('S18_3482','1976 Ford Gran Torino','Classic Cars','01:18:00','Gearbox Collectibles','9127','73.49','146.99'),('S18_3685','1948 Porsche Type 356 Roadster','Classic Cars','01:18:00','Gearbox Collectibles','8990','62.16','141.28'),('S18_3782','1957 Vespa GS150','Motorcycles','01:18:00','Studio M Art Models','7689','32.95','62.17'),('S18_3856','1941 Chevrolet Special Deluxe Cabriolet','Vintage Cars','01:18:00','Exoto Designs','2378','64.58','105.87'),('S18_4027','1970 Triumph Spitfire','Classic Cars','01:18:00','Min Lin Diecast','5545','91.92','143.62'),('S18_4409','1932 Alfa Romeo 8C2300 Spider Sport','Vintage Cars','01:18:00','Exoto Designs','6553','43.26','92.03'),('S18_4522','1904 Buick Runabout','Vintage Cars','01:18:00','Exoto Designs','8290','52.66','87.77'),('S18_4600','1940s Ford truck','Trucks and Buses','01:18:00','Motor City Art Classics','3128','84.76','121.08'),('S18_4668','1939 Cadillac Limousine','Vintage Cars','01:18:00','Studio M Art Models','6645','23.14','50.31'),('S18_4721','1957 Corvette Convertible','Classic Cars','01:18:00','Classic Metal Creations','1249','69.93','148.8'),('S18_4933','1957 Ford Thunderbird','Classic Cars','01:18:00','Studio M Art Models','3209','34.21','71.27'),('S24_1046','1970 Chevy Chevelle SS 454','Classic Cars','01:24:00','Unimax Art Galleries','1005','49.24','73.49'),('S24_1444','1970 Dodge Coronet','Classic Cars','01:24:00','Highway 66 Mini Classics','NULL','4074','32.37'),('S24_1578','1997 BMW R 1100 S','Motorcycles','01:24:00','Autoart Studio Design','7003','60.86','112.7'),('S24_1628','1966 Shelby Cobra 427 S/C','Classic Cars','01:24:00','Carousel DieCast Legends','8197','29.18','50.31'),('S24_1785','1928 British Royal Navy Airplane','Planes','01:24:00','Classic Metal Creations','3627','66.74','109.42'),('S24_1937','1939 Chevrolet Deluxe Coupe','Vintage Cars','01:24:00','Motor City Art Classics','7332','22.57','33.19'),('S24_2000','1960 BSA Gold Star DBD34','Motorcycles','01:24:00','Highway 66 Mini Classics','15','37.32','76.17'),('S24_2011','18th century schooner','Ships','01:24:00','Carousel DieCast Legends','1898','82.34','122.89'),('S24_2022','1938 Cadillac V-16 Presidential Limousine','Vintage Cars','01:24:00','Classic Metal Creations','2847','20.61','44.8'),('S24_2300','1962 Volkswagen Microbus','Trucks and Buses','01:24:00','Autoart Studio Design','2327','61.34','127.79'),('S24_2360','1982 Ducati 900 Monster','Motorcycles','01:24:00','Highway 66 Mini Classics','6840','47.1','69.26'),('S24_2766','1949 Jaguar XK 120','Classic Cars','01:24:00','Classic Metal Creations','2350','47.25','90.87'),('S24_2840','1958 Chevy Corvette Limited Edition','Classic Cars','01:24:00','Carousel DieCast Legends','2542','15.91','35.36'),('S24_2841','1900s Vintage Bi-Plane','Planes','01:24:00','Autoart Studio Design','5942','34.25','68.51'),('S24_2887','1952 Citroen-15CV','Classic Cars','01:24:00','Exoto Designs','1452','72.82','117.44'),('S24_2972','1982 Lamborghini Diablo','Classic Cars','01:24:00','Second Gear Diecast','7723','16.24','37.76'),('S24_3151','1912 Ford Model T Delivery Wagon','Vintage Cars','01:24:00','Min Lin Diecast','9173','46.91','88.51'),('S24_3191','1969 Chevrolet Camaro Z28','Classic Cars','01:24:00','Exoto Designs','4695','50.51','85.61'),('S24_3371','1971 Alpine Renault 1600s','Classic Cars','01:24:00','Welly Diecast Productions','7995','38.58','61.23'),('S24_3420','1937 Horch 930V Limousine','Vintage Cars','01:24:00','Autoart Studio Design','2902','26.3','65.75'),('S24_3432','2002 Chevy Corvette','Classic Cars','01:24:00','Gearbox Collectibles','9446','62.11','107.08'),('S24_3816','1940 Ford Delivery Sedan','Vintage Cars','01:24:00','Carousel DieCast Legends','6621','48.64','83.86'),('S24_3856','1956 Porsche 356A Coupe','Classic Cars','01:18:00','Classic Metal Creations','6600','98.3','140.43'),('S24_3949','Corsair F4U ( Bird Cage)','Planes','01:24:00','Second Gear Diecast','6812','29.34','68.24'),('S24_3969','1936 Mercedes Benz 500k Roadster','Vintage Cars','01:24:00','Red Start Diecast','2081','21.75','41.03'),('S24_4048','1992 Porsche Cayenne Turbo Silver','Classic Cars','01:24:00','Exoto Designs','6582','69.78','118.28'),('S24_4258','1936 Chrysler Airflow','Vintage Cars','01:24:00','Second Gear Diecast','4710','57.46','97.39'),('S24_4278','1900s Vintage Tri-Plane','Planes','01:24:00','Unimax Art Galleries','2756','36.23','72.45'),('S24_4620','1961 Chevrolet Impala','Classic Cars','01:18:00','Classic Metal Creations','7869','32.33','80.84'),('S32_1268','1980â€™s GM Manhattan Express','Trucks and Buses','01:32:00','Motor City Art Classics','5099','53.93','96.31'),('S32_1374','1997 BMW F650 ST','Motorcycles','01:32:00','Exoto Designs','178','66.92','99.89'),('S32_2206','1982 Ducati 996 R','Motorcycles','01:32:00','Gearbox Collectibles','9241','24.14','40.23'),('S32_2509','1954 Greyhound Scenicruiser','Trucks and Buses','01:32:00','Classic Metal Creations','2874','25.98','54.11'),('S32_3207','1950\'s Chicago Surface Lines Streetcar','Trains','01:32:00','Gearbox Collectibles','8601','26.72','62.14'),('S32_3522','1996 Peterbilt 379 Stake Bed with Outrigger','Trucks and Buses','01:32:00','Red Start Diecast','814','33.61','64.64'),('S32_4289','1928 Ford Phaeton Deluxe','Vintage Cars','01:32:00','Highway 66 Mini Classics','136','33.02','68.79'),('S32_4485','1974 Ducati 350 Mk3 Desmo','Motorcycles','01:32:00','Second Gear Diecast','3341','56.13','102.05'),('S50_1341','1930 Buick Marquette Phaeton','Vintage Cars','01:50:00','Studio M Art Models','7062','27.06','43.64'),('S50_1392','Diamond T620 Semi-Skirted Tanker','Trucks and Buses','01:50:00','Highway 66 Mini Classics','1016','68.29','115.75'),('S50_1514','1962 City of Detroit Streetcar','Trains','01:50:00','Classic Metal Creations','1645','37.49','58.58'),('S50_4713','2002 Yamaha YZR M1','Motorcycles','01:50:00','Autoart Studio Design','600','34.17','81.36'),('S700_1138','The Schooner Bluenose','Ships','0.527777777777778','Autoart Studio Design','1897','34','66.67'),('S700_1691','American Airlines: B767-300','Planes','0.527777777777778','Min Lin Diecast','5841','51.15','91.34'),('S700_1938','The Mayflower','Ships','0.527777777777778','Studio M Art Models','737','43.3','86.61'),('S700_2047','HMS Bounty','Ships','0.527777777777778','Unimax Art Galleries','3501','39.83','90.52'),('S700_2466','America West Airlines B757-200','Planes','0.527777777777778','Motor City Art Classics','9653','68.8','99.72'),('S700_2610','The USS Constitution Ship','Ships','0.527777777777778','Red Start Diecast','NULL',' NULL','NULL'),('S700_2824','1982 Camaro Z28','Classic Cars','01:18:00','Carousel DieCast Legends','6934','46.53','101.15'),('S700_2834','ATA: B757-300','Planes','0.527777777777778','Highway 66 Mini Classics','7106','59.33','118.65'),('S700_3167','F/A 18 Hornet 1/72','Planes','0.0916666666666667','Motor City Art Classics','551','54.4','80'),('S700_3505','The Titanic','Ships','0.527777777777778','Carousel DieCast Legends','1956','51.09','100.17'),('S700_3962','The Queen Mary','Ships','0.527777777777778','Welly Diecast Productions','5088','53.63','99.31'),('S700_4002','American Airlines: MD-11S','Planes','0.527777777777778','Second Gear Diecast','8820','36.27','74.03'),('S72_1253','Boeing X-32A JSF','Planes','0.0916666666666667','Motor City Art Classics','4857','32.77','49.66'),('S72_3212','Pont Yacht','Ships','0.0916666666666667','Unimax Art Galleries','414','33.3','54.6');


-- Print the first 5 entries of "employees" tables.
SELECT * FROM `employees` LIMIT 0, 5;

-- Print the first 5 entries of "offices" tables.
SELECT * FROM `offices` LIMIT 0, 5;

-- Print the first 5 entries of "customers" tables.
SELECT * FROM `customers` LIMIT 0, 5;

-- Print the first 5 entries of "orders" tables.
SELECT * FROM `orders` LIMIT 0, 5;

-- Print the first 5 entries of "orderdetails" tables.
SELECT * FROM `orderdetails` LIMIT 0, 5;

-- Print the first 5 entries of "payments" tables.
SELECT * FROM `payments` LIMIT 0, 5;

-- Print the first 5 entries of "products" tables.
SELECT * FROM `products` LIMIT 0, 5;

-- Print the first 5 entries of "productlines" tables.
SELECT * FROM `productlines` LIMIT 0, 5;


/* Questions: 
Q-1: The first step of every RDBMS activity is to create a star schema for a particular data set. You
have a total of eight tables as described earlier, and it is essential for you to create an entity
relational diagram (ERD) in order to relate the various tables. Which of the following is the most
appropriate relation among ‘employees’, ‘customers’, ‘orders’ and ‘offices’ based on the
problem statement?

A. The ‘customers’ table has only a one-to-many/zero relation with the 'orders' and
'employees' tables. Also, the 'offices' table has only a one-to-many/zero relation with
the 'employees' table.
B. The 'customers' table has only a one-to-many/zero relation with the 'orders' table. The
'employees' table has one/zero to many/zero relation with the 'customers' table. Also,
the 'offices' table has only a one-to-many/zero relation with the 'employees' table.
C. The 'orders' table has only a one-to-many/zero relation with the 'customers' table. The
'employees' table has one/zero to many/zero relation with the 'customers' table. Also,
the 'employees' table has only a one-to-many/zero relation with the 'offices' table.
D. The 'orders' table has only a one-to-many/zero relation with the 'customers' table. The
'employees' table has one/zero to many/zero relation with the 'customers' table. Also,
the 'offices' table has only a one-to-many/zero relation with the 'employees' table.

Question 1: Entity Relationship Diagram (ERD)
Question: What is the most appropriate relation among employees, customers, orders, and offices?

Answer:B (customers table has a one-to-many/zero relation with the orders table.
employees table has one/zero to many/zero relation with the customers table. 
Offices table has one-to-many/zero relation with the employees table).


Q-2:Which of the following table names has a self-referential relationship based on the descriptions of columns of each table given in the problem statement?

A. customers
B. orders
C. employees
D. Offices

Answer: C (employees)
-- The employees table has a reportsTo column, pointing to the employeeNumber column in the same table.

Q-3:What is the foreign key in the customers table that relates to the employees table?

A. contactLastName
B. contactFirstname
C. country
D. salesRepEmployeeNumber

Answer:D (salesRepEmployeeNumber)
-- This column acts as the foreign key for the employeeNumber column in the employees table.
-- or
-- 'salesRepEmployeeNumber' is the foreign key in the 'customers' table, which acts as a unique identification for a particular employee in the 'employees' table.

Q-4: Match the following actions with the appropriate SQL commands presented in the table given below.

A. a-I, b-II, c-III, d-IV
B. a-IV, b-III, c-II, d-I
C. a-III, b-I, c-II, d-IV
D. a-III, b-IV, c-I, d-II

Answer: D

Q-5: Suppose you want to create a table named 'payments' in SQL with the two primary keys
'customerNumber' and 'checkNumber', as mentioned in the ERD. Which of the following
queries is the correct one to achieve this?

A. CREATE TABLE `payments` (
`customerNumber` int(11) NOT NULL,
`checkNumber` varchar(12) NOT NULL,
`paymentDate` datetime DEFAULT NULL,
`amount` decimal(12,2) DEFAULT NULL,
PRIMARY KEY (`customerNumber`,`checkNumber`)
CONSTRAINT `Check` FOREIGN KEY (`customerNumber`) REFERENCES `customers`
(`customerNumber`)
)
B. CREATE TABLE `payments` (
`customerNumber` int(11) NOT NULL,
`checkNumber` varchar(12) NOT NULL,
`paymentDate` datetime DEFAULT NULL,
`amount` decimal(12,2) DEFAULT NULL,
PRIMARY KEY (`customerNumber'),
PRIMARY KEY ('checkNumber`)
)
C. CREATE TABLE `payments` (
`customerNumber` int(11) NOT NULL,
`checkNumber` varchar(12) NOT NULL,
`paymentDate` datetime DEFAULT NULL,
`amount` decimal(12,2) DEFAULT NULL,
PRIMARY KEY (`checkNumber),
CONSTRAINT `Check` FOREIGN KEY (`customerNumber`) REFERENCES `customers`
(`customerNumber`)
)
D. CREATE TABLE `payments` (
`customerNumber` int(11) NOT NULL,
`checkNumber` varchar(12) NOT NULL,
`paymentDate` datetime DEFAULT NULL,
`amount` decimal(12,2) DEFAULT NULL,
PRIMARY KEY (`checkNumber),
)
 
Answer: A
Create payments Table
Query:
CREATE TABLE `payments` (
    `customerNumber` INT(11) NOT NULL,
    `checkNumber` VARCHAR(12) NOT NULL,
    `paymentDate` DATETIME DEFAULT NULL,
    `amount` DECIMAL(12, 2) DEFAULT NULL,
    PRIMARY KEY (`customerNumber`, `checkNumber`),
    CONSTRAINT `Check` FOREIGN KEY (`customerNumber`) REFERENCES `customers` (`customerNumber`)
);
-- This is the correct query to create a new table with two primary keys in a table. Also, the 'customerNumber' column is defined as the foreign key in this table.
*/

/* Q-6: You need to enter the following entries in the 'customers' table to proceed in this assignment.
(495,'Diecast Collectables','Franco','Valarie','Boston','MA','51003','USA','1188',85100),
(496,'Kelly\'s Gift Shop','Snowden','Tony','Auckland','NULL','NULL','New Zealand','1612',110000)
Which of the following commands can be used to enter the two rows that are given above in
the 'customers' table?

A. INSERT
B. UPDATE
C. ALTER
D. CREATE

Answer:A
 */
INSERT INTO customers
VALUES 
(495, 'Diecast Collectables', 'Franco', 'Valarie', 'Boston', 'MA', '51003', 'USA', '1188', 85100),
(496, 'Kelly''s Gift Shop', 'Snowden', 'Tony', 'Auckland', NULL, NULL, 'New Zealand', '1612', 110000);

/*
Q-7: Suppose you need to change the 'employees' table by inserting the job title 'Sales Rep' in which
the office code is equal to 4. Which of the following queries will you use to perform this operation?

A. modify employees
set jobTitle = 'Sales Rep'
where officeCode = 4;
B. update employees
set jobTitle = 'Sales Rep'
where officeCode = 4;
C. update employees
set jobTitle = 'Sales Rep'
where officeCode = ‘4’;
D. modify employees
set jobTitle = 'Sales Rep'
where officeCode = ‘4’;

Answer:B Update Employees Table
Query:
*/
UPDATE employees
SET jobTitle = 'Sales Rep'
WHERE officeCode = 4;

/*
Q-8:Delete the entries where the ‘productLine’ column has a value that equals to ‘Boats’ from the
'productlines' table. What is the number of rows in the 'productlines' table?

A. 8
B. 7
C. 6
D. 5

Answer: B (7 rows remain)
Delete Entries from Productlines Table
Query:
*/
DELETE FROM productlines
WHERE productLine = 'Boats';

/*
Q-9:Suppose you want to convert the data type of the 'quantityOrdered' column of the
'orderdetails' table from varchar into an integer. Which of the following code will you use to
convert the varchar data type into an integer?

A. alter table orderdetails change quantityOrdered int;
B. alter table orderdetails modify column quantityOrdered int;
C. alter table orderdetails change quantityOrdered from varchar to int;
D. alter table orderdetails modify column quantityOrdered from varchar to int;

Answer: B
Query:
*/
SELECT * from productlines;
ALTER TABLE orderdetails
MODIFY COLUMN quantityOrdered INT;

/*
Q-10: You have tables named 'employees' and 'customers'. Code in the MySQL workbench that you
have been provided and answer the following questions:
- Suppose you print the names of employees with the job title 'Sales Rep'. What is the
first name of the employee that appears first in this query?
- What is the total number of employees from the ‘employees’ table? Alias it as
'Total_Employees'.
- How many customers are based in Australia? Alias it as 'Australia_Customers'.

A. Leslie, 5, 23
B. Jennings, 23, 5
C. Leslie, 23, 5
D. Jennings, 23, 5

Answer: C (Leslie, 23, 5)
- Print the names of employees with the job title 'Sales Rep'. What is the first name that
Query:
*/ 
select * from customers;
-- Names of employees with job title 'Sales Rep'
SELECT firstName 
FROM employees 
WHERE jobTitle = 'Sales Rep';

-- Total number of employees
SELECT COUNT(*) AS Total_Employees 
FROM employees;

-- Customers based in Australia
SELECT COUNT(*) AS Australia_Customers 
FROM customers 
WHERE country = 'Australia';

/*
Q-11: You have tables named 'products' and 'orders'. Code in the MySQL workbench that you have
been provided and answer the following questions:
- Using the 'products' table, calculate the sum of quantity that is in stock for the product
vendor 'Red Start Diecast' and the product line 'Vintage Cars'.
- What is the total number of orders that have not been shipped yet from the 'orders'
table?

A. 22381, 303
B. 8073, 23
C. 22381, 23
D. 8073,303

Answer: B(8073, 23)
Query:
*/ 
 SELECT * FROM products;
 
-- Sum of quantity in stock for specific vendor and product line
SELECT SUM(quantityInStock) 
FROM products 
WHERE productVendor = 'Red Start Diecast' AND productLine = 'Vintage Cars';

-- Count the total number of orders that have not been shipped yet, from the 'orders' table.
SELECT COUNT(*) 
FROM orders 
WHERE status != 'Shipped';

/*
Q-12: How many entries does the 'orderdetails' table contain for which the ‘productCode’ starts with
S18 and the ‘priceEach’ is greater than 150?

A. 23
B. 24
C. 25
D. 26

Answer: D (26 entries)
Use the ‘like’ command to get the required result.
Query:
*/
SELECT COUNT(*) productCode from orderdetails
WHERE productCode LIKE 'S18%' AND priceEach > 150;
-- Or
SELECT COUNT(*) 
FROM orderdetails 
WHERE productCode LIKE 'S18%' AND priceEach > 150;

/*
Q-13: Which of the following are the top three countries (in order) that have the maximum number of customers?

A. Spain, Germany, France
B. USA, Germany, France
C. Germany, France, USA
D. Germany, France, Spain

Answer: B (USA, Germany, France)
Query:
*/
SELECT * FROM customers;
SELECT country, COUNT(customerNumber) AS Country_Wise_Customers 
FROM customers
GROUP BY country
ORDER BY Country_Wise_Customers DESC
LIMIT 3;

/*
Q-14: What is the average credit limit for Singapore from the 'customers' table?

A. 67233
B. 58600
C. 58500
D. 51700

Answer: A (67233)
Query:
*/
SELECT AVG(creditLimit) AS credit_limit 
FROM customers 
WHERE country = 'Singapore';

/*
Q-15: What is the total amount to be paid by the customer named 'Euro+ Shopping Channel'? You
need to refer to the 'customers' and 'payments' tables to answer this question.

A. 715738
B. 715749
C. 725750
D. 725738

Answer: A (715738)
Query:
--You need to query the 'customer' table to find the customer number corresponding to the 'Euro+ Shopping Channel' and then find the sum of the amount using the 'payment' table. Find the customer number using the 'customers' table.
*/
SELECT customerName, customerNumber FROM customers
WHERE customerName= 'Euro+ Shopping Channel';

-- Find the total amount for a particular customer using the 'payments' table.
SELECT customerNumber, SUM(amount) AS total_amount FROM payments
WHERE customerNumber= '141';
-- Or
SELECT SUM(amount) AS total_amount 
FROM payments 
WHERE customerNumber = (
    SELECT customerNumber 
    FROM customers 
    WHERE customerName = 'Euro+ Shopping Channel'
);

/* 
Q-16: Which month received the maximum aggregate payments from the customers along with the aggregated value of the payment of that month?

A. November, 1551479
B. December, 1645923
C. January, 397887
D. February, 503357

Answer: B (December, 1645923)
Query:
*/
SELECT MONTH(paymentDate) AS payment_month, SUM(amount) AS amount_sum
FROM payments
GROUP BY payment_month
ORDER BY amount_sum DESC;
-- Or
SELECT MONTH(paymentDate) AS payment_month, SUM(amount) AS total_amount 
FROM payments 
GROUP BY payment_month 
ORDER BY total_amount DESC 
LIMIT 1;

/*
Q-17: What is the shipped date of the maximum quantity that was ordered for the product name '1968 Ford Mustang'?
Hint: Apply a nested query on the 'products', 'orderdetails' and 'orders' tables.

A. 07-12-2003
B. 12-07-2003
C. 09-09-2003
D. 16-10-2003

Answer: C (09-09-2003)
Query:
*/
SELECT shippedDate FROM orders
WHERE orderNumber = (SELECT orderNumber
FROM
(SELECT quantityOrdered, orderNumber FROM orderdetails
WHERE productCode = (
SELECT productCode
FROM products
WHERE productName = '1968 Ford Mustang'
)
) max_order_no
WHERE quantityOrdered = (SELECT MAX(quantityOrdered)
FROM orderdetails
WHERE productCode = (SELECT productCode
FROM products
WHERE productName = '1968 Ford Mustang'
)
)
);

/*
Q-18:
 Inner join:  What is the average value of credit limit corresponds to the customers which have been contacted by the employees with their office located in “Tokyo” city? 
 -or
Multiple customers can be contacted by a single employee, as you can see in the schema given
below. You need to use the ‘inner join’ clause on the 'employees' and 'customers' tables.
What is the average value of the credit limit that corresponds to the customers who have been
contacted by the employees from the 'Tokyo' office after using the ‘inner join’ clause on these
two tables? Hint: You need to apply the nested query as well.

A. 80900
B. 81900
C. 82900
D. 83900

Answer: D (83900)
Query:
*/
SELECT AVG(creditLimit) 
FROM customers c 
INNER JOIN employees e
ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE officeCode = (SELECT officeCode
FROM offices
WHERE office_city = 'Tokyo'
 );
 
 /*
Q-19
How will you find the name of the customer who paid the lowest amount for the product? You
need to use the ‘outer join’ clause on the 'customers' and 'payments' tables and the ‘sum’
clause on the attribute ‘amount’ to answer this question.

A. Boards & Toy Co.
B. Auto-Moto Classics Inc.
C. Euro + Shopping Channel
D. Mini Gift Distributors Ltd.

Answer: A (Boards & Toy Co.)
Query:
*/
SELECT customerName, customerNumber, SUM(amount) AS sum_amount FROM payments p LEFT JOIN customers c
USING(customerNumber)
GROUP BY customerNumber
ORDER BY sum_amount asc
LIMIT 5; 
-- Or
SELECT customerName, SUM(amount) AS sum_amount 
FROM payments 
LEFT JOIN customers USING(customerNumber) 
GROUP BY customerNumber 
ORDER BY sum_amount ASC 
LIMIT 1;

/*
Q-20: In which office does the employee with the job title 'VP Marketing' work?

A. Boston
B. Tokyo
C. San Francisco
D. Sydney

Answer: C (San Francisco)
Query:
*/
SELECT office_city
FROM employees LEFT JOIN offices
USING(officeCode)
WHERE jobTitle = 'VP Marketing';
-- or
SELECT office_city 
FROM offices 
INNER JOIN employees USING(officeCode) 
WHERE jobTitle = 'VP Marketing';

/*
Q-21: What is the name of the customer who belongs to ‘France’ and has the maximum creditLimit
among the customers in France?

A. Muscle Machine Inc
B. Handji Gifts & Co
C. Mini Wheels Co.
© Copyright 2020. upGrad Education Pvt. Ltd. All rights reserved
D. Mini Gifts Distributors Ltd.

Answer: D (Mini Gifts Distributors Ltd.)
Query:
*/
SELECT customerName FROM customers
WHERE creditLimit = (
SELECT MAX(creditLimit)
FROM customers
WHERE country = 'USA'
GROUP BY country
);

/*
Q-22: What will be the remaining stock of the product code that equals ‘S18_1589’ if it is sent to all
the customers who have demanded it?

A. 8692
B. 9042
C. 350
D. None of the above

Answer: A (8692)
*/
-- Query- 1
SELECT quantityInStock
FROM products
WHERE productCode="S18_1589";
-- Query- 2
SELECT SUM(quantityOrdered)
FROM orderdetails
WHERE productCode="S18_1589";
-- And then take the difference.
-- Or precode
SELECT (quantityInStock - SUM(quantityOrdered)) AS remaining_stock 
FROM products 
JOIN orderdetails USING(productCode) 
WHERE productCode = 'S18_1589';

/*
Q-23: What is the average amount paid by the customer 'Mini Gifts Distributors Ltd.'?

A. 63212
B. 64910
C. 65000
D. 65910

Answer: B (64910)
Query:
*/
SELECT customerName, AVG(amount)
FROM payments p LEFT JOIN customers c
USING(customerNumber)
WHERE customerName = 'Mini Gifts Distributors Ltd.'
GROUP BY customerName;
-- Or
SELECT AVG(amount) AS avg_amount 
FROM payments 
WHERE customerNumber = (
    SELECT customerNumber 
    FROM customers 
    WHERE customerName = 'Mini Gifts Distributors Ltd.'
);


