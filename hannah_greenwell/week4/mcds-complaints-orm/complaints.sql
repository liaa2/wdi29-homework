CREATE TABLE complaints (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  date_made TEXT,
  title TEXT,
  content TEXT,
  customer_id INTEGER -- foregin key
);

INSERT INTO complaints (date_made, title, content, customer_id)
  VALUES (
    '13/05/2017',
    'I Expect A Good Chocolaty Milkshake',
    "I went into McDonald's, and ordered a chocolate milkshake, that I was excited for. They gave me a milkshake but it most certainly was not chocolate, maybe there was a little but when I order a chocolate milkshake I expect a good chocolaty milkshake. I was not happy about it especially since I’m paying the money for what I order and that’s not what they bring me.",
    3
  );

INSERT INTO complaints (date_made, title, content, customer_id)
  VALUES (
    '28/02/2018',
    'What Happened To The North Atlantic White Fish?',
    "I only have to say what has happened to the fish sandwich. It has no flavor - the tartar sauce tastes like lemon seeds. What happened to the North Atlantic white fish which used to be advertised so greatly back in the day, such a disappointment anymore... The fries need help also.",
    3
  );

INSERT INTO complaints (date_made, title, content, customer_id)
  VALUES (
    '11/10/2016',
    'I Get Facial Expressions In A Way That Annoys Me',
    "I come to McDonald's every so often, and when I do, these young adults behave unprofessionally. I am a single mom and older than they are. I cannot believe that they behave like little kids. I get facial expressions in a way that they annoy me. I noticed that when there are other customers in their establishment, they don't treat the other customers like they treat me. I really hate going there sometimes.",
    1
  );

INSERT INTO complaints (date_made, title, content, customer_id)
  VALUES (
    '04/10/2017',
    "I'm Not Sure How Many Bugs I Had Already Eaten",
    "I ordered two of their apple pies. After almost finishing one of the pies. I noticed what appeared to be a burned piece of pie. So I went to take it off, but upon looking directly at it, I saw it was not a burned flake, but a bug. I also felt something string like inside my mouth, and reached inside my mouth and found a bug leg. I was totally disgusted, especially because I'm not sure how many bugs I had already eaten.",
    1
  );

INSERT INTO complaints (date_made, title, content, customer_id)
  VALUES (
    '30/03/2017',
    "Sundaes With A Drip Of Sauce",
    "I've a family of 4 that very much enjoy mcdonalds caramel sundaes with plenty sauce. at the beginning things were fine we asked for extra sauce we paid for it all happy. recently we have been denied our extra sauce even though we pay for it. our recent trips to mcdonalds have resulted in sundaes with a drip of sauce that my family wont eat so can you let us know if we can buy extra sauce or not. considering i spend around 50 per week on them its not asking much and is there any chance of sending us out some sauce so that the 20 sundaes in my freezer can be eaten please. thank you.",
    1
  );

INSERT INTO complaints (date_made, title, content, customer_id)
  VALUES (
    '10/08/2018',
    "They Didn’t Give Me All My Nuggets",
    "Let me tell you, I was ready to have a nice meal at McDonald’s and I look in my chicken nugget box and I could not believe it - there were 9 chicken nuggets instead of 10 and that just made my day bad. I was really disappointed in this. The service was fine but they didn’t give me all my nuggets.",
    4
  );

INSERT INTO complaints (date_made, title, content, customer_id)
  VALUES (
    '18/05/2016',
    "I Did Not Notice Until I Was Half Way Through",
    "We ordered a Big and Tasty hamburger from McDonald's, and the burger was raw. I did not notice until I was half way through.",
    4
  );

INSERT INTO complaints (date_made, title, content, customer_id)
  VALUES (
    '22/06/2015',
    "Ebola Is A Concern Of Mine",
    "Well today I went in and the lobby is full of flies. My thought is if the flies are in the lobby, then they are where they prepare the food. When I say full of flies there were only like 7 but that is plenty. I used 2 manage a restaurant when I was 18, so it was many yrs back but we never had bugs in the building. I blame this on management...... plus they handed my food 2 someone else then tried 2 give it 2 me. Ebola is a concern of mine, but not only that people are dirty, you don't know if someone washes their hands ever....... I'm just not satisfied with the service. It is just disgusting........",
    2
  );

INSERT INTO complaints (date_made, title, content, customer_id)
  VALUES (
    '14/02/2017',
    "My Burger Was Ruined By Ketchup",
    "I ordered a number 2 meal. In the first place ketchup does not belong on a hamburger. All it had was meat ketchup (which ruined the meat) pickle and onion - no lettuce, no tomato, no nothing that comes with an American hamburger!!! Mayo or mustard but never ketchup that goes with fries. I was cheated with nothing on my burger. Ordered two, paid 13 dollars and my burger was ruined by ketchup.",
    2
  );
