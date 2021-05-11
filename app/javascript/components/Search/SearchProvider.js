import React, { useContext, useEffect, useState } from 'react';
import SearchPage from './SearchPage';
import SearchAPI from '../../api/SearchAPI';

export const SearchContext = React.createContext();

const SearchProvider = ({ query }) => {
  const [hotels, setHotels] = useState([]);
  const [locations, setLocations] = useState([]);
  const [activePage, setActivePage] = useState(1);
  const [pagingData, setPagingData] = useState({});

  const [minYearOpened] = useState(705);
  const [maxYearOpened] = useState(2020);

  const [minYearRenovated] = useState(1000);
  const [maxYearRenovated] = useState(2020);

  const [minRate] = useState(10);
  const [maxRate] = useState(1000);

  const [rateSlider, setRateSlider] = useState([minRate, maxRate]);

  const [starRating, setStarRating] = useState([]);
  const [clearButton, setClearButton] = useState(true);

  const initFilterValues = {
    yearOpened: [minYearOpened, maxYearOpened],
    yearRenovation: [minYearRenovated, maxYearRenovated],
    rating: [],
    rate: [minRate, maxRate],
  }
  const [filterValue, setFilterValues] = useState(initFilterValues);

  const updateFilterValues = (key, value) => {
    setFilterValues({ ...filterValue, [key]: value });
  };

  useEffect(() => {
    const fetchData = async () => {
      const searchAPI = new SearchAPI();
      const data = await searchAPI.fetchQuery(
        query,
        locations,
        filterValue,
        activePage
      );
      setHotels(data.results);
      setPagingData(data.pagingData);
      setClearButton(_.isMatch(filterValue, initFilterValues))
    };

    fetchData();
  }, [
    locations,
    activePage,
    filterValue,
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
        initFilterValues,
        setFilterValues,
        filterValue,
        updateFilterValues,
      }}
      className='search'
    >
      <SearchPage />
    </SearchContext.Provider>
  );
}

export default SearchProvider;
export const useSearchContext = () => useContext(SearchContext);
