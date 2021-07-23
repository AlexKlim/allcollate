import React from 'react';
import { Card } from "tabler-react";

import PageSectionHeader from './PageSectionHeader'
import HighlightedMetrics from './HighlightedMetrics'
import CompareButton from './CompareButton/CompareButton';
import HotelChart from './Chart'

const HotelOverview =({ overview, slug, hotelName, hotelRates, ...rest }) => {

  return (
    <div className="page-content">
      <div className="container">
        <section>
          {/*<PageSectionHeader title={`${hotelName} BRAND`} />*/}
        </section>

        <section>
          <div style={{ display: 'flex', flexDirection: 'row', flexWrap: 'wrap', justifyContent: 'space-between' }}>
            <PageSectionHeader title="Overview" />
            <CompareButton slug={slug}/>
          </div>
          {overview && (
            <Card>
              <Card.Body>
                {overview}
              </Card.Body>
            </Card>
          )}
        </section>

        <HighlightedMetrics hotel={rest} />
        <HotelChart hotelName={hotelName} hotelRates={hotelRates} />
      </div>
    </div>
  );
}

export default HotelOverview;
