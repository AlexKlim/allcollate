import React from 'react';

import SearchFiltersLocations from './Filters/Locations';
import Rates from './Filters/Rates';
import StarRating from './Filters/StarRating';
import YearOpened from './Filters/YearOpened';
import YearRenovated from './Filters/YearRenovated';
import SearchResults from './SearchResults';

function SearchPage() {
  return (
    <div className='row'>
      <div className='col-md-3'>
        <SearchFiltersLocations />
        <YearRenovated />
        <YearOpened />
        <Rates />
        <StarRating />
      </div>
      <div className='col-md-9'>
        <SearchResults />
      </div>
    </div>
  );
}

export default SearchPage;
