import React from 'react'
import { TableRow, Typography, CircularProgress } from '@material-ui/core';
import StarRatings from 'react-star-ratings';
import { useStyles } from './styles'

export default function ComparisonResultTableRow(props) {
  const classes = useStyles()


  const createDataCellContainerClassName = (hotelsCount, index) => {
    if (index === (hotelsCount - 1)) {
      return classes.hotelDataCellLast
    } else {
      return classes.hotelDataCell
    }
  }

  const formattedValue = (val) => {
    return val ? val : <span>N/A</span>;
  };

  const startRating = (starRatingValue) => {
    return (
      starRatingValue != 0 ?
        <StarRatings
          rating={starRatingValue}
          starDimension='20px'
          starRatedColor='gold'
          numberOfStars={starRatingValue}
          starSpacing='0px'
        /> : <span>N/A</span>
    )
  }

  return (
    <>
      <TableRow>
        <td padding="none" align="center" className={classes.leftColumn}>
          <div className={classes.comparisonOptionBlock}>
            <div>
              <Typography>
                {`${props.comparisonOption}`}
              </Typography>
            </div>
          </div>
        </td>
        {props.hotels ? props.hotels.map((hotel, i) => {
          return (
            <td key={i} className={classes.resultTableRow} align='center'>
              <div className={createDataCellContainerClassName(props.hotels.length, i)}>
                {props.data !== 'starRating' && props.data !== 'rates' ?
                  <Typography>
                    {formattedValue(hotel[`${props.data}`])}
                  </Typography> :
                  props.data === 'starRating' ?
                    startRating(hotel.starRating) :
                    <Typography>
                      {hotel.rates[0].daily_rate}
                    </Typography>
                }
              </div>
            </td>
          )
        }) :
          <CircularProgress />
        }
      </TableRow>
      {(props.data === 'numberFloors' || props.data === 'reviewCount') ?
        <div className={classes.bigInterRowSpacing} /> :
        <div className={classes.normalInterRowSpacing} />}
    </>
  )
}