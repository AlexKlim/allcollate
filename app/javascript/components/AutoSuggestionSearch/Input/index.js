import React from 'react';

import {
  Loader,
} from "tabler-react";

export default props => {
  const { fetched, ...rest } = props;
  console.log(fetched)
  return (
    <div className="suggestion-input__input-group input-group input-group-lg">
      <input {...rest} />
      {fetched && (
        <div className="suggestion-input__loader_container">
          <Loader className="suggestion-input__loader"/>
        </div>
      )}
      <div className="input-group-btn suggestion-input__btn-search">
        <button className="suggestion-input__btn-search-input" type="submit">
          Search
        </button>
      </div>
    </div>
  );
};
