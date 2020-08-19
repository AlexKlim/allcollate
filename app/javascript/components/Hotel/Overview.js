import React from 'react';
import { Card } from "tabler-react";

import PageSectionHeader from './PageSectionHeader'
import HighlightedMetrics from './HighlightedMetrics'

export default class HotelOverview extends React.Component {

  constructor(props) {
    super(props);
  }

  render() {
    const { overview } = this.props;

    return (
      <>
        <section>
           {/*<PageSectionHeader title={`${hotelName} BRAND`} />*/}
        </section>

        <section>
          <PageSectionHeader title="Overview" />
          {overview && (
            <Card>
              <Card.Body>
                {overview}
              </Card.Body>
            </Card>
          )}
        </section>

        <HighlightedMetrics hotel={this.props} />
      </>
    );
  }
}
