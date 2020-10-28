import React, { useState } from 'react';
import { useSearchContext } from '../SearchProvider';

import { Card, Form } from 'tabler-react';

function SearchFiltersLocations() {
  const { query } = useSearchContext();

  handleInputChange = (e) => {

  }

  return (
    <Card>
      <Card.Body>
        <div className="search__filter-title">
          Locations
        </div>
        <Form.Group>
          <Form.Input
            placeholder="Try San Francisco"
            autoComplete="off"
            onChange={this.handleInputChange}
          />
        </Form.Group>
      </Card.Body>
    </Card>
  );
}

export default SearchFiltersLocations;