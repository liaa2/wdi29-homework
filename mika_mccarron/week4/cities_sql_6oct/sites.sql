CREATE TABLE sites (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  name TEXT,
  built_year INTEGER,
  architect TEXT,
  city_id INTEGER
);

INSERT INTO sites (name, built_year,architect, city_id)
  VALUES("Sydney Opera House",1973, "Jørn Utzon",1);

INSERT INTO sites (name, built_year,architect, city_id)
  VALUES("Sydney Harbour Bridge",1923, "John Bradfield",1);


INSERT INTO sites (name, built_year,architect, city_id)
  VALUES("The Eiffel Tower",1889, "Stephen Sauvestre",2);

INSERT INTO sites (name, built_year,architect, city_id)
  VALUES("Tokyo Tower",1957, "Tachū Naito",3);


  INSERT INTO sites (name, built_year,architect, city_id)
    VALUES("Tokyo Skytree",2008, "Nikken Sekkei",3);
