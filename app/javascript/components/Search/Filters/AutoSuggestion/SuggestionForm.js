import React, { useState, useEffect } from 'react';

import Autosuggest from 'react-autosuggest';
import theme from './theme';
import Input from './Input/index';

const SuggestionForm = ({ doSearch, results, value }) => {

  const [localValue, setLocalValue] = useState('');
  useEffect(() => setLocalValue(value), [value]);

  const inputProps = {
    placeholder: 'Type a location',
    name: 'query',
    onChange: (e) => setLocalValue(e.target.value),
    value: localValue,
    // fetched: this.state.fetched
  };

  const onSuggestionsFetchRequested = ({ value }) => {
    doSearch(value.trim());
  }

  const renderSuggestion = (suggestion, { query }) => {
    // const { noResults } = this.state;

    return (
      <div className="results__item">
        <ul className="list-unstyled us-results__list">
          <li className="search-filters-suggestion__results-item">
            {suggestion.city}, {suggestion.country}
          </li>
        </ul>
      </div>
      )
  }

  const onSuggestionSelected = (event, { suggestion, suggestionValue: value }) => {
    event.preventDefault();

    setLocalValue('');
    return;
    // const { noResults } = this.state;

    // if (noResults) {
    //   this.setState({ query: '' });
    //   return;
    // }

    // window.location.href = `/hotel/${suggestion.slug}`
  }

  const onFocus = () => true;
  const showSuggestionsOptions = { shouldRenderSuggestions: onFocus };

  return (
    <Autosuggest
      suggestions={results}
      theme={theme}
      {...showSuggestionsOptions}
      getSuggestionValue={results => results.city}
      inputProps={inputProps}
      onSuggestionsClearRequested={() => null}
      onSuggestionSelected={onSuggestionSelected.bind(this)}
      onSuggestionsFetchRequested={onSuggestionsFetchRequested.bind(this)}
      renderInputComponent={Input}
      renderSuggestion={renderSuggestion.bind(this)}
    />
  );
}

export default SuggestionForm;