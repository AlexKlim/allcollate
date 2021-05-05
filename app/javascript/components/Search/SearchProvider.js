import React, { useContext, useEffect, useState } from 'react';
import SearchPage from './SearchPage';
import SearchAPI from '../../api/SearchAPI';

export const SearchContext = React.createContext();

function SearchProvider({ query }) {
  const [hotels, setHotels] = useState([]);
  const [locations, setLocations] = useState([]);
  const [activePage, setActivePage] = useState(1);
  const [pagingData, setPagingData] = useState({});

  const [minYearOpened] = useState(705);
  const [maxYearOpened] = useState(2020);
  const [yearOpenedSlider, setYearOpenedSlider] = useState([
    minYearOpened,
    maxYearOpened,
  ]);

  const [minYearRenovated] = useState(1000);
  const [maxYearRenovated] = useState(2020);
  const [yearRenovationSlider, setYearRenovationSlider] = useState([
    minYearRenovated,
    maxYearRenovated,
  ]);

  const [minRate] = useState(90);
  const [maxRate] = useState(500);
  const [rateSlider, setRateSlider] = useState([
    minRate,
    maxRate,
  ]);

  const [starRating, setStarRating] = useState([]);
  const [clearButton, setClearButton] = useState(false)

  useEffect(() => {
    const fetchData = async () => {
      const searchAPI = new SearchAPI();
      const data = await searchAPI.fetchQuery(
        query,
        locations,
        yearRenovationSlider,
        yearOpenedSlider,
        starRating,
        rateSlider,
        activePage
      );
      setHotels(data.results);
      setPagingData(data.pagingData);
    };

    fetchData();
  }, [
    locations,
    activePage,
    yearRenovationSlider,
    yearOpenedSlider,
    starRating,
    rateSlider,
    clearButton
  ]);

  return (
    <SearchContext.Provider
      value={{
        query,
        hotels,
        locations,
        setLocations: (locations) => setLocations(locations),
        activePage,
        handlePageChange: (pageNum) => {
          setActivePage(pageNum);
        },
        setActivePage,
        setHotels,
        pagingData,
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
      }}
      className='search'
    >
      <SearchPage />
    </SearchContext.Provider>
  );
}

export default SearchProvider;
export const useSearchContext = () => useContext(SearchContext);
