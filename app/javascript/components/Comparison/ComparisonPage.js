import React from 'react';
import SuggestionForm from '../AutoSuggestionSearch/SuggestionForm'
import ComparisonResults from './ComparisonResults';
import { Typography, Box } from '@material-ui/core';
import { useComparisonContext } from './ComparisonProvider';
import RatesComparisonChart from './RatesComparisonChart';
import Notification from './Notification'
import { useStyles } from './styles'

function SearchPage() {
  const { setSlug, hotels } = useComparisonContext()
  const classes = useStyles()

  const onSuggestionSelected = (that, suggestion, value) => {
    setSlug(suggestion.slug);
    that.setState({ query: '' });
  }

  const onSubmit = (e) => {
    e.preventDefault();
  }

  return (
    <Box className={classes.page}>
      <Box className={classes.content}>
        <Box className={classes.pageHeader}>
          <Box className={classes.titleBox}>
            <Typography className={classes.title} variant="h1" className={classes.titlePage}>
              Compare Hotels
            </Typography>
          </Box>
          <SuggestionForm
            onSuggestionSelected={onSuggestionSelected}
            onSubmit={onSubmit}
            withSearchButton={false}
            withClearAllButton={true}
          />
          <Box>
          </Box>
        </Box>
        {
          hotels.length === 0 ?
            <Box className={classes.noHotelsBox}>
              <Box className={classes.noHotelsTitle}>
                <Typography variant="h5" gutterBottom>
                  Please add hotels
                </Typography>
              </Box>
            </Box> :
            <>
              <Box>
                <ComparisonResults />
                <RatesComparisonChart />
                <Notification text="Hotel is already in the comparison list" />
              </Box>
            </>
        }
      </Box>
    </Box>
  );
}

export default SearchPage;
