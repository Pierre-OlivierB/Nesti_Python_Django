BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "accounts_shopper" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"first_name"	varchar(150) NOT NULL,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "accounts_shopper" ("id","password","last_login","is_superuser","username","first_name","last_name","email","is_staff","is_active","date_joined") VALUES (1,'pbkdf2_sha256$320000$Y30nMMdIFnHNXdaezxRo94$0tne3UmrKITKtFuCbKyWRQ0ARnxBj0RFWP/jpqr1ZUU=','2022-05-14 10:09:57.672844',1,'test','','','test@gmail.fr',1,1,'2022-05-06 08:36:53.108135'),
 (2,'pbkdf2_sha256$320000$Md47dgl01si3qx7KQPicWR$hspV4EEcoZiQ/qu4/UwdLx0SgmdjT/B4fXTRFDsx5HQ=','2022-05-06 09:13:12.531954',0,'testuser','','','',0,1,'2022-05-06 09:13:12.350271'),
 (3,'pbkdf2_sha256$320000$MmAhZesCcnVAbnENyKZ95U$YE8jLkS9vpAQcQK6MSTkx1YJB6mnXXGQOD2Bl70yCjs=','2022-05-06 10:17:13.205412',0,'Morgane','','','',0,1,'2022-05-06 10:17:02.323975'),
 (4,'pbkdf2_sha256$320000$K1z1j0YvzwDzl4KOXDdwHG$12hg5kTn+cFJlqtht2IJJN/SSbcX4DJr3d4h3euDQdA=','2022-05-09 08:53:44.719307',0,'bigboss','','','',0,1,'2022-05-09 08:53:33.519659');
COMMIT;
