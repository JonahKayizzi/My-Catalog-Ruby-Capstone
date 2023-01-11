CREATE TABLE item(
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    publish_date DATE,
    archived BOOLEAN,
    archived BOOLEAN,
    genre_id INT,
	author_id INT,
	label_id INT,
    FOREIGN KEY (genre_id) REFERENCES genre (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (label_id) REFERENCES labels (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (author_id) REFERENCES author (id) ON DELETE RESTRICT ON UPDATE CASCADE,
);
CREATE TABLE books(
    id SERIAL PRIMARY KEY,
    publisher VARCHAR(50) NOT NULL,
    publish_date DATE NOT NULL,
    cover_state VARCHAR(50) NOT NULL,
    archived BOOLEAN,
    label_id INT NOT NULL REFERENCES labels(id) ON DELETE CASCADE,
    FOREIGN KEY (id) REFERENCES item (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    PRIMARY KEY(id)
);
CREATE TABLE labels(
    id SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    color VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);
CREATE TABLE genre(
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(255),
);
CREATE TABLE music_album(
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    on_spotify BOOLEAN,

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
