import React from 'react'
import { Link } from '@material-ui/core';
import { useComparisonContext } from './ComparisonProvider';

function ClearAllButton() {
	const { setHotels } = useComparisonContext()

	const onClearAll = () => {
		setHotels([])
	}

	return (
		<div style={{ marginLeft: '-3.5px' }}>
			<Link
				component="fragment"
				variant="body2"
				onClick={() => onClearAll()}
			>
				Clear all
			</Link>
		</div>
	)
}

export default ClearAllButton