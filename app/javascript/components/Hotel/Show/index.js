import * as React from "react";

import HeaderSubtitle from '../../Header/Subtitle'
import HotelOverview from '../../Hotel/Overview'

const HeaderShow = ({
  headerLink,
  headerAlt,
  headerLogo,
  starRating,
  ...rest
}) => {

  return (
    <>
      <HeaderSubtitle headerLink={headerLink} headerAlt={headerAlt} headerLogo={headerLogo} starRating={starRating} />
      <div className="page-content">
        <div className="container">
          <HotelOverview { ...rest } />
        </div>
      </div>
    </>
  );
}

export default HeaderShow;
