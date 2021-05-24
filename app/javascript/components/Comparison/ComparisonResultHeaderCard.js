import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Card from '@material-ui/core/Card';
import CardHeader from '@material-ui/core/CardHeader';
import CardMedia from '@material-ui/core/CardMedia';
import CardContent from '@material-ui/core/CardContent';
import Avatar from '@material-ui/core/Avatar';
import Typography from '@material-ui/core/Typography';
import { red } from '@material-ui/core/colors';
import { useComparisonContext } from './ComparisonProvider';
import Box from '@material-ui/core/Box';
import StarRatings from 'react-star-ratings';

const useStyles = makeStyles(() => ({
  card: {
    maxWidth: '345px',
  },
  media: {
    height: '0px',
    paddingTop: '56.25%',
  },
  avatar: {
    backgroundColor: red[500],
  },
  removeButton: {
    '&:hover': {
      cursor: 'pointer'
    }
  }
}));


export default function ComparisonResultHeaderCard(props) {
  const classes = useStyles();

let { hotels, setHotels } = useComparisonContext()

const removeHotelFromList = (name) => {
  setHotels(hotels.filter((hotel) => hotel.name !== name))
}

const {hotel} = props

  return (
    <Card className={classes.card}>
      <CardHeader
        avatar={
          <Avatar aria-label="recipe" className={classes.avatar}>
            {hotel.name[0]}
          </Avatar>
        }
        title={hotel.name}
        subheader={
          <StarRatings
            rating={hotel.starRating}
            starDimension='20px'
            starRatedColor='gold'
            numberOfStars={hotel.starRating}
            starSpacing='0px'
          />}
        action={
          <Box onClick={() => removeHotelFromList(hotel.name)} className={classes.removeButton}>
            <Typography>
              &#10006;
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
          {hotel.country + ', ' + hotel.city}
        </Typography>
      </CardContent>
    </Card>
  );
}