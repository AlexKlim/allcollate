import React, { useState, useEffect } from 'react';
import { useSearchContext } from '../ComparisonProvider';

function ClearFilters() {
  const {
    clearButton,
    setLocations,
    initFilterValues,
    setFilterValues,
  } = useSearchContext();

  const resetFilters = () => {
    setLocations([]);
    setFilterValues(initFilterValues);
    let starRatingCheckBoxes = document.getElementsByClassName('singleRating');
    for (let item of starRatingCheckBoxes) {
      if (item.children[0].checked) {
        item.click();
      }
    }
  };

  return (
    <div className='text-right mt-3 mb-3'>
      <button onClick={resetFilters} disabled={clearButton}>
        Clear All
      </button>
    </div>
  );
}

export default ClearFilters;