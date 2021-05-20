import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import { useComparisonContext } from './ComparisonProvider';
import Typography from '@material-ui/core/Typography';
import Table from '@material-ui/core/Table';
import TableBody from '@material-ui/core/TableBody';
import TableCell from '@material-ui/core/TableCell';
import TableContainer from '@material-ui/core/TableContainer';
import TableHead from '@material-ui/core/TableHead';
import TableRow from '@material-ui/core/TableRow';
import ComparisonResultHeaderCard from './ComparisonResultHeaderCard'
  
const useStyles = makeStyles({
  table: {
    borderTopWidth: 1,
    marginTop: '50px'
  },
  row: {
    borderWidth: '1px',
    borderColor: 'grey',
    borderStyle: 'solid',
    borderRadius: '4px'
  }
})

  const comparisonOptions = [
    'Start Rating',
    'Year Opened',
    'Year Renovated',
    'Checkin',
    'Checkout',
    'Number Rooms',
    'Number Floors'
  ]


function ComparisonResults() {
  const { hotels } = useComparisonContext();

  const classes = useStyles()

  return (
    <TableContainer>
      {console.log(hotels)}
        <Table className={classes.table} aria-label="customized table">
          <TableHead>
            <TableRow>
              <TableCell />
              {hotels.map((hotel, i) => {
                return (
                  <TableCell>
                    <ComparisonResultHeaderCard name={hotel.name} photo={hotel.photo}/>
                  </TableCell>
                )
              })
              }
            </TableRow>
          </TableHead>
          <TableBody>
            {
              comparisonOptions.map(option => {
                return(
                  <>
                <TableRow className={classes.row}>
                  <TableCell>
                    {option}
                  </TableCell>
                  {hotels.map((hotel, i) => {
                    return (
                      <TableCell>{hotel.name}</TableCell>
                    )
                  })
                  }
                </TableRow>
                <br />
                </>
                )
              })
            }
          </TableBody>
        </Table>
      </TableContainer>
  );
}

export default ComparisonResults;
