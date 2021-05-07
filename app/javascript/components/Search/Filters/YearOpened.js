import React, { useCallback, useState } from 'react';
import { useSearchContext } from '../SearchProvider';
import { Card } from 'tabler-react';
import Typography from '@material-ui/core/Typography';
import Slider from '@material-ui/core/Slider';
import _ from 'lodash';

function YearOpened() {
  const {
    yearOpenedSlider,
    setYearOpenedSlider,
    minYearOpened,
    maxYearOpened,
    setActivePage,
  } = useSearchContext();

  const [staticYearOpened, setStaticYearOpened] = useState(yearOpenedSlider);

  const debouncedSliderValue = useCallback(
    _.debounce((newValue) => {
      setYearOpenedSlider(newValue);
      setActivePage(1);
    }, 500),
    []
  );

  const handleChange = (event, newValue) => {
    setYearOpenedSlider(newValue);
    debouncedSliderValue(newValue);
  };

  return (
    <Card>
      <Card.Body>
        <Typography id='range-slider' gutterBottom variant='h6'>
          Year Opened
        </Typography>
        <Slider
          className='mt-5'
          value={yearOpenedSlider}
          onChange={handleChange}
          valueLabelDisplay='on'
          aria-labelledby='range-slider'
          min={minYearOpened}
          max={maxYearOpened}
        />
      </Card.Body>
    </Card>
  );
}

export default YearOpened;
