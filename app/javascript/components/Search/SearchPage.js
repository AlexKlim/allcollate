import React from 'react';

import { Typography } from '@material-ui/core';
import ClearFilters from './Filters/ClearFilters';
import SearchFiltersLocations from './Filters/Locations';
import Rates from './Filters/Rates';
import StarRating from './Filters/StarRating';
import YearOpened from './Filters/YearOpened';
import YearRenovated from './Filters/YearRenovated';
import SearchFiltersBrands from './Filters/Brands';
import SearchResults from './SearchResults';

import useStyles from './Styles';

function SearchPage() {
  const classes = useStyles()

  return (
    <>
      <Typography variant="h1" className={classes.titlePage}>
        Search for hotels
      </Typography>
      <div className='row'>
        <div className='col-md-3'>
          <ClearFilters />
          <SearchFiltersLocations />
          <StarRating />
          <Rates />
          <YearRenovated />
          <YearOpened />
          <SearchFiltersBrands />
        </div>
        <div className='col-md-9 search__results'>
          <SearchResults />
        </div>
      </div>
    </>
  );
}

export default SearchPage;
