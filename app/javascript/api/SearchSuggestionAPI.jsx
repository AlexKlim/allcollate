// import BaseApi from './BaseApi';
import axios from 'axios';

export default class SearchSuggestionAPI {
  fetchQuery(query) {
    return axios
      .get(`/search/suggestions?q=${query}`)
      .then(res => res && res.data);
  }
}
