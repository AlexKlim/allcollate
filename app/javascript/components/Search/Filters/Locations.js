import React, { useState, useEffect } from "react";
import { useHistory } from "react-router-dom";
import { useDebouncedCallback } from "use-debounce/lib";
import { useSearchContext } from "../SearchProvider";

import { Card, Form, Tag } from "tabler-react";

import Autosuggest from "react-autosuggest";

import SuggestionForm from "./AutoSuggestion/SuggestionForm";
import SearchAPI from "../../../api/SearchAPI";

function SearchFiltersLocations({ value = "" }) {
  const {
    query,
    locations,
    setActivePage,
    setLocations,
    setHotels,
  } = useSearchContext();
  const [results, setResults] = useState([]);

  const doSearch = async (query) => {
    const searchAPI = new SearchAPI();
    const data = await searchAPI.fetchLocations(query);
    setResults(data);
  };

  const doRemoveClick = (location) => {
    const filteredLocations = locations.filter(
      (item) => item.city !== location.city || item.country !== location.country
    );
    setActivePage(1);
    setLocations(filteredLocations);
  };

  const doSuggestionSelected = async (item) => {
    setActivePage(1);
    setLocations((locations) => [...locations, item]);
  };

  return (
    <Card>
      <Card.Body>
        <div className="search__filter-title">Locations</div>
        <Form.Group>
          <SuggestionForm
            doSuggestionSelected={doSuggestionSelected}
            doSearch={doSearch}
            results={results}
            value={value}
          />
          <Tag.List>
            {locations.map((tag) => (
              <Tag onRemoveClick={doRemoveClick.bind(this, tag)} remove>
                {tag.country}, {tag.city}
              </Tag>
            ))}
          </Tag.List>
        </Form.Group>
      </Card.Body>
    </Card>
  );
}

export default SearchFiltersLocations;
