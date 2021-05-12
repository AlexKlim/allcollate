import React from 'react';
import ClearFilters from './Filters/ClearFilters';

import SearchFiltersLocations from './Filters/Locations';
import ComparisonResults from './ComparisonResults';

function SearchPage() {
  return (
    <>
    <div className='row'>
      <div className='col-md-12'>
        <ClearFilters />
        <SearchFiltersLocations />
      </div>
      </div>
      <div className='row'>
      <div className='col-md-12'>
        <ComparisonResults />
      </div>
    </div>
    </>
  );
}

export default SearchPage;
