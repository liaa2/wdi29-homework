CREATE TABLE rock_stars(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name TEXT,
  last_name TEXT,
  instruments TEXT,
  alive BOOLEAN,
  image_url TEXT,
  rock_band_id INTEGER
);

INSERT INTO rock_stars (first_name, last_name, instruments, alive, image_url, rock_band_id)
  VALUES (
    "Mick", "Jagger", "Vocals, Guitar", 1, "https://consequenceofsound.files.wordpress.com/2016/03/screen-shot-2016-03-26-at-4-09-10-pm.png?w=807", 1
  );

INSERT INTO rock_stars (first_name, last_name, instruments, alive, image_url, rock_band_id)
  VALUES (
    "Keith", "Richards", "Guitar, Vocals", 1, "https://cdn-01.independent.ie/entertainment/music/music-news/article36660066.ece/8ccc3/AUTOCROP/w620/2018-03-02_ent_38971387_I2.JPG", 1
  );

INSERT INTO rock_stars (first_name, last_name, instruments, alive, image_url, rock_band_id)
  VALUES (
    "Kurt", "Cobain", "Vocals, Guitar", 0, "https://cdn.shopify.com/s/files/1/0966/0716/files/kurt-cobain-of-nirvana-mtv-live-and-loud-1993_large.jpg?v=1487748651", 2
  );

INSERT INTO rock_stars (first_name, last_name, instruments, alive, image_url, rock_band_id)
  VALUES (
    "Dave", "Gilmour", "Guitar, Vocals", 1, "https://lh5.googleusercontent.com/proxy/F20Wa1_1a-Nae3gBT5rZ-66SME001yQJy_1zhMmmrH-SCS6GWTTq_77SjHi9QhYLc0wZYKi3lSkytR6f1n9qcLIJTfvC=s0-d", 3
  );
