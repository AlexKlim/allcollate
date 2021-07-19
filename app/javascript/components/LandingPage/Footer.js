import React from 'react'
import { Box, Typography } from '@material-ui/core';

const Footer = () => {
    const date = new Date()
    return (
        <Box component='footer' className='footer' style={{
            paddingTop: '0px',
            background: '#FFFFFF',
            border: '1px solid rgba(0, 40, 100, 0.12)'
        }}>
            <Box className='container'>
                <Box className='row'>
                    <Box className='col-lg-6 text-center text-lg-left my-auto'>
                        <Box style={{ marginTop: '10px', display: 'inline-flex' }}>
                            <Box>
                                <Typography>
                                    Erketu Technology
                                </Typography>
                            </Box>
                            <Box>
                                <Typography className='text-muted small mb-4 mb-lg-0' style={{ marginLeft: '100px' }}>
                                    All Rights Reserved. &copy; {date.getFullYear()}
                                </Typography>
                            </Box>
                        </Box>
                    </Box>
                </Box>
            </Box>
        </Box >
    )
}

export default Footer
