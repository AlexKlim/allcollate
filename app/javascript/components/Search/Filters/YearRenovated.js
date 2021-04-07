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
    yearRenovationSlider,
    setYearRenovationSlider,
  } = useSearchContext();

  const handleChange = (event, newValue) => {
    setYearRenovationSlider(newValue);
  };

  return (
    <Card>
      <Card.Body>
        <Typography id='range-slider' gutterBottom>
          Year Renovated
        </Typography>
        <Slider
          value={yearRenovationSlider}
          onChange={handleChange}
          valueLabelDisplay='on'
          aria-labelledby='range-slider'
          min={2016}
          max={2021}
        />
      </Card.Body>
    </Card>
  );
}

export default YearRenovated;
