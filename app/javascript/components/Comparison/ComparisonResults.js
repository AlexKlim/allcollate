import React from 'react';

import { useComparisonContext } from './ComparisonProvider';
import Typography from '@material-ui/core/Typography';
import Table from '@material-ui/core/Table';
import TableBody from '@material-ui/core/TableBody';
import TableCell from '@material-ui/core/TableCell';
import TableContainer from '@material-ui/core/TableContainer';
import TableHead from '@material-ui/core/TableHead';
import TableRow from '@material-ui/core/TableRow';
import Paper from '@material-ui/core/Paper';

function ComparisonResults() {
  const { hotels } = useComparisonContext();

  const comparisonOptions = [
    'Start Rating',
    'Year Opened',
    'Year Renovated',
    'Checkin',
    'Checkout',
    'Number Rooms',
    'Number Floors'
  ]

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
                <TableRow>
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
