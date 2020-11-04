// import BaseApi from './BaseApi';
import axios from 'axios';

export default class SearchAPI {
  fetchQuery(query) {
    return axios
      .get(`api/search?q=${query}`)
      .then(res => res && res.data);
  }

  fetchSuggestionQuery(query) {
    return axios
      .get(`/search/suggestions?q=${query}`)
      .then(res => res && res.data);
  }

  fetchLocations(query) {
    return axios
      .get(`api/search/locations?q=${query}`)
      .then(res => res && res.data);
  }
}