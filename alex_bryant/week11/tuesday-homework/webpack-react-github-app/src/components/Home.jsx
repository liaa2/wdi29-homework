import React, {Component} from 'react';
import {Link} from 'react-router-dom';
import RandomUser from './RandomUser.jsx';

class Home extends Component {

  constructor(props) {
    super(props);
    console.log(props);

    this.redirectToUser = this.redirectToUser.bind(this);
  }

  redirectToUser(username) {
    console.log("username ", username);
    this.props.history.push(`/details/${username}`);
  }

  render() {
    return(
      <div>
        <h1>Github Search</h1>
        <Link to="/search">
          <button>Search for a user</button>
        </Link>
        <RandomUser redirectToUser={this.redirectToUser} />
      </div>
    );
  }

}

export default Home;
