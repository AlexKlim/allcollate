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
          <tr>
            <td className={classes.leftColumnHeader}>
              <div className={classes.leftColumnHeaderBox}/>
            </td>
            {hotels.map((hotel, i) => {
              return (
                <td className={classes.headerCell} key={i} border="none">
                  <div className={classes.headerCardBox}  >
                    <ComparisonResultHeaderCard hotel={hotel} index={i} />
                  </div>
                </td>
              )
            })}
          </tr>
          <div className={classes.headerSpacing} />
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
