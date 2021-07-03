import React from 'react'
import { Box, Typography } from '@material-ui/core';

const LandingPage = () => {
    return (
        <>
            <Box component='header' className='text-center  bg-light' style={{height: '578px;'}}>
                <Box className='overlay'>
                    <Box className='container'>
                        <Box className='row'>
                            <Box className='col-xl-9 mx-auto' style={{marginTop: '234px;'}}>
                                <Typography variant="h1" component="h2" className='mb-5'>
                                    Allcollate
                                </Typography>
                                    <br />
                                    Find and track any hotels
                                    <br />
                                    Suggestion form
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
                                <Box className='features-icons-icon d-flex'>
                                    <Box className='icon-directions m-auto text-primary'>
                                        Test
                                    </Box>
                                </Box>
                            </Box>
                        </Box>
                    </Box>
                </Box>
            </Box>
        </>
    )
}

export default LandingPage
