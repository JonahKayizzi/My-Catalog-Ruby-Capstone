CREATE TABLE books(
    id INT GENERATED ALWAYS AS IDENTITY,
    publisher VARCHAR(50),
    publish_date DATE,
    cover_state VARCHAR(50),
    archived BOOLEAN,
    label_id INT NOT NULL REFERENCES labels(id) ON DELETE CASCADE,
    PRIMARY KEY(id)
);
CREATE TABLE labels(
    id INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(50),
    color VARCHAR(50),
    PRIMARY KEY(id)
);