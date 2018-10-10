
CREATE TABLE moons(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  planet TEXT,
  period FLOAT,
  discoverer TEXT,
  discovery_year INTEGER,
  img_url TEXT
);

INSERT INTO moons( name, planet, period, discoverer, discovery_year, img_url)
  VALUES(
    "Luna", "Earth", 27.321582, "Probably everyone", -1000000000, "https://3c1703fe8d.site.internapcdn.net/newman/gfx/news/hires/2014/moon.png"
  );

INSERT INTO moons( name, planet, period, discoverer, discovery_year, img_url)
  VALUES(
    "Phobos", "Mars", 0.319, "Asaph Hall", 1877, "https://img.purch.com/w/660/aHR0cDovL3d3dy5zcGFjZS5jb20vaW1hZ2VzL2kvMDAwLzAwNy84ODQvb3JpZ2luYWwvaW1hZ2UyLTQ5Mi0yMDExMDEyMC1FRElULmpwZw=="
  );

INSERT INTO moons( name, planet, period, discoverer, discovery_year, img_url)
  VALUES(
    "Deimos", "Mars", 1.262, "Asaph Hall", 1877, "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Deimos-MRO.jpg/225px-Deimos-MRO.jpg"
  );
