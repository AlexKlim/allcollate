import React from 'react';

import {
  Page,
  Grid,
  Card,
  GalleryCard,
} from "tabler-react";
import _ from 'underscore';

import SiteWrapper from '../../../components/share/SiteWrapper'
import PageSectionHeader from '../../../components/PageSectionHeader'
import Chart from '../../../components/Chart'
import HighlightedMetrics from '../../../components/HighlightedMetrics'

import "tabler-react/dist/Tabler.css";
import './styles.scss'

export default class HotelShow extends React.Component {

  constructor(props) {
    super(props);
  }

  iframe () {
    return {
      __html: `<iframe width="100%" height="450" frameBorder="0" style="border:0" src="https://www.google.com/maps/embed/v1/place?q=${this.props.latitude},${this.props.longitude}&zoom=17&key=AIzaSyBU28GCObDTHbcIcFizphs1qlwpcx66_wE"/>`
    }
  }

  render() {
    const {
      slug,
      overview,
      name: hotelName,
      photos,
      country,
      state,
      city,
      addressline1,
      rates: hotelRates,
      agoda_url: agodaUrl,
    } = this.props;
    const sortedPhotos = photos.sort(photo => photo.order)

    return (
      <SiteWrapper headerLink={`/hotel/${slug}`} headerAlt={hotelName} headerLogo={sortedPhotos[0].url}>
        <Page.Content>
        <section>
            {/* <PageSectionHeader title={`${hotelName} BRAND`} /> */}
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

          {hotelRates.length > 1 && (
            <section>
              <PageSectionHeader title={`${hotelName} History Rates`} />
              <Chart rates={hotelRates} hotelName={hotelName}/>
              <span className="seo-snippet-for-graph">The latest daily rate is ${_.last(hotelRates).daily_rate}.</span>
            </section>
          )}
        </Page.Content>

        <section>
          <div className="map-container">
            <div className="container">
              <PageSectionHeader title={`${hotelName} Location`} />
              <Card className="map-card">
                <Card.Body>
                  The {hotelName} is located in {country}, {state}, {city}, {addressline1}.
                </Card.Body>
              </Card>
            </div>
            <div dangerouslySetInnerHTML={ this.iframe() } />
          </div>
        </section>

        <Page.Content>
          <section>
            <PageSectionHeader title={`${hotelName} Images`} />
            <Grid.Row className="row-cards">
              {sortedPhotos.map((item, key) => (
                <Grid.Col sm={6} lg={4} key={key} className="gallery-grid-col">
                  <GalleryCard className="gallery-card">
                    <img src={item.url} />
                  </GalleryCard>
                </Grid.Col>
              ))}
            </Grid.Row>
          </section>

          <section className="view-on-agoda">
            <a className="btn btn-info" href={agodaUrl} target="_blank" rel="nofollow noopener noreferrer">View on Agoda</a>
          </section>

          <section>
            {/* <PageSectionHeader title={`Similar ??? Hotels in the same area?`} /> */}
          </section>

        </Page.Content>
      </SiteWrapper>
    );
  }
}
