import React, { useState } from 'react';
import Snackbar from '@material-ui/core/Snackbar';
import Alert from '@material-ui/lab/Alert';

import useStyles from './Styles';

function FlashMessage({ message }) {
  const classes = useStyles();

  const [open, setOpen] = useState(true);

  const handleClose = (event, reason) => {
    if (reason === 'clickaway') {
      return;
    }

    setOpen(false);
  };

  return (
    <div className={classes.root}>
      <Snackbar open={open} autoHideDuration={10000} onClose={handleClose} anchorOrigin={{ vertical: 'top', horizontal: 'center' }} >
        <Alert severity="success" variant="filled" onClose={handleClose}>
          { message }
        </Alert>
      </Snackbar>
    </div>
  );
}

export default FlashMessage;
