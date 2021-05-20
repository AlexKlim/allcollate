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
import Paper from '@material-ui/core/Paper';
import { red } from '@material-ui/core/colors';
  
const useStyles = makeStyles({
  table: {
    borderTopWidth: 1
  },
  row: {
    borderWidth: 1,
    borderColor: 'grey',
    borderStyle: 'solid',
    borderRadius: 4
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
    <>
      <TableContainer>
        <Table aria-label="customized table">
          <TableHead>
            <TableRow>
              <TableCell />
              {hotels.map((hotel, i) => {
                return (
                  <TableCell>{hotel.name}</TableCell>
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
    </>
  );
}

export default ComparisonResults;
