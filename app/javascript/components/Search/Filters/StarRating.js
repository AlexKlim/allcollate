import React, { useCallback, useState } from 'react';
import { useSearchContext } from '../SearchProvider';
import { Card } from 'tabler-react';
import Typography from '@material-ui/core/Typography';
import StarRatings from 'react-star-ratings';
import _ from "lodash";

function StarRating() {
  const { starRating, setStarRating, setActivePage } = useSearchContext();

  const [ratings, _setRatings] = useState([5, 4, 3, 2, 1]);

  const debouncedStartRating = useCallback(
    _.debounce((rating, checked) => {
      if (checked) {
        setStarRating([...starRating, rating]);
      } else {
        setStarRating(starRating.filter((item) => item !== rating));
      }
      setActivePage(1);
    }, 500),
    []
  );

  const handleChange = (event) => {
    const rating = event.target.value;
    const checked = event.target.checked
    debouncedStartRating(rating, checked);
  };

  return (
    <Card>
      <Card.Body>
        <Typography id='range-slider' gutterBottom>
          Star Rating
        </Typography>
        {ratings.map((singleRating) => {
          return (
            <label
              htmlFor={`starRating-${singleRating}`}
              className='singleRating'
            >
              <input
                type='checkbox'
                value={singleRating}
                onChange={handleChange}
                id={`starRating-${singleRating}`}
                className='mr-2'
              />
              <StarRatings
                rating={singleRating}
                starDimension='20px'
                starRatedColor='gold'
                numberOfStars={singleRating}
                starSpacing='0px'
              />
            </label>
          );
        })}
      </Card.Body>
    </Card>
  );
}

export default StarRating;
