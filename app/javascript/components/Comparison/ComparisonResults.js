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
              <div className={classes.leftColumnHeaderBox} style={{border: '1px solid #F5F7FB'}}/>
            </td>
            {hotels.map((hotel, i) => {
              return (
                <td className={classes.headerCell} key={i} border="none">
                  <div className={classes.headerCardBox}  >
                    <ComparisonResultHeaderCard hotel={hotel} />
                  </div>
                </td>
              )
            })}
          </tr>
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
    // <Box className={classes.outer}>
    //   <Box className={classes.inner}>
    //     <Table aria-label="customized table" style={{width: '100%;'}}>
    //       <TableBody>
    //        <TableRow>
    //          <TableCell className={classes.leftColumnHeader}>
    //            <Box />
    //          </TableCell>
    //          {hotels.map((hotel, i) => {
    //            return (
    //              <TableCell className={classes.cell} key={i}>
    //                <Box className={classes.headerCardBox}>
    //                  <ComparisonResultHeaderCard hotel={hotel} />
    //                </Box>
    //              </TableCell>
    //            )
    //          })}
    //        </TableRow>
    //        {comparisonOptions.map((option, i) => {
    //          return (
    //            <ComparisonResultTableRow hotels={hotels} comparisonOption={option.title} data={option.key} key={i} />
    //          )
    //        })}
            /* <tr>
              <th style={{position: 'absolute;', left: '0px;', width: '100px;'}}>Lorem ipsum.</th>
              <td>Inventore, at.</td>
              <td>Facilis, voluptatum.</td>
              <td>Laboriosam, voluptatibus.</td>
              <td>Voluptatibus, eaque!</td>
              <td>Molestiae, cupiditate!</td>
              <td>Vel, odio.</td>
              <td>Maxime, dicta.</td>
              <td>Modi, laboriosam.</td>
              <td>Pariatur, non.</td>
            </tr>
            <tr>
              <th  style={{position: 'absolute;', left: '0px;', width: '100px;'}}>Lorem ipsum.</th>
              <td>Saepe, voluptas?</td>
              <td>Doloribus, quidem.</td>
              <td>Omnis, nam!</td>
              <td>Culpa, ut.</td>
              <td>Ex, est?</td>
              <td>Suscipit, ab.</td>
              <td>Ex, doloremque?</td>
              <td>Cum, libero.</td>
              <td>Officia, perspiciatis!</td>
            </tr>
            <tr>
              <th style={{position: 'absolute;', left: '0px;', width: '100px;'}}>Lorem ipsum.</th>
              <td>Mollitia, provident!</td>
              <td>Quae, sit.</td>
              <td>Sapiente, repellat.</td>
              <td>Molestias, distinctio?</td>
              <td>Tempora, omnis!</td>
              <td>Officiis, ex.</td>
              <td>Repellat, quae.</td>
              <td>Porro, delectus?</td>
              <td>Voluptatum, porro.</td>
            </tr>
            <tr>
              <th style={{position: 'absolute;', left: '0px;', width: '100px;'}}>Lorem ipsum.</th>
              <td>Animi, quisquam!</td>
              <td>Dicta, aliquam.</td>
              <td>Ea, nisi.</td>
              <td>Rem, labore.</td>
              <td>Eos, eveniet.</td>
              <td>Velit, eligendi.</td>
              <td>Esse, incidunt.</td>
              <td>Provident, accusantium?</td>
              <td>Commodi, fugiat!</td>
            </tr>
            <tr>
              <th style={{position: 'absolute;', left: '0px;', width: '100px;'}}>Lorem ipsum.</th>
              <td>Odit, dolore.</td>
              <td>Ab, harum?</td>
              <td>Delectus, consequuntur?</td>
              <td>Labore, iusto!</td>
              <td>Aperiam, temporibus.</td>
              <td>Odit, iusto!</td>
              <td>Repellendus, placeat.</td>
              <td>Provident, odit!</td>
              <td>Temporibus, laudantium.</td>
            </tr> */
    //       </TableBody>
    //     </Table>
    //   </Box>
    // </Box>
  );
}

export default ComparisonResults;
