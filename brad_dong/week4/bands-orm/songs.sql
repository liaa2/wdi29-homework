CREATE TABLE songs(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  band_id INTEGER   --foreign key, corres to id in bands
);

INSERT INTO songs (name, band_id)
  VALUES ("Root down", 1);

INSERT INTO songs (name, band_id)
  VALUES ("Old man", 3);

INSERT INTO songs (name, band_id)
  VALUES ("Midlife crisis", 2);

INSERT INTO songs (name, band_id)
  VALUES ("Shake your rump", 1);

INSERT INTO songs (name, band_id)
  VALUES ("Easy", 2);
