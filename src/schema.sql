CREATE TABLE authors(
  id INT, 
  first_name VARCHAR(255), 
  last_name VARCHAR(255), 
  PRIMARY KEY(id)
);

CREATE TABLE labels(
  id INT, 
  title VARCHAR(255), 
  color VARCHAR(255), 
  PRIMARY KEY(id)
);

CREATE TABLE genres(
  id INT, 
  name VARCHAR(255), 
  PRIMARY KEY(id)
);

CREATE TABLE books(
    id INT, 
    name VARCHAR(255), 
    published_date DATE, 
    publisher VARCHAR(255), 
    cover_state VARCHAR(255), 
    archived BOOLEAN, 
    author_id INT REFERENCES authors(id), 
    label_id INT REFERENCES labels(id), 
    genre_id INT REFERENCES genres(id), 
    PRIMARY KEY(id)
);

CREATE TABLE games(
  id INT, 
  name VARCHAR(255), 
  published_date DATE, 
  last_played_date DATE, 
  multiplayer BOOLEAN, 
  archived BOOLEAN, 
  author_id INT REFERENCES authors(id), 
  label_id INT REFERENCES labels(id), 
  genre_id INT REFERENCES genres(id), 
  PRIMARY KEY(id)
);

CREATE TABLE musicalbums(
  id INT, 
  name VARCHAR(255), 
  published_date DATE, 
  on_spotify BOOLEAN, 
  archived BOOLEAN, 
  author_id INT REFERENCES authors(id), 
  label_id INT REFERENCES labels(id), 
  genre_id INT REFERENCES genres(id), 
  PRIMARY KEY(id)
);