import React from 'react';
import { useComparisonContext } from './ComparisonProvider';
import { Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Box } from '@material-ui/core';
import ComparisonResultHeaderCard from './ComparisonResultHeaderCard'
import ComparisonResultTableRow from './ComparisonResultTableRow'
import { comparisonOptions } from './constants'
import { useStyles } from './styles'

function ComparisonResults() {
  const { hotels } = useComparisonContext();
  const classes = useStyles()

  return (
    <TableContainer>
      <Table className={classes.table} aria-label="customized table">
        <TableHead>
          <TableRow>
            <TableCell className={classes.leftColumnHeader}>
              <Box className={classes.leftColumnHeaderBox} />
            </TableCell>
            {hotels.map((hotel, i) => {
              return (
                <TableCell className={classes.cell} key={i}>
                  <Box className={classes.headerCardBox}>
                    <ComparisonResultHeaderCard hotel={hotel} />
                  </Box>
                </TableCell>
              )
            })}
          </TableRow>
          <br />
        </TableHead>
        <TableBody>
          {comparisonOptions.map((option, i) => {
            return (
              <ComparisonResultTableRow hotels={hotels} comparisonOption={option.title} data={option.key} key={i} />
            )
          })}
        </TableBody>
      </Table>
    </TableContainer>
  );
}

export default ComparisonResults;
