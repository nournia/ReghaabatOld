CREATE DATABASE IF NOT EXISTS reghaabat_library CHARACTER SET utf8 COLLATE utf8_general_ci;
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
	Licence VARCHAR(255) NULL DEFAULT NULL
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
	UserPass VARCHAR(255) DEFAULT NULL COLLATE 'ascii_bin',
	
	PRIMARY KEY (ID),
	UNIQUE KEY Email (Email),
	UNIQUE KEY NationalID (NationalID)
) AUTO_INCREMENT=1111;
CREATE TABLE permissions (
	TournamentID int(11) NOT NULL,
	UserID int(11) NOT NULL,
	Permission ENUM('user', 'operator', 'designer', 'manager', 'master', 'admin') NOT NULL, /* Ozv, Ozvyar, Tarrah, Tarrahyar, Modir, Modir-e-Samaneh */
	Accept tinyint(1) NOT NULL DEFAULT '0',
	PRIMARY KEY (TournamentID, UserID)
);
CREATE TABLE pictures (
	ID INT(11) NOT NULL,
	Kind ENUM('library', 'user', 'resource', 'match') NOT NULL,
	Picture MEDIUMBLOB NULL,
	PRIMARY KEY (ID)
);

/* matches */
CREATE TABLE ageclasses(
	ID TINYINT(4) NOT NULL,
	Title VARCHAR(255) NOT NULL,
	Description VARCHAR(255) NULL DEFAULT NULL,
	BeginAge TINYINT(4) NOT NULL,
	EndAge TINYINT(4) NOT NULL,
	PRIMARY KEY (ID)
);
CREATE TABLE authors (
	ID INT(11) NOT NULL AUTO_INCREMENT,
	Title VARCHAR(255) NOT NULL,
	Quality FLOAT NOT NULL DEFAULT '1',
	PRIMARY KEY (ID)
);
CREATE TABLE publications (
	ID INT(11) NOT NULL AUTO_INCREMENT,
	Title VARCHAR(255) NOT NULL,
	Quality FLOAT NOT NULL DEFAULT '1',
	PRIMARY KEY (ID)
);
CREATE TABLE resources (
	ID INT(11) NOT NULL AUTO_INCREMENT,
	CreatorID INT(11) NOT NULL,
	AuthorID INT(11) NULL DEFAULT NULL,
	PublicationID INT(11) NULL DEFAULT NULL,
	Quality FLOAT NOT NULL DEFAULT '1',
	Kind ENUM('book', 'audio', 'video', 'webpage') NOT NULL DEFAULT 'book',
	
	FileType VARCHAR(5) NULL DEFAULT NULL COLLATE 'ascii_bin',
	Content TEXT NULL,
	Link varchar(1000) NULL DEFAULT NULL COLLATE 'ascii_bin',

	Title VARCHAR(255) NOT NULL,
	Tags SET('') NULL DEFAULT NULL,
	AgeClass TINYINT(4) NULL DEFAULT NULL,
	PRIMARY KEY (ID)
);

CREATE TABLE matches (
	ID INT(11) NOT NULL AUTO_INCREMENT,
	ResourceID INT(11) NULL DEFAULT NULL,
	DesignerID INT(11) UNSIGNED NULL,
	Quality FLOAT NOT NULL DEFAULT '1',

	QPPaper TINYINT(4) NOT NULL,
	Content TEXT NULL,
	Configuration VARCHAR(50) NULL DEFAULT NULL,

	Title VARCHAR(255) NOT NULL,
	Tags SET('') NULL DEFAULT NULL,
	AgeClass TINYINT(4) NULL DEFAULT NULL,
	PRIMARY KEY (ID)
);
CREATE TABLE questions (
	MatchID INT(11) NOT NULL,
	ID TINYINT(4) NOT NULL,
	Question VARCHAR(1000) NOT NULL,
	Answer VARCHAR(1000) NULL DEFAULT NULL,
	Kind ENUM('write', 'choose') NOT NULL DEFAULT 'write',
	PRIMARY KEY (MatchID, ID)
);

INSERT INTO ageclasses	(ID, Title, Description, BeginAge, EndAge) VALUES 
						(0, 'الف', 'آمادگی و سال اول دبستان', 6, 7), 
						(1, 'ب', 'سال‌های دوم و سوم دبستان', 8, 9), 
						(2, 'ج', 'سال‌های چهارم و پنجم دبستان', 10, 11), 
						(3, 'د', 'سال‌های راهنمایی', 12, 14), 
						(4, 'ه', 'سال‌های دبیرستان', 15, 18);