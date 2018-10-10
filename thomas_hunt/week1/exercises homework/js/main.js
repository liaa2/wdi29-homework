//
//
// console.log('js is loaded');
//
// const numberOfChildren = 3;
// const PartnersName = "Tom";
// const geographicLocation = "Sydney";
// const jobTitle = "Dev";
//
//
//
// console.log("you will be a " + jobTitle + " in " + geographicLocation + " and married to " +PartnersName + " "+ "with " + numberOfChildren)
//
//
// //Age calculator
//
// const currentYear = 2018;
// const BirthYear = 1993;
//
// const ageAfterBirthday = currentYear - BirthYear
// const ageBeforeBirthday = ageAfterBirthday -1
//
// console.log(`You are either ${ageBeforeBirthday} or ${ageAfterBirthday} years old`);
//
//
// const currentAge = 50;
// const maximumAge = 60;
// const amountPerDay = 5;
//
// const yearsRemaining = maximumAge - currentAge;
// const amountPerYear = amountPerDay * 365;
//
// const totalSnacksRequired = yearsRemaining * amountPerYear;
//
// console.log(`you will need a total of ${totalSnacksRequired} to last you until the ripe old age of ${maximumAge}.` )
//
//
// console.log('Geometrizer');
//
// const radius = 72;
// const circumference = 2 * Math.PI * radius;
// // calculate square
// const area = Math.PI**3
//
// console.log (`The circumference is ${circumference}, and the area is ${area}`);
//
// /* multiline
// comment
// */
//
//
// //Lifetime supply Calculator
//
//
//
// // The Fortune Teller
// // Why pay a fortune teller when you can just program your fortune yourself?
// //
// // Store the following into variables: number of children, partner's name, geographic location, job title. Output your fortune to the screen like so: "You will be a X in Y, and married to Z with N kids."
// //
// // The Age Calculator
// // Forgot how old someone is? Calculate it!
// //
// // Store the current year in a variable.
// // Store their birth year in a variable.
// // Calculate their 2 possible ages based on the stored values.
// // Output them to the screen like so: "They are either NN or NN", substituting the values.
// // The Lifetime Supply Calculator
// // Ever wonder how much a "lifetime supply" of your favorite snack is? Wonder no more!
// //
// // Store your current age into a variable.
// // Store a maximum age into a variable.
// // Store an estimated amount per day (as a number).
// // Calculate how many you would eat total for the rest of your life.
// // Output the result to the screen like so: "You will need NN to last you until the ripe old age of X".
// // The Geometrizer
// // Calculate properties of a circle, using the definitions here.
// //
// // Store a radius into a variable.
// // Calculate the circumference based on the radius, and output "The circumference is NN".
// // Calculate the area based on the radius, and output "The area is NN".
// // The Temperature Converter
// // It's hot out! Let's make a converter based on the steps here.
// //
// // Store a celsius temperature into a variable.
// // Convert it to fahrenheit and output "NN°C is NN°F".
// // Now store a fahrenheit temperature into a variable.
// // Convert it to celsius and output "NN°F is NN°C."
//
//
// //Data input output of our prograk (variables) - Naming data
//
// //code the process we apply to transform our data (functions) - Naming functions
//
//
// const fortuneTeller = function (jobTitle, geographicLocation, PartnersName, numberOfChildren) {
// result = (`hello ${jobTitle} in ${geographicLocation} married too ${PartnersName} with ${numberOfChildren} number of children`);
// return result;
//
// }
//
// fortuneTeller ('dev', 'sydney','Tom','6');
//
//
// const calculateDogAge = function (dogAge, conversionRate){
//   // const humanAge = dogAge*7
// const humanAge = dogAge * 7;
// return `Your doggie is ${dogAge * conversionRate} years old in dog years`;
//
// } ;
//
// console.log(calculateDogAge(1,3) );
// console.log(calculateDogAge(2,5) );
// console.log(calculateDogAge(5,9) );
//
//
// const squareNumber = function (num,){
// const squared = num **2
// result = `The result of squaring the ${num} is ${squared}`
// return result;
//
//
// }
//
// squareNumber (3);
//
// const halfNumber = function(num){
// const twodivide = num/2
// let result = `Half of ${num} is ${twodivide}  `
// return result;
//
// };
//
// halfNumber(5);
//
// const percentOf = function (num1, num2) {
// const number = (num1 /num2)*100 ;
// return `${num1} is ${number}% of ${num2}`;
//
// };
//
// // console.log(percentOf(10, 20))
// //
// //
// // const areaOfCircle = function (radius) {
// // const calculation =  *
// //
//
// // }
//
//
// const greaterNum = function (no1,no2) {
// if (no1 > no2) {
//
// console.log(`The greater Number of ${no1} and ${no2} is ${no2}`)
// }
//
// greaterNum(10,5);
//
//
// const function = areaOfCircle (){
//
// }
//
//
// const mixup = function (string1, string2){
//
// }
//
//
// ## What number's bigger?
//
// Write a function named greaterNum that:
// - takes 2 arguments, both numbers.
// - returns whichever number is the greater (higher) number.
// - Call that function 2 times with different number pairs, and log the output to make sure it works (e.g. "The greater number of 5 and 10 is 10."
//


//
// const greaterNum = function (num1, num2);{
//
//
// if ( `${num1}> ${um2}` ) {
//   return `The greater number of ${num1} and ${num2} is ${num2}`
//
// } else if (`${num2}<${num1}`) {
//   return `${num2} is greater than ${num1}
//
//   }
//
// }
//
// greaterNum (5,10);
//


const raindrops = function (number){
  let string = "";
  if (number % 3 === 0 ) {
    string += "pling"
  }
  if (number % 5===0){
    string += "plong"

  } if (number %7===0)
  string += "plong"


} if (string.length ===0){
  string += number;
}
return string;
}

console.log(raindrops(28));
console.log(raindrops(1755));
console.log(raindrops(34));
console.log(raindrops(105));
