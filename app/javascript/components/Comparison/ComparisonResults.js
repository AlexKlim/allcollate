import React from 'react';

import { useComparisonContext } from './ComparisonProvider';

function ComparisonResults() {
  const { hotels } = useComparisonContext();

  return (
    <>
      {hotels.map((hotel, index) => {
        return (
          <div>{hotel.name}</div>
        );
      })}
    </>
  );
}

export default ComparisonResults;
