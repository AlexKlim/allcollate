import React, { useState } from 'react';
import { Card, Tag } from 'tabler-react';
import StarRatings from 'react-star-ratings';
import Tooltip from 'rc-tooltip';
import Pagination from 'reactive-pagination';
import { makeStyles } from '@material-ui/core/styles';
import Paper from '@material-ui/core/Paper';
import Table from '@material-ui/core/Table';
import TableBody from '@material-ui/core/TableBody';
import TableCell from '@material-ui/core/TableCell';
import TableContainer from '@material-ui/core/TableContainer';
import TableHead from '@material-ui/core/TableHead';
import TablePagination from '@material-ui/core/TablePagination';
import TableRow from '@material-ui/core/TableRow';
import { useSearchContext } from './ComparisonProvider';
import Routes from '../../helpers/routes';
import _ from 'lodash';

const columns = [
  { id: 'name', label: 'Name', minWidth: 170 },
  { id: 'code', label: 'ISO\u00a0Code', minWidth: 100 },
  {
    id: 'population',
    label: 'Population',
    minWidth: 170,
    align: 'right',
    format: (value) => value.toLocaleString('en-US'),
  },
  {
    id: 'size',
    label: 'Size\u00a0(km\u00b2)',
    minWidth: 170,
    align: 'right',
    format: (value) => value.toLocaleString('en-US'),
  },
  {
    id: 'density',
    label: 'Density',
    minWidth: 170,
    align: 'right',
    format: (value) => value.toFixed(2),
  },
];

function createData(name, code, population, size) {
  const density = population / size;
  return { name, code, population, size, density };
}

const rows = [
  createData('India', 'IN', 1324171354, 3287263),
  createData('China', 'CN', 1403500365, 9596961),
  createData('Italy', 'IT', 60483973, 301340),
  createData('United States', 'US', 327167434, 9833520),
  createData('Canada', 'CA', 37602103, 9984670),
  createData('Australia', 'AU', 25475400, 7692024),
  createData('Germany', 'DE', 83019200, 357578),
  createData('Ireland', 'IE', 4857000, 70273),
  createData('Mexico', 'MX', 126577691, 1972550),
  createData('Japan', 'JP', 126317000, 377973),
  createData('France', 'FR', 67022000, 640679),
  createData('United Kingdom', 'GB', 67545757, 242495),
  createData('Russia', 'RU', 146793744, 17098246),
  createData('Nigeria', 'NG', 200962417, 923768),
  createData('Brazil', 'BR', 210147125, 8515767),
];

const useStyles = makeStyles({
  root: {
    width: '100%',
  },
  container: {
    maxHeight: 440,
  },
});

export default function StickyHeadTable() {
  const classes = useStyles();
  const [page, setPage] = React.useState(0);
  const [rowsPerPage, setRowsPerPage] = React.useState(10);

  const handleChangePage = (event, newPage) => {
    setPage(newPage);
  };

  const handleChangeRowsPerPage = (event) => {
    setRowsPerPage(+event.target.value);
    setPage(0);
  };

  return (
    <Paper className={classes.root}>
      <TableContainer className={classes.container}>
        <Table stickyHeader aria-label="sticky table">
          <TableHead>
            <TableRow>
              {columns.map((column) => (
                <TableCell
                  key={column.id}
                  align={column.align}
                  style={{ minWidth: column.minWidth }}
                >
                  {column.label}
                </TableCell>
              ))}
            </TableRow>
          </TableHead>
          <TableBody>
            {rows.map((row) => {
              return (
                <TableRow hover role="checkbox" tabIndex={-1} key={row.code}>
                  {columns.map((column) => {
                    const value = row[column.id];
                    return (
                      <TableCell key={column.id} align={column.align}>
                        {column.format && typeof value === 'number' ? column.format(value) : value}
                      </TableCell>
                    );
                  })}
                </TableRow>
              );
            })}
          </TableBody>
        </Table>
      </TableContainer>
      {/* <TablePagination
        rowsPerPageOptions={[10, 25, 100]}
        component="div"
        count={rows.length}
        rowsPerPage={rowsPerPage}
        page={page}
        onChangePage={handleChangePage}
        onChangeRowsPerPage={handleChangeRowsPerPage}
      /> */}
    </Paper>
  );
}

