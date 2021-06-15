import React, { useState, useEffect } from "react";
import { useSearchContext } from "../SearchProvider";

import { Card, Form } from "tabler-react";
import { Typography, Chip } from "@material-ui/core";

import SuggestionForm from "./AutoSuggestion/SuggestionForm";
import SearchAPI from "../../../api/SearchAPI";
import { useDebouncedCallback } from 'use-debounce';
import useStyles from '../Styles';
import _ from 'lodash';


function SearchFiltersLocations({ value = "" }) {
  const classes = useStyles();

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
    updateFilterValues('locations', _.unionWith(locations, [item], _.isEqual))
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
          <div className={classes.locationChipsList}>
            {locations.map((tag) => (
              <Chip
                style={{ borderRadius: 5 }} onDelete={doRemoveClick.bind(this, tag)}
                label={`${tag.country}, ${tag.city}`}
              />
            ))}
            </div>
        </Form.Group>
      </Card.Body>
    </Card>
  );
}

export default SearchFiltersLocations;
