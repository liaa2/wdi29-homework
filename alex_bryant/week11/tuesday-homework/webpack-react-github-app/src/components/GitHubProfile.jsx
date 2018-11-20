import React, {Component} from 'react';
import ajax from '../utils/ajax.js';

class GitHubProfile extends Component {

  constructor(props) {
    super(props);

    this.state = {
      user: {},
      repos: []
    };

  }

  componentDidMount(){
    const username = this.props.match.params.username;

    ajax.getUserData(username)
    .then(response => {
      console.log(response.data);
      this.setState({
        user: response.data
      });
    })
    .catch(console.warn);

    ajax.getRepoData(username)
    .then(response => {
      console.log(response.data);
      this.setState({
        repos: response.data
      });
    })
    .catch(console.warn);
  }

  render() {
    return(
      <div>
        <h1>Github Search</h1>
        <h2>{this.props.match.params.username}</h2>

        <UserStats user={this.state.user} />

        <UserRepos repos={this.state.repos} />

      </div>
    );
  }

} // class GitHubProfile

const UserStats = props => {

  if(props.user.id === undefined) {
    return(<div>Loading User stats...</div>)
  }

  //ES6 object destructuring
  const {name, following, followers, public_repos, public_gists, avatar_url} = props.user;

  return(
    <div className="stats">
      <img src={avatar_url} />
      <h3>Stats for <strong>{name}</strong> </h3>
      <table>
        <thead>
          <tr>
            <th>Followers</th>
            <th>Following</th>
            <th>Repos</th>
            <th>Gists</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>{followers}</td>
            <td>{following}</td>
            <td>{public_repos}</td>
            <td>{public_gists}</td>
          </tr>
        </tbody>
      </table>
    </div>
  );
};

const UserRepos = props => {

  if(!props.repos.length) {
    return(<div>Loading Repo details...</div>)
  }

  return(
    <div className="repos">
      <h3>Repositories:</h3>
      {
        props.repos.map(repo =>
          <div className="repo">
            <p><strong>Name:</strong> {repo.name}</p>
            <p><strong>Language:</strong> {repo.language}</p>
            <p><strong>Description:</strong> {repo.description}</p>
            <p><strong>Download:</strong> <a href={repo.downloads_url}>{repo.downloads_url}</a></p>
          </div>
        )
      }
    </div>
  );
};

export default GitHubProfile;
