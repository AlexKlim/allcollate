import React, { useContext, useEffect, useState } from 'react';
import ComparisonPage from './ComparisonPage';
import ComparisonAPI from '../../api/ComparisonAPI';

export const ComparisonContext = React.createContext();

const ComparisonProvider = ({ initHotels }) => {
  const [hotels, setHotels] = useState(initHotels);
  const [slug, setSlug] = useState();

  useEffect(() => {
    const fetchData = async () => {
      // if (!slug) { return }

      const comparisonAPI = new ComparisonAPI();
      const data = await comparisonAPI.fetchHotels(slug);
      setHotels([...hotels, data.results]);
    };

    fetchData();
  }, [
    slug,
  ]);

  return (
    <ComparisonContext.Provider
      value={{
        hotels,
        setSlug,
      }}
      className='hotel'
    >
      <ComparisonPage />
    </ComparisonContext.Provider>
  );
}

export default ComparisonProvider;
export const useComparisonContext = () => useContext(ComparisonContext);
