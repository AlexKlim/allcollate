import React, { useCallback, useState } from 'react';
import { useSearchContext } from '../SearchProvider';
import { Card, Form, Tag } from 'tabler-react';
import Typography from '@material-ui/core/Typography';
import Slider from '@material-ui/core/Slider';
import _ from 'lodash';

function Rates() {
  const {
    rateSlider,
    setRateSlider,
    minRate,
    maxRate,
    setActivePage,
  } = useSearchContext();

  const [staticRate, setStaticRate] = useState(rateSlider);

  const debouncedSliderValue = useCallback(
    _.debounce((newValue) => {
      setRateSlider(newValue);
      setActivePage(1);
    }, 500),
    []
  );

  const handleChange = (event, newValue) => {
    setRateSlider(newValue);
    debouncedSliderValue(newValue);
  };

  return (
    <Card>
      <Card.Body>
        <Typography id='range-slider' gutterBottom>
          Rates ($)
        </Typography>
        <p className='pb-3'>average rates for the last 30 days</p>
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
