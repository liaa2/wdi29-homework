CREATE TABLE technicians (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name                TEXT,
  department          TEXT,
  location            TEXT,
  country             TEXT,
  certification       TEXT,
  level               TEXT,
  on_call             BOOLEAN,
  image_url           TEXT
);


-- Name: TEXT
-- Department.    Ie Networking, Cloud, Business Intelligence, D : 8esktop Support
-- Location:
-- Country:
-- Certification. ITL, Microsoft Cetfied, CISCO
-- Years of Service: 8
-- On Call?

INSERT INTO technicians (name,department,location,country,certification,level,on_call,image_url)
VALUES("Bill Murray","Desktop Support","Sydney","Australia","SAP Certified","Junior",0,"http://fillmurray.com/300/300"
);
