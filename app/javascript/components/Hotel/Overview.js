import React from 'react';
import { Card } from "tabler-react";

import PageSectionHeader from './PageSectionHeader'
import HighlightedMetrics from './HighlightedMetrics'
import CompareButton from './CompareButton/CompareButton';

export default class HotelOverview extends React.Component {

  constructor(props) {
    super(props);
  }

  render() {
    const { overview, slug } = this.props;

    return (
      <>
        <section>
          {/*<PageSectionHeader title={`${hotelName} BRAND`} />*/}
        </section>

        <section>
          <div style={{ display: 'flex', flexDirection: 'row', flexWrap: 'wrap', justifyContent: 'space-between' }}>
            <PageSectionHeader title="Overview" />
            {console.log('VOT I ON', slug)}
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

        <HighlightedMetrics hotel={this.props} />
      </>
    );
  }
}
