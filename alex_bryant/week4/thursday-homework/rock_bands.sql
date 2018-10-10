CREATE TABLE rock_bands(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  genre TEXT,
  description TEXT,
  notable_songs TEXT,
  still_active BOOLEAN,
  image_url TEXT,
  website_url TEXT
);

INSERT INTO rock_bands (name, genre, description, notable_songs, still_active, image_url, website_url)
  VALUES (
    "The Rolling Stones", "Rock 'n' Roll", "The Rolling Stones are an English rock band formed in London, England, in 1962. The first stable line-up consisted of Brian Jones (guitar, harmonica), Mick Jagger (lead vocals), Keith Richards (guitar, backing vocals), Bill Wyman (bass), Charlie Watts (drums), and Ian Stewart (piano). Stewart was removed from the official line-up in 1963 but continued as a touring member until his death in 1985. Brian Jones was the original leader of the group.", "Jumpin' Jack Flash, Satisfaction, Sympathy for the Devil", 1,  "https://upload.wikimedia.org/wikipedia/commons/f/fc/Trs_20150623_milwaukee_jp_105.jpg",   "http://www.rollingstones.com/"
  );

INSERT INTO rock_bands (name, genre, description, notable_songs, still_active, image_url, website_url)
  VALUES (
    "Nirvana", "Grunge", "Nirvana was an American rock band formed by lead singer and guitarist Kurt Cobain and bassist Krist Novoselic in Aberdeen, Washington, in 1987. Nirvana went through a succession of drummers, the longest-lasting and best-known being Dave Grohl, who joined in 1990. Despite releasing only three full-length studio albums in their seven-year career, Nirvana has come to be regarded as one of the most influential and important alternative bands in history. Though the band dissolved in 1994 after the death of Cobain, their music maintains a popular following and continues to influence modern rock and roll culture.", "Smells Like Teen Spirit, Heart Shaped Box, Polly", 0,    "https://upload.wikimedia.org/wikipedia/commons/1/19/Nirvana_around_1992.jpg", "http://www.nirvana.com/"
  );

INSERT INTO rock_bands (name, genre, description, notable_songs, still_active, image_url, website_url)
  VALUES (
    "Pink Floyd", "Progressive Rock", "Pink Floyd were an English rock band formed in London in 1965. They achieved international acclaim with their progressive and psychedelic music. Distinguished by their philosophical lyrics, sonic experimentation, extended compositions, and elaborate live shows, they are one of the most commercially successful and influential groups in popular music history.", "Time, Wish you were here", 0, "https://i.redd.it/8igf3t7akdby.jpg", "http://www.pinkfloyd.com"
  );
