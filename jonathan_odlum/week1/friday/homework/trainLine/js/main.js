console.log('Trains are running. Where to sir?');

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


// The N line has the following stops: Times Square, 34th, 28th, 23rd, Union Square, and 8th
// The L line has the following stops: 8th, 6th, Union Square, 3rd, and 1st
// The 6 line has the following stops: Grand Central, 33rd, 28th, 23rd, Union Square, and Astor Place.
// All 3 subway lines intersect at Union Square, but there are no other intersection points. (For example, this means the 28th stop on the N line is different than the 28th street stop on the 6 line, so you might need to differentiate this when you name your stops in the arrays.)
// Tell the user the number of stops AND the stops IN ORDER that they will pass through or change at.

const tripPlanner = {
  lines: {
    N:[
      'Times Square',
      '34th',
      '28th',
      '23rd',
      'Union Square',
      '8th',
    ],

    L:[
      '8th',
      '6th',
      'Union Square',
      '3rd',
      '1st',
    ],

    6:[
      'Grand Central',
      '33rd',
      '28th',
      '23rd',
      'Union Square',
      'Astor Place'
    ],
  },

  checkLine: function(line){
    let lineExists = line in tripPlanner.lines;
    if (!lineExists){
      console.log(`${line} does not exist in this network.`);
    }
    return lineExists;
  },

  checkStop: function(stop, line){
    let stopExists = this.lines[line].includes(stop);
    if (!stopExists){
      console.log(`${stop} does not exist in ${line}.`);
    }
    return stopExists;
  },

  checkInput: function(line1, stop1, line2, stop2){
    let validInputs = true;

    //check all inputs for value of 'string';
    if (typeof line1 !== 'string' || typeof stop1 !== 'string' || typeof line2 !== 'string' || typeof stop2 !== 'string'){

      validInputs = false;
      console.log(`Invalid input`);
    }

    validInputs = this.checkLine(line1);
    validInputs = this.checkLine(line2);

    validInputs = this.checkStop(stop1, line1);
    validInputs = this.checkStop(stop2, line2);

    return validInputs;
  },

  //Gets the order of stops and returns them in an array.
  orderedStops: function(arr, index1, index2){
    let stopList = [];
    if (index1 < index2){
      for (let i = index1+1; i < index2+1; i ++){
        stopList.push(arr[i]);
      }
    } else {
      for (let i = index2; i < index1; i ++){
        stopList.push(arr[i]);
      }
      stopList.reverse();
    }
    return stopList
  },

  //Given 2 stops on a line and returns the path between them as an array.
  travelLine: function(line, stop1, stop2){
    let currentLine =line;          //gets the correct key from the single character input.
    let lineStops = this.lines[currentLine];
    //Get the Array positions of the stops.
    let stop1Id;
    let stop2Id;
    for (let i = 0; i < lineStops.length; i ++){
      if (stop1 === lineStops[i]){
        stop1Id = i;
      } else if (stop2 === lineStops[i]){
        stop2Id = i;
      }
    }
    let stops = this.orderedStops(lineStops, stop1Id, stop2Id);
    return stops
  },
};

const planTrip = function(line1, stop1, line2, stop2){
  if(!tripPlanner.checkInput(line1, stop1, line2, stop2))
    return;
  let trip = {};
  console.log('Your Trip');
  console.log(`Boarding at ${stop1}:`);
  if ( line1 === line2 ){
    trip.leg1 = tripPlanner.travelLine(line1, stop1, stop2)
    console.log(`The train will stop at ${trip.leg1.join(', ')}. Alight at ${trip.leg1.slice(-1)[0]}.`);
    console.log(`A total of ${trip.leg1.length} stops.`);
  } else {
    change = 'Union Square';
    trip.leg1 = tripPlanner.travelLine(line1, stop1, change)
    trip.leg2 = tripPlanner.travelLine(line2, change, stop2)
    console.log(`The train will stop at ${trip.leg1.join(', ')}. Alight at Union Square to change.`);
    console.log(`Go to line ${line2}.`);
    console.log(`The train will stop at ${trip.leg2.join(', ')}. Alight at ${trip.leg2.slice(-1)[0]}`);
    console.log(`A total of ${trip.leg1.length + trip.leg2.length} stops.`);
  }
};

planTrip('N', '34th', 'L', '8th');
planTrip('N', 'Times Square', 'N', '8th');
