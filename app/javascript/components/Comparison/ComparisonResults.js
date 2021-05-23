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
import Box from '@material-ui/core/Box';
import { comparisonOptions } from './constants'

const useStyles = makeStyles({
  table: {
    borderTopWidth: 1,
    marginTop: '50px'
  },
  row: {
    border: '1px;',
    borderWidth: '1px;',
    borderColor: 'grey;',
    borderStyle: 'solid;',
    borderRadius: '4px;'
  },
  cell: {
    minWidth: '365px;'
  },
  noHotelsBox: {
    minWidth: '100%;'
  }
})

function ComparisonResults() {
  const { hotels } = useComparisonContext();

  const classes = useStyles()

  let content

  if (hotels.length === 0) {
    content =
      <Box className={classes.noHotelsBox}>
        <Typography variant="h2" gutterBottom>
          Please start typing the hotel name...
        </Typography>
      </Box>
  } else {
    content =
      <Table className={classes.table} aria-label="customized table">
        <TableHead>
          <TableRow>
            <TableCell />
            {hotels.map((hotel, i) => {
              return (
                <TableCell className={classes.cell} key={i}>
                  <ComparisonResultHeaderCard name={hotel.name} photo={hotel.photo} starRating={hotel.starRating} slug={hotel.slug} />
                </TableCell>
              )
            })
            }
          </TableRow>
        </TableHead>
        <TableBody>
          {
            comparisonOptions.map((option, i) => {
              return (
                <ComparisonResultTableRow hotels={hotels} comparisonOption={option.title} data={option.key} key={i} />
              )
            }
            )
          }
        </TableBody>
      </Table>
  }

  return (
    <TableContainer>
      {content}
    </TableContainer>
  );
}

export default ComparisonResults;
