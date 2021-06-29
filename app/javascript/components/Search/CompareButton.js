import React from 'react';
import Box from '@material-ui/core/Box';
import Button from '@material-ui/core/Button';
import DeleteIcon from '@material-ui/icons/Delete';
import { Divider } from '@material-ui/core';
import { Link } from '@material-ui/core';
import Routes from '../../helpers/routes';
import Typography from "@material-ui/core/Typography";

import useStyles from './Styles';

const CompareButton = (props) => {
    const { compareUrl, onRemoveCompareList } = props

    const classes = useStyles();

    return (
        compareUrl !== '' &&
        <Box className='row' display='flex' flexDirection='row-reverse' style={{ position: 'fixed', zIndex: '99999', bottom: '10%', left: '75%' }}>
            <Button
                variant="contained"
                color="primary"
                className={classes.link}
                size='small'
                className={classes.compareButton}
            >
                <div className={classes.compareButtonBlock}>
                    <div className={classes.compareLinkBlock}>
                        <Link href={Routes.comparePath(compareUrl)} className={classes.compareLink}>
                            <Typography variant="body2">
                                {compareUrl.split(',').length} Compare
                            </Typography>
                        </Link>
                    </div>
                    <Divider orientation="vertical" flexItem />
                    <div className={classes.removeListIconBlock}>
                        <DeleteIcon onClick={() => onRemoveCompareList()} />
                    </div>
                </div>
            </Button>
        </Box>
    )
}

export default CompareButton