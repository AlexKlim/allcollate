import React from 'react';
import { Box, Card, CardActionArea, Typography } from '@material-ui/core';
import Routes from '../../helpers/routes';
import { useStyles } from './Styles';

export default function HotelCard({ hotel }) {
	const classes = useStyles();

	return (
		<Box className='col-lg-4' style={{ marginTop: '70px' }}>
			<Box className='features-icons-item mx-auto mb-5.mb-lg-0 mb-lg-3'>
				<Box className='features-icons-icon d-flex'>
				<CardActionArea href={Routes.hotelPath(hotel.slug)}>
					<Card className={classes.root} style={{
						width: '234px',
						height: '220px',
						borderRadius: '4px',
						background: `url(${hotel.photo})`
					}}>
						<div className={classes.hotelNameContainer}>
							<Typography align='center'>
								{hotel.name}
							</Typography>
						</div>
						<div className={classes.hotelCurrentDateContainer}>
							<Typography align='center'>
								{Math.round(hotel.rate)}$
							</Typography>
						</div>
					</Card>
					</CardActionArea>
				</Box>
			</Box>
		</Box>
	);
}
