-- Adminer 4.7.7 PostgreSQL dump

DROP TABLE IF EXISTS "users";
DROP SEQUENCE IF EXISTS users_id_seq;
CREATE SEQUENCE users_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."users" (
    "id" bigint DEFAULT nextval('users_id_seq') NOT NULL,
    "name" character varying(255) NOT NULL,
    "email" character varying(255) NOT NULL,
    "email_verified_at" timestamp(0),
    "password" character varying(255) NOT NULL,
    "remember_token" character varying(100),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "users_email_unique" UNIQUE ("email"),
    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

DROP TABLE IF EXISTS "events";
DROP SEQUENCE IF EXISTS events_id_seq1;
CREATE SEQUENCE events_id_seq1 INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."events" (
    "id" bigint DEFAULT nextval('events_id_seq1') NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "name" character varying(255) NOT NULL,
    "date_event" timestamp(0) NOT NULL,
    "author" integer NOT NULL,
    "description" text,
    "reminder" timestamp(0),
    "image_url" text,
    CONSTRAINT "events_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "events_author_foreign" FOREIGN KEY (author) REFERENCES users(id) NOT DEFERRABLE
) WITH (oids = false);

DROP TABLE IF EXISTS "list_of_participants";
DROP SEQUENCE IF EXISTS list_of_participants_id_seq;
CREATE SEQUENCE list_of_participants_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."list_of_participants" (
    "id" bigint DEFAULT nextval('list_of_participants_id_seq') NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "event" integer NOT NULL,
    "participant" integer NOT NULL,
	"reminder_status" boolean,
    CONSTRAINT "list_of_participants_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "list_of_participants_event_foreign" FOREIGN KEY (event) REFERENCES events(id) NOT DEFERRABLE,
    CONSTRAINT "list_of_participants_participant_foreign" FOREIGN KEY (participant) REFERENCES users(id) NOT DEFERRABLE
) WITH (oids = false);

DROP TABLE IF EXISTS "password_resets";
CREATE TABLE "public"."password_resets" (
    "email" character varying(255) NOT NULL,
    "token" character varying(255) NOT NULL,
    "created_at" timestamp(0)
) WITH (oids = false);

CREATE INDEX "password_resets_email_index" ON "public"."password_resets" USING btree ("email");

DROP TABLE IF EXISTS "migrations";
DROP SEQUENCE IF EXISTS migrations_id_seq;
CREATE SEQUENCE migrations_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."migrations" (
    "id" integer DEFAULT nextval('migrations_id_seq') NOT NULL,
    "migration" character varying(255) NOT NULL,
    "batch" integer NOT NULL,
    CONSTRAINT "migrations_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "migrations" ("id", "migration", "batch") VALUES
(1,	'2014_10_12_000000_create_users_table',	1),
(2,	'2019_03_27_150622_create_events_table',	1),
(3,	'2014_10_12_100000_create_password_resets_table',	1),
(4,	'2019_03_27_154437_create_list_of_participants_table',	1);

-- 2022-04-25 14:59:51.919141+00