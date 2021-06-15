import React from 'react';
import Card from '@material-ui/core/Card';
import { CardHeader, CardMedia, CardContent, Typography, Box, Tooltip, Link } from '@material-ui/core';
import { useComparisonContext } from './ComparisonProvider';
import Routes from '../../helpers/routes';
import { useStyles } from './styles'
import _ from 'lodash'

export default function ComparisonResultHeaderCard(props) {
  const classes = useStyles();
  const { hotel, index } = props
  const { hotels, setHotels } = useComparisonContext()

  const removeHotelFromList = (name) => {
    setHotels(hotels.filter((hotel) => hotel.name !== name))
  }

  const createHeaderContainerClassName = (hotelsCount, index) => {
    if (hotelsCount === 1) {
      return classes.headerCardContainerOnly
    }
    else if (index === 0) {
      return classes.headerCardContainerFirst
    }
    else if (index === (hotels.length - 1)) {
      return classes.headerCardContainerLast
    } else {
      return classes.headerCardContainer
    }
  }

  const hotelNameBlock = (hotelName) => {
    if (hotelName.length >= 55) {
      return (
        <Tooltip title={hotel.name} enterDelay={500} leaveDelay={200} placement='top-start' arrow>
          <Box fontSize={18} className={classes.cardHeaderLink}>
            {_.truncate(hotel.name, { 'length': 55, 'separator': ' ' })}
          </Box>
        </Tooltip>
      )
    } else {
      return (
        <Box fontSize={18} className={classes.cardHeaderLink}>
          {hotel.name}
        </Box>
      )
    }
  }

  const locationAddressBlock = (hotel) => {
    const fullAddress = hotel.country + ', ' + hotel.city + ', ' + hotel.addressline1;

    if (fullAddress.length >= 55) {
      return (
        <Tooltip title={fullAddress} enterDelay={500} leaveDelay={200} placement='top-start' arrow>
          <Typography variant="body2" component="p">
            {_.truncate(fullAddress, { 'length': 55, 'separator': ' ' })}
          </Typography>
        </Tooltip>
      )
    } else {
      return (
        <Typography variant="body2" component="p">
          {fullAddress}
        </Typography>
      )
    }
  }

  return (
    <Box textAlign="center" className={createHeaderContainerClassName(hotels, index)}>
      <Card className={classes.card} >
        <CardHeader
          className={classes.cardHeader}
          title={
            <a href={Routes.hotelPath(hotel.slug)} className={classes.cardHeaderLink}>
              {hotelNameBlock(hotel.name)}
            </a>
          }
          action={
            <Box onClick={() => removeHotelFromList(hotel.name)} className={classes.removeButton}>
              <Typography variant="h5" >
                &times;
              </Typography>
            </Box>
          }
        >
        </CardHeader>
        <a href={Routes.hotelPath(hotel.slug)}>
          <CardMedia
            className={classes.media}
            image={hotel.photo}
            title={hotel.name}
          />
        </a>
        <CardContent>
          <Typography variant="body2" component="p">
            {locationAddressBlock(hotel)}
          </Typography>
        </CardContent>
      </Card>
    </Box>
  );
}