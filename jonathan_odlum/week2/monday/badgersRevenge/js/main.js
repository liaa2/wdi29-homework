// Badger's Revenge
// The names of those who are witnessed clapping Badger more than twice in the first four days of any one week will go into a draw. On Friday morning, a random name will be drawn from that list and the 'winner' will be forced to deliver the solution to Friday's warmup.
//
// Create a program that Badger can use for this task - ideally, you should create an object (revengeOfBadger) to do this, but if you can get it working using standalone functions, that's cool.
//
// Your program should:
//
// Track how many times each student in the class has clapped this week (just make up the numbers);
// Include a collection of candidates for the Friday draw (ie, a list of names of people who have clapped Badger more than twice that week);
// Pick a random student to deliver the solution to Friday's warmup.
// If no one has clapped enough that week, the program should indicate that Badger has to do his own damned warmup.



const badger = {
  claps: {
    AlexB: 4,
    Yianni: 3,
    John: 0,
    Jonno: 1,
    Hannah: 0,
    Leila: 1,
    Brad: 2,
    Andy: 1,
    AlexS: 6,
    Lucy: 5,
    Thomas: 3,
    Mika: 2,
    Brian: 4,
  },

  studentClaps: function(name){
    this.claps[name] ++;
  },

  studentDemos: function(name){
    if (this.claps.hasOwnProperty(name)){
      for (let key in this.claps){
        if(key !== name){
          this.studentClaps(name);
        }
      }
    }else{
      console.log(`${name} is not in this class. Someone else must demo.`);
      console.log('(Or just spell their name like I have.)');
    }
  },

  addStudent: function(name){
    this.claps[name] = 0;
  },

  setClaps: function(name, number){
    this.claps[name] = number;
  },

  revenge: function(){
    let everyone = this.claps;
    let hat = [];
    for (let key in everyone) {
      if (everyone[key] > 2){
        hat.push(key);
      }
    }
    if ( hat.length > 0 ){
      let randomPerson = Math.floor(Math.random()*hat.length);
      console.log(`${hat[randomPerson]} has to show their work!`);
    }else {
      console.log('Badger has to do his own damn demonstration.');
    }
  },

}

badger.revenge();
