CREATE TABLE item(
  id SERIAL PRIMARY KEY,
  publish_date DATE,
  archived BOOLEAN,
  archived BOOLEAN,
  genre_id INT,
	author_id INT,
	label_id INT,
  FOREIGN KEY (genre_id) REFERENCES genre (id),
  FOREIGN KEY (label_id) REFERENCES label (id),
  FOREIGN KEY (author_id) REFERENCES author (id),
);

CREATE TABLE books(
  id SERIAL PRIMARY KEY,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  publisher VARCHAR(30) NOT NULL,
  cover_state VARCHAR(10) NOT NULL,
  label_ID INT,
  author_ID INT,
  genre_ID INT,
  FOREIGN KEY (label_ID) REFERENCES label(ID),
  FOREIGN KEY (author_ID) REFERENCES author(ID),
  FOREIGN KEY(genre_ID) REFERENCES genre(ID)
);

CREATE TABLE label(
    id SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    color VARCHAR(50) NOT NULL,
);

CREATE TABLE genre(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE music_album(
  id SERIAL PRIMARY KEY,
  type_of_item text,
  author_id INTEGER,
  source_id INTEGER,
  on_spotify BOOLEAN,
  publish_date DATE,
  archived BOOLEAN,
  label_id INT,
  genre_id INT,
  FOREIGN KEY (label_id) REFERENCES label(id),
  FOREIGN KEY (genre_id) REFERENCES genre(id),
  FOREIGN KEY (author_id) REFERENCES author(id),
  FOREIGN KEY (source_id) REFERENCES source(id)
);

CREATE TABLE game (
    id SERIAL NOT NULL PRIMARY KEY,
    multiplayer BOOLEAN,
    last_played_at DATE,
    publish_date DATE,
    archived BOOLEAN,
    author_id INTEGER REFERENCES author (id)
);

CREATE TABLE author (
    id SERIAL NOT NULL PRIMARY KEY,
    first_name VARCHAR,
    last_name VARCHAR
);
