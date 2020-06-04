import PropTypes from 'prop-types';
import React from 'react';

import {
  Page,
  Avatar,
  Icon,
  Grid,
  Card,
  Text,
  Table,
  Alert,
  Progress,
  colors,
  Form,
  Dropdown,
  Button,
  StampCard,
  StatsCard,
  ProgressCard,
  Badge,
  GalleryCard,
} from "tabler-react";

import SiteWrapper from '../../../components/share/SiteWrapper'
import GoogleMap from '../../../components/GoogleMap'
import PageSectionHeader from '../../../components/PageSectionHeader'
import TopMetric from '../../../components/TopMetric'
import Chart from '../../../components/Chart'

import "tabler-react/dist/Tabler.css";
import './styles.scss'

export default class HotelShow extends React.Component {

  constructor(props) {
    super(props);
  }

  iframe () {
    return {
      __html: '<iframe width="100%" height="450" frameBorder="0" style="border:0" src="https://www.google.com/maps/embed/v1/place?q=12.568135%2C%20101.466979&key=AIzaSyBU28GCObDTHbcIcFizphs1qlwpcx66_wE"/>'
    }
  }

  render() {
    const {
      slug,
      overview,
      name: hotelName,
      star_rating: starRating,
      photos,
      number_rooms: numberRooms,
      number_floors: numberFloors,
      year_opened: yearOpened,
      year_renovated: yearRenovated,
      checkin,
      checkout,
      country,
      state,
      city,
      addressline1,
      rates: hotelRates,
    } = this.props;
    const sortedPhotos = photos.sort(photo => photo.order)

    return (
      <SiteWrapper headerLink={`/hotel/${slug}`} headerAlt={hotelName} headerLogo={sortedPhotos[0].url}>
        <Page.Content>
        <section>
            <PageSectionHeader title={`${hotelName} BRAND`} />
          </section>

          <section>
            <PageSectionHeader title="Overview" />
            <Card>
              <Card.Body>
                {overview}
              </Card.Body>
            </Card>
          </section>

          <Grid.Row cards={true}>
            <Grid.Col width={6} sm={4} lg={2}>
              <TopMetric total={checkin} label="Checkin" />
            </Grid.Col>
            <Grid.Col width={6} sm={4} lg={2}>
              <TopMetric total={checkout} label="Checkout" />
            </Grid.Col>
            <Grid.Col width={6} sm={4} lg={2}>
              <TopMetric total={starRating} label="Star Rating" />
            </Grid.Col>
            <Grid.Col width={6} sm={4} lg={2}>
              <TopMetric total={numberRooms} label="Number Rooms" />
            </Grid.Col>
            <Grid.Col width={6} sm={4} lg={2}>
              <TopMetric total={numberFloors} label="Number Floors" />
            </Grid.Col>
            <Grid.Col width={6} sm={4} lg={2}>
              <TopMetric total={yearOpened} label="Year Opened" />
            </Grid.Col>
            <Grid.Col width={6} sm={4} lg={2}>
              <TopMetric total={yearRenovated} label="Year Renovated" />
            </Grid.Col>
          </Grid.Row>
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
            <PageSectionHeader title={`${hotelName} History Rates`} />
            <Chart rates={hotelRates} hotelName={hotelName}/>
          </section>

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

          <section>
            <PageSectionHeader title={`Similar ??? Hotels in the same area?`} />
          </section>

        </Page.Content>
      </SiteWrapper>
    );
  }
}
