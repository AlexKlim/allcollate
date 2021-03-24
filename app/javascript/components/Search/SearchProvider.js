import React, { useContext, useEffect, useState } from 'react';
import SearchPage from './SearchPage';
import SearchAPI from '../../api/SearchAPI';

export const SearchContext = React.createContext();

function SearchProvider({ query }) {
  const [hotels, setHotels] = useState([]);
  const [tags, setTags] = useState([]);
  const [activePage, setActivePage] = useState(1);
  const [paging_data, setPagingData] = useState({});

  useEffect(() => {
    const fetchData = async () => {
      const searchAPI = new SearchAPI();
      const data = await searchAPI.fetchQuery(query);
      setHotels(data.results);
      setPagingData(data.paging_data);
    };

    fetchData();
  }, [tags]);

  useEffect(() => {
    const fetchData = async () => {
      const searchAPI = new SearchAPI();
      const data = await searchAPI.fetchQuery(query, activePage);
      setHotels(data.results);
      setPagingData(data.paging_data);
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
        paging_data,
      }}
      className='search'
    >
      <SearchPage />
    </SearchContext.Provider>
  );
}
export default SearchProvider;

export const useSearchContext = () => useContext(SearchContext);
