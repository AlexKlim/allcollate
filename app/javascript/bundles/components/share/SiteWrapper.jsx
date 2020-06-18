import * as React from "react";
// import { NavLink, withRouter } from "react-router-dom";

import {
  Site,
} from "tabler-react";
import StarRatings from 'react-star-ratings';

import SuggestionForm from '../Search/SuggestionForm'

import './styles.scss'

class SiteWrapper extends React.Component {

  render() {
    return (
      <Site.Wrapper
        headerProps={{
          align: "header-container",
          children: (
            <div className="main-header-py4">
              <div className="d-flex main-header">
                <React.Fragment>
                  <div className="order-lg-2 header-brand-title">
                    {/* <img src='/' alt='allcollate' className="allcollate-logo"/> */}
                    <a href="/" className="navbar-brand allcollate-title-link">
                      <span className="allcollate-title">Allcollate</span>
                    </a>
                      <span className="allcollate-title allcollate-title-beta">beta</span>
                      <SuggestionForm />
                  </div>
                </React.Fragment>
              </div>

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
            </div>
          ),
        }}
        footerProps={{
          copyright: (
            <React.Fragment>
              © {new Date().getFullYear()}
              <a href='/'> allcollate.com</a>.
              All rights reserved.
            </React.Fragment>
          ),
        }}
      >
        {this.props.children}
      </Site.Wrapper>
    );
  }
}

export default SiteWrapper;