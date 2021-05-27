export function uniqueHotels(hotels, cb) {
    let uniqueHotelsNames = []
    let uniqueHotels = []
    for (let hotel of hotels) {
        if (uniqueHotelsNames.indexOf(hotel.name) === -1) {
            uniqueHotelsNames.push(hotel.name)
            uniqueHotels.push(hotel)
        }
         else {
            cb()
        }
    }
    return uniqueHotels
}

export function hotelNameTrancate(hotelName) {
    const maxLength = 21
    return hotelName.length <= maxLength ? hotelName : hotelName.slice(0, maxLength) + '...'
}
