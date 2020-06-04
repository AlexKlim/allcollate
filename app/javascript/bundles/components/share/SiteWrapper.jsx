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
                    <img src='/' alt='allcollate' className="allcollate-logo"/>
                    <Form.InputGroup className="search-field-group" append={<Button RootComponent="a" color="primary" href="http://www.google.com">Go!s</Button>}>
                      <Form.Input className="adasda" placeholder="Search for..." />
                    </Form.InputGroup>
                  </div>
                </React.Fragment>
              </div>

              <div className="container header-subtitle">
                <React.Fragment>
                  <Site.Logo href={this.props.headerLink} alt={this.props.headerAlt} src={this.props.headerLogo} />
                  <h1 className="d-flex order-lg-2 header-brand-title">
                    {this.props.headerAlt}
                  </h1>
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