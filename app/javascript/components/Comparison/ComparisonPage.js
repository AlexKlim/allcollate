import React from 'react';
import SuggestionForm from '../AutoSuggestionSearch/SuggestionForm'
import ComparisonResults from './ComparisonResults';
import Typography from '@material-ui/core/Typography';

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
      <div className='row'>
        <div className='comparison__header'>
          <div className='comparison__header_title'>
            <p>
              Compare Hotels
        </p>
          </div>
          <div className='comparison__header_inputblock'>
            <SuggestionForm
              onSuggestionSelected={onSuggestionSelected}
              onSubmit={onSubmit}
            />
          </div>
        </div>
        <div className='row'>
          <div className='col-md-12'>
            <ComparisonResults />
          </div>
        </div>
      </div>
    </>
  );
}

export default SearchPage;
