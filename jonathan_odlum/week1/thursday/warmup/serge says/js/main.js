console.log(`Sir! Yessir! In the console, Sir!`);

// Warmup - Serge Says
// Examples
// Serge answers 'Sure.' if you ask him a question.
//
// He answers 'Woah, chill out!' if you yell at him (ALL CAPS).
//
// He says 'Fine. Be that way!' if you address him without actually saying anything.
//
// He answers 'Whatever.' to anything else.
//
// Create a function that takes an input and returns Serge's response.

const sergeReply = function(reply){
  console.log(`Serge says "${reply}"`);
}

const isUpperCase = function(str){
  return (str === str.toUpperCase());
}

const talkToSerge = function(talk){
  wordsString = talk;
  if (wordsString.charAt(wordsString.length-1) === `?`){
    sergeReply(`Sure.`);
  }else if (talk === ``){ //not inclusive enough. Needs to contain possibilities
    sergeReply('Fine. Be that way!');
  }else if (isUpperCase(talk)){
    sergeReply('Woah, chill out!');
  }else {
    sergeReply('Whatever.');
  }
}
