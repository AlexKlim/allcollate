import React, { useContext, useEffect, useState } from 'react';
import SearchPage from './SearchPage';
import SearchAPI from '../../api/SearchAPI';

export const SearchContext = React.createContext();

function SearchProvider({ query }) {
  const [hotels, setHotels] = useState([]);
  const [tags, setTags] = useState([]);
  const [activePage, setActivePage] = useState(1);
  const [pagingData, setPagingData] = useState({});

  useEffect(() => {
    const fetchData = async () => {
      const searchAPI = new SearchAPI();
      let data = {};
      let results = [];

      if (tags.length === 0) {
        data = await searchAPI.fetchQuery(query);
      } else {
        data = await searchAPI.fetchQuery(tags);
      }
      setHotels(data.results);
      setPagingData(data.pagingData);
    };

    fetchData();
  }, [tags]);

  useEffect(() => {
    const fetchData = async () => {
      const searchAPI = new SearchAPI();
      const data = await searchAPI.fetchQuery(query, activePage);
      setHotels(data.results);
      setPagingData(data.pagingData);
    };

    fetchData();
  }, [activePage]);

  return (
    <SearchContext.Provider
      value={{
        query,
        hotels,
        tags,
        setTags: (tags) => setTags(tags),
        activePage,
        handlePageChange: (pageNum) => {
          setActivePage(pageNum);
        },
        setHotels,
        pagingData,
      }}
      className='search'
    >
      <SearchPage />
    </SearchContext.Provider>
  );
}
export default SearchProvider;

export const useSearchContext = () => useContext(SearchContext);
