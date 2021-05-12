import React, { useState } from "react";
import { useSearchContext } from "../ComparisonProvider";

import { Card, Form, Tag } from "tabler-react";
import Typography from "@material-ui/core/Typography";

import SuggestionForm from "./AutoSuggestion/SuggestionForm";
import ComparisonAPI from "../../../api/ComparisonAPI";

function SearchFiltersLocations({ value = "" }) {
  const {
    locations,
    setActivePage,
    setLocations,
  } = useSearchContext();
  const [results, setResults] = useState([]);

  const doSearch = async (query) => {
    const comparisonAPI = new ComparisonAPI();
    const data = await comparisonAPI.fetchHotels(query);
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
      <Typography id='location' gutterBottom variant="h6">
          Hotels
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
