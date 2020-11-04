import React, { useState, useEffect } from 'react';
import { useDebouncedCallback } from 'use-debounce/lib';
import { useSearchContext } from '../SearchProvider';

import { Card, Form } from 'tabler-react';

import Autosuggest from 'react-autosuggest';

import SuggestionForm from './AutoSuggestion/SuggestionForm'
import SearchAPI from '../../../api/SearchAPI'

function SearchFiltersLocations({ value = '' }) {
  const { query } = useSearchContext();

  const doSearch = async (query) => {
    const searchAPI = new SearchAPI();
    const data = await searchAPI.fetchLocations(query);
    setResults(data);
  }

  const [results, setResults] = useState([]);

  return (
    <Card>
      <Card.Body>
        <div className="search__filter-title">
          Locations
        </div>
        <Form.Group>
          <SuggestionForm doSearch={doSearch} results={results} value={value} />


          {/* <Form.Input
            value={localValue}
            placeholder="Try San Francisco"
            autoComplete="off"
            onChange={(e) => setLocalValue(e.target.value)}
          /> */}
        </Form.Group>
      </Card.Body>
    </Card>
  );
}

export default SearchFiltersLocations;