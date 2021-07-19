import React from 'react';
import Card from '@material-ui/core/Card';
import { red } from '@material-ui/core/colors';
import Typography from '@material-ui/core/Typography';
import { Box } from '@material-ui/core';
import { useStyles } from './Styles';

export default function HotelCard(props) {
    const classes = useStyles();
    const { picture } = props

    return (
        <Box className='col-lg-4' style={{ marginTop: '70px' }}>
            <Box className='features-icons-item mx-auto mb-5.mb-lg-0 mb-lg-3'>
                <Box className='features-icons-icon d-flex'>
                    <Card className={classes.root} style={{
                        width: '234px',
                        height: '220px',
                        borderRadius: '4px',
                        background: `url(${picture})`
                    }}>
                        <div className={classes.hotelNameContainer}>
                            <Typography align='center'>
                                Hotel Name
                            </Typography>
                        </div>
                        <div className={classes.hotelCurrentDateContainer}>
                            <Typography align='center'>
                                50$
                            </Typography>
                        </div>
                    </Card>
                </Box>
            </Box>
        </Box>
    );
}
