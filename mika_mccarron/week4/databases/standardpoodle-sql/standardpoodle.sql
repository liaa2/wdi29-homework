--
-- # Homework on Thu, 4 Oct
-- # Mountains or Oceans or pick anything
--
-- Create a CRUD (Create, Read, Update, Delete) app for either Mountains or Oceans (or anything else that you pick).
--
-- Make sure to include the following:
-- - A page of all records in your database (e.g. all mountains)
-- - A page that shows one record (e.g. one mountain)
-- - A way to create, update, and delete a record
--
-- Make sure to use:
-- - SQL
-- - Seperate your concerns (with views for each action)
-- - Use a layout to hold all of your generic code


CREATE TABLE standardpoodles (
id INTEGER PRIMARY KEY AUTOINCREMENT, --take care of ID's internally
name TEXT,
color TEXT,
age TEXT,
temperment INTEGER,
award INTEGER,
alive BOOLEAN,
image_url TEXT
);


INSERT INTO standardpoodles( name, color, age, temperment, award,image_url)
VALUES("Chemmy", "White", 3 , 1, 0, 1, "https://gfnc1kn6pi-flywheel.netdna-ssl.com/wp-content/uploads/2017/09/white-poodle-names.jpg"
);

INSERT INTO standardpoodles( name, color, age, temperment, award,image_url)
VALUES("Baccarat", "Blue", 7, 1, 8, 0,   "https://cdn.pixabay.com/photo/2013/11/28/12/14/dog-220457_960_720.jpg"
);


INSERT INTO standardpoodles( name, color, age, temperment, award,image_url)
VALUES("Lalique", "Black", 7, 4, 10, 1, "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Full_attention_%288067543690%29.jpg/1200px-Full_attention_%288067543690%29.jpg"
);
