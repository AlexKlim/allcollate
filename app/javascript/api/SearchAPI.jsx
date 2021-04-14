// import BaseApi from './BaseApi';
import axios from 'axios';

export default class SearchAPI {
  fetchQuery(query, locations, yearRenovationSlider, yearOpenedSlider, pageNum) {
    let url = `api/search?q=${query}&locations=${JSON.stringify(
      locations
    )}&yearRenovated=${JSON.stringify(
      yearRenovationSlider
    )}&yearOpened=${JSON.stringify(
      yearOpenedSlider
    )}&pageNum=${pageNum}`;
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
