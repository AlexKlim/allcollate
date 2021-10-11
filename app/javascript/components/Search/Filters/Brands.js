import React, { useState, useEffect } from "react";
import { useSearchContext } from "../SearchProvider";

import { Card, Form } from "tabler-react";
import { Typography, Chip } from "@material-ui/core";

import SuggestionForm from "./AutoSuggestion/SuggestionForm";
import SearchAPI from "../../../api/SearchAPI";
import { useDebouncedCallback } from 'use-debounce';
import useStyles from '../Styles';
import _ from 'lodash';


function SearchFiltersBrands({ value = "" }) {
  const classes = useStyles();

  const {
    filterValue,
    updateFilterValues,
  } = useSearchContext();
  const [results, setResults] = useState([]);

  const [brands, setBrands] = useState(filterValue.brands);
  useEffect(() => {
    setBrands(filterValue.brands)
  }, [
    filterValue.brands,
  ])

  const debouncedSearch = useDebouncedCallback(
    async (query) => {
      const searchAPI = new SearchAPI();
      const data = await searchAPI.fetchBrands(query);
      setResults(data);
    }, 100,
  );

  const doSearch = async (query) => {
    debouncedSearch(query)
  };

  const doRemoveClick = (brand) => {
    const filteredBrands = brands.filter(
      (item) => item.id !== brand.id
    );
    updateFilterValues('brands', filteredBrands)
  };

  const doSuggestionSelected = async (item) => {
    updateFilterValues('brands', _.unionWith(brands, [item], _.isEqual))
  };

  const suggestionView = (suggestion) => {
    return suggestion.name
  }

  return (
    <Card>
      <Card.Body>
      <Typography id='brand' gutterBottom variant="h6">
          Brand
        </Typography>
        <Form.Group>
          <SuggestionForm
            doSuggestionSelected={doSuggestionSelected}
            doSearch={doSearch}
            results={results}
            value={value}
            suggestionView={suggestionView}
          />
          <div className={classes.brandChipsList}>
            {brands.map((brand) => (
              <Chip
                style={{ borderRadius: 5 }} onDelete={doRemoveClick.bind(this, brand)}
                label={brand.name}
              />
            ))}
            </div>
        </Form.Group>
      </Card.Body>
    </Card>
  );
}

export default SearchFiltersBrands;
