import React from 'react';
import { Box, Typography } from '@material-ui/core';
import SuggestionForm from '../AutoSuggestionSearch/SuggestionForm';
import HotelCard from './HotelCard'
import HeaderGraphic from './HeaderGraphic';
import Title from './Title'
import { useStyles } from './Styles';

const LandingPage = ({ hotels }) => {
	const classes = useStyles()
	const onSubmit = (e) => {
		e.preventDefault();
	}
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
										onSubmit={onSubmit}
										withSearchButton={false}
										withClearAllButton={false}
									/>
								</Box>
							</Box>
						</Box>
					</Box>
				</Box>
			</Box>
			<Box component='section' className={`features-icons text-center ${classes.hotelCardsRow}`}>
				<Box className='container' style={{ display: 'flex', flexWrap: 'wrap', justifyContent: 'center' }}>
					<Box className='row' style={{ width: '800px' }}>
						<HotelCard hotel={hotels[0]} />
						{/* <HotelCard hotel={hotels[1]} /> */}
						<div id="adgshp-988197843" />
						<HotelCard hotel={hotels[2]} />
					</Box>
				</Box>
			</Box>
			<Box style={{ width: '100%', height: '171px', background: '#f8f9fa' }}>
			</Box>
		</>
	)
}

export default LandingPage
