import React from "react";
import { useSearchContext } from "../SearchProvider";
import { Card } from "tabler-react";
import Typography from "@material-ui/core/Typography";
import Slider from "@material-ui/core/Slider";

function YearRenovated() {
  const { yearRenovationSlider, setYearRenovationSlider, minYearRenovated, maxYearRenovated } = useSearchContext();

  const handleChange = (_event, newValue) => {
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
          min={minYearRenovated}
          max={maxYearRenovated}
        />
      </Card.Body>
    </Card>
  );
}

export default YearRenovated;
