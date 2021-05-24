import React, { useContext, useEffect, useState } from 'react';
import ComparisonPage from './ComparisonPage';
import ComparisonAPI from '../../api/ComparisonAPI';

export const ComparisonContext = React.createContext();

const ComparisonProvider = ({ initHotels }) => {
  const [hotels, setHotels] = useState(initHotels);
  const [slug, setSlug] = useState();
  const [currentHotel, setCurrentHotel] = useState(null)

  useEffect(() => {
    const fetchData = async () => {
      // if (!slug) { return }

      const comparisonAPI = new ComparisonAPI();
      const data = await comparisonAPI.fetchHotels(slug);

      function unique(hotels) {
        let uniqueHotelsNames = []
        let uniqueHotels = []
        for (let hotel of hotels) {
          if (uniqueHotelsNames.indexOf(hotel.name) === -1) {
            uniqueHotelsNames.push(hotel.name)
            uniqueHotels.push(hotel)
          }
        }
        return uniqueHotels
      }
      
      unique(hotels)

      if (!data) {
        setHotels([...hotels])
        return
      }
      setHotels(unique([...hotels, data.results]));
    };

    fetchData();

  }, [
    slug
  ]);

  useEffect(() => {
      setCurrentHotel(hotels[0])
  }, [
    hotels
  ])
      

  return (
    <ComparisonContext.Provider
      value={{
        hotels,
        setSlug,
        setHotels,
        currentHotel,
        setCurrentHotel
      }}
      className='hotel'
    >
      <ComparisonPage />
    </ComparisonContext.Provider>
  );
}

export default ComparisonProvider;
export const useComparisonContext = () => useContext(ComparisonContext);
