import * as React from "react";
import Button from '@material-ui/core/Button';
import { Redirect } from "react-router-dom";

function CompareButton(props) {
    const {slug} = props

    return (
        <div className="page-subheader">
            <Button variant="contained" color="primary" href={`/comparisons?hotels=${slug}`} size="medium">
                Compare
            </Button>
        </div>
    );
}

export default CompareButton;
