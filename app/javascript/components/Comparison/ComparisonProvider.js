import React, { useContext, useEffect, useState } from 'react';
import ComparisonPage from './ComparisonPage';
import ComparisonAPI from '../../api/ComparisonAPI';
import _ from 'lodash'

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

      if (!data) {
        setHotels([..._.uniqWith(hotels, _.isEqual)])
        return
      }

      hotels.unshift(data.results)

      console.log(hotels)

      const rawHotels = _.cloneDeep([hotels])[0]
      
      if (! _.isEqual(rawHotels, _.uniqWith(hotels, _.isEqual))) {
        toggleNotification()
      }

      setHotels(_.uniqWith(hotels, _.isEqual));
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
