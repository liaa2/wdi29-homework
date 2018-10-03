console.log("we doin' fine");

// Scrabble Score
// Write a program that, given a word, computes the scrabble score for that word.
//
// scrabble("cabbage")
// // => 14
//
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

const letterValues = {
  a: 1,
  e: 1,
  i: 1,
  o: 1,
  u: 1,
  l: 1,
  n: 1,
  r: 1,
  s: 1,
  t: 1,
  d: 2,
  g: 2,
  b: 3,
  c: 3,
  m: 3,
  p: 3,
  f: 4,
  h: 4,
  v: 4,
  w: 4,
  y: 4,
  k: 5,
  j: 8,
  x: 8,
  q: 10,
  z: 10,
}

const scrabble = function(word){
  let wordArray = word.split('');
  let wordScore = 0;
  for (let i = 0; i < wordArray.length; i ++){
    wordScore += letterValues[wordArray[i]];
  }
  console.log(wordScore);
  return wordScore;
}

let myWord = scrabble('scrabble');
console.log(myWord);
