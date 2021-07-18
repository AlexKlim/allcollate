import React, { useContext, useEffect, useState } from 'react';
import ComparisonPage from './ComparisonPage';
import ComparisonAPI from '../../api/ComparisonAPI';
import _ from 'lodash'

export const ComparisonContext = React.createContext();

const ComparisonProvider = ({ initCurrentUser, initHotels }) => {
  const [hotels, setHotels] = useState(initHotels);
  const [currentUser, _setCurrentUser] = useState(initCurrentUser)
  const [slugs, setSlugs] = useState([]);
  const [notificationOn, setNotificationOn] = useState(false)


  function toggleNotification() {
    setNotificationOn(true)
  }

  useEffect(() => {
    const fetchData = async () => {
      const comparisonAPI = new ComparisonAPI();
      const data = await comparisonAPI.fetchHotels(slugs);

      if (_.find(hotels, { id: data.results.id })) {
        toggleNotification()
      } else {
        setHotels(data.results);
      }
    };
    if (slugs.length > 0) { fetchData(); }
  }, [
    slugs
  ]);

  return (
    <ComparisonContext.Provider
      value={{
        currentUser,
        hotels,
        setSlugs,
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
