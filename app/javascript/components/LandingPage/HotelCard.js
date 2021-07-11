import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Card from '@material-ui/core/Card';
import { red } from '@material-ui/core/colors';
import Typography from '@material-ui/core/Typography';
import { Box } from '@material-ui/core';

const useStyles = makeStyles((theme) => ({
    root: {
        maxWidth: 345,
    },
    media: {
        height: 0,
        paddingTop: '56.25%',
    },
    expand: {
        transform: 'rotate(0deg)',
        marginLeft: 'auto',
        transition: theme.transitions.create('transform', {
            duration: theme.transitions.duration.shortest,
        }),
    },
    expandOpen: {
        transform: 'rotate(180deg)',
    },
    avatar: {
        backgroundColor: red[500],
    },
}));


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
                        <div style={{
                            width: '234px',
                            height: '45px',
                            background: 'rgba(92, 115, 194, 0.9)',

                            fontFamily: 'Roboto',
                            fontStyle: 'normal',
                            fontWeight: 'normal',
                            fontSize: '20px',
                            lineHeight: '23px',
                            display: 'flex',
                            alignItems: 'center',
                            textAlign: 'center',
                            justifyContent: 'center',

                            color: '#FFFFFF'
                        }}>
                            <Typography align='center'>
                                Hotel Name
                            </Typography>
                        </div>
                        <div style={{
                            width: '45px',
                            height: '45px',
                            marginLeft: '189px',
                            marginTop: '130px',
                            background: 'rgba(92, 115, 194, 0.9)',
                            borderTopLeftRadius: '4px',
                            borderBottomRightRadius: '4px',

                            fontStyle: 'normal',
                            fontWeight: 'normal',
                            fontSize: '18px',
                            lineHeight: '21px',
                            display: 'flex',
                            alignItems: 'center',
                            textAlign: 'center',
                            justifyContent: 'center',

                            color: '#FFFFFF'
                        }}>
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
