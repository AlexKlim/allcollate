import React, { useEffect, useState } from 'react';
import { Card, Tag } from 'tabler-react';
import StarRatings from 'react-star-ratings';
import Tooltip from '@material-ui/core/Tooltip';
import Pagination from 'reactive-pagination';
import { useSearchContext } from './SearchProvider';
import Routes from '../../helpers/routes';
import Typography from "@material-ui/core/Typography";
import CircularProgress from '@material-ui/core/CircularProgress';
import _ from 'lodash';
import Box from '@material-ui/core/Box';
import Button from '@material-ui/core/Button';
import DeleteIcon from '@material-ui/icons/Delete';
import { Divider } from '@material-ui/core';
import { Link } from '@material-ui/core';


import useStyles from './Styles';

function SearchResults() {
  const classes = useStyles();

  const {
    hotels,
    handlePageChange,
    activePage,
    pagingData,
    isLoading,
    hotelPlaceholderUrl,
  } = useSearchContext();

  const [listUpdated, setListUpdated] = useState(false)
  const [comparisonList, setComparisonList] = useState([])
  const [compareSlug, setCompareSlug] = useState('')

  useEffect(() => {
    if (listUpdated) {
      const list = hotels.filter(hotel => hotel.slug in localStorage)
      const slugsList = list.map(hotel => hotel.slug)
      console.log(slugsList)
      if (slugsList.length !== 0) {
        setCompareSlug(slugsList.join(','))
      } else {
        setCompareSlug('')
      }
      setListUpdated(false)
    }
  }, [
    listUpdated
  ])

  useEffect(() => {
    const list = hotels.filter(hotel => hotel.slug in localStorage)
    const slugsList = list.map(hotel => hotel.slug)
    if (slugsList.length !== 0) {
      // setComparisonList(slugsList)
      setCompareSlug(slugsList.join(','))
    } else {
      setCompareSlug('')
    }
  })

  const onSelectHotel = (hotel) => {
    if (!(hotel.slug in localStorage)) {
      localStorage.setItem(`${hotel.slug}`, 1)
    } else {
      localStorage.removeItem(`${hotel.slug}`)
    }
    setListUpdated(true)
  }

  const number_or_na = (val) => {
    return val ? val : <span className='search__text-grey'>NA</span>;
  };

  const ratingTag = (rating, reviewCount) => {
    if (!rating || rating < 1) {
      return;
    }

    let color = 'green';
    if (_.inRange(rating, 1, 5)) {
      color = 'red';
    } else if (_.inRange(rating, 5, 8)) {
      color = 'yellow';
    }

    return (
      <Tooltip arrow placement='top'
        title={
          <Typography variant="body2">
            Review score.
            <br />
            Based on <b>{reviewCount}</b> review counts.
          </Typography>
        }
      >
        <span>
          <Tag color={color}>{rating}</Tag>
        </span>
      </Tooltip>
    );
  };

  return (
    <>
      {isLoading && hotels.length == 0 && (
        <div className={`row ${classes.centerContent}`}>
          <CircularProgress />
        </div>
      )}

      {!isLoading && hotels.length == 0 && (
        <div className={`row ${classes.centerContent}`}>
          <Typography variant="h6" component="div" align='center'>
            No results. Please adjust your search and try again.
          </Typography>
        </div>
      )}

      <div className={`row ${isLoading && classes.loading}`}>
        {hotels.map((hotel, index) => {
          return (
            <Card key={index}>
              <Card.Body>
                <div className='row'>
                  <div className='search__compare-action'>
                    <input
                      type='checkbox'
                      className='search__compare-action-checkbox'
                      onChange={() => onSelectHotel(hotel)}
                      checked={hotel.slug in localStorage ? 'checked' : ''}
                    />
                  </div>
                  <div className='col-md-2'>
                    <a href={Routes.hotelPath(hotel.slug)}>
                      <img src={hotel.photo || hotelPlaceholderUrl} className='search__hotel-photo' />
                    </a>
                  </div>
                  <div className='col-md-3'>
                    <div className='search__hotel-name'>
                      <a href={Routes.hotelPath(hotel.slug)}>{hotel.name}</a>
                    </div>
                    <StarRatings
                      rating={hotel.starRating}
                      starDimension='20px'
                      starRatedColor='gold'
                      starSpacing='0px'
                    />
                    <div className='search__hotel-overview'>
                      {hotel.overview}
                    </div>
                  </div>

                  <div className='col-md-3 search__hotel-location'>
                    {hotel.country}, {hotel.city}, {hotel.addressline1}
                  </div>

                  <div className='search__hotel-dates text-center'>
                    <div className='search__hotel-dates-title'>
                      Opened/Renovated
                    </div>
                    <div>
                      {number_or_na(hotel.yearOpened)} /{' '}
                      {number_or_na(hotel.yearRenovated)}
                    </div>
                  </div>

                  <div className='search__hotel-rate text-center '>
                    <div className='search__hotel-rate-title'>$/Night</div>
                    <div>{hotel.rate}</div>
                  </div>
                  <div className='col-md-1 search__score float-right'>
                    <div className='col-md-1 search__hotel-rate text-center '>
                      {ratingTag(hotel.rating, hotel.reviewCount)}
                    </div>
                  </div>

                  <div className='col-md-1 search__view'>
                    <a
                      className='btn btn-light position-absolute fixed-bottom'
                      href={Routes.hotelPath(hotel.slug)}
                    >
                      View
                    </a>
                  </div>
                </div>
              </Card.Body>
            </Card>
          );
        })}
      </div>
      {compareSlug !== '' &&
        <Box className='row' display='flex' flexDirection='row-reverse'>
          <Button
            variant="contained"
            color="primary"
            className={classes.link}
            size='small'
          >
            <Link href={Routes.comparePath(compareSlug)} style={{color: 'white'}}>
            <Typography>
              {compareSlug.split(',').length} Compare  <Divider orientation="vertical" flexItem light />
            </Typography>
            </Link>
            <DeleteIcon />
          </Button>
        </Box>
      }
      {hotels.length > 0 && pagingData?.totalRecords > pagingData?.perPage && (
        <div className='row'>
          <div className='col-12 text-center'>
            <Pagination
              activePage={activePage}
              itemsCountPerPage={pagingData?.perPage || 10}
              totalItemsCount={pagingData?.totalRecords || 400}
              delimeter={5}
              onChange={handlePageChange}
              styling='rounded'
            />
          </div>
        </div>
      )}
    </>
  );
}

export default SearchResults;
