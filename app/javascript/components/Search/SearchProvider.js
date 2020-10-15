import React, { useContext } from "react";
import SearchPage from './SearchPage'

export const SearchContext = React.createContext();

function SearchProvider({ query }) {
  const hotels = [];

  return(
    <SearchContext.Provider value={{ query, hotels }} className="search">
      <SearchPage />
    </SearchContext.Provider>
  )
}
export default SearchProvider;


export const useSearchContext = () => useContext(SearchContext);