CREATE DATABASE IF NOT EXISTS reghaabat_library CHARACTER SET utf8 COLLATE utf8_general_ci;
USE reghaabat_library;
-- 0 <= Rate >= 1, 0 <= Quality	

/* globals */
CREATE TABLE ageclasses(
	ID TINYINT(4) NOT NULL,
	Title VARCHAR(255) NOT NULL,
	Description VARCHAR(255) NULL DEFAULT NULL,
	BeginAge TINYINT(4) NOT NULL,
	EndAge TINYINT(4) NOT NULL,
	PRIMARY KEY (ID)
);
CREATE TABLE tags (
	ID TINYINT(4) NOT NULL,
	Title VARCHAR(50) NOT NULL,
	PRIMARY KEY (ID)
);
CREATE TABLE categories (
	ID TINYINT(4) NOT NULL,
	Title VARCHAR(255) NOT NULL,
	PRIMARY KEY (ID)
);

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
	PRIMARY KEY (ID, Kind)
);

/* matches */
CREATE TABLE authors (
	ID INT(11) NOT NULL AUTO_INCREMENT,
	Title VARCHAR(255) NOT NULL,
	Quality FLOAT NOT NULL DEFAULT '1',
	QWeight INT NOT NULL DEFAULT '0',
	PRIMARY KEY (ID)
);
CREATE TABLE publications (
	ID INT(11) NOT NULL AUTO_INCREMENT,
	Title VARCHAR(255) NOT NULL,
	Quality FLOAT NOT NULL DEFAULT '1',
	QWeight INT NOT NULL DEFAULT '0',
	PRIMARY KEY (ID)
);
CREATE TABLE resources (
	ID INT(11) NOT NULL AUTO_INCREMENT,
	CreatorID INT(11) NOT NULL,
	AuthorID INT(11) NULL DEFAULT NULL,
	PublicationID INT(11) NULL DEFAULT NULL,
	EntityID INT(11) NOT NULL,
	Quality FLOAT NOT NULL DEFAULT '1',
	QWeight INT NOT NULL DEFAULT '0',
	Kind ENUM('book', 'multimedia', 'webpage') NOT NULL DEFAULT 'book',
	Tags SET('') NULL DEFAULT NULL,
	Title VARCHAR(255) NOT NULL,
	AgeClass TINYINT(4) NULL DEFAULT NULL,
	PRIMARY KEY (ID)
);
CREATE TABLE books (
	ID INT(11) NOT NULL AUTO_INCREMENT,
	Pages INT NULL DEFAULT NULL,
	PRIMARY KEY (ID)
);
CREATE TABLE multimedias (
	ID INT(11) NOT NULL AUTO_INCREMENT,
	FileType VARCHAR(5) NULL DEFAULT NULL COLLATE 'ascii_bin',
	Duration INT NULL DEFAULT NULL COMMENT 'minutes',
	PRIMARY KEY (ID)
);
CREATE TABLE webpages (
	ID INT(11) NOT NULL AUTO_INCREMENT,
	Content TEXT NULL,
	Link varchar(1000) NULL DEFAULT NULL COLLATE 'ascii_bin',
	Words INT NULL DEFAULT NULL,
	PRIMARY KEY (ID)
);
CREATE TABLE matches (
	ID INT(11) NOT NULL AUTO_INCREMENT,
	DesignerID INT(11) NOT NULL,
	Quality FLOAT NOT NULL DEFAULT '1',
	QWeight INT NOT NULL DEFAULT '0',

	Title VARCHAR(255) NOT NULL,
	AgeClass TINYINT(4) NULL DEFAULT NULL,
	
	-- Question
	ResourceID INT(11) NULL DEFAULT NULL,
	QPPaper TINYINT(4) NULL DEFAULT NULL,
	
	-- Instruction
	CategoryID TINYINT(4) NULL DEFAULT NULL,
	Content TEXT NULL DEFAULT NULL,
	Configuration VARCHAR(50) NULL DEFAULT NULL,

	PRIMARY KEY (ID)
);
CREATE TABLE questions (
	MatchID INT(11) NOT NULL,
	ID TINYINT(4) NOT NULL,
	Question VARCHAR(1000) NOT NULL,
	Answer VARCHAR(1000) NULL DEFAULT NULL,
	ChoiceNumber TINYINT(4) NOT NULL DEFAULT '-1' COMMENT '-1: no choice, 0..n : valid',
	PRIMARY KEY (MatchID, ID)
);
CREATE TABLE choices (
	MatchID INT(11) NOT NULL,
	QuestionID TINYINT(4) NOT NULL,
	ID TINYINT(4) NOT NULL,
	Choice VARCHAR(255) DEFAULT NULL,
	PRIMARY KEY (MatchID, QuestionID, ID)
);

/* answers */
CREATE TABLE answers (
	ID INT(11) NOT NULL AUTO_INCREMENT,
	UserID INT(11) NOT NULL,
	MatchID INT(11) NOT NULL,
	DeliverTime DATETIME NULL DEFAULT NULL,
	ReceiveTime DATETIME NULL DEFAULT NULL,
	CorrectTime DATETIME NULL DEFAULT NULL,
	Rate FLOAT NULL DEFAULT NULL,
	Score SMALLINT(6) NULL DEFAULT NULL,
	PRIMARY KEY (ID)
);
CREATE TABLE subanswers (
	ID INT(11) NOT NULL AUTO_INCREMENT,
	AnswerID INT(11) NOT NULL,
	Question VARCHAR(1000) NOT NULL,
	Answer VARCHAR(1000) NOT NULL,
	Rate FLOAT DEFAULT NULL,
	Message TEXT COMMENT 'designer message to user',
	Attachment BLOB,
	PRIMARY KEY (ID)
);

/* tournaments */
CREATE TABLE supports (
	TournamentID INT(11) NOT NULL,
	MatchID INT(11) NOT NULL,
	CorrectorID INT(11) NOT NULL,
	CurrentState ENUM('active', 'disabled', 'imported') NOT NULL,
	PRIMARY KEY (TournamentID, MatchID)
);

/* data */
INSERT INTO ageclasses	(ID, Title, Description, BeginAge, EndAge) VALUES 
						(0, 'الف', 'آمادگی و سال اول دبستان', 6, 7), 
						(1, 'ب', 'سال‌های دوم و سوم دبستان', 8, 9), 
						(2, 'ج', 'سال‌های چهارم و پنجم دبستان', 10, 11), 
						(3, 'د', 'سال‌های راهنمایی', 12, 14), 
						(4, 'ه', 'سال‌های دبیرستان', 15, 18);
					
INSERT INTO categories 	(ID, Title) VALUES 
						(0, 'نقاشی'), 
						(1, 'رنگ‌آمیزی'), 
						(2, 'تحقیق'), 
						(3, 'آزمایش'), 
						(4, 'کاردستی');

INSERT INTO tags	 	(ID, Title) VALUES 
						(0, 'داستانی'), 
						(1, 'تاریخی'), 
						(2, 'علمی');