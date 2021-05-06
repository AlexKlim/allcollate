import React, { useState, useEffect } from "react";
import { useSearchContext } from "../SearchProvider";

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
    setClearButton
  } = useSearchContext();

  const checkFilter = () => {
  }

  useEffect(() => {
    checkFilter
  }, [
    locations,
    yearRenovationSlider,
    yearOpenedSlider,
    starRating,
    rateSlider
  ]);
 
  const resetFilters = (event) => {
    //
  };

  return (
    <div className="text-right mt-3 mb-3">
        <button onClick={resetFilters} disabled={false}>Clear All</button>
    </div>
  );
}

export default ClearFilters;
