import React, { useCallback, useState } from "react";
import { useSearchContext } from "../SearchProvider";
import { Card, Form, Tag } from "tabler-react";
import Typography from "@material-ui/core/Typography";
import Slider from "@material-ui/core/Slider";
import _ from "lodash";

function YearOpened() {
  const {
    yearOpenedSlider,
    setYearOpenedSlider,
    minYearOpened,
    maxYearOpened,
  } = useSearchContext();

  const [staticYearOpened, setStaticYearOpened] = useState(yearOpenedSlider);

  const debouncedSliderValue = useCallback(
    _.debounce((newValue) => setYearOpenedSlider(newValue), 5000),
    []
  );

  const handleChange = (event, newValue) => {
    setStaticYearOpened(newValue);
    debouncedSliderValue(newValue);
  };

  return (
    <Card>
      <Card.Body>
        <Typography id="range-slider" gutterBottom>
          Year Opened
        </Typography>
        <Slider
          className="mt-5"
          value={staticYearOpened}
          onChange={handleChange}
          valueLabelDisplay="on"
          aria-labelledby="range-slider"
          min={minYearOpened}
          max={maxYearOpened}
        />
      </Card.Body>
    </Card>
  );
}

export default YearOpened;
