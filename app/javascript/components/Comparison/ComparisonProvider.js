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
      console.log(data.results)

      const isDuplicate = (newHotel) => {
        let status = false
        hotels.map(hotel => {
          if (_.isEqual(hotel, newHotel)) {
            toggleNotification()
            status = true
            return
          }
        })
          return status
      }

      if( !data.results || isDuplicate(data.results)) {
        return
      }

      let newHotels = _.cloneDeep(hotels)

      myHotels.unshift(data.results)

      _.uniqWith(newHotels, _.isEqual)

      setHotels(newHotels);
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
