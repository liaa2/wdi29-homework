CREATE TABLE brands (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  company_name TEXT,
  founded TEXT,
  hq TEXT,
  ceo TEXT,
  revenue INTEGER,
  stock_price INTEGER,
  website TEXT,
  logo_url TEXT
);
INSERT INTO brands(company_name, founded, hq, ceo, revenue, stock_price, website, logo_url)
  VALUES(
    "Nike", 1964, "Beaverton", "Mark Parker", 34.35, 80.31, "nike.com", "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Logo_NIKE.svg/1200px-Logo_NIKE.svg.png"
  );
INSERT INTO brands(company_name, founded, hq, ceo, revenue, stock_price, website, logo_url)
  VALUES(
    "adidas", 1949, "Herzogenaurach", "Kasper Rørsted", 21.28, 207.40, "adidas.com", "https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Adidas_Logo.svg/1200px-Adidas_Logo.svg.png"
  );
INSERT INTO brands(company_name, founded, hq, ceo, revenue, stock_price, website, logo_url)
  VALUES(
    "Puma", 1948, "Herzogenaurach", "Bjørn Gulden", 4.1, 426.00, "au.puma.com", "https://upload.wikimedia.org/wikipedia/en/thumb/4/49/Puma_AG.svg/1200px-Puma_AG.svg.png"
  );
INSERT INTO brands(company_name, founded, hq, ceo, revenue, stock_price, website, logo_url)
  VALUES(
    "Under Armour", 1996, "Baltimore", "Kevin Plank", 0.005, 19.79, "underarmour.com.au", "https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/Under_Armour_Logo.svg/1200px-Under_Armour_Logo.svg.png"
  );
