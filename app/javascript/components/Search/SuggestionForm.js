import * as React from "react";
import Autosuggest from 'react-autosuggest';
import _ from 'underscore';
import {
  Button,
  Form,
  Grid,
} from "tabler-react";

import SearchSuggestionAPI from '../../api/SearchSuggestionAPI'
import theme from './theme';

class SuggestionForm extends React.Component {

  constructor(props, context) {
    super(props, context);

    this.suggestionAPI = new SearchSuggestionAPI();

    this.fetch = _.debounce(async q => {
      const result = await this.suggestionAPI.fetchQuery(q);
      this.setState({ fetched: true, resultItems: result });
    }, 500);

    this.state = {
      noResults: false,
      query: '',
      resultItems: [],
    };
  }

  get currentSuggestions() {
    const { noResults, resultItems } = this.state;

    if (noResults) {
      return resultItems.slice(0, 1);
    } else {
      return resultItems;
    }
  }

  onChange = (event, { newValue }) => {
    this.setState({
      query: newValue
    });
  };

  onSuggestionSelected(event, { suggestion, suggestionValue: value }) {
    event.preventDefault();

    const { noResults } = this.state;

    if (noResults) {
      this.setState({ query: '' });
      return;
    }

    window.location.href = `/hotel/${suggestion.slug}`
  }

  onSuggestionsFetchRequested({ value }) {
    if (_.isEmpty(value)) {
      this.setState({ fetched: false });
      return;
    }
    if (value.trim().length > 2) {
      this.fetch(value.trim());
    }
  }

  renderSuggestionsContainer({ children, containerProps }) {
    return (
      <div {...containerProps} className="suggestion-results__container">
        {children}
      </div>
    );
  }

  renderSuggestion(suggestion, { query }) {
    const { noResults } = this.state;


    return (
      <div className="results__item">
        <ul className="list-unstyled us-results__list">
          <li className="suggestion-results__item">
            {suggestion.name}
            <small className="text-muted suggestion-results__help-text">
              {suggestion.city}, {suggestion.country}
            </small>
          </li>
        </ul>
      </div>
      )
  }

  render() {
    const onFocus = () => true;
    const showSuggestionsOptions = { shouldRenderSuggestions: onFocus };

    const inputProps = {
      placeholder: 'Type a hotel name',
      value: this.state.query || '',
      onChange: this.onChange
    };

    return (
      <Form.Group className="suggestion-form--group col-md-4">
        <Grid.Row gutters="xs">
          <Grid.Col>
            <Autosuggest
              suggestions={this.currentSuggestions}
              theme={theme}
              {...showSuggestionsOptions}
              getSuggestionValue={suggestion => suggestion.name}
              inputProps={inputProps}
              onSuggestionsClearRequested={() => null}
              onSuggestionSelected={this.onSuggestionSelected.bind(this)}
              onSuggestionsFetchRequested={this.onSuggestionsFetchRequested.bind(this)}
              // renderInputComponent={Input}
              renderSuggestion={this.renderSuggestion.bind(this)}
              renderSuggestionsContainer={this.renderSuggestionsContainer.bind(this)}
            />
          </Grid.Col>
          {/* <Grid.Col auto>
            <Button
              color="secondary"
              icon="search"
            />
          </Grid.Col> */}
        </Grid.Row>
      </Form.Group>
    );
  }
}

export default SuggestionForm;
