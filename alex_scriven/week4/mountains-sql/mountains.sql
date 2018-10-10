CREATE TABLE mountains(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  country TEXT,
  image TEXT,
  elevation INTEGER
);

INSERT INTO mountains (name, country, image, elevation)

  VALUES (
    "Mt Fuji", "Japan", "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Numazu_and_Mount_Fuji.jpg/320px-Numazu_and_Mount_Fuji.jpg",
    3776
  );
