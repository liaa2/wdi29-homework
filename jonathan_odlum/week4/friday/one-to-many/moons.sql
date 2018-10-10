CREATE TABLE moons(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  period FLOAT,
  discoverer TEXT,
  discovery_year INTEGER,
  img_url TEXT,
  planet_id INTEGER
);
