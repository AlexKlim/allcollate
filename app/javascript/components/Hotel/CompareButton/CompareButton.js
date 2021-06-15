import * as React from "react";
import Button from '@material-ui/core/Button';

function CompareButton() {
    return (
        <div className="page-subheader">
            <Button variant="contained" color="primary" size="medium" disableElevation>
                Compare
            </Button>
        </div>
    );
}

export default CompareButton;
