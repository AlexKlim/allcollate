import React, { useEffect } from 'react';
import Card from '@material-ui/core/Card';
import { CardHeader, CardMedia, CardContent, Typography, Box, Tooltip } from '@material-ui/core';
import { useComparisonContext } from './ComparisonProvider';
import {useStyles} from './styles'
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

  return (
    <Box textAlign="center" className={createHeaderContainerClassName(hotels, index)}>
      <Card className={classes.card} >
        <CardHeader
          title={
            <Tooltip title={hotel.name} enterDelay={500} leaveDelay={200} placement='top-start' arrow>
              <Box fontSize={18}>
                {_.truncate(hotel.name, {'length': 25, 'separator': ' '})}
              </Box>
            </Tooltip>
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
        <CardMedia
          className={classes.media}
          image={hotel.photo}
          title={hotel.name}
        />
        <CardContent>
          <Typography variant="body2" color="textSecondary" component="p">
            {hotel.country + ', ' + hotel.city + ', ' + hotel.addressline1}
          </Typography>
        </CardContent>
      </Card>
    </Box>
  );
}