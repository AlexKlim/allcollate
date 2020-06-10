import * as React from "react";
// import { NavLink, withRouter } from "react-router-dom";

import {
  Site,
  // Nav,
  // Grid,
  // List,
  Button,
  Form,
  // Container
} from "tabler-react";
import StarRatings from 'react-star-ratings';

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
                    {/* <Form.InputGroup className="search-field-group" append={
                      <Button RootComponent="a" color="primary" href="http://www.google.com">Search</Button>
                    }>
                      <Form.Input className="adasda" placeholder="Search for..." />
                    </Form.InputGroup> */}
                  </div>
                </React.Fragment>
              </div>

              <div className="container header-subtitle">
                <React.Fragment>
                  <Site.Logo href={this.props.headerLink} alt={this.props.headerAlt} src={this.props.headerLogo} />
                  <div className="d-flex order-lg-2 header-brand-title">
                    <h1 className="hotel-name">
                      {this.props.headerAlt}
                    </h1>
                    <div className="rating-wrapper">
                      <StarRatings rating={4} starDimension="20px" starRatedColor="gold" starSpacing="0px" />
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