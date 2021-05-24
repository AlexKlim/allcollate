import React from 'react';
import SuggestionForm from '../AutoSuggestionSearch/SuggestionForm'
import ComparisonResults from './ComparisonResults';
import Typography from '@material-ui/core/Typography';
import Grid from '@material-ui/core/Grid'
import { makeStyles } from '@material-ui/core/styles';
import { useComparisonContext } from './ComparisonProvider';
import Link from '@material-ui/core/Link';
import RatesComparisonChart from './RatesComparisonChart';
import Box from '@material-ui/core/Box';
import SelectHotelChart from './SelectHotelChart';

const useStyles = makeStyles({
  pageHeader: {
    display: 'flex',
    marginTop: '70px'
  },
  titleBox: {
    width: '120%'
  },
  title: {
    fontStyle: 'normal',
    fontWeight: 'normal',
    fontSize: '34px',
    lineHeight: '40px',
    color: 'black'
  },
  searchBox: {
    width: '300%',
    display: 'flex'
  }
})

function SearchPage() {

  const { setHotels, setSlug, currentHotel } = useComparisonContext()

  const classes = useStyles()

  const onSuggestionSelected = (that, suggestion, value) => {
    setSlug(suggestion.slug);
    that.setState({ query: '' });
  }

  const onClearAll = () => {
    setHotels([])
  }

  const onSubmit = (e) => {
    e.preventDefault();
  }

  return (
    <>
      <Box className={classes.pageHeader}>
        <Box className={classes.titleBox}>
          <Typography className={classes.title}>
            Compare Hotels
            </Typography>
        </Box>
        <Box className={classes.searchBox}>
          <SuggestionForm
            onSuggestionSelected={onSuggestionSelected}
            onSubmit={onSubmit}
          />
          <Link
            component="button"
            variant="body2"
            onClick={() => onClearAll()}
          >
            Clear all
          </Link>
        </Box>
      </Box>
      <Grid>
        <ComparisonResults />
        <SelectHotelChart />
        { currentHotel ? <RatesComparisonChart currentHotel={currentHotel} /> : null}
      </Grid>
    </>
  );
}

export default SearchPage;
