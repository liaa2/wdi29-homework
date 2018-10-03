// Scrabble Score
// Write a program that, given a word, computes the scrabble score for that word.
//
// scrabble("cabbage")
// // => 14
// Letter Values
// Letter                           Value
// A, E, I, O, U, L, N, R, S, T       1
// D, G                               2
// B, C, M, P                         3
// F, H, V, W, Y                      4
// K                                  5
// J, X                               8
// Q, Z                               10
// Extensions
// You can play a :double or a :triple letter.
// You can play a :double or a :triple word.

const scrabble = {
  scores: {
    a : 1,
    b : 3,
    c : 3,
    d : 2,
    e : 1,
    f : 4,
    g : 2,
    h : 4,
    i : 1,
    j : 8,
    k : 5,
    l : 1,
    m : 3,
    n : 1,
    o : 1,
    p : 3,
    q : 10,
    r : 1,
    s : 1,
    t : 1,
    u : 1,
    v : 4,
    w : 4,
    x : 8,
    y : 4,
    z : 10
  },

  calculateScore: function(word){
    wordLowerCase = word.toLowerCase();
    let totalScore = 0;

    for(let i = 0; i < wordLowerCase.length; i++){
      let currentLetter = wordLowerCase[i];

      if(currentLetter in this.scores){
        totalScore += this.scores[currentLetter];
      } // if
    } // for

    console.log(`Your word ${word} scores: ${totalScore}`);
  }, // calculateScore

}; // scrabble

const scrabbleAnswer = {
  letterScore: {
    1: ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'],
    2: ['D', 'G'],
    3: ['B', 'C', 'M', 'P'],
    4: ['F', 'H', 'V', 'W', 'Y'],
    5: ['K'],
    8: ['J', 'X'],
    10: ['Q', 'Z']
  },

  score: function(word){
    word = word.toUpperCase();
    let sum = 0;

    for (let i = 0; i < word.length; i++){
      let letter = word[i];

      for(let key in this.letterScore){
        if(this.letterScore[key].includes(letter)){
          sum += parseInt(key);
          //IMPORTANT - Stops for loop!
          break;
        } // if
      } // inner for
    } // outer for
  } // score
}; // scrabbleAnswer
