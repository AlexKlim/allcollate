import React from 'react';
import SuggestionForm from '../AutoSuggestionSearch/SuggestionForm'
import ComparisonResults from './ComparisonResults';

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
        <SuggestionForm
          onSuggestionSelected={onSuggestionSelected}
          onSubmit={onSubmit}
        />
      </div>
      <div className='row'>
        <div className='col-md-12'>
          <ComparisonResults />
        </div>
    </div>
    </>
  );
}

export default SearchPage;
