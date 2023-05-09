
CREATE TABLE IF NOT EXISTS Music_genres (
    ID_genres SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Artists(
    ID_Artists SERIAL PRIMARY KEY,
	ID_genres INTEGER REFERENCES Music_genres(ID_genres),
	name VARCHAR(30) NOT NULL
);
	
CREATE TABLE IF NOT EXISTS Albums (
    ID_Album SERIAL  PRIMARY KEY,
    ID_Artists INTEGER REFERENCES Artists(id_Artists),
	name VARCHAR(40) NOT NULL
);
CREATE TABLE IF NOT EXISTS Track (
    ID_Track SERIAL  PRIMARY KEY,
    ID_Albums INTEGER REFERENCES Albums(id_Album),
	name VARCHAR(40) NOT NULL,
	duration INTEGER NOT NULL CHECK(duration < 20)
);	


CREATE TABLE IF NOT EXISTS Genres_and_artists (
	Artists_ID INTEGER REFERENCES Artists(ID_Artists),
	Music_genres_ID INTEGER REFERENCES Music_genres(ID_genres),
	CONSTRAINT pk1 PRIMARY KEY (Artists_ID, Music_genres_ID)
);

CREATE TABLE IF NOT EXISTS Albums_and_artists (
	Artists_ID INTEGER REFERENCES Artists(ID_Artists),
	Albums_ID INTEGER REFERENCES Albums(ID_Album),
	CONSTRAINT pk2 PRIMARY KEY (Artists_ID, Albums_ID)
);

CREATE TABLE IF NOT EXISTS Collection (
    ID_Collection SERIAL  PRIMARY KEY,
    name VARCHAR(40) NOT NULL UNIQUE,
    year INTEGER NOT NULL CHECK(year >= 1960 AND year <= 2023),
	Track_ID INTEGER REFERENCES Track(ID_Track)
);

CREATE TABLE IF NOT EXISTS Track_collections (
	Track_ID INTEGER REFERENCES Track(ID_Track),
	Collection_ID INTEGER REFERENCES Collection(ID_Collection),
	CONSTRAINT pk3 PRIMARY KEY (Track_ID, Collection_ID)
);