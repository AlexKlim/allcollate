import React, { useState, useEffect } from "react";
import { useSearchContext } from "../SearchProvider";
import { Card, Form, Tag } from "tabler-react";
import Typography from "@material-ui/core/Typography";
import Slider from "@material-ui/core/Slider";

function YearOpened({ value = "" }) {
  const { yearOpenedSlider, setYearOpenedSlider } = useSearchContext();

  const [MIN, setMIN] = useState(705);
  const [MAX, setMAX] = useState(2020);

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
          min={MIN}
          max={MAX}
        />
      </Card.Body>
    </Card>
  );
}

export default YearOpened;
