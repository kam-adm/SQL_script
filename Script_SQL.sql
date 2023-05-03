
CREATE TABLE IF NOT EXISTS Music_genres (
    ID_genres SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS Artists(
    ID_Artists SERIAL PRIMARY KEY,
	ID_genres INTEGER REFERENCES Music_genres(ID_genres),
	name VARCHAR(30) NOT null
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
	password VARCHAR(128) NOT null
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
    name VARCHAR(40) NOT NULL,
    year INTEGER NOT NULL,
	Albums_ID INTEGER REFERENCES Albums(ID_Album),
	Track_ID INTEGER REFERENCES Track(ID_Track),
	CONSTRAINT pk3 PRIMARY KEY (Albums_ID, Track_ID)
);