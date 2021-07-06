import React from 'react';
import { Box, Typography } from '@material-ui/core';
import SuggestionForm from '../AutoSuggestionSearch/SuggestionForm';
import HotelCard from './HotelCard'

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
            <Box component='header' className='text-center  bg-light' style={{ height: '578px' }}>
                <Box className='overlay'>
                    <Box className='container'>
                        <Box className='row'>
                            <Box className='col-xl-9 mx-auto' style={{ marginTop: '234px' }}>
                                <Typography variant="h1" component="h2" className='mb-5'>
                                    Allcollate
                                </Typography>
                                <br />
                                Find and track any hotels
                                <br />
                                <Typography>
                                    Suggestion form
                                </Typography>
                                {/* <SuggestionForm
                                    onSuggestionSelected={onSuggestionSelected}
                                    onSubmit={onSubmit}
                                    withoutSearchButton={true}
                                /> */}
                            </Box>
                        </Box>
                    </Box>
                </Box>
            </Box>
            <Box component='section' className='features-icons text-center'>
                <Box className='container'>
                    <Box className='row'>
                        <Box className='col-lg-4'>
                            <Box className='features-icons-item mx-auto mb-5.mb-lg-0 mb-lg-3'>
                                <Box className='features-icons-icon d-flex'
                                >
                                    <HotelCard />
                                </Box>
                            </Box>
                        </Box>
                        <Box className='col-lg-4'>
                            <Box className='features-icons-item mx-auto mb-5.mb-lg-0 mb-lg-3'>
                                <Box className='features-icons-icon d-flex'>
                                    <HotelCard />
                                </Box>
                            </Box>
                        </Box>
                        <Box className='col-lg-4'>
                            <Box className='features-icons-item mx-auto mb-5.mb-lg-0 mb-lg-3'>
                                <Box className='features-icons-icon d-flex'>
                                    <HotelCard />
                                </Box>
                            </Box>
                        </Box>
                    </Box>
                </Box>
            </Box>
            <Box component='footer' className='footer bg-light'>
                <Box className='container'>
                    <Box className='row'>
                        <Box className='col-lg-6 h-100 text-center text-lg-left my-auto'>

                        </Box>
                    </Box>
                </Box>
            </Box>
        </>
    )
}

export default LandingPage
