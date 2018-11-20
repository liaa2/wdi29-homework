import axios from 'axios';

const GITHUB_BASE_URL = 'https://api.github.com/';
const GITHUB_USER_SEARCH = '?client_id=4ec1b8f9c149f7c46ffd&client_secret=a05ec287c29ebd9633131b5a08298530709130e9';
const GITHUB_REPO_SEARCH = '/repos?client_id=4ec1b8f9c149f7c46ffd&client_secret=a05ec287c29ebd9633131b5a08298530709130e9';

export default {

  getUserData(username) {
    const url = GITHUB_BASE_URL + "users/" + username + GITHUB_USER_SEARCH;
    console.log("url: ", url);
    return axios.get(url);
  },

  getRepoData(username) {
    const url = GITHUB_BASE_URL + "users/" + username + GITHUB_REPO_SEARCH;
    console.log("url: ", url);
    return axios.get(url);
  },

  getRandomUser(rand) {
    const url = GITHUB_BASE_URL + "search/users?q=" + rand;
    console.log("url: ", url);
    return axios.get(url);
  }
}
