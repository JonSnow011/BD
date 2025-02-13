CREATE TABLE IF NOT EXISTS Genres (
id SERIAL PRIMARY KEY,
genre VARCHAR(60) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Singers (
id SERIAL PRIMARY KEY,
singer VARCHAR(60) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS GenresSingers (
genre_id SERIAL REFERENCES janrs(id),
singer_id SERIAL REFERENCES Singers(id),
CONSTRAINT pk PRIMARY KEY (genre_id, singer_id)
);

CREATE TABLE IF NOT EXISTS Albums (
id SERIAL PRIMARY KEY,
name_album VARCHAR(60) NOT NULL,
year_of_album INT NOT NULL
);

CREATE TABLE IF NOT EXISTS AlbumsSingers (
album_id SERIAL REFERENCES Albums(id),
singer_id SERIAL REFERENCES Singers(id),
CONSTRAINT pk1 PRIMARY KEY (album_id, singer_id)
);

CREATE TABLE IF NOT EXISTS Trecks (
id SERIAL PRIMARY KEY,
album_id INTEGER NOT NULL REFERENCES Albums(id),
name_treck VARCHAR(90) NOT NULL,
time INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Collections (
id SERIAL PRIMARY KEY,
name VARCHAR(60) UNIQUE NOT NULL,
year INT NOT NULL
);

CREATE TABLE IF NOT EXISTS TrecksCollections (
treck_id SERIAL REFERENCES Trecks(id),
collection_id SERIAL REFERENCES Collections(id),
CONSTRAINT pk2 PRIMARY KEY (treck_id, collection_id)
);