import React from "react";
import { useSearchContext } from "../SearchProvider";
import { Card } from "tabler-react";
import Typography from "@material-ui/core/Typography";
import Rating from '@material-ui/lab/Rating';

function StarRating() {
  const {
    startRating, setStarRating
  } = useSearchContext();

  const handleChange = (event) => {
    let rating = event.target.value;
    if(event.target.checked){
      setStarRating([...startRating, rating]);
    }
    else{
      setStarRating(startRating.filter(item => item !== rating));
    }
  };

  return (
    <Card>
      <Card.Body>
        <Typography id="range-slider" gutterBottom>
          Star Rating
        </Typography>
        <input type="checkbox" value={5} onClick={handleChange}/>
        <Rating name="customized-5" className="pl-2" value={5} max={5} readOnly/> <br />
        <input type="checkbox" value={4} onClick={handleChange}/>
        <Rating name="customized-4" className="pl-2" value={4} max={4} readOnly/><br />
        <input type="checkbox" value={3} onClick={handleChange}/>
        <Rating name="customized-3" className="pl-2" value={3} max={3} readOnly/><br />
        <input type="checkbox" value={2} onClick={handleChange}/>
        <Rating name="customized-2" className="pl-2" value={2} max={2} readOnly/><br />
        <input type="checkbox" value={1} onClick={handleChange}/>
        <Rating name="customized-1" className="pl-2" value={1} max={1} readOnly/>
      </Card.Body>
    </Card>
  );
}

export default StarRating;
