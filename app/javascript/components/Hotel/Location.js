import React from 'react';
import { Card } from "tabler-react";
import PageSectionHeader from './PageSectionHeader'

export default class HotelLocation extends React.Component {

  constructor(props) {
    super(props);
  }

  iframe () {
    return {
      __html: `<iframe width="100%" height="450" frameBorder="0" style="border:0" src="https://www.google.com/maps/embed/v1/place?q=${this.props.latitude},${this.props.longitude}&zoom=17&key=AIzaSyBU28GCObDTHbcIcFizphs1qlwpcx66_wE"/>`
    }
  }

  render() {
    return (
      <div dangerouslySetInnerHTML={ this.iframe() } />
    );
  }
}
