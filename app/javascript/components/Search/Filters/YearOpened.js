import React from "react";
import { useSearchContext } from "../SearchProvider";
import { Card, Form, Tag } from "tabler-react";
import Typography from "@material-ui/core/Typography";
import Slider from "@material-ui/core/Slider";

function YearOpened() {
  const { yearOpenedSlider, setYearOpenedSlider, minYearOpened, maxYearOpened } = useSearchContext();

  const handleChange = (event, newValue) => {
    setYearOpenedSlider(newValue);
  };

  return (
    <Card>
      <Card.Body>
        <Typography id="range-slider" gutterBottom>
          Year Opened
        </Typography>
        <Slider
          className="mt-5"
          value={yearOpenedSlider}
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
