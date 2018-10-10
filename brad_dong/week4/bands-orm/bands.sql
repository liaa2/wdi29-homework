CREATE TABLE bands(
  id INTEGER PRIMARY KEY,
  name TEXT,
  no_of_members INTEGER,
  genre TEXT,
  img_url TEXT
);


INSERT INTO bands (name, no_of_members, genre, img_url)
VALUES ("Beastie Boys", 3, "Rap", "http://fillmurray.com/400/490");


INSERT INTO bands (name, no_of_members, genre, img_url)
VALUES ("Faith No More", 5, "Rock", "http://fillmurray.com/300/600");



INSERT INTO bands (name, no_of_members, genre, img_url)
VALUES ("Neil Young", 1, "Folk Rock", "http://fillmurray.com/500/300");
