CREATE TABLE restaurants (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name          TEXT,
  location      TEXT,
  rating        INTEGER,
  cost          INTEGER,
  dish_id     INTEGER
);

INSERT INTO restaurants(name, location, rating, cost, dish_id)
  VALUES(
    "Jiro's Sushi", "Japan", 5, 5, 1
  );

INSERT INTO restaurants(name, location, rating, cost, dish_id)
  VALUES(
    "Down 'n Out", "America", 2, 1, 2
  );

INSERT INTO restaurants(name, location, rating, cost, dish_id)
  VALUES(
    "Pizza Hut", "Everywhere", 3, 1, 4
  );

INSERT INTO restaurants(name, location, rating, cost, dish_id)
  VALUES(
    "Dominos", "Australia", 2, 1, 4
  );
