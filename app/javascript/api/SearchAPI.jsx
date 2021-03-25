// import BaseApi from './BaseApi';
import axios from 'axios';

export default class SearchAPI {
  fetchQuery(query, pageNum) {
    let url = '';

    if (typeof query === 'string') {
      url = `api/search?q=${query}`;
    } else if (typeof query === 'object') {
      url = `api/search?q=${JSON.stringify(query)}&tags=true`;
    }

    if (pageNum != undefined) {
      url += `&pageNum=${pageNum}`;
    }
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
