DELIMITER $$
CREATE DATABASE IF NOT EXISTS reghaabat_library CHARACTER SET utf8 COLLATE utf8_general_ci;
USE reghaabat_library;
-- 0 <= Rate <= 1, 0 <= Quality	

/* tables */
-- globals 
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

-- users
CREATE TABLE library (
	-- group
	MasterID int(11) NOT NULL,
	Title VARCHAR(255) NOT NULL,
	Description VARCHAR(1000) DEFAULT NULL,
	Active tinyint(1) NOT NULL DEFAULT '0',
  
	-- library
	UniqueID CHAR(40) NOT NULL,
	ServerID CHAR(32) NULL DEFAULT NULL,
	Licence VARCHAR(255) NULL DEFAULT NULL,
	SyncTime DATETIME NULL DEFAULT NULL
);
CREATE TABLE users (
	ID INT(11) NOT NULL AUTO_INCREMENT,
	GID INT(11) NULL DEFAULT NULL,
	NationalID INT(11) NOT NULL,
	Quality INT(11) NOT NULL DEFAULT '0',
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
	UserPass CHAR(40) DEFAULT NULL COLLATE 'ascii_bin',
	
	PRIMARY KEY (ID),
	UNIQUE KEY Email (Email),
	UNIQUE KEY NationalID (NationalID)
) AUTO_INCREMENT=1111;
CREATE TABLE permissions (
	ID INT(11) NOT NULL AUTO_INCREMENT,
	GID INT(11) NULL DEFAULT NULL,
	TournamentID int(11) NOT NULL,
	UserID int(11) NOT NULL,
	Permission ENUM('user', 'operator', 'designer', 'manager', 'master', 'admin') NOT NULL, /* Ozv, Ozvyar, Tarrah, Tarrahyar, Modir, Modir-e-Samaneh */
	Accept tinyint(1) NOT NULL DEFAULT '0',
	PRIMARY KEY (ID),
	FOREIGN KEY (UserID) REFERENCES users(ID),
	FOREIGN KEY (TournamentID) REFERENCES tournaments(ID)
);
CREATE TABLE pictures (
	ID INT(11) NOT NULL AUTO_INCREMENT,
	GID INT(11) NULL DEFAULT NULL,
	ReferenceID INT(11) NOT NULL,
	Kind ENUM('library', 'user', 'resource', 'match') NOT NULL,
	Picture MEDIUMBLOB NULL,
	PRIMARY KEY (ID, Kind)
);

