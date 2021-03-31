// import BaseApi from './BaseApi';
import axios from 'axios';

export default class SearchAPI {
  fetchQuery(query, pageNum) {
    let url = `api/search?q=${query}&pageNum=${pageNum}`;
    return axios.get(url).then((res) => res && res.data);
  }

  fetchAtLocations(query) {
    let url = `api/search/locationHotels?q=${JSON.stringify(query)}`;
    return axios.get(url).then((res) => res && res.data);
  }

  fetchSuggestionQuery(query) {
    return axios
      .get(`/search/suggestions?q=${query}`)
      .then((res) => res && res.data);
  }

  fetchLocations(query) {
    return axios
      .get(`api/search/locations?q=${query}`)
      .then((res) => res && res.data);
  }
}
