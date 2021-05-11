import React, { useState, useEffect } from 'react';
import { useSearchContext } from '../SearchProvider';
import { Card } from 'tabler-react';
import Typography from '@material-ui/core/Typography';
import Slider from '@material-ui/core/Slider';
import { useDebouncedCallback } from 'use-debounce';

function Rates() {
  const {
    minRate,
    maxRate,
    filterValue,
    updateFilterValues,
  } = useSearchContext();

  const [rateSlider, setRateSlider] = useState(filterValue.rate);
  useEffect(() => {
    setRateSlider(filterValue.rate)
  }, [
    filterValue.rate,
  ])

  const debouncedSliderValue = useDebouncedCallback(
    (value) => {
      updateFilterValues('rate', value)
    }, 500,
  );

  const handleChange = (_event, newValue) => {
    setRateSlider(newValue);
    debouncedSliderValue(newValue);
  };

  return (
    <Card>
      <Card.Body>
        <Typography id='range-slider' gutterBottom variant='h6'>
          Rates ($)
        </Typography>
        <p className='pb-3'>
          <i>average rates for the last 30 days</i>
        </p>
        <Slider
          className='mt-5'
          value={rateSlider}
          onChange={handleChange}
          valueLabelDisplay='on'
          aria-labelledby='range-slider'
          min={minRate}
          max={maxRate}
        />
      </Card.Body>
    </Card>
  );
}

export default Rates;
