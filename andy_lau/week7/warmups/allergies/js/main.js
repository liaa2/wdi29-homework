// Allergies Warmup
// An allergy test produces a single numeric score which contains the information about all the allergies the person has (that they were tested for).
//
// The list of items (and their value) that were tested are:
//
// eggs (1)
// peanuts (2)
// shellfish (4)
// strawberries (8)
// tomatoes (16)
// chocolate (32)
// pollen (64)
// cats (128)
// So if Tom is allergic to peanuts and chocolate, he gets a score of 34.
//
// Now, given just that score of 34, your program should be able to say:
//
// Whether Tom is allergic to any one of those allergens listed above.
// All the allergens Tom is allergic to.


// // // // // // // MY SOLUTION // // // // // //
const allergies = {
  cats: 128,
  pollen: 64,
  chocolate: 32,
  tomatoes: 16,
  strawberries: 8,
  shellfish: 4,
  peanuts: 2,
  eggs: 1
};

const test = function(score){
  let remainder = score;
  let allergyArray = [];
  let i = 0;
  for (let key in allergies) {
    if (remainder >= allergies[key]) {
      remainder = remainder - allergies[key];
      allergyArray.push(Object.keys(allergies)[i]);
    }
    i += 1
  }
  if (allergyArray.length > 0) {
    return `Allergic to: ${allergyArray.join(', ')}`;
  } else {
    return 'You are Immune'
  }
};

console.log(test(34));
