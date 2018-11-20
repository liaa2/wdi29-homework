// Markov Text Generator
// A Markov Chain is a mathematical structure that shows you how to transition from one state of a system to another in a probabalistic way. Don't panic! For our purposes this just means something like a lookup table that contains each state in a system, and for each state it lists the other states which that state can move to, with a probability for each of them; the probability tells you how likely each of the next states are to be the next state that the system moves to.
//
// So for example, if I am in the state of "Watching TV", I might transition to another state called "Falling Asleep" with a 20% probability, "Change the Channel" with a 30% probability, "Go to Fridge" with a 10% probability, and "Continue Staring Glassy-Eyed at the Screen Without Really Seeing Anything" with a 40% probability. Each of these states would have their own list of other states to transition to; so the aforementioned "Go to Fridge" state might transition to "Get Beer" with a 35% probability, and "Get Snacks" with a 65% probability.
//
// In this way we can specify the likely behaviour of a system, and then simulate e.g. a night of TV viewing by starting at one of the states and generating a random number to decide which state to move to next, and so on.
//
// One interesting use of Markov chains is to analyse a large sample of text and then generate new pieces of text which are magically in the "style" of the analysed text. In this case our states are the individual words of the text, and the next state for each word is the list of words that tend to immediately follow that word, with a probability for each word which tells us how often the following word appears after the current word.
//
// Still with me? YOUR TASK is to create a page in HTML and Javascript which loads a local text file using AJAX (it should be a book or at least something coherent, 250Kb to 1Mb; Project Gutenberg is your friend), then from the words of the text builds a Markov table: i.e., an object whose keys are each word in the text, and for each key its value is an array which lists all the words that follow that word. Don't worry about storing numbers which represent the probabilities of each following word! Just adding the following words to an array, allowing duplicates, will do what we want.
//
// Having completed the analysis, the next step is generation! For a random starting word, generate a new text of 60-100 words by starting the process with a random word and then choosing a next word in the sequence from your Markov table.
//
// Voilà! Instant fresh content in the style of any of the great masters!
//
// STOP CRYING, THIS IS NOT AS HARD AS IT SOUNDS YOU BIG BABIES
//
// Possible steps to a solution:
// Have your page load the contents of a text file into a single variable using AJAX (you will need to run a local server so you can open the file as a URL). This is a quick google search away! hint use a search term involving 'simple http server'
// Separate all the text in the loaded file into an array of words.
// Iterate over the array and add a key to your lookup table for each word, and an empty array as the key's value (if it's not already set as a key); get the word that follows this word and push it onto the array of words for this key (i.e. and words in this array are words which have been found to follow this word in your original text). Repeat.
// Pick a random starting word, and get the next word by randomly picking one of the words in its array of following words (if we've allowed duplicates in this array, words that were found to follow more often will have a higher probability of being picked). Repeat!
// Further Reading:
// Markov Chains Explained Visually
// Obligatory Wikipedia link
// Coding Rainbow: Markov Chains video tutorial
// "A Markov bot remixing Sarah Palin speeches and Erowid trip reports": Erowid Sarah Palin
// A Twitter bot which creates new tweets by analysing the most recent tweets on Twitter: Markov Twain
// A Twitter bot which creates new Tweets based on those of any user you ask if for: https://twitter.com/markovchainme
// Creating a Markov Twitter Bot
// Visualing Googles Tri-Gram Data
// Google Books N-Gram Viewer
// Google Books N-Gram RAW DATA download

