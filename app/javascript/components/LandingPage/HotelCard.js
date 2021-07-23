import React from 'react';
import { Box, Card, CardActionArea, Typography } from '@material-ui/core';
import Routes from '../../helpers/routes';
import { useStyles } from './Styles';

export default function HotelCard({ hotel }) {
	const classes = useStyles({ backgroundUrl: hotel.photo });

	return (
		<Box className='col-md-4'>
			<CardActionArea className={classes.cardLink} href={Routes.hotelPath(hotel.slug)}>
				<Card className={classes.cardBody}>
					<div className={classes.hotelNameContainer}>
						<Typography variant="h5">
							{hotel.name}
						</Typography>
					</div>
					<div className={classes.hotelPriceContainer}>
						<div className={classes.hotelPrice}>
							<Typography variant="h6">
								{Math.round(hotel.rate)}$
							</Typography>
						</div>
					</div>
				</Card>
			</CardActionArea>
		</Box>
	);
}
