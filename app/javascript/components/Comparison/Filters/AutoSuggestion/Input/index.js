import React from 'react';

import {
  Loader,
} from "tabler-react";

export default props => {
  const { fetched, ...rest } = props;

  return (
    <div className="search-filters-suggestion__input-group input-group input-group-lg">
      <input {...rest} />
      {fetched && (
        <div className="search-filters-suggestion__input-loader_container">
          <Loader className="search-filters-suggestion__input-loader"/>
        </div>
      )}
    </div>
  );
};
