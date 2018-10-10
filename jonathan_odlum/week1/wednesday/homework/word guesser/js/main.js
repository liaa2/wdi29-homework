console.log(`Up and Running`);
// Homework: The Word Guesser
// You'll create a simple word guessing game where the user gets infinite tries to guess the word (like Hangman without the hangman, or like Wheel of Fortune without the wheel and fortune).
//
// Create two global arrays: one to hold the letters of the word (e.g. 'F', 'O', 'X'), and one to hold the current guessed letters (e.g. it would start with '_', '_', '_' and end with 'F', 'O', 'X').
// Write a function called guessLetter that will:
// Take one argument, the guessed letter.
// Iterate through the word letters and see if the guessed letter is in there.
// If the guessed letter matches a word letter, changed the guessed letters array to reflect that.
// When it's done iterating, it should log the current guessed letters ('F__') and congratulate the user if they found a new letter.
// It should also figure out if there are any more letters that need to be guessed, and if not, it should congratulate the user for winning the game.
// Pretend you don't know the word, and call guessLetter multiple times with various letters to check that your program works.

// const hiddenWord = `termite`;
// const hiddenArray = hiddenWord.split(``);
// let guessedLetters = [];
// let word = ``;
// for (let i = 0; i < hiddenWord.length; i ++){
//   guessedLetters.push(`_`);
// }
//
// const guessLetter = function (letter) {
// for (let i = 0; i < guessedLetters.length; i ++){
//   if (letter === guessedLetters[i]){
//     console.log(`Already tried that`);
//     return;
//   }
// }
//   if (letter.length !== 1){
//     console.log(`Please only input one letter at a time.`);
//     return;
//   }
//     let letterMatched = false;
//     let win = true;
//     for (let i = 0; i < hiddenWord.length; i ++){
//       if (letter === hiddenWord[i]){
//         guessedLetters[i] = letter;
//         letterMatched = true;
//       }
//       if (`_` === guessedLetters[i]){
//         win = false;
//       }
//     }
//     if (letterMatched){
//       console.log(`Congratulations!`);
//     } else {
//       console.log(`Nope!`);
//     }
//     word = guessedLetters.join(``);
//     console.log(word);
//     if (win){
//       console.log(`%cYOU WON!`, `color: red;`);
//     }
//   }
// }


// Bonus: Make it more like Wheel of Fortune:
// Start with a reward amount of $0
// Every time a letter is guessed, generate a random amount and reward the user if they found a letter (multiplying the reward if multiple letters found), otherwise subtract from their reward.
// When they guess the word, log their final reward amount.

// const hiddenWord = `termite`;
// const hiddenArray = hiddenWord.split(``);
// let guessedLetters = [];
// for (let i = 0; i < hiddenWord.length; i ++){
//   guessedLetters.push(`_`);
// }
// let word = ``;
//
// let win = false;
// let winnings = 0;
// let reward = Math.floor(Math.random()*900+100);
// console.log(`Guess a letter for $${reward}`);
//
//
// const guessLetter = function (letter) {
//   if (!win){
//     for (let i = 0; i < guessedLetters.length; i ++){
//       if (letter === guessedLetters[i]){
//         console.log(`Already found that`);
//         return;
//       }
//     }
//     if (letter.length !== 1){
//       console.log(`Please only input one letter at a time.`);
//       return;
//     } else {
//       win = true;
//       let letterMatched = false;
//       let numberOfOccurs = 0;
//
//       for (let i = 0; i < hiddenWord.length; i ++){
//         if (letter === hiddenWord[i]){
//           guessedLetters[i] = letter;
//           letterMatched = true;
//           numberOfOccurs ++;
//         }
//         if (`_` === guessedLetters[i]){
//           win = false;
//         }
//       }
//       if (letterMatched){
//         let amount = numberOfOccurs*reward;
//         console.log(`Congratulations! You've gained $${amount}!`);
//         winnings += amount;
//         reward = Math.floor(Math.random()*900+100);
//         console.log(`Guess another letter for $${reward}`);
//       } else {
//         winnings -+ reward;
//         console.log(`Nope! Sorry you lost $${reward}`);
//       }
//       word = guessedLetters.join(``);
//       console.log(word);
//       if (win){
//         console.log(`%cYOU'VE WON A TOTAL OF ${winnings}!`, `color: red;`);
//       }
//     }
//   }else{
//     console.log(`You've won. Don't be greedy.`);
//   }
// }

// Bonus: Make it like Hangman:
// Keep track of all the guessed letters (right and wrong) and only let the user guess a letter once. If they guess a letter twice, do nothing.
// Keep track of the state of the hangman as a number (starting at 0), and subtract or add to that number every time they make a wrong guess.
// Once the number reaches 6 (a reasonable number of body parts for a hangman), inform the user that they lost and show a hangman on the log.

const secretWord = `termite`;
const secretArray = secretWord.split(``);
let hiddenArray = [];
let guessedLetters = [];
let manDead = false;
let win = false;
let failedLetters = 0;

let h1 = `+---+ `;
let h2 = `|   `;
let h3 = `|  `;
let h4 = `|  `;
let h5 = `|________ `;

let word = ``;
for (let i = 0; i < secretWord.length; i ++){
  hiddenArray.push(`_`);
}

const guessLetter = function (letter) {
  if (!manDead && !win){
    if (letter.length !== 1){
      console.log(`Please only input one letter at a time.`);
      return;
    }
    for (let i = 0; i < guessedLetters.length; i ++){
      if (letter === guessedLetters[i]){
        return;
      }
    }

    guessedLetters.push(letter);
    win = true;

    let letterMatched = false;
    for (let i = 0; i < secretWord.length; i++){
      if (letter === secretWord[i]){
        hiddenArray[i] = letter;
        letterMatched = true;
      }
      if (`_` === hiddenArray[i]){
        win = false;
      }
    }

    if (letterMatched){
      console.log(`Congratulations!`);
      word = hiddenArray.join('');
      console.log(word);
    } else {
      failedLetters ++;
      console.log(`Nope!`);
      switch(failedLetters){
        case 1:
          h2 = h2 + `o`;
          break;
        case 2:
          h3 = h3 + `/`
          break;
        case 3:
          h3 = h3 + `|`
          break;
        case 4:
          h3 = h3 + `\\`
          break;
        case 5:
          h4 = h4 + `/`
          break;
        case 6:
          h4 = h4 + ` \\`
          break;
      }
    }

    console.log(h1);
    console.log(h2);
    console.log(h3);
    console.log(h4);
    console.log(h5);

    if (failedLetters >= 6){
      manDead = true;
      console.log("Oh No!");
    }

  }else{
    if (manDead)
      console.log("You're already dead mate.");
    else if (win)
      console.log(`Game's over. Go home.`);
  }
}
