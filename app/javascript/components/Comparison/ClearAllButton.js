import React from 'react'
import { Link } from '@material-ui/core';
import { useComparisonContext } from './ComparisonProvider';

function ClearAllButton() {
    const { setHotels } = useComparisonContext()

    const onClearAll = () => {
        setHotels([])
    }
    return (
            <Link
                className="suggestion-input__btn-search-input"
                component="button"
                variant="body2"
                onClick={() => onClearAll()}
            >
                Clear all
            </Link>
    )
}

export default ClearAllButton