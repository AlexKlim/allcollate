import React from 'react';
import _ from 'underscore';

import PageSectionHeader from './PageSectionHeader'
import RateChart from './RateChart'

export default class HotelChart extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const { hotelName, hotelRates } = this.props;
    const sortedRates = _.sortBy(hotelRates, function(r) { return r.actual_on })

    return (
      <>
        {sortedRates.length > 1 && (
          <section>
            <PageSectionHeader title={`${hotelName} History Rates`} />
            <RateChart rates={sortedRates} hotelName={hotelName}/>
            <span className="seo-snippet-for-graph">The latest daily rate is ${_.last(sortedRates).daily_rate}.</span>
          </section>
        )}
      </>
    );
  }
}
