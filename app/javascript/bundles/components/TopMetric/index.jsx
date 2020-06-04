import * as React from "react";

import {
  Text,
  Card,
  Header
} from "tabler-react";

class TopMetric extends React.Component {
  render() {
    return (
      <Card className={this.props.className}>
      <Card.Body className="p-3 text-center">
        <Header className="m-0">{this.props.total}</Header>
        <Text color="muted" className=" mb-4">
          {this.props.label}
        </Text>
      </Card.Body>
    </Card>
    );
  }
}

export default TopMetric;