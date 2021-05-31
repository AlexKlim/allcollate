import React, { useContext, useEffect, useState } from 'react';
import SearchPage from './SearchPage';
import SearchAPI from '../../api/SearchAPI';

export const SearchContext = React.createContext();

const SearchProvider = ({ query }) => {
  const [hotels, setHotels] = useState([]);
  const [activePage, setActivePage] = useState(1);
  const [pagingData, setPagingData] = useState({});

  const [minYearOpened] = useState(705);
  const [maxYearOpened] = useState(2020);

  const [minYearRenovated] = useState(1000);
  const [maxYearRenovated] = useState(2020);

  const [minRate] = useState(10);
  const [maxRate] = useState(1000);

  const [clearButton, setClearButton] = useState(true);
  const [isLoading, setLoading] = useState(false);

  const initFilterValues = {
    locations: [],
    yearOpened: [minYearOpened, maxYearOpened],
    yearRenovation: [minYearRenovated, maxYearRenovated],
    rate: [minRate, maxRate],
    rating: [],
  }
  const [filterValue, setFilterValues] = useState(initFilterValues);

  const updateFilterValues = (key, value) => {
    setFilterValues({ ...filterValue, [key]: value });
    setActivePage(1);
  };

  useEffect(() => {
    const fetchData = async () => {
      const searchAPI = new SearchAPI();
      setLoading(true);
      const data = await searchAPI.fetchQuery(
        query,
        filterValue,
        activePage
      );
      setHotels(data.results);
      setPagingData(data.pagingData);
      setClearButton(_.isEqual(filterValue, initFilterValues));
      setLoading(false);
    };

    fetchData();
  }, [
    activePage,
    filterValue,
  ]);

  return (
    <SearchContext.Provider
      value={{
        query,
        hotels,
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
        minRate,
        maxRate,
        clearButton,
        initFilterValues,
        setFilterValues,
        filterValue,
        updateFilterValues,
        isLoading,
      }}
      className='search'
    >
      <SearchPage />
    </SearchContext.Provider>
  );
}

export default SearchProvider;
export const useSearchContext = () => useContext(SearchContext);
