CREATE TABLE mountains (
id INTEGER PRIMARY KEY AUTOINCREMENT,
  mountain_name TEXT,
  mountain_continent TEXT,
  environment TEXT,
  height INTEGER,
  image_url TEXT
);

INSERT INTO mountains( mountain_name, mountain_continent, environment, height, image_url )
  VALUES ("Tambourine", "Australia", "Sub Tropical", 525, "https://placebear.com/200/300" );

INSERT INTO mountains( mountain_name, mountain_continent, environment, height, image_url )
    VALUES ("Kilimanjaro", "Africa", "Tropical", 5885, "https://placebear.com/200/300" );

INSERT INTO mountains( mountain_name, mountain_continent, environment, height, image_url )
    VALUES ("Everest", "Asia", "Very Cold", 8848, "https://placebear.com/200/300" );
