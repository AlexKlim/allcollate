import axios from 'axios';

export default class ComparisonAPI {
  fetchHotels(slugs) {
    return axios
      .get(`api/comparisons?slugs=${slugs.join(',')}`)
      .then((res) => res && res.data);
  }
}
