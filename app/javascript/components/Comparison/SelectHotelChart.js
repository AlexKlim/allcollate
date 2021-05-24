import React from 'react'
import Button from '@material-ui/core/Button';
import Menu from '@material-ui/core/Menu';
import MenuItem from '@material-ui/core/MenuItem';
import { useComparisonContext } from './ComparisonProvider';
import Box from '@material-ui/core/Box';

export default function SelectHotelChart() {

    const {hotels, currentHotel, setCurrentHotel} = useComparisonContext()

    const [anchorEl, setAnchorEl] = React.useState(null);

    const handleClick = (event) => {
        setAnchorEl(event.currentTarget);
    };

    const onSelect = (hotel) => {
        setCurrentHotel(hotel)
        setAnchorEl(null);
    };

    const onClose = () => {
        setAnchorEl(null)
    }

    return (
        <Box>
            <Button aria-controls="simple-menu" aria-haspopup="true" onClick={handleClick}>
                {currentHotel ? currentHotel.name : 'Select Hotel'}
          </Button>
            <Menu
                id="simple-menu"
                anchorEl={anchorEl}
                keepMounted
                open={Boolean(anchorEl)}
                onClose={() => onClose}
            >
                {
                    hotels.map((hotel, i) => {
                        return (
                            <MenuItem onClick={() => onSelect(hotel)} key={i}>{hotel.name}</MenuItem>
                        )
                    })
                }
            </Menu>
        </Box>
    )
}