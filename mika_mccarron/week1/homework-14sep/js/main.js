// MTA Lab
// Objectives:
// Apply your knowledge of Javascript to solve a real world problem.
// Get really good at array manipulation and JS data structures.
// Activity
// Create a program that models a simple subway system.
//
// The program takes the line and stop that a user is getting on at and the line and stop that user is getting off at and prints the journey and the total number of stops for the trip in the console:
//
// planTrip('N', 'Times Square', '6', '33rd'); // This is only a suggested function name and signature.
//
// // console.log() shows output similar to this:
// // "You must travel through the following stops on the N line: 34th, 28th, 23rd, Union Square."
// // "Change at Union Square."
// // "Your journey continues through the following stops: 23rd, 28th, 33rd."
// // "7 stops in total."
// There are 3 subway lines:
// The N line has the following stops: Times Square, 34th, 28th, 23rd, Union Square, and 8th
// The L line has the following stops: 8th, 6th, Union Square, 3rd, and 1st
// The 6 line has the following stops: Grand Central, 33rd, 28th, 23rd, Union Square, and Astor Place.
// All 3 subway lines intersect at Union Square, but there are no other intersection points. (For example, this means the 28th stop on the N line is different than the 28th street stop on the 6 line, so you might need to differentiate this when you name your stops in the arrays.)
// Tell the user the number of stops AND the stops IN ORDER that they will pass through or change at.
// Your trip planner must work in either direction, i.e. planTrip('N', 'Times Square', '6', '33rd') (starting at Times Square) should work as well as the reverse trip planTrip('6', '33rd', 'N', 'Times Square') (starting at 33rd).
// Hints:
// Work out how you would do it on paper first! Then start to explain that process in Javascript.
// Get the program to work for a single line before trying to tackle multiple lines.
// Don't worry about prompting the user for input. Hard code some values to get it working. You can use prompt() later to make it more interactive.
// Consider diagramming the lines by sketching out the subway lines and their stops and intersection.
// The key to the lab is finding the index positions of each stop. (hint: indexOf())
// Depending on what kind of data structures you use to represent the lines and stations, you might have to make sure the stops that are the same for different lines have different names (i.e. 23rd on the N and on the 6 need to be differentiated)

//console.log("JS loaded!");

const trainLines = {
  'N':['Times Square', '34th', '28th', '23rd', 'Union Square', '8th'],
  'L':['8th','6th','Union Square','3rd', '1st'],
  '6':['Grand Central', '33rd', '28th','23rd', 'Union Square', 'Astor Place'],
};
// console.log(trainLines);

const singleLineTrip = function( lineName, startStation, endStation ){

	// this console.log is just for debugging, to help you see what arguments this function is getting
  console.log('Arguments to this function are:',  lineName, startStation, endStation );//???Is this calling the function?
  let tripStations = [];  // create a new empty array and store it in a local variable of the function called tripStations

  let lineStations = trainLines[ lineName ];
  // console.log(`lineStations is:`, lineStations);

  // here's where you work out the stations which will be passed on this trip
  // the first thing you will need to do is retrieve the array which lists the stations for the line the trip is happening on
  // (the name of this line is in the `lineName` argument for this function, which you can use like any normal variable -
  // you will need to use it as a key into your object which stores the 3 lines, to access the array of stations for the requested line
  // ..... do something here which loops through the stations in the specified line, from the specified start to end, and adds them to the new array tripStations.....
  return tripStations;

}; // end of singleLineTrip()

// debugger;

const results = singleLineTrip('6', '33rd', 'Union Square');

console.log( results );
