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

  const [is_clear_disabled, setClearDisabled] = useState(false);

  useEffect(() => {
    if (
      locations.length === 0 &&
      starRating.length === 0 &&
      yearRenovationSlider[0] === minYearRenovated &&
      yearRenovationSlider[1] === maxYearRenovated &&
      yearOpenedSlider[0] === minYearOpened &&
      yearOpenedSlider[1] === maxYearOpened &&
      rateSlider[0] === minRate &&
      rateSlider[1] === maxRate
    ) {
      setClearDisabled(true);
    } else {
      setClearDisabled(false);
    }
  }, [
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
      <button onClick={resetFilters} disabled={is_clear_disabled}>
        Clear All
      </button>
    </div>
  );
}

export default ClearFilters;
