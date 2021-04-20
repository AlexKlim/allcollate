import React, { useCallback, useState } from "react";
import { useSearchContext } from "../SearchProvider";
import { Card, Form, Tag } from "tabler-react";
import Typography from "@material-ui/core/Typography";
import Slider from "@material-ui/core/Slider";
import _ from "lodash";

function YearRenovated() {
  const {
    yearRenovationSlider,
    setYearRenovationSlider,
    minYearRenovated,
    maxYearRenovated,
  } = useSearchContext();

  const [staticYearRenovated, setStaticYearRenovated] = useState(
    yearRenovationSlider
  );

  const debouncedSliderValue = useCallback(
    _.debounce((newValue) => setYearRenovationSlider(newValue), 500),
    []
  );

  const handleChange = (event, newValue) => {
    setStaticYearRenovated(newValue);
    debouncedSliderValue(newValue);
  };

  return (
    <Card>
      <Card.Body>
        <Typography id="range-slider" gutterBottom>
          Year Renovated
        </Typography>
        <Slider
          className="mt-5"
          value={staticYearRenovated}
          onChange={handleChange}
          valueLabelDisplay="on"
          aria-labelledby="range-slider"
          min={minYearRenovated}
          max={maxYearRenovated}
        />
      </Card.Body>
    </Card>
  );
}

export default YearRenovated;
