import React from 'react'
import { TableRow, TableCell } from '@material-ui/core';
import StarRatings from 'react-star-ratings';
import CircularProgress from '@material-ui/core/CircularProgress';
import { useStyles } from './styles'

export default function ComparisonResultTableRow(props) {
  const classes = useStyles()

  return (
    <>
      <TableRow className={classes.row}>
        <td padding="none" align="center" className={classes.leftColumn}>
          <div className={classes.comparisonOptionBlock}>
            {`${props.comparisonOption}`}
          </div>
        </td>
        {props.hotels ? props.hotels.map((hotel, i) => {
          return (
            <td key={i} className={classes.resultTableRow} align='center'>
            <div className={classes.hotelDataCell}>
              {props.data !== 'starRating' ? hotel[`${props.data}`] :
                <StarRatings
                  rating={hotel[`${props.data}`]}
                  starDimension='20px'
                  starRatedColor='gold'
                  numberOfStars={hotel[`${props.data}`]}  
                  starSpacing='0px'

                />}
                </div>
            </td>
          )
        }) :
          <CircularProgress />
        }
      </TableRow>
      <br />
    </>
  )
}