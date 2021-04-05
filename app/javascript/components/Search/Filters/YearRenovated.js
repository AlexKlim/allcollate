import React, { useState, useEffect } from 'react';
import { useHistory } from 'react-router-dom';
import { useDebouncedCallback } from 'use-debounce/lib';
import { useSearchContext } from '../SearchProvider';

import { Card, Form, Tag } from 'tabler-react';

import Autosuggest from 'react-autosuggest';

import SuggestionForm from './AutoSuggestion/SuggestionForm';
import SearchAPI from '../../../api/SearchAPI';

import Typography from '@material-ui/core/Typography';
import Slider from '@material-ui/core/Slider';

function YearRenovated({ value = '' }) {
  const {
    query,
    locations,
    setActivePage,
    setLocations,
    setHotels,
  } = useSearchContext();
  const [results, setResults] = useState([]);
  const [sliderValues, setSliderValues] = React.useState([20, 37]);

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

  const handleChange = (event, newValue) => {
    setSliderValues(newValue);
  };

  return (
    <Card>
      <Card.Body>
        <Typography id='range-slider' gutterBottom>
          Year Renovated
        </Typography>
        <Slider
          value={sliderValues}
          onChange={handleChange}
          valueLabelDisplay='auto'
          aria-labelledby='range-slider'
        />
      </Card.Body>
    </Card>
  );
}

export default YearRenovated;
