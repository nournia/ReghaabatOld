CREATE DATABASE IF NOT EXISTS reghaabat_library CHARACTER SET utf8 COLLATE utf8_bin;
USE reghaabat_library;
-- 0 <= Rate >= 1, 0 <= Quality	

/* users */
CREATE TABLE library (
	/* group */
	MasterID int(11) NOT NULL,
	Title VARCHAR(255) NOT NULL,
	Description VARCHAR(1000) DEFAULT NULL,
	Active tinyint(1) NOT NULL DEFAULT '0',
  
	/* library */
	UniqueID CHAR(40) NOT NULL,
	ServerID CHAR(32) NULL DEFAULT NULL,
	Licence VARCHAR(255) NULL DEFAULT NULL,
	
	SyncTime DATETIME NULL DEFAULT NULL,
	CAS TINYINT(1) NOT NULL DEFAULT '1'
);
CREATE TABLE users (
	ID INT(11) NOT NULL AUTO_INCREMENT,
	NationalID INT(11) NOT NULL,
	FirstName VARCHAR(255) NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	BirthDate DATE NOT NULL,
	Address VARCHAR(255) NULL DEFAULT NULL,
	Phone VARCHAR(50) NULL DEFAULT NULL,
	Gender ENUM('male','female') NOT NULL,
	RegisterTime DATETIME NULL DEFAULT NULL,
	Description VARCHAR(255) NULL DEFAULT NULL,
	Score INT NOT NULL DEFAULT '0',
	CorrectionTime INT(11) NOT NULL DEFAULT '0' COMMENT 'Minute',
	Email VARCHAR(255) DEFAULT NULL COLLATE 'ascii_bin',
	UserPass VARCHAR(255) DEFAULT NULL 'ascii_bin',
	
	SyncTime DATETIME NULL DEFAULT NULL,
	CAS TINYINT(1) NOT NULL DEFAULT '1',
	
	PRIMARY KEY (ID),
	UNIQUE KEY Email (Email),
	UNIQUE KEY NationalID (NationalID)
) AUTO_INCREMENT=1111;
CREATE TABLE permissions (
	TournamentID int(11) NOT NULL,
	UserID int(11) NOT NULL,
	Permission ENUM('operator', 'designer', 'manager', 'master', 'admin') NOT NULL, /* Ozvyar, Tarrah, Tarrahyar, Modir, Modir-e-Samaneh */
	Accept tinyint(1) NOT NULL DEFAULT '0',
	PRIMARY KEY (TournamentID, UserID)
);
CREATE TABLE pictures (
	ID INT(11) NOT NULL,
	Kind ENUM('library', 'user', 'resource', 'match') NOT NULL,
	Picture MEDIUMBLOB NULL,
	PRIMARY KEY (ID)
);