// function ComparisonResults() {
//   const {
//     hotels,
//     handlePageChange,
//     activePage,
//     pagingData,
//   } = useSearchContext();

//   const number_or_na = (val) => {
//     return val ? val : <span className='search__text-grey'>NA</span>;
//   };

//   const ratingTag = (rating, reviewCount) => {
//     if (!rating || rating < 1) {
//       return;
//     }

//     let color = 'green';
//     if (_.inRange(rating, 1, 5)) {
//       color = 'red';
//     } else if (_.inRange(rating, 5, 8)) {
//       color = 'yellow';
//     }

//     return (
//       <Tooltip
//         placement='top'
//         overlay={
//           <div>
//             Review score.
//             <br />
//             Based on <b>{reviewCount}</b> review counts.
//           </div>
//         }
//       >
//         <Tag color={color}>{rating}</Tag>
//       </Tooltip>
//     );
//   };
//   return (
//     <>
//       <div className='row'>
//         {hotels.map((hotel, index) => {
//           return (
//             <Card key={index}>
//               <Card.Body>
//                 <div className='row'>
//                   <div className='search__compare-action'>
//                     <input
//                       type='checkbox'
//                       className='search__compare-action-checkbox'
//                     />
//                   </div>
//                   <div className='col-md-2'>
//                     <a href={Routes.hotelPath(hotel.slug)}>
//                       <img src={hotel.photo} className='search__hotel-photo' />
//                     </a>
//                   </div>
//                   <div className='col-md-3'>
//                     <div className='search__hotel-name'>
//                       <a href={Routes.hotelPath(hotel.slug)}>{hotel.name}</a>
//                     </div>
//                     <StarRatings
//                       rating={hotel.starRating}
//                       starDimension='20px'
//                       starRatedColor='gold'
//                       starSpacing='0px'
//                     />
//                     <div className='search__hotel-overview'>
//                       {hotel.overview}
//                     </div>
//                   </div>

//                   <div className='col-md-3 search__hotel-location'>
//                     {hotel.country}, {hotel.city}, {hotel.addressline1}
//                   </div>

//                   <div className='search__hotel-dates text-center'>
//                     <div className='search__hotel-dates-title'>
//                       Opened/Renovated
//                     </div>
//                     <div>
//                       {number_or_na(hotel.yearOpened)} /{' '}
//                       {number_or_na(hotel.yearRenovated)}
//                     </div>
//                   </div>

//                   <div className='search__hotel-rate text-center '>
//                     <div className='search__hotel-rate-title'>$/Night</div>
//                     <div>{hotel.rate}</div>
//                   </div>
//                   <div className='col-md-1 search__score float-right'>
//                     <div className='col-md-1 search__hotel-rate text-center '>
//                       {ratingTag(hotel.rating, hotel.reviewCount)}
//                     </div>
//                   </div>

//                   <div className='col-md-1 search__view'>
//                     <a
//                       className='btn btn-light position-absolute fixed-bottom'
//                       href={Routes.hotelPath(hotel.slug)}
//                     >
//                       View
//                     </a>
//                   </div>
//                 </div>
//               </Card.Body>
//             </Card>
//           );
//         })}
//       </div>
//       {hotels.length > 0 && pagingData?.totalRecords > pagingData?.perPage && (
//         <div className='row'>
//           <div className='col-12 text-center'>
//             <Pagination
//               activePage={activePage}
//               itemsCountPerPage={pagingData?.perPage || 10}
//               totalItemsCount={pagingData?.totalRecords || 400}
//               delimeter={5}
//               onChange={handlePageChange}
//               styling='rounded'
//             />
//           </div>
//         </div>
//       )}
//     </>
//   );
// }

// export default ComparisonResults;
