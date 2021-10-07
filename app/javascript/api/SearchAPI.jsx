import axios from 'axios';

export default class SearchAPI {
  fetchQuery(query, filterValue,  pageNum) {
    query = query == null ? "" : query;
    let url = `api/search?q=${query}&locations=${JSON.stringify(
      filterValue.locations
    )}&yearRenovated=${JSON.stringify(
      filterValue.yearRenovation
    )}&yearOpened=${JSON.stringify(
      filterValue.yearOpened
    )}&rates=${JSON.stringify(
      filterValue.rate
    )}&starRating=${JSON.stringify(
      filterValue.rating
    )}&brands=${JSON.stringify(
      filterValue.brands
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

  fetchBrands(query) {
    return axios
      .get(`api/search/brands?q=${query}`)
      .then((res) => res && res.data);
  }
}
