CREATE TABLE camping_grounds(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name              TEXT,
  description        TEXT,
  location          TEXT,
  type              TEXT,
  entry_fee         INTEGER,
  booking           BOOLEAN,
  image_url         TEXT
);


INSERT INTO camping_grounds( name,description,location,type,entry_fee,booking,image_url)
VALUES(
"Cattai Campground","Enjoy a weekend away camping at Cattai National Park along the Hawkesbury River. Go walking, camping, canoeing and bike riding before cooking up a barbecue feast",
"Cattai","Caravan Site",50,1,"images/1.jpg"
);

INSERT INTO camping_grounds( name,description,location,type,entry_fee,booking,image_url)
VALUES(
"Frazer Campground","Small and secluded, this camping spot is perfect for weekend getaways, with easy access walks and a nearby lagoon at the beach where the kids can make a splash.",
"Frazer","Tent Site",150,0,"images/2.jpg"
);

INSERT INTO camping_grounds( name,description,location,type,entry_fee,booking,image_url)
VALUES(
"Lane Cove River Tourist","The caravan park at Lane Cove River Tourist Park offers tent, campervan, motorhome or caravan camping in a campground with great facilities near Lane Cove National Park, close to Sydney.",
"Lane Cove","Caravan Site",150,0,"images/3.jpg"
);