// $.ajax({
//   url: '/Users/alexbryant/wdi/homework/alex_bryant/week11/tuesday-warmup/book.json',
//   dataType: 'JSONP',
//   crossDomain: true,
//   success: function () { console.log("success"); },
//   failure: function () { console.log("failed"); },
//   complete: function (data) {
//     console.log(data);
//   }
// });

 let text = "When I was a young journeyman programmer, I would learn about every feature of the languages I was using, and I would attempt to use all of those features when I wrote. I suppose it was a way of showing off, and I suppose it worked because I was the guy you went to if you wanted to know how to use a particular feature. Eventually I figured out that some of those features were more trouble than they were worth. Some of them were poorly specified, and so were more likely to cause portability problems. Some resulted in code that was  difficult to read or modify. Some induced me to write in a manner that was too tricky and error-prone. And  some of those features were design errors. Sometimes language designers make mistakes.  Most programming languages contain good parts and bad parts. I discovered that I could be a better  programmer by using only the good parts and avoiding the bad parts. After all, how can you build something  good out of bad parts?  It is rarely possible for standards committees to remove imperfections from a language because doing so  would cause the breakage of all of the bad programs that depend on those bad parts. They are usually  powerless to do anything except heap more features on top of the existing pile of imperfections. And the new  features do not always interact harmoniously, thus producing more bad parts.  But you have the power to define your own subset. You can write better programs by relying exclusively on  the good parts.  JavaScript is a language with more than its share of bad parts. It went from non-existence to global adoption  in an alarmingly short period of time. It never had an interval in the lab when it could be tried out and  polished. It went straight into Netscape Navigator 2 just as it was, and it was very rough. When Javaâ¢  applets failed, JavaScript became the 'Language of the Web' by default. JavaScript's popularity is almost  completely independent of its qualities as a programming language.  Fortunately, JavaScript has some extraordinarily good parts. In JavaScript, there is a beautiful, elegant, highly  expressive language that is buried under a steaming pile of good intentions and blunders. The best nature of  JavaScript is so effectively hidden that for many years the prevailing opinion of JavaScript was that it was an  unsightly, incompetent toy. My intention here is to expose the goodness in JavaScript, an outstanding,  dynamic programming language. JavaScript is a block of marble, and I chip away the features that are not  beautiful until the language's true nature reveals itself. I believe that the elegant subset I carved out is vastly  superior to the language as a whole, being more reliable, readable, and maintainable.  This book will not attempt to fully describe the language. Instead, it will focus on the good parts with  occasional warnings to avoid the bad. The subset that will be described here can be used to construct reliable,  readable programs small and large. By focusing on just the good parts, we can reduce learning time, increase  robustness, and save some trees.  Perhaps the greatest benefit of studying the good parts is that you can avoid the need to unlearn the bad parts.  Unlearning bad patterns is very difficult. It is a painful task that most of us face with extreme reluctance.  Sometimes languages are subsetted to make them work better for students. But in this case, I am subsetting  JavaScript to make it work better for professionals.  JavaScript is an important language because it is the language of the web browser. Its association with the  browser makes it one of the most popular programming languages in the world. At the same time, it is one of  the most despised programming languages in the world. The API of the browser, the Document Object Model  (DOM) is quite awful, and JavaScript is unfairly blamed. The DOM would be painful to work with in any  language. The DOM is poorly specified and inconsistently implemented. This book touches only very lightly  on the DOM. I think writing a Good Parts book about the DOM would be extremely challenging.  JavaScript is most despised because it isn't SOME OTHER LANGUAGE. If you are good in SOME OTHER  LANGUAGE and you have to program in an environment that only supports JavaScript, then you are forced  to use JavaScript, and that is annoying. Most people in that situation don't even bother to learn JavaScript first,  and then they are surprised when JavaScript turns out to have significant differences from the SOME OTHER  LANGUAGE they would rather be using, and that those differences matter.  The amazing thing about JavaScript is that it is possible to get work done with it without knowing much about  the language, or even knowing much about programming. It is a language with enormous expressive power. It  is even better when you know what you're doing. Programming is difficult business. It should never be  undertaken in ignorance.";

 let lookup = {};

const buildLookup = () => {
 text = text.replace(/\s+/g, " ");
 text = text.replace("\'s", "");
 text = text.replace(/[.?;\-,]+/g, "");
 //console.log(text);
 const arr = text.split(' ');
 for (let i=0; i<arr.length - 1; i+=1) {
   if(!lookup[arr[i]]) {
     lookup[arr[i]] = [];
   }
   lookup[arr[i]].push(arr[i+1]);
 }
};


buildLookup();

console.log(lookup);
