-- Adminer 4.7.1 PostgreSQL dump

DROP TABLE IF EXISTS "events";
DROP SEQUENCE IF EXISTS events_id_seq;
CREATE SEQUENCE events_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."events" (
    "id" bigint DEFAULT nextval('events_id_seq') NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "name" character varying(255) NOT NULL,
    "date_event" timestamp(0) NOT NULL,
    "author" integer NOT NULL,
    "description" text,
    "reminder" timestamp(0),
    CONSTRAINT "events_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "events_author_foreign" FOREIGN KEY (author) REFERENCES users(id) NOT DEFERRABLE
) WITH (oids = false);

INSERT INTO "events" ("id", "created_at", "updated_at", "name", "date_event", "author", "description", "reminder") VALUES
(1,	'2019-03-29 15:43:30',	'2019-03-29 15:43:30',	'Graspop',	'2019-04-01 09:00:00',	2,	'Big festival with amazing guests, all the greatest metal bands in the world.',	'2019-03-29 10:00:00');

DROP TABLE IF EXISTS "list_of_participants";
DROP SEQUENCE IF EXISTS list_of_participants_id_seq;
CREATE SEQUENCE list_of_participants_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."list_of_participants" (
    "id" bigint DEFAULT nextval('list_of_participants_id_seq') NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "event" integer NOT NULL,
    "participant" integer NOT NULL,
    CONSTRAINT "list_of_participants_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "list_of_participants_event_foreign" FOREIGN KEY (event) REFERENCES events(id) NOT DEFERRABLE,
    CONSTRAINT "list_of_participants_participant_foreign" FOREIGN KEY (participant) REFERENCES users(id) NOT DEFERRABLE
) WITH (oids = false);


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
(2,	'2014_10_12_100000_create_password_resets_table',	1),
(3,	'2019_03_27_150622_create_events_table',	1),
(4,	'2019_03_27_154437_create_list_of_participants_table',	1);

DROP TABLE IF EXISTS "password_resets";
CREATE TABLE "public"."password_resets" (
    "email" character varying(255) NOT NULL,
    "token" character varying(255) NOT NULL,
    "created_at" timestamp(0)
) WITH (oids = false);

CREATE INDEX "password_resets_email_index" ON "public"."password_resets" USING btree ("email");


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

