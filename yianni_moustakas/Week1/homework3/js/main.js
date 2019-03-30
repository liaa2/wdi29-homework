// Geometry Function Lab

// Part 1, Rectangle
// Given a rectangle object like the one below, write the following functions:
//
const rectangle = {
  length: 4,
  width: 5
};
// isSquare(rect) - Returns whether the rectangle is a square or not

const isSquare = function (rectangle) {
  let shape = "Rectangle";
  if (rectangle.length === rectangle.width) {
    shape = "Square";
  }
  return shape;
}

// area(rect) - Returns the area of the rectangle

const area = function (rectangle) {
  return rectangle.length * rectangle.width;
}

// perimeter(rect) - Returns the perimeter of the rectangle

const perimeter = function (rectangle) {
  return (rectangle.length*2) + (rectangle.width*2);
}

// In other words, these functions should take as their only argument a single object with the same keys (length, width) as the rectangle object above, and use that object to make the calculations.
//


// Part 2, Triangle
// Given a triangle object like the one below, write the following functions:

const triangle = {
  sideA: 6,
  sideB: 6,
  sideC: 9
};

// isEquilateral(tri) - Returns whether the triangle is equilateral or not

const isEquilateral = function (triangle) {
  let a = triangle.sideA;
  let b = triangle.sideB;
  let c = triangle.sideC;
  if (a === b && a === c && b === c) {
    return "equilateral";
  } else {
    return "is not equilateral";
  }
};

// isIsosceles(tri) - Returns whether the triangle is isosceles or not

const isIsosceles = function (triangle) {
  let a = triangle.sideA;
  let b = triangle.sideB;
  let c = triangle.sideC;
  if ((a === b && b !== c) || (a===c && c !== b) || (b===c && c !== a)) {
    return "isosceles";
  } else {
    return "is not isosceles";
  }
};

// area(tri) - Returns the area of the Triangle

const triArea = function (triangle) {
  let a = triangle.sideA;
  let b = triangle.sideB;
  let c = triangle.sideC;
  let s = (a + b + c)/2;
  let heron = s*(s-a)*(s-b)*(s-c);
  return Math.floor(Math.sqrt(heron));
};

// isObtuse(tri) - Returns whether the triangle is obtuse or not



// As above, these functions should take a single object as an argument, which will have the same keys as the triangle above, and which you will use for your calcuations.
//


//  js-homework-5.md
// The Cash Register
// Write a function called cashRegister that takes a shopping cart object. The object contains item names and prices (itemName: itemPrice). The function should return the total price of the shopping cart. Example
//
// // Input


const cartForParty = {
  banana: "1.25",
  handkerchief: ".99",
  Tshirt: "25.01",
  apple: "0.60",
  nalgene: "10.34",
  proteinShake: "22.36"
};


// // Output
const cashRegister = function(cartForParty) {

  let totalPrice = 0

  for (let k in cartForParty) {
    let currentPrice = parseFloat(cartForParty[k]);
    totalPrice += currentPrice;
    console.log(currentPrice)
    console.log(totalPrice)
  }
  return `$${totalPrice}`;
}; // 60.55


// Tried to do again with two for loops. Brad's example.
const cashRegister = function(input) {

  let totalPrice = 0
  let prices = []

  for (let k in input) {
    prices.push(input);
    let currentPrice = parseFloat(input[k]);
  }
  for (let i = 0; i < prices; i++)
    totalPrice += prices;
    console.log(currentPrice)
    console.log(totalPrice)
  }
  return `$${totalPrice}`;
}; // 60.55





//  js-homework-bank.md
// JavaScript Bank
// In this homework, you'll create a basic bank in Javascript. The bank has many accounts and the following capabilities that you need to write.
//

// Bank
// There is only one bank. This bank has an array of accounts. The bank needs a method that will return the total sum of money in the accounts. It also needs an addAccount method that will enroll a new account at the bank and add it to the array of accounts. There is no need to create additional functions of the bank to delete accounts, etc.
//
// The bank has many accounts. Accounts should be objects that all share a set of common functionality.
//
// Accounts
// Accounts have a current balance and owner's name. You should be able to deposit or withdraw from an account to change the balance.
//
// There is no need to write a user interface. Make sure functions return values -- you may also have your functions console.log() values to help you see your code working.
//
// You should write a basic story through a series of JavaScript commands that shows that the methods do indeed work as expected: add some accounts, show the total balance, make some deposits and withdrawals, show the new total balance.
//
// Tips
// Don't overthink this. Shorter code is probably the answer.
//


