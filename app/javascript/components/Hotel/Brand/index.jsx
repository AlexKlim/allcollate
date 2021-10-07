import * as React from "react";
import { Card, Table, Button, Tag, Text } from "tabler-react";
import pluralize from 'pluralize';

function Brand({ brandName, brandId, brandHotelsCount }) {
  return (
    <Card className="col-md-5">
      <Card.Header >
        <Card.Title>Brand</Card.Title>
      </Card.Header>
      <Table className="card-table">
        <Table.Body>
          <Table.Row>
            <Table.Col>
              <Text className="h4">
                {brandName}
              </Text>
            </Table.Col>
            <Table.Col>
              <Text className="h4">
                {/* <Tag link href="#" color="secondary"> */}
                <Tag color="secondary">
                  {pluralize('hotel', brandHotelsCount, true)}
                </Tag>
              </Text>
            </Table.Col>
            {/* <Table.Col>
              <Button href={"/"}>
                View All
              </Button>
            </Table.Col> */}
          </Table.Row>
        </Table.Body>
      </Table>
    </Card>
  );
}

export default Brand;
