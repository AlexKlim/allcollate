import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Card from '@material-ui/core/Card';
import CardHeader from '@material-ui/core/CardHeader';
import CardMedia from '@material-ui/core/CardMedia';
import CardContent from '@material-ui/core/CardContent';
import Avatar from '@material-ui/core/Avatar';
import IconButton from '@material-ui/core/IconButton';
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
  expandOpen: {
    transform: 'rotate(180deg)',
  },
  avatar: {
    backgroundColor: red[500],
  },
}));


export default function ComparisonResultHeaderCard(props) {
  const classes = useStyles();

let { hotels, setHotels } = useComparisonContext()

const removeHotelFromList = (name) => {
  setHotels(hotels.filter((hotel) => hotel.name !== name))
}

  return (
    <Card className={classes.card}>
      <CardHeader
        avatar={
          <Avatar aria-label="recipe" className={classes.avatar}>
            R
          </Avatar>
        }
        title={props.name}
        subheader={
          <StarRatings
            rating={props.starRating}
            starDimension='20px'
            starRatedColor='gold'
            numberOfStars={props.starRating}
            starSpacing='0px'
          />}
        action={
          <Box onClick={() => removeHotelFromList(props.name)}>
            <Typography>
              &#10006;
        </Typography>
          </Box>
        }
      >
      </CardHeader>
      <CardMedia
        className={classes.media}
        image={props.photo}
        title={props.slug}
      />
      <CardContent>
        <Typography variant="body2" color="textSecondary" component="p">
          {props.slug}
        </Typography>
      </CardContent>
    </Card>
  );
}