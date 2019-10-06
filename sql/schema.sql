BEGIN;

CREATE TABLE Families(
	id VARCHAR NOT NULL,
	family VARCHAR PRIMARY KEY
);

CREATE TABLE Toons(
  name VARCHAR PRIMARY KEY,
  family varchar NOT NULL REFERENCES Families ON DELETE CASCADE,
  class VARCHAR NOT NULL,
  level INT NOT NULL,
  xp FLOAT NOT NULL
);

CREATE TABLE Gear(
  toon VARCHAR PRIMARY KEY REFERENCES Toons ON DELETE CASCADE,
  dp INT NOT NULL,
  ap INT NOT NULL,
  aap INT NOT NULL
);

CREATE TABLE Skills(
  toon VARCHAR PRIMARY KEY REFERENCES Toons ON DELETE CASCADE,
  gathering INT NOT NULL,
  fishing INT NOT NULL,
  hunting INT NOT NULL,
  cooking INT NOT NULL,
  alchemy INT NOT NULL,
  processing INT NOT NULL,
  training INT NOT NULL,
  trade INT NOT NULL,
  farming INT NOT NULL,
  sailing INT NOT NULL
);

CREATE TABLE History(
  toon VARCHAR REFERENCES Toons ON DELETE CASCADE,
  event_date DATE NOT NULL,
  event_time TIME NOT NULL,
  stat VARCHAR NOT NULL,
  amount INT NOT NULL,
  PRIMARY KEY (toon, event_date, event_time)
);

CREATE TABLE Updates(
  title VARCHAR,
  url VARCHAR,
  PRIMARY KEY (title, url)
);

CREATE TABLE News(
  title VARCHAR,
  url VARCHAR,
  PRIMARY KEY (title, url)
);

COMMIT;
