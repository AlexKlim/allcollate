import React from 'react'
import { TableRow } from '@material-ui/core';
import StarRatings from 'react-star-ratings';
import CircularProgress from '@material-ui/core/CircularProgress';
import { useStyles } from './styles'
import Typography from '@material-ui/core/Typography';

export default function ComparisonResultTableRow(props) {
  const classes = useStyles()


  const createDataCellContainerClassName = (hotelsCount, index) => {
    if (index === (hotelsCount - 1)) {
      return classes.hotelDataCellLast
    } else {
      return classes.hotelDataCell
    }
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
                    {hotel[`${props.data}`]}
                  </Typography> :
                  props.data === 'starRating' ?
                    <StarRatings
                      rating={hotel[`${props.data}`]}
                      starDimension='20px'
                      starRatedColor='gold'
                      numberOfStars={hotel[`${props.data}`]}
                      starSpacing='0px'

                    /> :
                    <Typography>
                      {hotel[`${props.data}`][0].daily_rate}
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