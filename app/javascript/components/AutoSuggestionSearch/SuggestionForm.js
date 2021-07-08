import * as React from "react";
import Autosuggest from 'react-autosuggest';
import _ from 'underscore';
import {
  Button,
  Form,
  Grid,
} from "tabler-react";

import SearchAPI from '../../api/SearchAPI'
import theme from './theme';
import Input from './Input/index';

class SuggestionForm extends React.Component {

  constructor(props, context) {
    super(props, context);

    this.searchAPI = new SearchAPI();

    this.fetch = _.debounce(async q => {
      this.setState({ fetched: true });
      const result = await this.searchAPI.fetchSuggestionQuery(q);
      this.setState({ fetched: false, resultItems: result });
    }, 500);

    this.state = {
      noResults: false,
      query: props.query || '',
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

    if (this.props.onSuggestionSelected) {
      this.props.onSuggestionSelected(this, suggestion, value )
      return
    }

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

  onSubmit(e) {
    if (this.props.onSubmit) {
      this.props.onSubmit(e)
      return
    }

    const { value } = this.input

    if (_.isEmpty(value)) {
      e.preventDefault()
      Router.pushRoute("/search")
      return
    }
  }

  render() {
    const onFocus = () => true;
    const showSuggestionsOptions = { shouldRenderSuggestions: onFocus };

    const inputProps = {
      placeholder: 'Type a hotel name',
      name: 'q',
      onChange: this.onChange,
      value: this.state.query || '',
      fetched: this.state.fetched,
      withSearchButton: this.props.withSearchButton === undefined ? true : false,
      withClearAllButton: this.props.withClearAllButton
    };

    return (
      <Form action="/search" className="suggestion-form--group col-md-4" onSubmit={this.onSubmit.bind(this)} >
        <Grid.Row>
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
              renderInputComponent={Input}
              renderSuggestion={this.renderSuggestion.bind(this)}
              renderSuggestionsContainer={this.renderSuggestionsContainer.bind(this)}
            />
          </Grid.Col>
        </Grid.Row>
      </Form>
    );
  }
}

export default SuggestionForm;
