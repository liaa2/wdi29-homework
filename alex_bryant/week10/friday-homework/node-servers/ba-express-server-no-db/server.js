//My fake DB
const flights = [
  {
    id: 1,
    flight_number: '123',
    departure_date_formatted: 'Tue 25 December, 08:00am',
    origin: 'SYD',
    destination: 'SFO',
    plane: {
      name: '737',
      rows: 40,
      cols: 4
    }
  },
  {
    id: 2,
    flight_number: '345',
    departure_date_formatted: 'Tue 26 December, 04:00am',
    origin: 'SYD',
    destination: 'SFO',
    plane: {
      name: 'A380',
      rows: 40,
      cols: 6
    }
  },
  {
    id: 3,
    flight_number: '545',
    departure_date_formatted: 'Tue 25 December, 11:00am',
    origin: 'SYD',
    destination: 'MEL',
    plane: {
      name: '737-800',
      rows: 20,
      cols: 4
    }
  }
];

const reservations = {

};

const user_reservations = {

};

const express = require('express');
const cors = require('cors');
const app = express();

//all cross-origin requests
app.use(cors());

const server = app.listen(3000, () => {
  console.log('Server listening on port 3000...');
});

//listen for GET requests on the '/' path of the server
app.get('/', (req, res) => {
  //handle a request by sending a response
  console.log(req.query);
  // res.send('<h1>Hello World from Node.js Express</h1>');
  res.json(req.query);
});

//listen for GET requests on the '/flights' path of the server
app.get('/flights', (req, res) => {
  res.json([
    {id: 1, number: 'BA123'},
    {id: 2, number: 'BA234'},
    {id: 3, number: 'BA345'}
  ]);
});

//listen for GET requests on the '/flights/:id' path of the server
app.get('/flights/:id', (req, res) => {
  console.log(req.params);

  // find the flight object from the array whose id field
  const flight = flights.find(f => f.id === +req.params.id);

  res.json({flight, reservations, user_reservations});
});
