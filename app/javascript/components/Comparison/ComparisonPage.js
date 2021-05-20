import React from 'react';
import SuggestionForm from '../AutoSuggestionSearch/SuggestionForm'
import ComparisonResults from './ComparisonResults';
import Typography from '@material-ui/core/Typography';
import Grid from '@material-ui/core/Grid'
import { makeStyles } from '@material-ui/core/styles';
import { useComparisonContext } from './ComparisonProvider';

const useStyles = makeStyles({
  title: {
    fontStyle: 'normal',
    fontWeight: 'normal',
    fontSize: '34px',
    lineHeight: '40px',
    color: 'black'
  }
})

function SearchPage() {

  const classes = useStyles()

  const { setSlug } = useComparisonContext();

  const onSuggestionSelected = (that, suggestion, value) => {
    setSlug(suggestion.slug);
    that.setState({ query: '' });
  }

  const onSubmit = (e) => {
    e.preventDefault();
  }

  return (
    <>
      <Grid container spacing={2}>
        <Grid item xs={4}>
          <Grid>
            <Typography className={classes.title}>
              Compare Hotels
            </Typography>
          </Grid>
        </Grid>
        <Grid item xs={7}>
          <Grid
            container
            direction="row"
            justify="flex-start"
            alignItems="center">
            <SuggestionForm
              onSuggestionSelected={onSuggestionSelected}
              onSubmit={onSubmit}
            />
            <Grid item>
              <a href='#'>Clear all</a>
            </Grid>
          </Grid>
        </Grid>
      </Grid>
      <Grid>
        <ComparisonResults />
      </Grid>
    </>
  );
}

export default SearchPage;
