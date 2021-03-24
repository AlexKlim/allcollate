import React from "react";
import { Card } from 'tabler-react';
import StarRatings from 'react-star-ratings';

import { useSearchContext } from './SearchProvider'

import Routes from '../../helpers/routes'

function SearchResults() {
  const { hotels } = useSearchContext();


  const number_or_na = (val) => {
    return val ? val : (
      <span className="search__text-grey">NA</span>
    )
  }

  return(
    <div className="row">
      { hotels.map(hotel => (
        <Card>
          <Card.Body>
            <div className="row">
              <div className="search__compare-action">
                <input type="checkbox" className="search__compare-action-checkbox" />
              </div>
              <div className="col-md-2">
                <a href={Routes.hotelPath(hotel.slug)}>
                  <img src={hotel.photo} className="search__hotel-photo"/>
                </a>
              </div>
              <div className="col-md-3">
                <div className="search__hotel-name">
                  <a href={Routes.hotelPath(hotel.slug)}>{hotel.name}</a>
                </div>
                <StarRatings rating={hotel.starRating} starDimension="20px" starRatedColor="gold" starSpacing="0px" />
                <div className="search__hotel-overview">
                  {hotel.overview}
                </div>
              </div>

              <div className="col-md-3 search__hotel-location">
                {hotel.country}, {hotel.city}, {hotel.addressline1}
              </div>

              <div className="search__hotel-dates text-center">
                <div className="search__hotel-dates-title">Opened/Renovated</div>
                <div>
                  {number_or_na(hotel.yearOpened)} / {number_or_na(hotel.yearRenovated)}
                </div>
              </div>

              <div className="search__hotel-rate text-center ">
                <div className="search__hotel-rate-title">$/Night</div>
                <div>{hotel.rate}</div>
              </div>

              <div className="col-md-1 search__score">
                <div></div>
                <a className="btn btn-light position-absolute fixed-bottom" href={Routes.hotelPath(hotel.slug)}>View</a>
              </div>
            </div>
          </Card.Body>
        </Card>
        ))}
    </div>
  )
}

export default SearchResults;
