CREATE TABLE food (
  id INTEGER PRIMARY KEY AUTOINCREMENT, -- take care of IDs internally
  name            TEXT,
  country         TEXT,
  country_img     TEXT,
  main_ingredient TEXT,
  description     TEXT,
  score           INTEGER,
  edible          BOOLEAN,
  image_url       TEXT
);

INSERT INTO food(name, country, country_img, main_ingredient, description, score, edible, image_url)
  VALUES(
    "Pad Thai", "Thailand", "https://upload.wikimedia.org/wikipedia/commons/a/a9/Flag_of_Thailand.svg", "rice noodles", "A stir fried rice noodle dish", 7, 1 , "https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/Phat_Thai_kung_Chang_Khien_street_stall.jpg/1200px-Phat_Thai_kung_Chang_Khien_street_stall.jpg"
  );

INSERT INTO food(name, country, country_img, main_ingredient, description, score, edible, image_url)
  VALUES(
    "Croissant", "Austria","https://upload.wikimedia.org/wikipedia/commons/4/41/Flag_of_Austria.svg", "dough, butter", "Flaky pastry", 6, 1 , "https://secure.i.telegraph.co.uk/multimedia/archive/02898/croissants_2898177b.jpg"
  );

INSERT INTO food(name, country, country_img, main_ingredient, description, score, edible, image_url)
  VALUES(
    "Pizza", "Italy","https://upload.wikimedia.org/wikipedia/en/0/03/Flag_of_Italy.svg", "dough, sauce", "round wheel of dough and ingredients", 7, 1 , "https://cdn.castellocheese.com/globalassets/occasions/dinner-occasion-page/pizza-cauliflower-pizza-with-creamy-white.jpg"
  );

INSERT INTO food(name, country, country_img, main_ingredient, description, score, edible, image_url)
  VALUES(
    "Vegemite", "Australia","https://upload.wikimedia.org/wikipedia/commons/8/88/Flag_of_Australia_%28converted%29.svg", "bad stuff", "yea nah", 0, 0 , "https://upload.wikimedia.org/wikipedia/commons/1/10/Vegemiteontoast_large.jpg"
  );

INSERT INTO food(name, country, country_img, main_ingredient, description, score, edible, image_url)
  VALUES(
    "Waffle", "Belgium","https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Flag_of_Belgium.svg/450px-Flag_of_Belgium.svg.png", "flour, sugar", "sweet dessert", 7, 1 , "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Waffle_with_strawberries_and_confectioner%27s_sugar.jpg/500px-Waffle_with_strawberries_and_confectioner%27s_sugar.jpg"
  );
