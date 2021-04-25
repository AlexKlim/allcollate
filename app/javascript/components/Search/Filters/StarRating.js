import React, { useState } from 'react';
import { useSearchContext } from '../SearchProvider';
import { Card } from 'tabler-react';
import Typography from '@material-ui/core/Typography';
import StarRatings from 'react-star-ratings';

function StarRating() {
  const { starRating, setStarRating } = useSearchContext();

  const [ratings, setRatings] = useState([5, 4, 3, 2, 1]);

  const handleChange = (event) => {
    let rating = event.target.value;
    if (event.target.checked) {
      setStarRating([...starRating, rating]);
    } else {
      setStarRating(starRating.filter((item) => item !== rating));
    }
  };

  return (
    <Card>
      <Card.Body>
        <Typography id='range-slider' gutterBottom>
          Star Rating
        </Typography>
        {ratings.map((singleRating) => {
          return (
            <>
              <input
                type='checkbox'
                value={singleRating}
                onClick={handleChange}
                className='mr-2'
              />
              <StarRatings rating={singleRating} starDimension="20px" starRatedColor="gold" numberOfStars={singleRating} starSpacing="0px" />
              <br />
            </>
          );
        })}
      </Card.Body>
    </Card>
  );
}

export default StarRating;
