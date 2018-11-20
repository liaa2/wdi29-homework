import React, {Component} from 'react';
import ajax from '../utils/ajax.js';

class RandomUser extends Component {

  constructor(props) {
    super(props);

    this.state = {
      username: ''
    };

    this.handleClick = this.handleClick.bind(this);

  }

  componentDidUpdate() {
    console.log("user ", this.state.username);
    if(this.state.username) {
      this.props.redirectToUser(this.state.username);
    }
  }

  handleClick(event){

    //Getting a random string to search for a user
    const chars = "abcdefghiklmnopqrstuvwxyz";
  	let randomstring = '';
  	for (let i=0; i<3; i++) {
  		let rnum = Math.floor(Math.random() * chars.length);
  		randomstring += chars.substring(rnum,rnum+1);
  	}

    event.preventDefault();
    const username = randomstring;

    ajax.getRandomUser(username)
    .then(response => {
      const results = response.data.items;
      const rand = results[Math.floor(Math.random() * results.length)];
      this.setState({
        username: rand.login
      });
    })
    .catch(console.warn);

  }

  render() {
    return(
      <button onClick={this.handleClick}>Random User</button>
    );
  }

}

export default RandomUser;
