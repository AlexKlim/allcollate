import React, { useState, useEffect } from 'react';
import { useSearchContext } from '../SearchProvider';

function ClearFilters() {
  const {
    locations,
    yearRenovationSlider,
    setYearRenovationSlider,
    yearOpenedSlider,
    setYearOpenedSlider,
    minYearOpened,
    maxYearOpened,
    minYearRenovated,
    maxYearRenovated,
    starRating,
    setStarRating,
    minRate,
    maxRate,
    rateSlider,
    setRateSlider,
    clearButton,
    setClearButton,
    setLocations,
  } = useSearchContext();

  const checkFilter = () => {};

  useEffect(() => {}, [
    locations,
    yearRenovationSlider,
    yearOpenedSlider,
    starRating,
    rateSlider,
  ]);

  const resetFilters = () => {
    setStarRating([]);
    setRateSlider([minRate, maxRate]);
    setYearOpenedSlider([minYearOpened, maxYearOpened]);
    setYearRenovationSlider([minYearRenovated, maxYearRenovated]);
    setLocations([]);
    let starRatingCheckBoxes = document.getElementsByClassName('singleRating');
    for (let item of starRatingCheckBoxes) {
      if (item.children[0].checked) {
        item.click();
      }
    }
  };

  return (
    <div className='text-right mt-3 mb-3'>
      <button onClick={resetFilters} disabled={false}>
        Clear All
      </button>
    </div>
  );
}

export default ClearFilters;
