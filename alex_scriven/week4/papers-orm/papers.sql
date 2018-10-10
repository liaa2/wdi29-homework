CREATE TABLE papers (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT,
  year, INTEGER,
  citations INTEGER,
  web_link TEXT,
  author_id INTEGER
);

INSERT INTO papers (
  title, year, citations, web_link, author_id
)
VALUES("Random Forests", 2001, 39626, "https://www.stat.berkeley.edu/~breiman/randomforest2001.pdf", 1
);
INSERT INTO papers (
  title, year, citations, web_link, author_id
)
VALUES("Statistical Modeling: The Two Cultures", 2001, 2193, "http://www2.math.uu.se/~thulin/mm/breiman.pdf", 1
);
INSERT INTO papers (
  title, year, citations, web_link, author_id
)
VALUES("XGBoost: A Scalable Tree Boosting System", 2016, 1337, "https://arxiv.org/pdf/1603.02754.pdf", 3
);
INSERT INTO papers (
  title, year, citations, web_link, author_id
)
VALUES("C4.5", 1993, 34161, "https://books.google.com.au/books/about/C4_5.html?id=1F1QAAAAMAAJ&source=kp_book_description&redir_esc=y", 2
);
INSERT INTO papers (
  title, year, citations, web_link, author_id
)
VALUES("Induction of Decision Trees", 1985, 19894, "http://hunch.net/~coms-4771/quinlan.pdf", 2
);
