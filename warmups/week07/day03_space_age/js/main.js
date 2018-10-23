// # Allergies Warmup
//
// An allergy test produces a single numeric score which contains the information about all the allergies the person has (that they were tested for).
//
// The list of items (and their value) that were tested are:
//
// * eggs (1)
// * peanuts (2)
// * shellfish (4)
// * strawberries (8)
// * tomatoes (16)
// * chocolate (32)
// * pollen (64)
// * cats (128)
//
// So if Tom is allergic to peanuts and chocolate, he gets a score of 34.
//
// Now, given just that score of 34, your program should be able to say:
//
// - Whether Tom is allergic to any one of those allergens listed above.
// - All the allergens Tom is allergic to.


//version 1
const allergens = {
  scorecard: {
    1: "eggs",
    2: "peanuts",
    4: "shellfish",
    8: "strawberries",
    16: "tomatoes",
    32: "chocolate",
    64: "pollen",
    128: "cats"
  },

  getKeys: function(){
    const allergyKeys = Object.keys(this.scorecard).map(Number).reverse();
    // console.log(allergyKeys);

    return allergyKeys; //[128, 64, 32, 16, 8, 4, 2, 1]
  },

  getList: function(score){
    const keys = this.getKeys(); //[128, 64, 32, 16, 8, 4, 2, 1]

    let allergies = [];

    for( let i = 0; i < keys.length; i++ ){
      let key = keys[i]
      console.log(`key: ${key}, score: ${score}`);

      if (score >= key) {
        allergies.push(this.scorecard[key]);

        console.log(`${this.scorecard[key]} has been pushed to allergies array.`);
        score -= key

        console.log(`new score is ${score}.`);
      }
    }
    // console.log(allergies);
    return allergies; //["chocolate", "peanuts"]
  },

  diagnosis: function(score){
    const allergyList = this.getList(score); //["chocolate", "peanuts"]

    if (allergyList.length > 0) {
      console.log(`You are allergic to ${allergyList.join(", ")}`);
    } else {
      console.log("You are impervious.");
    }
  }
};

allergens.diagnosis(34);
allergens.diagnosis(0);


//version 2 - using maths
// const allergens = function(score){
//   const types = ["eggs", "peanuts", "shellfish", "strawberries", "tomatoes", "chocolate", "pollen", "cats"];
//
//   let allergic = [];
//
//   for( let i = (types.length -1 ); i >= 0; i-- ){
//
//     if (score >= 2**i ) {
//       allergic.push(types[i]);
//       console.log(`${types[i]} has been pushed to allergic array.`);
//       score -= 2**i;
//       console.log(`new score is ${score}`);
//     }
//   }
//
//   if (allergic.length > 0) {
//     console.log(`You are allergic to ${allergic.join(", ")}`);
//   } else {
//     console.log("All good.");
//   }
// }
//
//
// allergens(34);
// allergens(0);
