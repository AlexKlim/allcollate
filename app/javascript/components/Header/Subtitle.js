import * as React from "react";

import {
    Site,
} from "tabler-react";
import StarRatings from 'react-star-ratings';

class HeaderSubtitle extends React.Component {
    render() {
      return (
        <div className="container header-subtitle">
          <React.Fragment>
            {this.props.headerLogo && (
              <Site.Logo href={this.props.headerLink} alt={this.props.headerAlt} src={this.props.headerLogo} />
            )}
            <div className="d-flex order-lg-2 header-brand-title">
              <h1 className="hotel-name">
                {this.props.headerAlt}
              </h1>
              <div className="rating-wrapper">
                <StarRatings rating={this.props.starRating} starDimension="20px" starRatedColor="gold" starSpacing="0px" />
              </div>
            </div>
          </React.Fragment>
        </div>
      );
    }
}

export default HeaderSubtitle;
