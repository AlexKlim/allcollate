import * as React from "react";
import Button from '@material-ui/core/Button';
import Routes from '../../../helpers/routes';
import { useStyles } from './styles'

function CompareButton(props) {
  const classes = useStyles()
  const { slug } = props

  return (
    <div className="page-subheader">
      <Button variant="contained" href={Routes.hotelComparePath(slug)} size="medium" className={classes.link}>
        Compare
      </Button>
    </div>
  );
}

export default CompareButton;
