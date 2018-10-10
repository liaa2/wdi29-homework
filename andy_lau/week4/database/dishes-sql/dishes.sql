CREATE TABLE dishes (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name          TEXT,
  origin        TEXT,
  flag_url      TEXT,
  ingredient    TEXT,
  description   TEXT,
  rating        INTEGER,
  image_url     TEXT
);

INSERT INTO dishes(name, origin, flag_url, ingredient, description, rating, image_url)
  VALUES(
    "Sushi", "Japan", "https://upload.wikimedia.org/wikipedia/en/9/9e/Flag_of_Japan.svg", "Fish", "raw fish and stuff", 5, "http://www.washokulovers.com/wp-content/uploads/2016/03/DSC07441.jpg"
  );

INSERT INTO dishes(name, origin, flag_url, ingredient, description, rating, image_url)
  VALUES(
      "Hamburger", "Germany (disputed)", "https://upload.wikimedia.org/wikipedia/en/b/ba/Flag_of_Germany.svg", "Bread, meat", "Meat and other ingredients between two buns", 3, "https://upload.wikimedia.org/wikipedia/commons/0/0b/RedDot_Burger.jpg"
  );

INSERT INTO dishes(name, origin, flag_url, ingredient, description, rating, image_url)
  VALUES(
      "Waffle", "Belgium", "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Flag_of_Belgium.svg/450px-Flag_of_Belgium.svg.png", "Sugar", "Variety of waffle with lighter batter and larger squares", 2, "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Waffle_with_strawberries_and_confectioner%27s_sugar.jpg/500px-Waffle_with_strawberries_and_confectioner%27s_sugar.jpg"
  );

INSERT INTO dishes(name, origin, flag_url, ingredient, description, rating, image_url)
  VALUES(
      "Pizza", "Italy", "https://upload.wikimedia.org/wikipedia/en/0/03/Flag_of_Italy.svg", "Dough", "Variety of ingredients on dough", 3, "https://cdn.castellocheese.com/globalassets/occasions/dinner-occasion-page/pizza-cauliflower-pizza-with-creamy-white.jpg"
  );
