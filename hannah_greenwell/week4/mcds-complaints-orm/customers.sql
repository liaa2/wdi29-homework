CREATE TABLE customers (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  city TEXT,
  state TEXT,
  disgruntled_rating INTEGER,
  image_url TEXT
);

INSERT INTO customers (name, city, state, disgruntled_rating, image_url)
  VALUES ('Patty', 'Winona', 'MN', 5, '/img/patty.png');

INSERT INTO customers (name, city, state, disgruntled_rating, image_url)
  VALUES ('Gerald', 'Cleveland', 'OH', 4, '/img/gerald.png');

INSERT INTO customers (name, city, state, disgruntled_rating, image_url)
  VALUES ('Barbara', 'Cleveland', 'TX', 1, '/img/barbara.png');

INSERT INTO customers (name, city, state, disgruntled_rating, image_url)
  VALUES ('Stanley', 'Duncan', 'OK', 3, '/img/stanley.png');
