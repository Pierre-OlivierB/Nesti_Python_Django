BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "store_product" (
	"id"	integer NOT NULL,
	"thumbnail"	varchar(100),
	"description"	text NOT NULL,
	"name"	varchar(128) NOT NULL,
	"price"	real NOT NULL,
	"stock"	integer NOT NULL,
	"slug"	varchar(128) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "store_cart_orders" (
	"id"	integer NOT NULL,
	"cart_id"	bigint NOT NULL,
	"order_id"	bigint NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("order_id") REFERENCES "store_order"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("cart_id") REFERENCES "store_cart"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "store_cart" (
	"id"	integer NOT NULL,
	"user_id"	bigint NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("user_id") REFERENCES "accounts_shopper"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "store_order" (
	"id"	integer NOT NULL,
	"quantity"	integer NOT NULL,
	"ordered"	bool NOT NULL,
	"product_id"	bigint NOT NULL,
	"user_id"	bigint NOT NULL,
	"ordered_date"	datetime,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("user_id") REFERENCES "accounts_shopper"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("product_id") REFERENCES "store_product"("id") DEFERRABLE INITIALLY DEFERRED
);
INSERT INTO "store_product" ("id","thumbnail","description","name","price","stock","slug") VALUES (1,'products/jambon_jwXalQ6.jpg','dfhqzfhezmflahefmlkhf"mlkflvjvjvùmjvmrlgjemglj','Sneakers',50.0,10,'sneakers'),
 (2,'products/BACK_TO_THE_FUTURE-0.jpg','Mon dieu, je devais complétement avoir la tête dans les nuages.','Doc',90.0,2,'doc'),
 (3,'products/608.jpg','Ninja!','Ninja',130.0,1,'ninja'),
 (4,'products/18742256.jpg','Ca chouufe','Tête brûlé',600.0,40,'tete-brule');
INSERT INTO "store_cart_orders" ("id","cart_id","order_id") VALUES (8,4,4),
 (9,4,5),
 (10,4,6);
INSERT INTO "store_cart" ("id","user_id") VALUES (4,1);
INSERT INTO "store_order" ("id","quantity","ordered","product_id","user_id","ordered_date") VALUES (2,1,1,4,1,'2022-05-06 14:11:13.177886'),
 (3,1,1,4,1,'2022-05-08 11:22:50.918572'),
 (4,1,0,4,1,NULL),
 (5,1,0,1,1,NULL),
 (6,1,0,3,1,NULL),
 (7,1,1,1,4,'2022-05-14 10:04:25.507025');
CREATE INDEX IF NOT EXISTS "store_product_slug_6de8ee4b" ON "store_product" (
	"slug"
);
CREATE UNIQUE INDEX IF NOT EXISTS "store_cart_orders_cart_id_order_id_a1c5cc0e_uniq" ON "store_cart_orders" (
	"cart_id",
	"order_id"
);
CREATE INDEX IF NOT EXISTS "store_cart_orders_cart_id_22f6138e" ON "store_cart_orders" (
	"cart_id"
);
CREATE INDEX IF NOT EXISTS "store_cart_orders_order_id_5cd21146" ON "store_cart_orders" (
	"order_id"
);
CREATE INDEX IF NOT EXISTS "store_order_product_id_11796f0f" ON "store_order" (
	"product_id"
);
CREATE INDEX IF NOT EXISTS "store_order_user_id_ae5f7a5f" ON "store_order" (
	"user_id"
);
COMMIT;
