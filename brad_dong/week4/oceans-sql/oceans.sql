CREATE TABLE oceans(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  volume INTEGER,
  area INTEGER,
  colour TEXT,
  wetness INTEGER
);


INSERT INTO oceans (name, volume, area, colour, wetness)
VALUES(
    "Indian", 71, 264, "blue", 9   );

INSERT INTO oceans (name, volume, area, colour, wetness)
  VALUES(
    "Pacific", 162, 660, "green", 7
  );

INSERT INTO oceans (name, volume, area, colour, wetness)
  VALUES(
    "North Atlantic", 41, 146, "blue", 8
  );

INSERT INTO oceans (name, volume, area, colour, wetness)
  VALUES(
    "South Atlantic", 40, 160, "blue", 9
  );
