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

const useStyles = makeStyles(() => ({
  contentBox: {
    alignSelf: 'flex-center',
    width: '100%',
    height: '100%',
    display: 'flex',
    flexWrap: 'wrap',
    justifyContent: 'space-around',
    alignItems: 'center'
  },
  card: {
    width: '245px',
    height: '245px',
  },
  cardHeader: {
    align: 'center'
  },
  media: {
    height: '0px',
    paddingTop: '56.25%',
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
    <Box className={classes.contentBox}>
    <Card className={classes.card}>
      <CardHeader 
      title={
        // <Typography>
        <Box textAlign="center" fontSize={18}>
          {hotel.name}
          </Box>
          // </Typography>
      }
        action={
          <Box onClick={() => removeHotelFromList(hotel.name)} className={classes.removeButton}>
            <Typography>
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
          {hotel.country + ', ' + hotel.city}
        </Typography>
      </CardContent>
    </Card>
    </Box>
  );
}