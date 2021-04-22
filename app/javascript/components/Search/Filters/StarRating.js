import React, { useState } from 'react';
import { useSearchContext } from '../SearchProvider';
import { Card } from 'tabler-react';
import Typography from '@material-ui/core/Typography';
import Rating from '@material-ui/lab/Rating';

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
        {ratings.map((single_rating) => {
          return (
            <>
              <input
                type='checkbox'
                value={single_rating}
                onClick={handleChange}
              />
              <Rating
                className='pl-2'
                value={single_rating}
                max={single_rating}
                readOnly
              />{' '}
              <br />
            </>
          );
        })}
      </Card.Body>
    </Card>
  );
}

export default StarRating;
