import React, { useContext, useEffect, useState } from "react";
import SearchPage from "./SearchPage";
import SearchAPI from "../../api/SearchAPI";

export const SearchContext = React.createContext();

function SearchProvider({ query }) {
  const [hotels, setHotels] = useState([]);
  const [locations, setLocations] = useState([]);
  const [activePage, setActivePage] = useState(1);
  const [pagingData, setPagingData] = useState({});

  const [minYearOpened] = useState(705)
  const [maxYearOpened]= useState(2020)
  const [yearOpenedSlider, setYearOpenedSlider] = useState([minYearOpened, maxYearOpened]);

  const [minYearRenovated] = useState(1000)
  const [maxYearRenovated]= useState(2020)
  const [yearRenovationSlider, setYearRenovationSlider] = useState([
    minYearRenovated,
    maxYearRenovated,
  ]);

  const [startRating, setStarRating] = useState([]);

  useEffect(() => {
    const fetchData = async () => {
      const searchAPI = new SearchAPI();
      const data = await searchAPI.fetchQuery(
        query,
        locations,
        yearRenovationSlider,
        yearOpenedSlider,
        startRating,
        activePage
      );
      setHotels(data.results);
      setPagingData(data.pagingData);
    };

    fetchData();
  }, [locations, activePage, yearRenovationSlider, yearOpenedSlider, startRating]);

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
        startRating,
        setStarRating
      }}
      className="search"
    >
      <SearchPage />
    </SearchContext.Provider>
  );
}

export default SearchProvider;
export const useSearchContext = () => useContext(SearchContext);
