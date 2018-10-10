//**PART 1

// Write a function called squareNumber that will take one argument (a number), square that number, and return the result. It should also log a string like "The result of squaring the number 3 is 9."
// Write a function called halfNumber that will take one argument (a number), divide it by 2, and return the result. It should also log a string like "Half of 5 is 2.5.".
// Write a function called percentOf that will take two numbers, figure out what percent the first number represents of the second number, and return the result. It should also log a string like "2 is 50% of 4."
// Write a function called areaOfCircle that will take one argument (the radius), calculate the area based on that, and return the result. It should also log a string like "The area for a circle with radius 2 is 12.566370614359172."
// Bonus: Round the result so there are only two digits after the decimal.


let squareNumber = function(number){

const result = number * number
console.log(`the result of squaring ${number} is ${result} `)

}

squareNumber(3);

let halfNumber = function (number){

  const result = number/2

  console.log (`half of ${number} is ${result}`)


};

halfNumber(5);


let percentOf = function (num1,num2){

  const result = ((num1/num2)*100)
    console.log (`The result of ${num1} is ${result} of ${num2}`)

};

percentOf(10,5)

let areaOfCircle = function(radius){

const result = radius * radius
console.log (`the area for a circle of a ${radius} is ${result}`)

}
areaOfCircle(3)



//Strings
// Create a function called DrEvil. It should take a single argument, an amount, and return ' dollars', except it will add '(pinky)' at the end if the amount is 1 million. For example:
//
//   DrEvil(10): 10 dollars
//   DrEvil(1000000): 1000000 dollars (pinky)

let drEvil = function(amount){

if (amount == 1000000) {
  console.log(`drEvil (${amount}): ${amount} dollars (pinky)`)
} else {
  console.log (`drEvil (${amount}): ${amount} dollars`)
}

}
drEvil(10);

let mixUp = function(mix, pod){

let mix = 'mix'
let pod = 'pod'

console.log()



}
