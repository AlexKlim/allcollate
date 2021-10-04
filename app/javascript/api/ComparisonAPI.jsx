import axios from 'axios';

export default class ComparisonAPI {
  fetchHotels(slug) {
    return axios
      .get(`/api/comparisons?slug=${slug}`)
      .then((res) => res && res.data);
  }
}
