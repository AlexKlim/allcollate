import React from 'react';
import { Box, Typography } from '@material-ui/core';
import SuggestionForm from '../AutoSuggestionSearch/SuggestionForm';
import HotelCard from './HotelCard'
import HotelCardAgoda from './HotelCardAgoda'
import HeaderGraphic from './HeaderGraphic';
import Title from './Title'
import { useStyles } from './Styles';

const LandingPage = ({ hotels }) => {
	const classes = useStyles()

	return (
		<>
			<HeaderGraphic />
			<Box component='header' className='text-center  bg-light' style={{ height: '578px' }}>
				<Box className='overlay'>
					<Box className='container'>
						<Box className='row'>
							<Box className='col-xl-12 mx-auto' style={{ marginTop: '234px' }}>
								<Title />
								<Typography style={{ fontSize: '32px', marginTop: '35px' }}>
									Find and track any hotels
								</Typography>
								<Box style={{ display: 'flex', flexWrap: 'wrap', justifyContent: 'center', marginTop: '35px' }}>
									<SuggestionForm
										formClassName="col-md-8 suggestion__form-home"
										withSearchButton={false}
										withClearAllButton={false}
										autofocus="autofocus"
									/>
								</Box>
							</Box>
						</Box>
					</Box>
				</Box>
			</Box>
			<Box component='section' className={`features-icons text-center ${classes.hotelCardsRow}`}>
				<Box className={`container ${classes.featureContainer}`}>
					<Box className='row'>
						<HotelCard hotel={hotels[0]} />
						<HotelCardAgoda />
						<HotelCard hotel={hotels[1]} />
					</Box>
				</Box>
			</Box>
			<Box component='section' className={classes.emptyRow}></Box>
		</>
	)
}

export default LandingPage
