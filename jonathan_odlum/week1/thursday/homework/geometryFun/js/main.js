console.log("All 'function'ing as normal. (ha ha)");

// Geometry Function Lab
// Part 1, Rectangle
// Given a rectangle object like the one below, write the following functions:
//
// isSquare(rect) - Returns whether the rectangle is a square or not
// area(rect) - Returns the area of the rectangle
// perimeter(rect) - Returns the perimeter of the rectangle
// const rectangle = {
//   length: 4,
//   width: 4
// };
// In other words, these functions should take as their only argument a single object with the same keys (length, width) as the rectangle object above, and use that object to make the calculations.

const rectangle = {
  length: 5,
  width: 5
};

const isSquare = function(rect){
  return rect.length === rect.width;
}

const squareArea = function(rect){
  return rect.width*rect.length;
}

const perimeter = function(rect){
  return (rect.width*2+ rect.length*2);
}

console.log(`The rectangle is square: ${isSquare(rectangle)}`);
console.log(`The area is ${squareArea(rectangle)}`);
console.log(`The perimeter is ${perimeter(rectangle)}`);

// Part 2, Triangle
// Given a triangle object like the one below, write the following functions:
//
// isEquilateral(tri) - Returns whether the triangle is equilateral or not
// isIsosceles(tri) - Returns whether the triangle is isosceles or not
// area(tri) - Returns the area of the Triangle
// isObtuse(tri) - Returns whether the triangle is obtuse or not
// const triangle = {
//   sideA: 3,
//   sideB: 4,
//   sideC: 4
// };
// As above, these functions should take a single object as an argument, which will have the same keys as the triangle above, and which you will use for your calcuations.

const triangle = {
  a: 3,
  b: 4,
  c: 5
};

const isEquilateral = function(tri){
  return tri.a===tri.b && tri.a===tri.c;
}

const isIsosceles = function(tri){
  return tri.a===tri.b || tri.a===tri.c || tri.c===tri.b;
}

// A = sqr(s(s-a)(s-b)(s-c)

const triangleArea = function(tri){
  let s = (tri.a+tri.b+tri.c)/2
  return Math.sqrt(s * (s-tri.a) * (s-tri.b) * (s-tri.c));
}

const isObtuse = function(tri){
  let AandB = tri.a**2 + tri.b**2;
  return AandB < tri.c**2;
}


console.log(`It is equilateral: ${isEquilateral(triangle)}`);
console.log(`It is isosceles: ${isIsosceles(triangle)}`);
console.log(`Its area is: ${triangleArea(triangle)}`);
console.log(`It is obtuse: ${isObtuse(triangle)}`);
