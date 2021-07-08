import React from 'react';
import { Loader } from "tabler-react";
import ClearAllButton from '../../Comparison/ClearAllButton';

export default props => {
  const { fetched, ...rest } = props;

  return (
    <>
      <div className="suggestion-input__input-group input-group input-group-lg">
        <input {...rest} />
        {fetched && (
          <div className="suggestion-input__loader_container">
            <Loader className="suggestion-input__loader" />
          </div>
        )}
        <div className="input-group-btn suggestion-input__btn-search">
          <button className="suggestion-input__btn-search-input" type="submit">
            {props.withSearchButton ?
              <>Search</> :
              null
            }
            {props.withClearAllButton ?
              <ClearAllButton /> :
              null
            }
          </button>
        </div>
      </div>
    </>
  );
};
