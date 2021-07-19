import React from 'react';
import { Box, Typography } from '@material-ui/core';
import SuggestionForm from '../AutoSuggestionSearch/SuggestionForm';
import HotelCard from './HotelCard'
import Footer from './Footer';
import HeaderGraphic from './HeaderGraphic';
import Title from './Title'
import { useStyles } from './Styles';

const LandingPage = () => {
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
                                <Box style={{
                                    display: 'flex',
                                    flexWrap: 'wrap',
                                    justifyContent: 'center',
                                    marginTop: '35px'
                                }}>
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
                        <HotelCard picture={'http://pix5.agoda.net/hotelimages/38/38/38_120516001857736.jpg?s=312x'} />
                        <HotelCard picture={'http://pix5.agoda.net/hotelimages/38/38/38_120516001857736.jpg?s=312x'} />
                        <HotelCard picture={'http://pix5.agoda.net/hotelimages/38/38/38_120516001857736.jpg?s=312x'} />
                    </Box>
                </Box>
            </Box>
            <Box className={classes.whiteSpaceBlock}>
            </Box>
            <Footer />
        </>
    )
}

export default LandingPage
