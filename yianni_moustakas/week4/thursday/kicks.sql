CREATE TABLE kicks (
  id INTEGER PRIMARY KEY AUTOINCREMENT, -- take care of IDs internally
  brand  TEXT,
  silhouette TEXT,
  colorway TEXT,
  category TEXT,
  description TEXT,
  heat_rating INTEGER,
  drip_or_drop BOOLEAN,
  release_date TEXT,
  image_url TEXT
);
INSERT INTO kicks( brand, silhouette, colorway, category, description, heat_rating, drip_or_drop, release_date, image_url )
  VALUES(
    "Nike", "Air Jordan 1", "O/W Chicago", "Lifestyle", "Off White x Nike", 9, 1, "2017", "https://stockx.imgix.net/Air-Jordan-1-Retro-High-Off-White-Chicago-Product.jpg?fit=fill&bg=FFFFFF&w=1400&h=1000&auto=format,compress&trim=color&q=90"
);
INSERT INTO kicks( brand, silhouette, colorway, category, description, heat_rating, drip_or_drop, release_date, image_url )
  VALUES(
    "Adidas", "Yung-1", "Frieza", "Lifestyle", "Dragon Ball Z x Adidas", 7, 0, "2018", "https://stockx.imgix.net/adidas-Yung-1-Dragon-Ball-Z-Frieza.png?fit=fill&bg=FFFFFF&w=1400&h=1000&auto=format,compress&trim=color&q=90"
);
INSERT INTO kicks( brand, silhouette, colorway, category, description, heat_rating, drip_or_drop, release_date, image_url )
  VALUES(
    "Nike", "Air Zoom Streak", "Supreme Flames", "Lifestyle", "Supreme x Nike", 6.5, 0, "2018", "https://stockx-360.imgix.net/Nike-Zoom-Streak-Spectrum-Plus-Supreme-White/Images/Nike-Zoom-Streak-Spectrum-Plus-Supreme-White/Lv2/img36.jpg?auto=format,compress&w=1117&q=90"
);
