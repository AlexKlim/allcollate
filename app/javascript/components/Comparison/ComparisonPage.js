import React from 'react';
import SuggestionForm from '../AutoSuggestionSearch/SuggestionForm'
import ComparisonResults from './ComparisonResults';
import Typography from '@material-ui/core/Typography';
import Grid from '@material-ui/core/Grid'
import { makeStyles } from '@material-ui/core/styles';
import { useComparisonContext } from './ComparisonProvider';
import Link from '@material-ui/core/Link';

const useStyles = makeStyles({
  top: {
    marginTop: '70px'
  },
  title: {
    fontStyle: 'normal',
    fontWeight: 'normal',
    fontSize: '34px',
    lineHeight: '40px',
    color: 'black'
  }
})

function SearchPage() {

  const {setHotels} = useComparisonContext()

  const classes = useStyles()

  const { setSlug } = useComparisonContext();

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
      <Grid container spacing={2} className={classes.top}>
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
    <Link
      component="button"
      variant="body2"
      onClick={() => onClearAll()}
    >
      Clear all
    </Link>

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
