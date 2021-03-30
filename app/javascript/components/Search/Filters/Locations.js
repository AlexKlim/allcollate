import React, { useState, useEffect } from 'react';
import { useHistory } from 'react-router-dom';
import { useDebouncedCallback } from 'use-debounce/lib';
import { useSearchContext } from '../SearchProvider';

import { Card, Form, Tag } from 'tabler-react';

import Autosuggest from 'react-autosuggest';

import SuggestionForm from './AutoSuggestion/SuggestionForm';
import SearchAPI from '../../../api/SearchAPI';

function SearchFiltersLocations({ value = '' }) {
  const { query, tags, setTags, setHotels } = useSearchContext();

  const [results, setResults] = useState([]);
  // const [tags, setTags] = useState([]);

  const doSearch = async (query) => {
    const searchAPI = new SearchAPI();
    const data = await searchAPI.fetchLocations(query);
    setResults(data);
  };

  const doRemoveClick = (event) => {
    let updatedTags = [];

    tags.forEach((singleItem) => {
      if (
        singleItem.city === event.city &&
        singleItem.country === event.country
      ) {
        // Do not push in array
      } else {
        updatedTags.push(singleItem);
      }
    });

    setTags(updatedTags);
  };

  const doSuggestionSelected = async (item) => {
    setTags((tags) => [...tags, item]);
  };

  return (
    <Card>
      <Card.Body>
        <div className='search__filter-title'>Locations</div>
        <Form.Group>
          <SuggestionForm
            doSuggestionSelected={doSuggestionSelected}
            doSearch={doSearch}
            results={results}
            value={value}
          />
          <Tag.List>
            {tags.map((tag) => (
              <Tag onRemoveClick={doRemoveClick.bind(this, tag)} remove>
                {tag.country}, {tag.city}
              </Tag>
            ))}
          </Tag.List>
        </Form.Group>
      </Card.Body>
    </Card>
  );
}

export default SearchFiltersLocations;
