import React, { useEffect } from 'react';
import { useComparisonContext } from './ComparisonProvider';
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
import {useStyles} from './styles'

function ComparisonResults() {
  const { hotels } = useComparisonContext();


  const classes = useStyles()

  return (
    <TableContainer>
      <Table className={classes.table} aria-label="customized table">
        <TableHead>
          <TableRow>
            <TableCell className={classes.leftColumnHeader} />
            {hotels.map((hotel, i) => {
              return (
                <TableCell className={classes.cell} key={i}>
                  <Box className={classes.headerCardBox}>
                  <ComparisonResultHeaderCard hotel={hotel} />
                  </Box>
                </TableCell>
              )
            })
            }
          </TableRow>
          <br />
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
    </TableContainer>
  );
}

export default ComparisonResults;
