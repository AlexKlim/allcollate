import React, { useState, useEffect } from 'react';
import { useSearchContext } from '../SearchProvider';
import { Card } from 'tabler-react';
import Typography from '@material-ui/core/Typography';
import Slider from '@material-ui/core/Slider';
import { useDebouncedCallback } from 'use-debounce';

function YearOpened() {
  const {
    minYearOpened,
    maxYearOpened,
    filterValue,
    updateFilterValues,
  } = useSearchContext();

  const [staticYearOpened, setStaticYearOpened] = useState(filterValue.yearOpened);
  useEffect(() => {
    setStaticYearOpened(filterValue.yearOpened)
  }, [
    filterValue.yearOpened,
  ])

  const debouncedSliderValue = useDebouncedCallback(
    (value) => {
      updateFilterValues('yearOpened', value)
    }, 500,
  );

  const handleChange = (_event, newValue) => {
    setStaticYearOpened(newValue);
    debouncedSliderValue(newValue);
  };

  const helpText = () => {
    const leftSlider = staticYearOpened[0];
    const rightSlider = staticYearOpened[1];

    const minText = leftSlider == minYearOpened ? `+${leftSlider}` : leftSlider
    const maxText = rightSlider == maxYearOpened ? `${rightSlider}+` : rightSlider

    return `from ${minText} to ${maxText}`;
  }

  return (
    <Card>
      <Card.Body>
        <Typography id='range-slider' variant='h6'>
          Year Opened
        </Typography>
        <p className='pb-3'>
          <i>{helpText()}</i>
        </p>
        <Slider
          className='mt-5'
          value={staticYearOpened}
          onChange={handleChange}
          valueLabelDisplay='auto'
          aria-labelledby='range-slider'
          min={minYearOpened}
          max={maxYearOpened}
        />
      </Card.Body>
    </Card>
  );
}

export default YearOpened;
