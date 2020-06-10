import * as React from "react";

import {
  Grid
} from "tabler-react";
import TopMetric from '../TopMetric'

class HighlightedMetrics extends React.Component {
  render() {
    const {
      number_rooms: numberRooms,
      number_floors: numberFloors,
      year_opened: yearOpened,
      year_renovated: yearRenovated,
      checkin,
      checkout,
    } = this.props.hotel;

    return (
      <Grid.Row cards={true}>
        {checkin && (
          <Grid.Col width={6} sm={4} lg={2}>
            <TopMetric total={checkin} label="Checkin" />
          </Grid.Col>
        )}
        {checkout && (
          <Grid.Col width={6} sm={4} lg={2}>
            <TopMetric total={checkout} label="Checkout" />
          </Grid.Col>
        )}
        {numberRooms && (
          <Grid.Col width={6} sm={4} lg={2}>
            <TopMetric total={numberRooms} label="Number Rooms" />
          </Grid.Col>
        )}
        {numberFloors && (
          <Grid.Col width={6} sm={4} lg={2}>
            <TopMetric total={numberFloors} label="Number Floors" />
          </Grid.Col>
        )}
        {yearOpened && (
          <Grid.Col width={6} sm={4} lg={2}>
            <TopMetric total={yearOpened} label="Year Opened" />
          </Grid.Col>
        )}
        {yearRenovated && (
          <Grid.Col width={6} sm={4} lg={2}>
            <TopMetric total={yearRenovated} label="Year Renovated" />
          </Grid.Col>
        )}
      </Grid.Row>
    );
  }
}

export default HighlightedMetrics;