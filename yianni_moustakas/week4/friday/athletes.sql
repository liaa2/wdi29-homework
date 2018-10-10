CREATE TABLE athletes (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  full_name TEXT,
  age INTEGER,
  club TEXT,
  country TEXT,
  sponsored_brand TEXT,
  country_image TEXT,
  club_image TEXT,
  self_image TEXT
);
INSERT INTO athletes(full_name, age, club, country, sponsored_brand, country_image, club_image, self_image)
  VALUES(
    "Cristiano Ronaldo", 33, "Juventus", "Portugal", "Nike", "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Portugal.svg/1200px-Flag_of_Portugal.svg.png", "https://s3-eu-central-1.amazonaws.com/centaur-wp/designweek/prod/content/uploads/2017/01/17103153/170115_logoprimario_rgb.png", "http://www.abc.net.au/news/image/10330496-3x2-700x467.jpg"
  );
INSERT INTO athletes(full_name, age, club, country, sponsored_brand, country_image, club_image, self_image)
  VALUES(
    "Paul Pogba", 25, "Manchester United", "France", "adidas", "https://upload.wikimedia.org/wikipedia/en/thumb/c/c3/Flag_of_France.svg/1200px-Flag_of_France.svg.png", "https://banner2.kisspng.com/20171220/rze/manchester-united-logo-png-5a3a1f84413c87.20767413151375859626726432.jpg", "https://cdn.images.express.co.uk/img/dynamic/67/590x/Paul-Pogba-899885.jpg"
  );
INSERT INTO athletes(full_name, age, club, country, sponsored_brand, country_image, club_image, self_image)
  VALUES(
    "Sergio Aguero", 27, "Manchester City", "Argentina", "Puma", "http://fillmurray.com/300/300", "http://fillmurray.com/300/300", "http://fillmurray.com/300/300"
  );
INSERT INTO athletes(full_name, age, club, country, sponsored_brand, country_image, club_image, self_image)
  VALUES(
    "Memphis Depay", 26, "Olympique Lyonnais", "France", "Under Armour", "http://fillmurray.com/300/300", "http://fillmurray.com/300/300", "http://fillmurray.com/300/300"
  );
