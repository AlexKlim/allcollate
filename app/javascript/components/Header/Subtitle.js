import * as React from "react";
import { Typography } from '@material-ui/core';
import { Site } from "tabler-react";
import StarRatings from 'react-star-ratings';
import { useStyles } from './styles'

function HeaderSubtitle({ headerLink, headerAlt, headerLogo, starRating }) {
  const classes = useStyles()

  return (
    <div className="sub-header">
      <div className="container header-subtitle">
        <React.Fragment>
          {headerLogo && (
            <Site.Logo href={headerLink} alt={headerAlt} src={headerLogo} />
          )}
          <div className="d-flex order-lg-2 header-brand-title">
            <Typography variant="h1" className={classes.hotelName}>
              {headerAlt}
            </Typography>
            <div className="rating-wrapper">
              <StarRatings rating={starRating} starDimension="20px" starRatedColor="gold" starSpacing="0px" />
            </div>
          </div>
        </React.Fragment>
      </div>
    </div>
  );
}

export default HeaderSubtitle;
