import React, { useEffect } from 'react';
import { Snackbar, Box, makeStyles } from '@material-ui/core';
import MuiAlert from '@material-ui/lab/Alert';
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
    zIndex: '9999'
  }
}));

export default function Notification({ text }) {
  const { notificationOn, setNotificationOn } = useComparisonContext()
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
      <Snackbar
        open={open} autoHideDuration={4000} onClose={handleClose}
        anchorOrigin={{ vertical: 'top', horizontal: 'center' }}
      >
        <Alert onClose={handleClose} severity="info">
          {text}
        </Alert>
      </Snackbar>
    </Box>
  );
}