export function hotelNameTrancate(hotelName) {
    const maxLength = 21
    return hotelName.length <= maxLength ? hotelName : hotelName.slice(0, maxLength) + '...'
}
