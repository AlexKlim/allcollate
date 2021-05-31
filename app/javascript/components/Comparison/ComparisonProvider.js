import React, { useContext, useEffect, useState } from 'react';
import ComparisonPage from './ComparisonPage';
import ComparisonAPI from '../../api/ComparisonAPI';
import { uniqueHotels } from './helpers'

export const ComparisonContext = React.createContext();

const ComparisonProvider = ({ initHotels }) => {
  const [hotels, setHotels] = useState(initHotels);
  const [slug, setSlug] = useState();
  const [notificationOn, setNotificationOn] = useState(false)


  function toggleNotification() {
    setNotificationOn(true)
  }

  useEffect(() => {
    const fetchData = async () => {

      const comparisonAPI = new ComparisonAPI();
      const data = await comparisonAPI.fetchHotels(slug);

      uniqueHotels(hotels, toggleNotification)

      if (!data) {
        setHotels([...hotels])
        return
      }
      hotels.unshift(data.results)
      setHotels(uniqueHotels(hotels, toggleNotification));
    };

    fetchData();

  }, [
    slug
  ]);



  return (
    <ComparisonContext.Provider
      value={{
        hotels,
        setSlug,
        setHotels,
        notificationOn,
        setNotificationOn
      }}
      className='hotel'
    >
      <ComparisonPage />
    </ComparisonContext.Provider>
  );
}

export default ComparisonProvider;
export const useComparisonContext = () => useContext(ComparisonContext);
