import React, { useState, useEffect } from "react";
import { useSearchContext } from "../SearchProvider";
import { Card, Form, Tag } from "tabler-react";
import Typography from "@material-ui/core/Typography";
import Slider from "@material-ui/core/Slider";

function YearRenovated({ value = "" }) {
  const { yearRenovationSlider, setYearRenovationSlider } = useSearchContext();

  const handleChange = (event, newValue) => {
    setYearRenovationSlider(newValue);
  };

  return (
    <Card>
      <Card.Body>
        <Typography id="range-slider" gutterBottom>
          Year Renovated
        </Typography>
        <Slider
          className="mt-5"
          value={yearRenovationSlider}
          onChange={handleChange}
          valueLabelDisplay="on"
          aria-labelledby="range-slider"
          min={2016}
          max={2021}
        />
      </Card.Body>
    </Card>
  );
}

export default YearRenovated;
