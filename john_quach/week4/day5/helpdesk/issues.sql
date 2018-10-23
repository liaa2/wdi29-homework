CREATE TABLE issues(
id                  INTEGER PRIMARY KEY AUTOINCREMENT,
summary             TEXT,
description         TEXT,
cust_name           TEXT,
business_unit       TEXT,
priority            TEXT,
category            TEXT,
resolved            BOOLEAN,
resolution          TEXT,
technician_id       INTEGER
);

-- Type ie Networking, Desktop
INSERT INTO issues(summary,description,cust_name,business_unit,priority,category,resolved,resolution,technician_id)
  VALUES( "Cannot Print from laptop", "Recently I got my laptop re-configured and now cannot print to local print", "Robert Burns", "Coporate", "High", "Desktop Support",1,"WIP",1
);

INSERT INTO issues(summary,description,cust_name,business_unit,priority,category,resolved,resolution,technician_id)
  VALUES( "Performance issues with submit", "Recently I got my laptop re-configured and now cannot print to local print", "Robert Burns", "Coporate", "High", "Desktop Support",1,"WIP",1
);

INSERT INTO issues(summary,description,cust_name,business_unit,priority,category,resolved,resolution,technician_id)
  VALUES( "Sensor light broken", "Recently I got my laptop re-configured and now cannot print to local print", "Robert Burns", "Coporate", "High", "Desktop Support",1,"WIP",1
);
