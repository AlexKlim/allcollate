import React, { useState, useEffect } from "react";
import { useSearchContext } from "../SearchProvider";

import { Card, Form, Tag } from "tabler-react";
import Typography from "@material-ui/core/Typography";

import SuggestionForm from "./AutoSuggestion/SuggestionForm";
import SearchAPI from "../../../api/SearchAPI";
import { useDebouncedCallback } from 'use-debounce';

function SearchFiltersLocations({ value = "" }) {
  const {
    filterValue,
    updateFilterValues,
  } = useSearchContext();
  const [results, setResults] = useState([]);

  const [locations, setLocations] = useState(filterValue.locations);
  useEffect(() => {
    setLocations(filterValue.locations)
  }, [
    filterValue.locations,
  ])

  const debouncedSearch = useDebouncedCallback(
    async (query) => {
      const searchAPI = new SearchAPI();
      const data = await searchAPI.fetchLocations(query);
      setResults(data);
    }, 100,
  );

  const doSearch = async (query) => {
    debouncedSearch(query)
  };

  const doRemoveClick = (location) => {
    const filteredLocations = locations.filter(
      (item) => item.city !== location.city || item.country !== location.country
    );
    updateFilterValues('locations', filteredLocations)
  };

  const doSuggestionSelected = async (item) => {
    updateFilterValues('locations', [...locations, item])
  };

  return (
    <Card>
      <Card.Body>
      <Typography id='location' gutterBottom variant="h6">
          Locations
        </Typography>
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