const bank = {
  accounts: [
    {ownersName: "Mary", currentBalance: 5},
    {ownersName: "George", currentBalance: 20},
    {ownersName: "Cameron", currentBalance: 10000},
    {ownersName: "Hunter", currentBalance: 20}
  ],

  totalSumOfAllAccounts: function () {

    let sum = 0;

    for (let i=0; i< this.accounts.length; i++) {
      let balance = this.accounts[i].currentBalance;
      sum += balance;
    } // for
    return sum;
  },

  addAccount: function (name, amount) {
    // Version 1
    // let noOfAccounts = this.accounts.length;
    // this.accounts[noOfAccounts] = {};
    // this.accounts[noOfAccounts] = name;
    // this.accounts[noOfAccounts] = currentBalance;

    // Version 2
    // const newAccount ={
    //   ownersName: name,
    //   currentBalance: amount
    // };
    // this.accounts.push(newAccount);
    // console.log(this.accounts)

    //Version 3
    this.accounts.push({ownersName: name, currentBalance: amount})
    console.log(this.accounts)
  },


  deposit: function (name, depositAmount) {
    for (let i = 0; i < this.accounts.length; i++) {
      if (this.accounts[i].ownersName === name) {
        this.accounts[i].currentBalance += depositAmount;
      }
    } // for
    return currentBalance; // shoud this be in the for loop?
  },

  withdraw: function (name, withdrawAmount) {
    for (let i = 0; i < this.accounts.length; i++) {
      if (this.accounts[i].ownersName === name) {
        if (withdrawAmount > this.accounts[i].currentBalance) {
          console.log("Insufficient Funds!");
        }
        if (withdrawAmount < this.accounts[i].currentBalance) {
          this.accounts[i].currentBalance == withdrawAmount;
        }
      }
    } // for
    return currentBalance; // shoud this be in the for loop?
  },

  showAccountBalance: function (name) {
    for (let i = 0; i < this.accounts.length; i++) {
      if (this.accounts[i].ownersName === name) {
        console.log(this.accounts[i].currentBalance);
        // console.log("YES")
      }
    }
  },

  transfer: function(name1, name2, amount) {

  }

};




// Bonus
// Ensure that the accounts cannot have negative values.
// Write a 'transfer' on the bank that allows you to transfer amounts between two accounts.
// Additional
// Begin exploring the JavaScript Koans. Fork, clone and start trying them.
//
// Credit Card Validation
// You're starting your own credit card business. You've come up with a new way to validate credit cards with a simple function called validateCreditCard that returns true or false.
//
// Here are the rules for a valid number:
//
// Number must be 16 digits, all of them must be numbers
// You must have at least two different digits represented (all of the digits cannot be the same)
// The final digit must be even
// The sum of all the digits must be greater than 16
// The following credit card numbers are valid:
//
// 9999-9999-8888-0000
// 6666-6666-6666-1666
// The following credit card numbers are invalid:
//
// a923-3211-9c01-1112 invalid characters
// 4444-4444-4444-4444 only one type of number
// 1111-1111-1111-1110 sum less than 16
// 6666-6666-6666-6661 odd final number
// Example
// validateCreditCard('9999-9999-8888-0000'); // Returns: true
// Hint: Remove the dashed from the input string before checking if the input credit card number is valid.
//
// Bonus: Return an object indicating whether the credit card is valid, and if not, what the error is
//
// { valid: true, number: 'a923-3211-9c01-1112' }
// { valid: false, number: 'a923-3211-9c01-1112', error: ‘wrong_length’ }
// Double Bonus: Make your credit card scheme even more advanced! What are the rules, and what are some numbers that pass or fail? Ideas: check expiration date! Check out the Luhn Algorithm for inspiration.
