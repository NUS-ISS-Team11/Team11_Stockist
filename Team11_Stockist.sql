CREATE DATABASE `Team11_Stockist` ;


use Team11_Stockist;
CREATE TABLE `user` (
  `userID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `userid_UNIQUE` (`userID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE `administrator` (
  `adminID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(10) unsigned NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phoneNumber` int(11) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`adminID`),
  UNIQUE KEY `adminID_UNIQUE` (`adminID`),
  UNIQUE KEY `userID_UNIQUE` (`userID`),
  CONSTRAINT `userID` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE `mechanic` (
  `mechID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(11) unsigned NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phoneNumber` int(11) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`mechID`),
  UNIQUE KEY `mechID_UNIQUE` (`mechID`),
  UNIQUE KEY `userID_UNIQUE` (`userID`),
  CONSTRAINT `user_ID` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE `supplier` (
  `supplierID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `supplierName` varchar(45) DEFAULT NULL,
  `contactNumber` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`supplierID`),
  UNIQUE KEY `supplierid_UNIQUE` (`supplierID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE `product` (
  `productId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `partNo` int(11) unsigned NOT NULL ,
  `productName` varchar(45) DEFAULT NULL,
  `unitPrice` float(11) DEFAULT NULL,
  `supplierID` int(11)unsigned NOT NULL,
`description` varchar(45) DEFAULT NULL,
`color` varchar(45) DEFAULT NULL,
`dimension` varchar(45) DEFAULT NULL,
`manufacturer` varchar(45) DEFAULT NULL,
`reorderLevel` varchar(45) DEFAULT NULL,
`minOrderQty` int(11) DEFAULT NULL,
`shelfLocation` varchar(100) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`productId`),
  UNIQUE KEY `productId_UNIQUE` (`productId`),
  KEY `supplierID_idx` (`supplierID`),
  CONSTRAINT `supplierID` FOREIGN KEY (`supplierID`) REFERENCES `supplier` (`supplierID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;


CREATE TABLE `reorder` (
  `orderID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `productId` int(11) unsigned NOT NULL,
  `partNo` int(11) unsigned NOT NULL,
  `supplierID` int(11) unsigned NOT NULL,
   `unitPrice` float(11) DEFAULT NULL,
   `minOrderQty` int(11) DEFAULT NULL,
   `reorderQty` int(11) DEFAULT NULL,
   `orderQty` int(11) DEFAULT NULL,
   `price` float(11) DEFAULT NULL,
    `orderDate` date DEFAULT NULL,
  PRIMARY KEY (`orderID`),
  UNIQUE KEY `orderID_UNIQUE` (`orderID`),
  KEY `productId_idx` (`productId`),
  CONSTRAINT `productId` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `transaction` (
  `transactionID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `productId` int(11) unsigned NOT NULL,
  `partNo` int(11) unsigned NOT NULL,
  `mechID` int(11) unsigned NOT NULL,
   `customerName` varchar(45) DEFAULT NULL,
   `usage` int(11) DEFAULT NULL,
    `dateofUsage` date DEFAULT NULL,
  PRIMARY KEY (`transactionID`),
  CONSTRAINT `FK_productId` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mechID` FOREIGN KEY (`mechID`) REFERENCES `mechanic` (`mechID`) ON DELETE CASCADE ON UPDATE CASCADE,
  UNIQUE KEY `transactionID_UNIQUE` (`transactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
