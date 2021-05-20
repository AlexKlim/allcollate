import React from 'react';
import SuggestionForm from '../AutoSuggestionSearch/SuggestionForm'
import ComparisonResults from './ComparisonResults';
import Typography from '@material-ui/core/Typography';
import Grid from '@material-ui/core/Grid'

import { useComparisonContext } from './ComparisonProvider';

function SearchPage() {

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
          <Grid className='comparison__title'>
            <p>
              Compare Hotels
            </p>
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
