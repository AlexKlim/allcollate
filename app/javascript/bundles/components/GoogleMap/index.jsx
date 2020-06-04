import * as React from "react";
import cn from "classnames";

import "./styles.scss";

import {
  withScriptjs,
  withGoogleMap,
  GoogleMap as ReactGoogleMap,
} from "react-google-maps";

const MapComponent = withScriptjs(
  withGoogleMap(props => (
    <ReactGoogleMap
      defaultZoom={8}
      defaultCenter={{ lat: -34.397, lng: 150.644 }}
      disableDefaultUI={true}
    />
  ))
);

function GoogleMap({ blackAndWhite }) {
  const containerClasses = cn("GoogleMapContainer", { blackAndWhite });
  return (
    <MapComponent
      googleMapURL="https://maps.googleapis.com/maps/api/js"
      loadingElement={<div style={{ height: `100%` }} />}
      containerElement={<div className={containerClasses} />}
      mapElement={<div style={{ height: `100%` }} />}
    />
  );
}

export default GoogleMap;