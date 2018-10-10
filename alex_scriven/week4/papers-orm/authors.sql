CREATE TABLE authors (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  age INTEGER,
  country TEXT,
  profile_pic TEXT,
  alive BOOLEAN,
  website TEXT
);

INSERT INTO authors (
  name, age, country, profile_pic, alive, website
)
VALUES(
  "Leo Breiman", 77, "USA", "https://upload.wikimedia.org/wikipedia/en/4/4d/Leo_Breiman.jpg", 0, "https://en.wikipedia.org/wiki/Leo_Breiman"
);

INSERT INTO authors (
  name, age, country, profile_pic, alive, website
)
VALUES(
  "Ross Quinlan", 75, "Australia", "https://www.rulequest.com/Personal/quinlan-small.jpg", 1, "https://en.wikipedia.org/wiki/Ross_Quinlan"
);

INSERT INTO authors (
  name, age, country, profile_pic, alive, website
)
VALUES(
  "Tianqi Chen", 30, "China", "https://homes.cs.washington.edu/~tqchen/data/img/tqchen-head.jpg", 1, "https://homes.cs.washington.edu/~tqchen/"
);
