CREATE TABLE cities (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  country TEXT,
  image_url TEXT
);

INSERT INTO cities (name,country,image_url)
  VALUES(
    "Sydney", "Australia", "https://dynaimage.cdn.cnn.com/cnn/q_auto,w_1024,c_fill,g_auto,h_576,ar_16:9/http%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F170220102107-sydney-habour.jpg"
  );


  INSERT INTO cities (name,country,image_url)
    VALUES(
      "Paris", "France",
      "https://dynaimage.cdn.cnn.com/cnn/q_auto,w_1024,c_fill,g_auto,h_576,ar_16:9/http%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F170220102107-sydney-habour.jpg"
    );


    INSERT INTO cities (name,country,image_url)
      VALUES(
        "Tokyo", "Japan",
        "https://res.klook.com/image/upload/fl_lossy.progressive,q_65,f_auto/c_fill,w_1200,h_630/w_80,x_15,y_15,g_south_west,l_klook_water/cities/0441edc7-Tokyo-banner--.jpg"
      );



      -- INSERT INTO cities (city,country,image_url
      --   VALUES(
      --     "New York", "America",
      --     "https://static.independent.co.uk/s3fs-public/thumbnails/image/2018/01/31/09/new-york-statue-of-liberty.jpg"
      --   );
