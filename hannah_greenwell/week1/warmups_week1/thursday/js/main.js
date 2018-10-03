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

const sergeSays = function( str ){

  if( !str ){
    return 'Fine. Be that way!';
  }

  if( str.endsWith( '?' ) ){
    return 'Sure.'
  }

  const strCaps = str.toUpperCase();

  if( str.localeCompare( strCaps ) === 0 ){
    return 'Woah, chill out!'
  }
  // Alternative - if(str === str.toUpperCase()) ...

  return 'Whatever.';
}; // for

console.log(sergeSays(''));
console.log(sergeSays('How are you Serge?'));
console.log(sergeSays('I LIKE TO TALK LOUDLY?'));
console.log(sergeSays('You suck, serge.'));
console.log(sergeSays('!*%?@!&^#!'));
