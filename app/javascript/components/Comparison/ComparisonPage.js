import React, { useEffect } from 'react';
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
import Notification from './Notification'

const useStyles = makeStyles({
  page: {
    minWidth: '100%'
  },
  content: {
    width: '100%'
  },
  pageHeader: {
    display: 'flex',
    marginTop: '50px',
    display: 'flex',
    flexWrap: 'wrap',
    alignItems: 'center'
  },
  titleBox: {
    width: 'fit-content'
  },
  title: {
    fontStyle: 'normal',
    fontWeight: 'normal',
    fontSize: '34px',
    lineHeight: '40px',
    color: 'black'
  },
  searchBox: {
    width: '6000px',
  },
  noHotelsBox: {
    position: 'absolute',
    minWidth: '100%;',
    left: 0,
    textAlign: 'center',
    backgroundColor: '#F5F7FB'
  },
  noHotelsTitle: {
    marginTop: '15%'
  }
})

function SearchPage() {

  const { setHotels, setSlug, hotels } = useComparisonContext()

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
    <Box className={classes.page}>
      <Box className={classes.content}>
        <Box className={classes.pageHeader}>
          <Box className={classes.titleBox}>
            <Typography className={classes.title}>
              Compare Hotels
            </Typography>
          </Box>
          <SuggestionForm
            onSuggestionSelected={onSuggestionSelected}
            onSubmit={onSubmit}
          />
          <Box>
            <Link
              component="button"
              variant="body2"
              onClick={() => onClearAll()}
            >
              Clear all
          </Link>
          </Box>
        </Box>
        {
          hotels.length === 0 ?
            <Box className={classes.noHotelsBox}>
              <Box className={classes.noHotelsTitle}>
                <Typography variant="h2" gutterBottom>
                  Please add at least one hotel to the list...
        </Typography>
              </Box>
            </Box> :
            <>
              <Box>
                <ComparisonResults />
                {hotels.length !== 0 ? <RatesComparisonChart /> : null}
                <Notification />
              </Box>
            </>
        }
      </Box>
    </Box>
  );
}

export default SearchPage;
