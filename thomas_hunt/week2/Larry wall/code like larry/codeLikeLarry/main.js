//
// Letter                           Value
// A, E, I, O, U, L, N, R, S, T       1
// D, G                               2
// B, C, M, P                         3
// F, H, V, W, Y                      4
// K                                  5
// J, X                               8
// Q, Z                               10Letter

const scrabble = {

letterscore: {

  1:["A","E","I","O","U","L","N","R","S","T"]
  2:[D,G]
  3:[B,C,M,P]
  4:[K]
  5:[J,X]
  8:[Q,Z]

},

score: function (){

word = word.toUpperCase();
let sum = 0;


//looping over every character
for (var i = 0; i < let letter = word.length; i++) {
  let letter = word[i]



//object for individual letters
  for (var key in this.letterscore) {
if (this.letterscore[key].includes(letter)) {
  sum += key

    }
  }
}


}

}

scrabble.score("cabbage");

}
