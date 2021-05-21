import React from 'react'
import TableRow from '@material-ui/core/TableRow';
import TableCell from '@material-ui/core/TableCell';
import { makeStyles } from '@material-ui/core/styles';
import { spacing } from '@material-ui/system';

const useStyles = makeStyles({
  row: {
    border: '1px',
    borderWidth: '1px',
    borderColor: 'grey',
    borderStyle: 'solid',
    borderRadius: '4px',
    marginTop: '10px'
  }  
})

export default function ComparisonResultTableRow(props) {

  const classes = useStyles()

  return (
    <TableRow className={classes.row}>
      <TableCell>
        {`${props.comparisonOption}`}
      </TableCell>
      {props.hotels.map((hotel, i) => {
        return (
          <TableCell>{hotel[`${props.data}`]}</TableCell>
        )
      })
      }
    </TableRow>
  )
}