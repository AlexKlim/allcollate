import React, { useEffect } from 'react';
import Button from '@material-ui/core/Button';
import Snackbar from '@material-ui/core/Snackbar';
import MuiAlert from '@material-ui/lab/Alert';
import { makeStyles } from '@material-ui/core/styles';
import Box from '@material-ui/core/Box';
import { useComparisonContext } from './ComparisonProvider';

const Alert = (props) => {
  return <MuiAlert elevation={6} variant="filled" {...props} />;
}

const useStyles = makeStyles((theme) => ({
  root: {
    width: '100%',
    '& > * + *': {
      marginTop: theme.spacing(2),
    },
    zIndex: '999999999999'
  },
}));

export default function Notification() {

    const {notificationOn, setNotificationOn} = useComparisonContext()

  const classes = useStyles();
  const [open, setOpen] = React.useState(false);

  useEffect(() => {
    if (notificationOn) {
    setOpen(true);
    }
  }, [
      notificationOn
  ])

  const handleClose = (event, reason) => {
    if (reason === 'clickaway') {
      return;
    }
    setNotificationOn(false)
    setOpen(false);
  };

  return (
    <Box className={classes.root}>
      <Snackbar open={open} autoHideDuration={4000} onClose={handleClose}>
        <Alert onClose={handleClose} severity="info">
          Hotel is already in the list!
        </Alert>
      </Snackbar>
    </Box>
  );
}