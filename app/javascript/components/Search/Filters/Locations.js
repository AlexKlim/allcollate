import React, { useState } from 'react';
import { useSearchContext } from '../SearchProvider';

import { Card, Form } from 'tabler-react';

function SearchFiltersLocations() {
  const { query } = useSearchContext();

  return (
    <Card>
      <Card.Body>
        <div className="search__filter-title">
          { `Locations: ${query}` }
        </div>
        <Form.Group>
          <Form.Input
            name="example-text-input"
            placeholder="Try San Francisco"
          />
        </Form.Group>
      </Card.Body>
    </Card>
  );
}

export default SearchFiltersLocations;