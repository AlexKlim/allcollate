import React, { useState, useEffect } from 'react';
import { useHistory } from 'react-router-dom';
import { useDebouncedCallback } from 'use-debounce/lib';
import { useSearchContext } from '../SearchProvider';
import { Slider, RangeSlider } from 'rsuite';

import { Card, Form, Tag } from 'tabler-react';

import Autosuggest from 'react-autosuggest';

import SuggestionForm from './AutoSuggestion/SuggestionForm';
import SearchAPI from '../../../api/SearchAPI';

function YearRenovated({ value = '' }) {
  const {
    query,
    locations,
    setActivePage,
    setLocations,
    setHotels,
  } = useSearchContext();
  const [results, setResults] = useState([]);

  const doSearch = async (query) => {
    const searchAPI = new SearchAPI();
    const data = await searchAPI.fetchLocations(query);
    setResults(data);
  };

  const doRemoveClick = (event) => {
    let updatedLocations = [];

    locations.forEach((singleItem) => {
      if (
        singleItem.city === event.city &&
        singleItem.country === event.country
      ) {
        // Do not push in array
      } else {
        updatedLocations.push(singleItem);
      }
    });
    setActivePage(1);
    setLocations(updatedLocations);
  };

  const doSuggestionSelected = async (item) => {
    setActivePage(1);
    setLocations((locations) => [...locations, item]);
  };

  const handleChange = (values) => {
    debugger;
  }

  return (
    <Card>
      <Card.Body>
        <h6>Year Renovated</h6>
        <RangeSlider 
          defaultValue={[2016, 2020]}
          step={10}
          graduated
          progress
          tooltip
          renderMark={mark => {
            return mark;
          }}
          onChange={handleChange}
        />
      </Card.Body>
    </Card>
  );
}

export default YearRenovated;