-- matches 
CREATE TABLE authors (
	ID INT(11) NOT NULL AUTO_INCREMENT,
	GID INT(11) NULL DEFAULT NULL,
	Quality INT(11) NOT NULL DEFAULT '0',
	Title VARCHAR(255) NOT NULL,
	PRIMARY KEY (ID)
);
CREATE TABLE publications (
	ID INT(11) NOT NULL AUTO_INCREMENT,
	GID INT(11) NULL DEFAULT NULL,
	Quality INT(11) NOT NULL DEFAULT '0',
	Title VARCHAR(255) NOT NULL,
	PRIMARY KEY (ID)
);
CREATE TABLE resources (
	ID INT(11) NOT NULL AUTO_INCREMENT,
	GID INT(11) NULL DEFAULT NULL,
	CreatorID INT(11) NOT NULL,
	AuthorID INT(11) NULL DEFAULT NULL,
	PublicationID INT(11) NULL DEFAULT NULL,
	EntityID INT(11) NOT NULL,
	Quality INT(11) NOT NULL DEFAULT '0',
	Kind ENUM('book', 'multimedia', 'webpage') NOT NULL DEFAULT 'book',
	Tags SET('') NULL DEFAULT NULL,
	Title VARCHAR(255) NOT NULL,
	AgeClass TINYINT(4) NULL DEFAULT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (CreatorID) REFERENCES users(ID),
	FOREIGN KEY (AuthorID) REFERENCES authors(ID),
	FOREIGN KEY (PublicationID) REFERENCES publications(ID),
	FOREIGN KEY (AgeClass) REFERENCES ageclasses(ID)
);
CREATE TABLE books (
	ID INT(11) NOT NULL AUTO_INCREMENT,
	GID INT(11) NULL DEFAULT NULL,
	Pages INT NULL DEFAULT NULL,
	PRIMARY KEY (ID)
);
CREATE TABLE multimedias (
	ID INT(11) NOT NULL AUTO_INCREMENT,
	GID INT(11) NULL DEFAULT NULL,
	FileType VARCHAR(5) NULL DEFAULT NULL COLLATE 'ascii_bin',
	Duration INT NULL DEFAULT NULL COMMENT 'minutes',
	PRIMARY KEY (ID)
);
CREATE TABLE webpages (
	ID INT(11) NOT NULL AUTO_INCREMENT,
	GID INT(11) NULL DEFAULT NULL,
	Content TEXT NULL,
	Link varchar(1000) NULL DEFAULT NULL COLLATE 'ascii_bin',
	Words INT NULL DEFAULT NULL,
	PRIMARY KEY (ID)
);
CREATE TABLE matches (
	ID INT(11) NOT NULL AUTO_INCREMENT,
	GID INT(11) NULL DEFAULT NULL,
	DesignerID INT(11) NOT NULL,
	Quality INT(11) NOT NULL DEFAULT '0',

	Title VARCHAR(255) NOT NULL,
	AgeClass TINYINT(4) NULL DEFAULT NULL,
	
	-- Question
	ResourceID INT(11) NULL DEFAULT NULL,
	
	-- Instruction
	CategoryID TINYINT(4) NULL DEFAULT NULL,
	Content TEXT NULL DEFAULT NULL,
	Configuration VARCHAR(50) NULL DEFAULT NULL,

	PRIMARY KEY (ID),
	FOREIGN KEY (DesignerID) REFERENCES users(ID),
	FOREIGN KEY (ResourceID) REFERENCES resources(ID),
	FOREIGN KEY (CategoryID) REFERENCES categories(ID),
	FOREIGN KEY (AgeClass) REFERENCES ageclasses(ID)
);
CREATE TABLE questions (
	ID INT(11) NOT NULL AUTO_INCREMENT,
	GID INT(11) NULL DEFAULT NULL,
	MatchID INT(11) NOT NULL,
	Question VARCHAR(1000) NOT NULL,
	Answer VARCHAR(1000) NULL DEFAULT NULL,
	ChoiceNumber TINYINT(4) NOT NULL DEFAULT '-1' COMMENT '-1: no choice, 0..n : valid',
	PRIMARY KEY (ID),
	FOREIGN KEY (MatchID) REFERENCES matches(ID)
);
CREATE TABLE choices (
	ID INT(11) NOT NULL AUTO_INCREMENT,
	GID INT(11) NULL DEFAULT NULL,
	QuestionID TINYINT(4) NOT NULL,
	Choice VARCHAR(255) DEFAULT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (QuestionID) REFERENCES questions(ID)
);

-- answers 
CREATE TABLE answers (
	ID INT(11) NOT NULL AUTO_INCREMENT,
	GID INT(11) NULL DEFAULT NULL,
	UserID INT(11) NOT NULL,
	MatchID INT(11) NOT NULL,
	DeliverTime DATETIME NULL DEFAULT NULL,
	ReceiveTime DATETIME NULL DEFAULT NULL,
	CorrectTime DATETIME NULL DEFAULT NULL,
	Rate FLOAT NULL DEFAULT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (UserID) REFERENCES users(ID),
	FOREIGN KEY (MatchID) REFERENCES matches(ID)
);
CREATE TABLE subanswers (
	ID INT(11) NOT NULL AUTO_INCREMENT,
	GID INT(11) NULL DEFAULT NULL,
	AnswerID INT(11) NOT NULL,
	Question VARCHAR(1000) NOT NULL,
	Answer VARCHAR(1000) NOT NULL,
	Rate FLOAT DEFAULT NULL,
	Message TEXT COMMENT 'designer message to user',
	Attachment BLOB,
	PRIMARY KEY (ID),
	FOREIGN KEY (AnswerID) REFERENCES answers(ID)
);

