import axios from 'axios';

export default class SearchAPI {
  fetchQuery(query, locations, filterValue,  pageNum) {
    query = query == null ? "" : query;
    let url = `api/search?q=${query}&locations=${JSON.stringify(
      locations
    )}&yearRenovated=${JSON.stringify(
      filterValue.yearRenovation
    )}&yearOpened=${JSON.stringify(
      filterValue.yearOpened
    )}&rates=${JSON.stringify(
      filterValue.rate
    )}&starRating=${JSON.stringify(
      filterValue.rating
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
