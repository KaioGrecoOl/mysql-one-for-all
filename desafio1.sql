DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.plans(
  plan_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  plan VARCHAR(30) NOT NULL,
  price DECIMAL(3,2)
) engine = InnoDB;

INSERT INTO
  SpotifyClone.plans (plan, price)
VALUES
  ('gratuito', 0.00),
  ('familiar', 7.99),
  ('universitário', 5.99),
  ('pessoal', 6.99);

CREATE TABLE SpotifyClone.users(
  user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  client_name VARCHAR(30) NOT NULL,
  age INT,
  signature_date DATE,
  plan_id INT NOT NULL,
  FOREIGN KEY (plan_id) REFERENCES SpotifyClone.plans (plan_id)
) engine = InnoDB;

INSERT INTO
  SpotifyClone.users (client_name, age, signature_date, plan_id)
VALUES
  ('Thati', 23, '2019-10-20', 1),
  ('Cintia', 35, '2017-12-30', 2),
  ('Bill', 20, '2019-06-05', 3),
  ('Roger', 45, '2020-05-13', 4),
  ('Norman', 58, '2017-02-17', 4),
  ('Patrick', 33, '2017-01-06', 2),
  ('Vivian', 26, '2018-01-05', 3),
  ('Carol', 19, '2018-02-14', 3),
  ('Angelina', 42, '2018-04-29', 2),
  ('Paul', 46, '2017-01-17', 2);

CREATE TABLE SpotifyClone.artists(
  artist_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  artist_name VARCHAR(30) NOT NULL
) engine = InnoDB;

INSERT INTO
  SpotifyClone.artists (artist_name)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon'),
  ('Tyler Isle'),
  ('Fog');

CREATE TABLE SpotifyClone.albuns(
  albun_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  albun_name VARCHAR(30) NOT NULL,
  release_year YEAR NOT NULL,
  artist_id INT NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists (artist_id)
) engine = InnoDB;

INSERT INTO
  SpotifyClone.albuns (albun_name, release_year, artist_id)
VALUES
  ('Envious', 1990, 1),
  ('Exuberant', 1993, 1),
  ('Hallowed Steam', 1995, 2),
  ('Incandescent', 1998, 3),
  ('Temporary Culture', 2001, 4),
  ('Library of liberty', 2003, 4),
  ('Chained Down', 2007, 5),
  ('Cabinet of fools', 2012, 5),
  ('No guarantees', 2015, 5),
  ('Apparatus', 2015, 6);

CREATE TABLE SpotifyClone.following_artists(
  user_id INT NOT NULL,
  artist_id INT NOT NULL,
  CONSTRAINT PRIMARY KEY(user_id, artist_id),
  FOREIGN KEY (user_id) REFERENCES SpotifyClone.users (user_id),
  FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists (artist_id)
) engine = InnoDB;

INSERT INTO
  SpotifyClone.following_artists (user_id, artist_id)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 3),
  (6, 1),
  (7, 2),
  (7, 5),
  (8, 1),
  (8, 5),
  (9, 6),
  (9, 4),
  (9, 3),
  (10, 2),
  (10, 6);

 CREATE TABLE SpotifyClone.songs(
  song_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  song_name VARCHAR(50) NOT NULL,
  albun_id INT NOT NULL,
  music_time INT NOT NULL,
  FOREIGN KEY (albun_id) REFERENCES SpotifyClone.albuns (albun_id)
) engine = InnoDB;

INSERT INTO
  SpotifyClone.songs (song_name, albun_id, music_time)