/* tournaments */
CREATE TABLE tournaments (
	ID int(11) NOT NULL AUTO_INCREMENT,
	GID INT(11) NULL DEFAULT NULL,
	Title VARCHAR(255) NOT NULL,
	StartTime DATETIME NOT NULL,
	Active TINYINT(1) NOT NULL,
	CreatorID int(11) NOT NULL,
	UserPayTransform FLOAT NOT NULL,
	DesignerPayTransform FLOAT NOT NULL,
	OpenUser tinyint(1) NOT NULL DEFAULT '1',
	Address VARCHAR(1000) DEFAULT NULL,
	PayUnit VARCHAR(100) NOT NULL,
	PRIMARY KEY (ID)
);
CREATE TABLE follows (
	ID int(11) NOT NULL AUTO_INCREMENT,
	GID INT(11) NULL DEFAULT NULL,
	TournamentID INT(11) NOT NULL,
	FollowedID INT(11) NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (TournamentID) REFERENCES tournaments(ID),
	FOREIGN KEY (FollowedID) REFERENCES tournaments(ID)
);
CREATE TABLE supports (
	ID int(11) NOT NULL AUTO_INCREMENT,
	GID INT(11) NULL DEFAULT NULL,
	TournamentID INT(11) NOT NULL,
	MatchID INT(11) NOT NULL,
	CorrectorID INT(11) NOT NULL,
	CurrentState ENUM('active', 'disabled', 'imported') NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (TournamentID) REFERENCES tournaments(ID),
	FOREIGN KEY (MatchID) REFERENCES matches(ID)
);
CREATE TABLE scores (
	ID int(11) NOT NULL AUTO_INCREMENT,
	GID INT(11) NULL DEFAULT NULL,
	UserID INT(11) NOT NULL,
	TournamentID INT(11) NOT NULL,
	Score INT(11) NOT NULL DEFAULT '0',
	ParticipateTime DATETIME NOT NULL,
	Confirm TINYINT(1) NOT NULL DEFAULT '1',
	PRIMARY KEY (ID),
	FOREIGN KEY (UserID) REFERENCES users(ID),
	FOREIGN KEY (TournamentID) REFERENCES tournaments(ID)
);
CREATE TABLE payments (
	ID int(11) NOT NULL AUTO_INCREMENT,
	GID INT(11) NULL DEFAULT NULL,
	TournamentID INT(11) NOT NULL,
	UserID INT(11) NOT NULL,
	Payment SMALLINT(6) NOT NULL,
	PayTime DATETIME NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (UserID) REFERENCES users(ID),
	FOREIGN KEY (TournamentID) REFERENCES tournaments(ID)
);

-- open_scores 
CREATE TABLE open_categories (
	ID int(11) NOT NULL AUTO_INCREMENT,
	GID INT(11) NULL DEFAULT NULL,
	TournamentID INT(11) NOT NULL,
	Title VARCHAR(255) NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (TournamentID) REFERENCES tournaments(ID)
);
CREATE TABLE open_scores (
	ID INT(11) NOT NULL AUTO_INCREMENT,
	GID INT(11) NULL DEFAULT NULL,
	TournamentID INT(11) NOT NULL,
	UserID INT(11) NOT NULL,
	CategoryID TINYINT(4) NOT NULL,
	Title VARCHAR(255) NOT NULL,
	Score SMALLINT(6) NOT NULL,
	ScoreTime DATETIME NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (UserID) REFERENCES users(ID),
	FOREIGN KEY (CategoryID) REFERENCES open_categories(D)
);

