// # Phone Number Check
//
// The rules for a valid phone number in this exercise are as follows:
//
// - If the phone number has any non-numerals in it, they should be removed/ignored
// - If the phone number is 11 digits and the first number is 1, trim the 1 and use the first 10 digits
// - If the phone number is 11 digits and the first number is not 1, then it is an invalid number
// - If the phone number is 10 digits long, it is valid; if not, it is invalid
//
// ## Exercise
//
// 1. Write a Javascript function which takes a phone number as a string and returns the cleaned-up version of the number if it is valid (ie. with non-numerals removed), or if not valid, returns '00000000' (ten zeroes)
// 2. Write a Javascript function which returns a formatted version of the given phone number, ie:
//
// ```plain
// Input:  11234567890
// Output: (123) 456-7890
// I.e., the first 3 numbers are the area code, and are in brackets;
// then comes a space, then the next 3 numbers (the exchange code),
// followed by a dash, then then the last four numbers.
// ```



const phoneNumber = {
  cleanNumber: function(num){
    let cleaned = [];
    let numerals = "0123456789";

    for( let i = 0; i < num.length; i++ ){
      let currentNum = num[i];
      // console.log(currentNum);
      if(numerals.indexOf(currentNum) !== -1){
        cleaned.push(currentNum);
      }//if
    }//for

    cleaned = cleaned.join("")
    // console.log(cleaned);
    if(( cleaned.length === 11 ) && ( cleaned[0] === "1" )){
      return cleaned.substr(1);
    } else {
      return cleaned;
    }
  }, // cleanNumber

  isValid: function(num){
    let cleaned = this.cleanNumber(num);
    if (cleaned.length !== 10) {
      return "0000000000";
    } else {
      return cleaned;
    }
  }, // isValid

  getFormattedNumber: function(num){
    let cleaned = this.cleanNumber(num);
    //substr() extracts length characters from a string, counting from the start index.
    // If start is a positive number, the index starts counting at the start of the string. Its value is capped at str.length.
    // If start is a negative number, the index starts counting from the end of the string. Its value is capped at -str.length.
    // str.substr(start[, length])
    //start - The index of the first character to include in the returned substring.
    //length - Optional. The number of characters to extract.
    let areaCode = cleaned.substr(0, 3);
    let exchangeCode = cleaned.substr(3, 3);
    let remaining = cleaned.substr(6);

    return `(${areaCode}) ${exchangeCode}-${remaining}`
  }
}



const num1 = '112345s67#89mm0123';
console.log('Input:', num1);
console.log('Output:',  phoneNumber.cleanNumber( num1 ) )
console.log('isValid:', phoneNumber.isValid( num1 ) );
console.log( "Formatted:", phoneNumber.getFormattedNumber( num1 ));

console.log("===========================================");

const num2 = '15s67#89mm0124';
console.log('Input:', num2);
console.log('Output:',  phoneNumber.cleanNumber( num2 ) )
console.log('isValid:', phoneNumber.isValid( num2 ) );
console.log( "Formatted:", phoneNumber.getFormattedNumber( num2 ));
