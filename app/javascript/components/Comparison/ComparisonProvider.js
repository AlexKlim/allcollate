import React, { useContext, useEffect, useState } from "react";
import ComparisonPage from "./ComparisonPage";
import ComparisonAPI from "../../api/ComparisonAPI";
import _ from "lodash";

export const ComparisonContext = React.createContext();

const ComparisonProvider = ({ initHotels }) => {
  const [hotels, setHotels] = useState(initHotels);
  const [slug, setSlug] = useState();
  const [notificationOn, setNotificationOn] = useState(false);

  function toggleNotification() {
    setNotificationOn(true);
  }

  useEffect(() => {
    const fetchData = async () => {
      const comparisonAPI = ComparisonAPI;
      const data = await comparisonAPI.fetchHotels(slug);

      if (_.find(hotels, { id: data.results.id })) {
        toggleNotification();
      } else {
        const updatedHotels = _.unionWith([data.results], hotels, _.isEqual);
        setHotels(updatedHotels);
      };
    };
    if (slug) {
      fetchData();
    }
  }, [slug]);

  return (
    <ComparisonContext.Provider
      value={{
        hotels,
        setSlug,
        setHotels,
        notificationOn,
        setNotificationOn
      }}
      className="hotel"
    >
      <ComparisonPage />
    </ComparisonContext.Provider>
  );
}

export default ComparisonProvider;
export const useComparisonContext = () => useContext(ComparisonContext);