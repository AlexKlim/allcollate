import React, { useState, useEffect } from 'react';
import { useSearchContext } from '../SearchProvider';
import { Card } from 'tabler-react';
import Typography from '@material-ui/core/Typography';
import StarRatings from 'react-star-ratings';
import { useDebouncedCallback } from 'use-debounce';

function StarRating() {
  const {
    filterValue,
    updateFilterValues,
  } = useSearchContext();

  const [ratings, setStarRating] = useState(filterValue.rating);
  useEffect(() => {
    setStarRating(filterValue.rating)
  }, [
    filterValue.rating,
  ])

  const debouncedStartRating = useDebouncedCallback(
    (currentRatings) => {
      updateFilterValues('rating', currentRatings)
    }, 500,
  );

  const handleChange = (event) => {
    const rating = parseInt(event.target.value);
    const checked = event.target.checked
    let currentRatings;
    if (checked) {
      currentRatings = [...ratings, rating]
    } else {
      currentRatings = ratings.filter((item) => item !== rating)
    }
    setStarRating(currentRatings)
    debouncedStartRating(currentRatings);
  };

  return (
    <Card>
      <Card.Body>
        <Typography id='range-slider' gutterBottom variant="h6">
          Star Rating
        </Typography>
        {[5,4,3,2,1].map((singleRating) => {
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
