/* todos

// permissions
CREATE TABLE groupings (
  GroupID int(11) NOT NULL,
  UserID int(11) NOT NULL,
  Accept tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (GroupID,UserID),
  FOREIGN KEY (GroupID) REFERENCES groups(ID),
  FOREIGN KEY (UserID) REFERENCES users(ID)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

// sync process 
// log table (operatorid)
*/

SET sql_mode = 'ALLOW_INVALID_DATES';
/* 
	0 <= Rate >= 1 
	0 <= Quality	
*/

/* users */
CREATE TABLE libraries (
	ID INT(11) NOT NULL AUTO_INCREMENT,
	/* group */
	MasterID int(11) NOT NULL,
	Title VARCHAR(255) NOT NULL,
	Description varchar(1000) DEFAULT NULL,
	Active tinyint(1) NOT NULL DEFAULT '0',
  
	/* library */
	UniqueID CHAR(40) NOT NULL,
	ServerID CHAR(32) NULL DEFAULT NULL,
	Licence VARCHAR(255) NULL DEFAULT NULL,
	SyncTime DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (ID)
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
	Email VARCHAR(255) NOT NULL COLLATE 'ascii_bin',
	UserName VARCHAR(50) NOT NULL,
	UserPass VARCHAR(50) NOT NULL,
	Permission VARCHAR(255) NULL DEFAULT NULL,
	UpdateTime DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (ID),
	UNIQUE KEY UserName (UserName)
);

/* transactions */
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

CREATE TABLE payments (
	ID int(11) NOT NULL AUTO_INCREMENT,
	TournamentID INT(11) NOT NULL,
	PayerID INT(11) NOT NULL,
	UserID INT(11) NOT NULL,
	Payment SMALLINT(6) NOT NULL,
	PayTime DATETIME NOT NULL,
	PRIMARY KEY (ID)
);
CREATE TABLE messages (
	ID int(11) NOT NULL AUTO_INCREMENT,
	SenderID int(11) NOT NULL,
	ReceiverID int(11) NOT NULL,
	Content TEXT NULL,
	SendTime DATETIME NOT NULL,
	ViewTime DATETIME DEFAULT NULL,
	PRIMARY KEY (ID),
);

/* globals */
CREATE TABLE sentences (
	ID INT(11) NOT NULL AUTO_INCREMENT,
	Sentence VARCHAR(255) NOT NULL,
	UpdateTime DATETIME NOT NULL,
	PRIMARY KEY (ID)
);
CREATE TABLE categories (
	ID TINYINT(4) NOT NULL,
	Title VARCHAR(255) NOT NULL,
	Description VARCHAR(255) NULL DEFAULT NULL,
	BeginAge TINYINT(4) NOT NULL,
	EndAge TINYINT(4) NOT NULL,
	UpdateTime DATETIME NOT NULL,
	PRIMARY KEY (ID)
);
CREATE TABLE authors (
	ID INT(11) NOT NULL AUTO_INCREMENT,r
	Title VARCHAR(255) NOT NULL,
	Quality FLOAT NOT NULL DEFAULT '1',
	UpdateTime DATETIME NOT NULL,
	PRIMARY KEY (ID)
);
CREATE TABLE publications (
	ID INT(11) NOT NULL AUTO_INCREMENT,
	Title VARCHAR(255) NOT NULL,
	Quality FLOAT NOT NULL DEFAULT '1',
	UpdateTime DATETIME NOT NULL,
	PRIMARY KEY (ID)
);
/* global match
CREATE TABLE tags (
	Kind TINYINT(4) NOT NULL,
	ID TINYINT(4) NOT NULL,
	Caption VARCHAR(50) NOT NULL,
	UpdateTime DATETIME NOT NULL,
	PRIMARY KEY (Kind, ID)
);
CREATE TABLE opencategories (
	TournamentID INT(11) NOT NULL,
	ID TINYINT(4) NOT NULL,
	Caption VARCHAR(255) NOT NULL,
	SyncTime DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (TournamentID, ID)
);
*/

/* matches */
CREATE TABLE resources (
	ID INT(11) NOT NULL AUTO_INCREMENT,
	CreatorID INT(11) NOT NULL,
	AuthorID INT(11) NULL DEFAULT NULL,
	PublicationID INT(11) NULL DEFAULT NULL,
	Quality FLOAT NOT NULL DEFAULT '1',
	Kind ENUM('') NOT NULL DEFAULT '',
	Link varchar(1000) CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL,

	Title VARCHAR(255) NOT NULL,
	Tags SET('') NULL DEFAULT NULL,
	Category TINYINT(4) NULL DEFAULT NULL,
	UpdateTime DATETIME NULL DEFAULT NULL,
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
	Category TINYINT(4) NULL DEFAULT NULL,
	UpdateTime DATETIME NULL DEFAULT NULL,
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
CREATE TABLE choices (
	MatchID INT(11) NOT NULL,
	ID TINYINT(4) NOT NULL,
	AnswerNumber TINYINT(4) NOT NULL COMMENT '1..4',
	Answer1 VARCHAR(255) DEFAULT NULL,
	Answer2 VARCHAR(255) DEFAULT NULL,
	Answer3 VARCHAR(255) DEFAULT NULL,
	Answer4 VARCHAR(255) DEFAULT NULL,
	PRIMARY KEY (MatchID, ID),
);

CREATE TABLE tournaments (
	ID int(11) NOT NULL AUTO_INCREMENT,
	Title VARCHAR(255) NOT NULL,
	StartTime DATETIME NOT NULL,
	Active TINYINT(1) NOT NULL,
	CreatorID int(11) NOT NULL,
	UserPayTransform FLOAT NOT NULL,
	DesignerPayTransform FLOAT NOT NULL,
	OpenUser tinyint(1) NOT NULL DEFAULT '1',
	Address VARCHAR(1000) DEFAULT NULL,
	PayUnit VARCHAR(100) NOT NULL,
	PRIMARY KEY (ID),
);

CREATE TABLE supports (
	TournamentID INT(11) NOT NULL,
	MatchID INT(11) NOT NULL,
	CorrectorID INT(11) NOT NULL,
	CurrentState ENUM('active', 'disable', 'imported') NOT NULL,
	PRIMARY KEY (TournamentID, MatchID)
);

CREATE TABLE follows (
  TournamentID int(11) NOT NULL,
  FollowedID int(11) NOT NULL,
  PRIMARY KEY (TournamentID,FollowedID),
);

CREATE TABLE scores (
  UserID int(11) NOT NULL,
  TournamentID int(11) NOT NULL,
  Score int(11) NOT NULL DEFAULT '0',
  ParticipateTime DATETIME NOT NULL,
  Confirm tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (UserID, TournamentID)
);

CREATE TABLE open_scores (
	ID INT(11) NOT NULL,
	UserID INT(11) NOT NULL,
	Title VARCHAR(255) NOT NULL,
	Score SMALLINT(6) NOT NULL,
	ScoreTime DATETIME NOT NULL,
	PRIMARY KEY (ID)
);

CREATE TABLE pictures (
	ID INT(11) NOT NULL,
	Picture MEDIUMBLOB NULL,
	Kind ENUM('library', 'user', 'resource', 'match') NOT NULL,
	PRIMARY KEY (ID)
);
