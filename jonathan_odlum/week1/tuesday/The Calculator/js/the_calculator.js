console.log("we working fam.");
// Part 1
// Write a function called squareNumber that will take one argument (a number), square that number, and return the result. It should also log a string like "The result of squaring the number 3 is 9."

const squareNumber = function (number) {
  const square = number * number;
  console.log(`The result of squaring the number ${number} is ${square}.`)
  return square;
}
squareNumber(3);

// Write a function called halfNumber that will take one argument (a number), divide it by 2, and return the result. It should also log a string like "Half of 5 is 2.5.".

const halfNumber = function (number) {
  const half = number/2;
  console.log(`Half of ${number} is ${half}.`);
  return half;
}
halfNumber(3);

// Write a function called percentOf that will take two numbers, figure out what percent the first number represents of the second number, and return the result. It should also log a string like "2 is 50% of 4."

const percentOf = function (x, y) {
  const percentage = (x/y * 100).toFixed(2);
  console.log(`${x} is ${percentage}% of ${y}.`);
  return percentage;
}
percentOf(3, 6);

// Write a function called areaOfCircle that will take one argument (the radius), calculate the area based on that, and return the result. It should also log a string like "The area for a circle with radius 2 is 12.566370614359172."

const areaOfCircle = function (radius){
  const area = Math.PI * radius*radius;
  console.log(`The area for a circle with radius ${radius} is ${area}`);
  // Bonus: Round the result so there are only two digits after the decimal.
  console.log(`To 2 decimal places thats ${area.toFixed(2)}`);
  return area.toFixed(2);
}
areaOfCircle(3);

// Part 2
// Write a function that will take one argument (a number) and perform the following operations, using the functions you wrote earlier1:
//
// Take half of the number and store the result.
// Square the result of #1 and store that result.
// Calculate the area of a circle with the result of #2 as the radius.
// Calculate what percentage that area is of the squared result (#3).

const part2 = function (number) {
  const half = halfNumber(number);
  const squaredHalf = squareNumber(half);
  const area = areaOfCircle(squaredHalf);
  const finalPercentage = percentOf(area, squaredHalf);
}

part2(5);
