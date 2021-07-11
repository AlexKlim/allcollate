import React from 'react';
import { Box, Typography } from '@material-ui/core';
import SuggestionForm from '../AutoSuggestionSearch/SuggestionForm';
import HotelCard from './HotelCard'
import Footer from './Footer';
import HeaderGraphic from './HeaderGraphic';

const LandingPage = () => {

    const onSuggestionSelected = (that, suggestion, value) => {
        // setSlug(suggestion.slug);
        // that.setState({ query: '' });
        console.log(that, suggestion, value)
    }

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
                                <Typography variant="h1" component="h2" className='mb-5' style={{ color: '#5C73C2', fontSize: '64px' }}>
                                    Allcollate
                                </Typography>
                                <Typography style={{ fontSize: '32px', marginTop: '35px' }}>
                                    Find and track any hotels
                                </Typography>
                                <Box style={{ display: 'flex', flexWrap: 'wrap', justifyContent: 'center', marginTop: '35px' }}>
                                    <SuggestionForm
                                        onSuggestionSelected={onSuggestionSelected}
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
            <Box component='section' className='features-icons text-center' style={{
                borderTop: '1px solid #B2B2B2',
                borderBottom: '1px solid #B2B2B2',
                paddingTop: '0px',
                height: '360px'
            }}>
                <Box className='container'>
                    <Box className='row'>
                        <Box className='col-lg-4' style={{ marginTop: '70px' }}>
                            <Box className='features-icons-item mx-auto mb-5.mb-lg-0 mb-lg-3'>
                                <Box className='features-icons-icon d-flex'
                                >
                                    <HotelCard />
                                </Box>
                            </Box>
                        </Box>
                        <Box className='col-lg-4' style={{ marginTop: '70px' }}>
                            <Box className='features-icons-item mx-auto mb-5.mb-lg-0 mb-lg-3'>
                                <Box className='features-icons-icon d-flex'>
                                    <HotelCard />
                                </Box>
                            </Box>
                        </Box>
                        <Box className='col-lg-4' style={{ marginTop: '70px' }}>
                            <Box className='features-icons-item mx-auto mb-5.mb-lg-0 mb-lg-3'>
                                <Box className='features-icons-icon d-flex'>
                                    <HotelCard />
                                </Box>
                            </Box>
                        </Box>
                    </Box>
                </Box>
            </Box>
            <Box style={{ width: '100%', height: '171px', background: '#f8f9fa' }}>
            </Box>
            <Footer />
        </>
    )
}

export default LandingPage