INSERT INTO "users" ("id", "name", "email", "email_verified_at", "password", "remember_token", "created_at", "updated_at") VALUES
(1,	'vch',	'vincent_chilot@live.be',	NULL,	'$2y$10$OL8.sMqGcp2kJYGwkQ0.5uTy2aWr6pn2.zegHuQmDarTZyi75laoG',	NULL,	'2019-03-29 14:35:48',	'2019-03-29 14:35:48'),
(2,	'testor',	'test5@test.com',	NULL,	'$2y$10$HjtmmP/WbhtKW7mHx9TOAuVoTni751BV3cT2m4qsKzghiLd9u5wfW',	NULL,	'2019-03-29 15:20:48',	'2019-03-29 15:20:48'),
(3,	'vincent',	'vincent.chilot@gmail.com',	NULL,	'$2y$10$.3t0CYCS8cDegWAnp8z62.y1qd1uvHeFwsd/yzxsKWItGINmcr4H2',	NULL,	'2019-04-02 11:21:07',	'2019-04-02 11:21:07'),
(4,	'vch',	'vch@vch.com',	NULL,	'$2y$10$zbDbqdi673qTFcqbDkrNjuVoeXmJmNplMmAPI/YU5iLA/ihmiOwRq',	NULL,	'2019-04-02 11:29:30',	'2019-04-02 11:29:30'),
(5,	'vivi',	'vch@mmm.com',	NULL,	'$2y$10$38aJOav4hliYy1j.N2hXZO/fXzJ2dFgK9AKpXAhYwD4IHEIpVTzAu',	NULL,	'2019-04-02 12:05:44',	'2019-04-02 12:05:44'),
(10,	'xxx',	'xxx@xxx.com',	NULL,	'$2y$10$n2U2TMRvZd2IrtIt4fIQieKM/Uc.BxtWcw545UoUmkuUqZyhZfZa2',	NULL,	'2019-04-02 12:09:02',	'2019-04-02 12:09:02'),
(12,	'xxx',	'yyy@xxx.com',	NULL,	'$2y$10$XPBokdcPM8IfxVy4zKTvI.fE5s6RBN.az3zbeHucnUmpyZBd/0hDW',	NULL,	'2019-04-02 12:10:48',	'2019-04-02 12:10:48'),
(13,	'ccc',	'c@c.com',	NULL,	'$2y$10$Gb0SVwtMRmAg8icnDsFSteXGg8hVRkRvcX8iu9RnN80.xRdukivAW',	NULL,	'2019-04-02 12:15:42',	'2019-04-02 12:15:42'),
(14,	'vvv',	'ddd@lll.com',	NULL,	'$2y$10$4ZM7UPreAB5cTJGP82JUr.MCeDswi/o1/eevHb4F9mn6CDmXVSRni',	NULL,	'2019-04-02 12:19:51',	'2019-04-02 12:19:51'),
(15,	'test',	'test@test.com',	NULL,	'$2y$10$XIyoMJWdM7vc3ACuUYQ9SOrJVHRK0TBDgLtj.RGeXlCb/j8HefX4C',	NULL,	'2019-04-02 12:21:28',	'2019-04-02 12:21:28'),
(16,	'mmmm',	'm@m.com',	NULL,	'$2y$10$e23AA5.31rBRly3Sgc83IOFVGqavIjx2Kg7nYS5VM3c1fsLcl8WE.',	NULL,	'2019-04-02 12:24:51',	'2019-04-02 12:24:51'),
(17,	'www',	'w@live.be',	NULL,	'$2y$10$hGV6rJ8/UXZ7QTeRmlQM1OM7/fjcnjTlGjpus/cX5NXUkeTJmXhuG',	NULL,	'2019-04-02 12:26:28',	'2019-04-02 12:26:28'),
(18,	'aaa',	'a@a.com',	NULL,	'$2y$10$bgtEomNG3eYyVvm1OQb7lOX2r/CoUM3.3j8oVNWXZsPIfWegJP/7u',	NULL,	'2019-04-02 12:31:25',	'2019-04-02 12:31:25'),
(19,	'www',	'w@w.com',	NULL,	'$2y$10$LJN6Xf8gSl.Wn3Tebr3K2epuUl7kP7OQ/1/69M9BPW9NH.49O8PbK',	NULL,	'2019-04-02 12:32:43',	'2019-04-02 12:32:43'),
(20,	'ppp',	'p@p.com',	NULL,	'$2y$10$aVAL9R2p0FJ6E2dmSfpAUORoFn9pKkvtT.4uXLFOXnGk1p5wxZj.O',	NULL,	'2019-04-02 12:36:54',	'2019-04-02 12:36:54'),
(21,	'sss',	's@l.com',	NULL,	'$2y$10$WydMLz8ueEbcTQla6BorXevzaYqmozzrIfr9QiIdm.IVlhzdf3.2K',	NULL,	'2019-04-02 12:38:09',	'2019-04-02 12:38:09'),
(22,	'bbbb',	'b@lll.com',	NULL,	'$2y$10$lNgXuta5dB08nlVxKVKmGuAIeRfHgG6z6A7.9WEL2x1UsA9Z2KQcC',	NULL,	'2019-04-02 12:38:47',	'2019-04-02 12:38:47'),
(23,	'nnn',	'm@n.com',	NULL,	'$2y$10$qlnP8afjWKW6S/Ux6KRyLeHs6rex.LW3WjfWzsMp3/EooaO.k4/N6',	NULL,	'2019-04-02 12:39:24',	'2019-04-02 12:39:24'),
(25,	'nnn',	'bbbbbbb@llll.com',	NULL,	'$2y$10$8ohPSABEWVsYyJEGGBqk4.ejHt0Dme71MCBaXtpOuyQEFWJIdKg9O',	NULL,	'2019-04-02 12:39:44',	'2019-04-02 12:39:44'),
(28,	'oooo',	'o@o.com',	NULL,	'$2y$10$zSf4MdNV2X6ZZBYyPjaRYO7l0pvsSFaL.jxITp4B9nRWPgr9rPgae',	NULL,	'2019-04-02 12:41:44',	'2019-04-02 12:41:44'),
(32,	'qqq',	'q@q.com',	NULL,	'$2y$10$l0.hm.fABOXSOgrtPMLWyO9Uf4ws2/ng0O09gUYRvMvJUJw/US0Ru',	NULL,	'2019-04-02 12:45:35',	'2019-04-02 12:45:35'),
(33,	'qqq',	'ppppp@q.com',	NULL,	'$2y$10$Tk08v07i19d1eqrS2xhe1ekYdDCggKYeBZ7j4u6G.lz2hkRU3trOW',	NULL,	'2019-04-02 12:45:47',	'2019-04-02 12:45:47'),
(35,	'mmmm',	'myjytjytjytj@m.com',	NULL,	'$2y$10$6vBSLEKy7WcBz3Oml.oYO.KjfCe6JWDx0I1tjkdOKZdKHwVj7I7Ma',	NULL,	'2019-04-02 12:46:35',	'2019-04-02 12:46:35'),
(36,	'mmmm',	'fthtrhthtrhtrh@mmmmm.com',	NULL,	'$2y$10$hUoUOe7vZteFGbPMrPT7nOBH4l2klsxHx4kr1vxdrlz6xFMvSRxpm',	NULL,	'2019-04-02 12:46:49',	'2019-04-02 12:46:49'),
(37,	'vincent',	'blablabla@live.com',	NULL,	'$2y$10$0SkqVhwID0LnBYu4Tt4RTO3Wod0XVfnTvN1isxAwNbRL5zM38/SI6',	NULL,	'2019-04-02 12:47:24',	'2019-04-02 12:47:24'),
(38,	'vivi',	'vivi@vivi.com',	NULL,	'$2y$10$GFYNc/Aly/CrjjdOC5/pte3WyyXITOhKcEew8znjznWpT0fIQCOPG',	NULL,	'2019-04-02 13:15:18',	'2019-04-02 13:15:18'),
(40,	'test',	't@test.com',	NULL,	'$2y$10$In6Fdmrxukwm0fv5OaZLUO9A8IWa5a4WU.wYG2Bqcd5ytuLGrPPZm',	NULL,	'2019-04-02 13:19:23',	'2019-04-02 13:19:23'),
(41,	'vvvvv',	'vvvvvvvvvvvvvvv@dcsdcs.com',	NULL,	'$2y$10$cZEyd.Tma9MpyWURGY8ZcOyReVWRilsbUz8L2U.oXJreiYpFTlcX6',	NULL,	'2019-04-02 13:19:54',	'2019-04-02 13:19:54'),
(42,	'testtest',	'testtest@testtest.testtest',	NULL,	'$2y$10$/wk5xPPKx/ya1JZ6scW84eGW7iBB4142cvhaImVnp0cqUGj5fFvfK',	NULL,	'2019-04-02 13:23:49',	'2019-04-02 13:23:49'),
(43,	'mercredi',	'mercredi@mercredi.com',	NULL,	'$2y$10$5MSTJwrCajh1nCd3hEd5KuSsAj0p5Zf0ZXjMucVh9i0G4XVZL./sy',	NULL,	'2019-04-03 07:46:35',	'2019-04-03 07:46:35'),
(47,	'devfront',	'devfront@devfront.com',	NULL,	'$2y$10$8/y819q8zahzuXrjv/0odO6l.tpEqfjjF.w2ixHxoHXk6K2tVng/6',	NULL,	'2019-04-03 11:51:24',	'2019-04-03 11:51:24');

-- 2019-04-03 12:42:29.634872+00
