import React, { useEffect } from 'react';
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
import ComparisonResultTableRow from './ComparisonResultTableRow'
import {comparisonOptions} from './constants'
  
const useStyles = makeStyles({
  table: {
    borderTopWidth: 1,
    marginTop: '50px'
  },
  row: {
    border: '1px',
    borderWidth: '1px',
    borderColor: 'grey',
    borderStyle: 'solid',
    borderRadius: '4px'
  }
})

function ComparisonResults() {
  const { hotels } = useComparisonContext();

  const classes = useStyles()

  return (
    <TableContainer>
        <Table className={classes.table} aria-label="customized table">
          <TableHead>
            <TableRow>
              <TableCell />
              {hotels.map((hotel, i) => {
                return (
                  <TableCell>
                    <ComparisonResultHeaderCard name={hotel.name} photo={hotel.photo} starRating={hotel.starRating} slug={hotel.slug}/>
                  </TableCell>
                )
              })
              }
            </TableRow>
          </TableHead>
          <TableBody>
            {
              comparisonOptions.map((option => {
                return (
                  <ComparisonResultTableRow hotels={hotels} comparisonOption={option.title} data={option.key}/>
                )
              })
              )
            }
          </TableBody>
        </Table>
      </TableContainer>
  );
}

export default ComparisonResults;
