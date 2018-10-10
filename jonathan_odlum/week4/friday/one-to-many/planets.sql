CREATE TABLE planets(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  nick_name TEXT,
  period FLOAT,
  img_url TEXT
);

INSERT INTO planets( name, nick_name, period, img_url)
  VALUES(
    "Earth",
    "The blue planet",
    365,
    "https://3c1703fe8d.site.internapcdn.net/newman/gfx/news/hires/2014/whatpercento.jpg"
  );

INSERT INTO planets( name, nick_name, period, img_url)
  VALUES(
    "Mars",
    "The red planet",
    687,
    "https://upload.wikimedia.org/wikipedia/commons/0/02/OSIRIS_Mars_true_color.jpg"
 );


INSERT INTO planets( name, nick_name, period, img_url)
  VALUES(
    "Jupiter",
    "The spotty one",
    4332,
    "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/Jupiter_and_its_shrunken_Great_Red_Spot.jpg/330px-Jupiter_and_its_shrunken_Great_Red_Spot.jpg"
  );
