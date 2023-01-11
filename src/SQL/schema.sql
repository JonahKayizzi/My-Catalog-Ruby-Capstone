CREATE TABLE books(
    id SERIAL PRIMARY KEY,
    publisher VARCHAR(50) NOT NULL,
    publish_date DATE NOT NULL,
    cover_state VARCHAR(50) NOT NULL,
    archived BOOLEAN,
    label_id INT NOT NULL REFERENCES labels(id) ON DELETE CASCADE,
    PRIMARY KEY(id)
);
CREATE TABLE labels(
    id SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    color VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE game (
    id SERIAL NOT NULL PRIMARY KEY,
    multiplayer BOOLEAN,
    last_played_at DATE,
    publish_date DATE,
    archived BOOLEAN,
    author_id INTEGER REFERENCES author (id)
);

