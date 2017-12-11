CREATE DATABASE lighttalk;
USE lighttalk;

CREATE TABLE tb_admin
(
	adminid              INTEGER AUTO_INCREMENT,
	adminname            VARCHAR(16) NOT NULL,
	truename             VARCHAR(20) NULL,
	sex                  ENUM('ÄÐ','Å®') NULL,
	email                VARCHAR(30) NULL,
	telephone            NUMERIC(11,0) NULL,
	passwd               VARCHAR(20) NOT NULL,
	PRIMARY KEY (adminid)
) AUTO_INCREMENT = 1;



CREATE TABLE tb_post
(
	postid               INTEGER AUTO_INCREMENT,
	userid               INTEGER NOT NULL,
	posttitle            VARCHAR(40) NOT NULL,
	postcontent          VARCHAR(200) NOT NULL,
	posttime             DATETIME NOT NULL,
	PRIMARY KEY (postid)
) AUTO_INCREMENT = 1;



CREATE TABLE tb_post_file
(
	fileid               INTEGER AUTO_INCREMENT,
	filelink             TEXT NOT NULL,
	postid               INTEGER NOT NULL,
	PRIMARY KEY (fileid)
) AUTO_INCREMENT = 1;



CREATE TABLE tb_post_picture
(
	pictureid            INTEGER AUTO_INCREMENT,
	picturelink          TEXT NOT NULL,
	postid               INTEGER NOT NULL,
	PRIMARY KEY (pictureid)
) AUTO_INCREMENT = 1;



CREATE TABLE tb_post_report
(
	reportid             INTEGER NOT NULL,
	postid               INTEGER NOT NULL,
	PRIMARY KEY (reportid)
);



CREATE TABLE tb_reply
(
	postid               INTEGER NOT NULL,
	replyid              INTEGER AUTO_INCREMENT,
	userid               INTEGER NOT NULL,
	replycontent          VARCHAR(200) NOT NULL,
	replytime            DATETIME NOT NULL,
	PRIMARY KEY (replyid)
) AUTO_INCREMENT = 1;



CREATE TABLE tb_reply_file
(
	replyid              INTEGER NOT NULL,
	fileid               INTEGER AUTO_INCREMENT,
	filelink             TEXT NOT NULL,
	PRIMARY KEY (fileid)
) AUTO_INCREMENT = 1;



CREATE TABLE tb_reply_picture
(
	replyid              INTEGER NOT NULL,
	pictureid            INTEGER AUTO_INCREMENT,
	picturelink          TEXT NOT NULL,
	PRIMARY KEY (pictureid)
) AUTO_INCREMENT = 1;



CREATE TABLE tb_reply_report
(
	reportid             INTEGER NOT NULL,
	replyid              INTEGER NOT NULL,
	PRIMARY KEY (reportid)
);



CREATE TABLE tb_report
(
	reportid             INTEGER AUTO_INCREMENT,
	userid               INTEGER NOT NULL,
	reason               TEXT NULL,
	reporttime           DATETIME NOT NULL,
	state                ENUM('ÒÑÉóºË','Î´ÉóºË') NULL DEFAULT 'Î´ÉóºË',
	result               TEXT NULL,
	adminid              INTEGER NULL,
	reviewertime         DATETIME NULL,
	PRIMARY KEY (reportid)
) AUTO_INCREMENT = 1;



CREATE TABLE tb_user
(
	userid               INTEGER AUTO_INCREMENT,
	username             VARCHAR(16) NOT NULL,
	sex                  ENUM('ÄÐ','Å®') NULL,
	email                VARCHAR(30) NULL,
	telephone            NUMERIC(11,0) NULL,
	truename             VARCHAR(20) NULL,
	passwd               VARCHAR(20) NOT NULL,
	PRIMARY KEY (userid)
) AUTO_INCREMENT = 1;



CREATE TABLE tb_user_report
(
	reportid             INTEGER NOT NULL,
	userid               INTEGER NOT NULL,
	PRIMARY KEY (reportid)
);



ALTER TABLE tb_post
ADD FOREIGN KEY R_1 (userid) REFERENCES tb_user (userid);



ALTER TABLE tb_post_file
ADD FOREIGN KEY R_27 (postid) REFERENCES tb_post (postid);



ALTER TABLE tb_post_picture
ADD FOREIGN KEY R_26 (postid) REFERENCES tb_post (postid);



ALTER TABLE tb_post_report
ADD FOREIGN KEY (reportid) REFERENCES tb_report(reportid)
		ON DELETE CASCADE;



ALTER TABLE tb_post_report
ADD FOREIGN KEY R_24 (postid) REFERENCES tb_post (postid);



ALTER TABLE tb_reply
ADD FOREIGN KEY R_6 (postid) REFERENCES tb_post (postid);



ALTER TABLE tb_reply
ADD FOREIGN KEY R_7 (userid) REFERENCES tb_user (userid);



ALTER TABLE tb_reply_file
ADD FOREIGN KEY R_9 (replyid) REFERENCES tb_reply (replyid);



ALTER TABLE tb_reply_picture
ADD FOREIGN KEY R_8 (replyid) REFERENCES tb_reply (replyid);



ALTER TABLE tb_reply_report
ADD FOREIGN KEY (reportid) REFERENCES tb_report(reportid)
		ON DELETE CASCADE;



ALTER TABLE tb_reply_report
ADD FOREIGN KEY R_25 (replyid) REFERENCES tb_reply (replyid);



ALTER TABLE tb_report
ADD FOREIGN KEY R_10 (userid) REFERENCES tb_user (userid);



ALTER TABLE tb_report
ADD FOREIGN KEY R_12 (adminid) REFERENCES tb_admin (adminid);



ALTER TABLE tb_user_report
ADD FOREIGN KEY (reportid) REFERENCES tb_report(reportid)
		ON DELETE CASCADE;



ALTER TABLE tb_user_report
ADD FOREIGN KEY R_23 (userid) REFERENCES tb_user (userid);


