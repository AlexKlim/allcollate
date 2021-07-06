import React from 'react'
import { Box, Typography } from '@material-ui/core';

const Footer = () => {
    return (
        <Box component='footer' className='footer bg-light'>
            <Box className='container'>
                <Box className='row'>
                    <Box className='col-lg-6 h-100 text-center text-lg-left my-auto'>
                        <Box style={{ display: 'inline-flex' }}>
                            <Typography>
                                Erketu Technology
                            </Typography>
                            <Typography className='text-muted small mb-4 mb-lg-0' style={{ marginLeft: '100px' }}>
                                All Rights Reserved. &copy; 2021
                            </Typography>
                        </Box>
                    </Box>
                </Box>
            </Box>
        </Box>
    )
}

export default Footer