VALUES
  ('Soul For Us', 1, 200),
  ('Reflections Of Magic', 1, 163),
  ('Dance With Her Own', 1, 116),
  ('Troubles Of My Inner Fire', 2, 203),
  ('Time Fireworks', 2, 152),
  ('Magic Circus', 3, 105),
  ('Honey, So Do I', 3, 207),
  ('Sweetie, Lets Go Wild', 3, 139),
  ('She Knows', 3, 244),
  ('Fantasy For Me', 4, 100),
  ('Celebration Of More', 4, 146),
  ('Rock His Everything', 4, 223),
  ('Home Forever', 4, 231),
  ('Diamond Power', 4, 241),
  ("Let's Be Silly", 4, 132),
  ('Thang Of Thunder', 5, 240),
  ('Words Of Her Life', 5, 185),
  ('Without My Streets', 5, 176),
  ('Need Of The Evening', 6, 190),
  ('History Of My Roses', 6, 222),
  ('Without My Love', 6, 111),
  ('Walking And Game', 6, 123),
  ('Young And Father', 6, 197),
  ('Finding My Traditions', 7, 179),
  ('Walking And Man', 7, 229),
  ('Hard And Time', 7, 135),
  ("Honey, I'm A Lone Wolf", 7, 150),
  ('She Thinks I Wont Stay Tonight', 8, 166),
  ('He Heard Youre Bad For Me', 8, 154),
  ('He Hopes We Cant Stay', 8, 210),
  ('I Know I Know', 8, 117),
  ('Hes Walking Away', 9, 159),
  ('Hes Trouble', 9, 138),
  ('I Heard I Want To Bo Alone', 9, 120),
  ('I Ride Alone', 9, 151),
  ('Honey', 10, 79),
  ('You Cheated On Me', 10, 95),
  ('Wouldnt It Be Nice', 10, 213),
  ('Baby', 10, 136),
  ('You Make Me Feel So', 10, 83);

 CREATE TABLE SpotifyClone.reproduction_history(
  song_id INT NOT NULL,
  user_id INT NOT NULL,
  music_played_in DATETIME,
  CONSTRAINT PRIMARY KEY(song_id, user_id),
  FOREIGN KEY (song_id) REFERENCES SpotifyClone.songs (song_id),
  FOREIGN KEY (user_id) REFERENCES SpotifyClone.users (user_id)
) engine = InnoDB;

INSERT INTO
  SpotifyClone.reproduction_history (song_id, user_id, music_played_in)
VALUES
  (36, 1,'2020-02-28 10:45:55'),
  (25, 1, '2020-05-02 05:30:35'),
  (23, 1, '2020-03-06 11:22:33'),
  (14, 1, '2020-08-05 08:05:17'),
  (15, 1, '2020-09-14 16:32:22'),
  (34, 2, '2020-01-02 07:40:33'),
  (24, 2, '2020-05-16 06:16:22'),
  (21, 2, '2020-10-09 12:27:48'),
  (39, 2, '2020-09-21 13:14:46'),
  (6, 3, '2020-11-13 16:55:13'),
  (3, 3, '2020-12-05 18:38:30'),
  (26, 3, '2020-07-30 10:00:00'),
  (2, 4, '2021-08-15 17:10:10'),
  (35, 4, '2021-07-10 15:20:30'),
  (27, 4, '2021-01-09 01:44:33'),
  (7, 5, '2020-07-03 19:33:28'),
  (12, 5, '2017-02-24 21:14:22'),
  (14, 5, '2020-08-06 15:23:43'),
  (1, 5, '2020-11-10 13:52:27'),
  (38, 6, '2019-02-07 20:33:48'),
  (29, 6, '2017-01-24 00:31:17'),
  (30, 6, '2017-10-12 12:35:20'),
  (22, 6, '2018-05-29 14:56:41'),
  (5, 7, '2018-05-09 22:30:49'),
  (4, 7, '2020-07-27 12:52:58'),
  (11, 7, '2018-01-16 18:40:43'),
  (39, 8, '2018-03-21 16:56:40'),
  (40, 8, '2020-10-18 13:38:05'),
  (32, 8, '2019-05-25 08:14:03'),
  (33, 8, '2021-08-15 21:37:09'),
  (16, 9, '2021-05-24 17:23:45'),
  (17, 9, '2018-12-07 22:48:52'),
  (8, 9, '2021-03-14 06:14:26'),
  (9, 9, '2020-04-01 03:36:00'),
  (20, 10, '2017-02-06 08:21:34'),
  (21, 10, '2017-12-04 05:33:43'),
  (12, 10, '2017-07-27 05:24:49'),
  (13, 10, '2017-12-25 01:03:57'); 