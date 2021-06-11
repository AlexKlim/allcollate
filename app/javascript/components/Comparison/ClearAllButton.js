import React from 'react'
import { Link } from '@material-ui/core';
import { useComparisonContext } from './ComparisonProvider';

function ClearAllButton() {
    const { setHotels } = useComparisonContext()

    const onClearAll = () => {
        setHotels([])
    }
    return (
        // <Box className="input-group-btn suggestion-input__btn-search">
            <Link
                className="suggestion-input__btn-search-input"
                component="button"
                variant="body2"
                onClick={() => onClearAll()}
            >
                Clear all
            </Link>
        // </Box>
    )
}

export default ClearAllButton