-- log
CREATE TABLE changes (
	TableName VARCHAR(30) NOT NULL,
	ID INT(11) NOT NULL,
	SubjectID INT(11) NOT NULL,
	Kind ENUM('insert', 'update', 'delete') NOT NULL DEFAULT 'insert',
	EventTime DATETIME NOT NULL,
	FOREIGN KEY (SubjectID) REFERENCES users(ID)	
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

/* functions */
CREATE FUNCTION getAgeClass(birth DATE) RETURNS INT(11) DETERMINISTIC
BEGIN
	DECLARE i, b, e INT;
	DECLARE y INT DEFAULT TIMESTAMPDIFF(YEAR, birth, NOW());
	DECLARE r INT DEFAULT -1;

	DECLARE done INT DEFAULT 0;
	DECLARE cur CURSOR FOR SELECT ID, BeginAge, EndAge FROM ageclasses;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
	OPEN cur;
	
	age_loop: LOOP
		FETCH cur INTO i, b, e;
		IF done THEN
			LEAVE age_loop;
		ELSEIF y >= b AND y <= e THEN
			SET r = i;
			LEAVE age_loop;
		END IF;
	END LOOP;

	CLOSE cur;	
	RETURN r;
END$$

/* procedures */
CREATE PROCEDURE prepareMatchScores()
BEGIN
	DROP TEMPORARY TABLE IF EXISTS matchScores;
	CREATE TEMPORARY TABLE matchScores AS
	SELECT matches.ID AS MatchID, ROUND(100 * (matches.AgeClass + IFNULL(LOG(IFNULL(matches.Quality, 0) + IFNULL(users.Quality, 0) + IFNULL(resources.Quality, 0) + IFNULL(authors.Quality, 0) + IFNULL(publications.Quality, 0)), 0))) AS Score
	FROM (matches LEFT JOIN users ON matches.DesignerID = users.ID) LEFT JOIN ((resources LEFT JOIN authors ON resources.AuthorID = authors.ID) LEFT JOIN publications ON resources.PublicationID = publications.ID) ON matches.ResourceID = resources.ID;
END$$
CREATE PROCEDURE prepareUserMatchScores(IN UID INT)
BEGIN
	DROP TEMPORARY TABLE IF EXISTS userMatchScores, supported, followed, newrows;
	CREATE TEMPORARY TABLE supported (TID INT, FID INT);
	CREATE TEMPORARY TABLE followed (TID INT, FID INT);
	CREATE TEMPORARY TABLE newrows (TID INT, FID INT);
	INSERT INTO supported SELECT TournamentID, TournamentID FROM scores WHERE UserID = UID;
	
	followLoop: LOOP
		DELETE FROM followed; 
		INSERT INTO followed (TID, FID) SELECT supported.TID, follows.FollowedID FROM follows INNER JOIN supported ON follows.TournamentID = supported.FID;
		DELETE FROM newrows; 
		
		INSERT INTO newrows (TID, FID) SELECT followed.TID, followed.FID FROM followed WHERE CONCAT(followed.TID, '-', followed.FID) NOT IN (SELECT CONCAT(supported.TID, '-', supported.FID) FROM supported);
		
		IF (SELECT TID FROM newrows LIMIT 1) IS NOT NULL THEN
			INSERT INTO supported (TID, FID) SELECT TID, FID FROM newrows; 
		ELSE
			LEAVE followLoop;
		END IF;
	END LOOP followLoop;
	
	CALL prepareMatchScores;
	
	CREATE TEMPORARY TABLE userMatchScores AS
	SELECT supported.TID AS TournamentID, matches.ID AS MatchID, ROUND(matchScores.Score * tournaments.UserPayTransform) AS UserScore, ROUND(matchScores.Score * tournaments.DesignerPayTransform) AS DesignerScore
	FROM supported
		INNER JOIN tournaments ON supported.TID = tournaments.ID
		INNER JOIN supports ON supported.FID = supports.TournamentID
		INNER JOIN matches ON supports.MatchID = matches.ID
		INNER JOIN matchScores ON matches.ID = matchScores.MatchID;		
	
	DROP TEMPORARY TABLE supported, followed, newrows, matchScores;
END$$
CREATE PROCEDURE updateQualities(IN iMatchID INT) -- bug: follow support
BEGIN
	DECLARE qBefore, qAfter, mDesignerID, mResourceID, mAuthorID, mPublicationID INT;
	SELECT Quality, DesignerID, ResourceID INTO qBefore, mDesignerID, mResourceID FROM matches WHERE ID = iMatchID;
	SELECT COUNT(TournamentID) INTO qAfter FROM supports WHERE MatchID = iMatchID;
	
	UPDATE matches SET Quality = qAfter WHERE ID = iMatchID;
	UPDATE users SET Quality = Quality - qBefore + qAfter WHERE ID = mDesignerID;

	IF mResourceID IS NOT NULL THEN
		SELECT AuthorID, PublicationID INTO mAuthorID, mPublicationID FROM resources WHERE ID = mResourceID;
		UPDATE resources SET Quality = Quality - qBefore + qAfter WHERE ID = mResourceID;
		UPDATE authors SET Quality = Quality - qBefore + qAfter WHERE ID = mAuthorID;
		UPDATE publications SET Quality = Quality - qBefore + qAfter WHERE ID = mPublicationID;
	END IF;	
END$$

/* triggers */
CREATE TRIGGER trgAnswerUpdate AFTER UPDATE ON answers
FOR EACH ROW BEGIN
	IF NEW.Rate IS NOT NULL THEN
		CALL prepareUserMatchScores(NEW.UserID);
		
		UPDATE scores, userMatchScores SET scores.Score = scores.Score + userMatchScores.UserScore * (NEW.Rate - IFNULL(OLD.Rate, 0))
			WHERE scores.UserID = NEW.UserID AND scores.TournamentID = userMatchScores.TournamentID AND NEW.MatchID = userMatchScores.MatchID;
	
		IF OLD.Rate IS NULL THEN
			UPDATE scores, userMatchScores, matches SET Score = Score + userMatchScores.DesignerScore
				WHERE matches.ID = userMatchScores.MatchID AND scores.UserID = matches.DesignerID AND scores.TournamentID = userMatchScores.TournamentID AND NEW.MatchID = userMatchScores.MatchID;
		END IF;
		
		DROP TEMPORARY TABLE userMatchScores;
		
		UPDATE users, scores SET users.Score = scores.Score 
			WHERE users.ID = NEW.UserID AND scores.UserID = NEW.UserID AND scores.TournamentID = 1;
	END IF;
END$$
CREATE TRIGGER trgSupportInsert AFTER INSERT ON supports
FOR EACH ROW BEGIN
	CALL updateQualities(NEW.MatchID);
END$$
CREATE TRIGGER trgSupportDelete AFTER DELETE ON supports
FOR EACH ROW BEGIN
	CALL updateQualities(OLD.MatchID);
END$$

/*
CREATE PROCEDURE setAnswerScore(IN AID INT)
BEGIN
  DECLARE avgRate, crrTime FLOAT;
  DECLARE correctedBefore, correctedAfter INT;
  DECLARE lastCorrectTime DATETIME;
  IF (SELECT ID FROM subanswers WHERE AnswerID = AID LIMIT 1) IS NOT NULL AND (SELECT ID FROM subanswers WHERE AnswerID = AID AND Rate IS NULL LIMIT 1) IS NULL THEN
    SELECT AVG(Rate)/4 INTO avgRate FROM subanswers WHERE AnswerID = AID;
    SELECT CorrectTime INTO lastCorrectTime FROM answers WHERE ID = AID;

    SELECT Count(ID) INTO correctedBefore FROM answers WHERE CorrectTime IS NOT NULL;
    UPDATE answers SET Score = avgRate, CorrectTime = NOW() WHERE answers.ID = AID;
    SELECT Count(ID) INTO correctedAfter FROM answers WHERE CorrectTime IS NOT NULL;

    UPDATE groups, answers, matches SET groups.CorrectionTime = (groups.CorrectionTime * correctedBefore + TIMESTAMPDIFF(MINUTE, answers.AnswerTime, NOW()) - (IF(lastCorrectTime IS NULL, 0, TIMESTAMPDIFF(MINUTE, answers.AnswerTime, lastCorrectTime)))) / correctedAfter
      WHERE answers.ID = AID AND answers.MatchID = matches.ID AND groups.ID IN (SELECT DISTINCT groupings.GroupID FROM groupings WHERE groupings.UserID = matches.DesignerID);
    END IF;
END$$

DELIMITER //
//
CREATE TRIGGER trgUserUpdate AFTER UPDATE ON users
FOR EACH ROW
BEGIN
  IF new.Score <> old.Score THEN
    UPDATE groups SET groups.Score = groups.Score + new.Score - old.Score
      WHERE groups.ID IN (SELECT DISTINCT groupings.GroupID FROM groupings WHERE groupings.UserID = new.ID AND groupings.Accept = 1);
  END IF;
END
//
CREATE TRIGGER trgGroupingAccept AFTER UPDATE ON groupings
FOR EACH ROW BEGIN
  UPDATE groups, users SET groups.Score = groups.Score + users.Score 
    WHERE groups.ID = new.GroupID AND users.ID = new.UserID AND new.Accept = 1;
END
//
CREATE TRIGGER trgGroupingDelete AFTER DELETE ON groupings
FOR EACH ROW BEGIN
  UPDATE groups, users SET groups.Score = groups.Score - users.Score 
    WHERE groups.ID = old.GroupID AND users.ID = old.UserID AND old.Accept = 1;
END
//
DELIMITER ;
*/

/* first
INSERT INTO users (NationalID, FirstName, LastName, BirthDate, Gender, RegisterTime, UserPass) VALUES (1, 'علیرضا', 'نوریان', '1990-10-12', 'male', '2010-10-12 17:32:00', sha1('1'));
INSERt INTO permissions (TournamentID, UserID, Permission, Accept) VALUES (1, 1111, "admin", 1);
INSERT INTO library (MasterID, Title, UniqueID, SyncTime) VALUES (1111, 'کتاب', 'ef0dfd5a0d01ecb0ef9171bedd456325', NOW());
*/