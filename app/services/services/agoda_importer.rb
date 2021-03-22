class Services::AgodaImporter
  URL = 'http://affiliateapi7643.agoda.com/affiliateservice/lt_v1'

  def hotel_stats!
    request = json_base

    request[:criteria][:checkInDate] = (Date.current + 1.day).to_s
    request[:criteria][:checkOutDate] = (Date.current + 2.day).to_s

    Hotel.find_in_batches(batch_size: 200).each do |hotels|
      request[:criteria][:hotelId] = hotels.map(&:agoda_hotel_id)

      options = { body: request.to_json, verify: false, timeout: 180, headers: headers }
      response = HTTParty.post(URL, options)

      if response.success?
        parse_response(response, request[:criteria][:checkInDate])
      else
        Rails.logger.error('Agoda', {
          status: response.code,
          message: "Error request body: #{response.body}"
        })
      end
    end
  end

  private

  def parse_response(response, actual_on)
    (response['results'] || []).each do |hotel_result|
      hotel = Hotel.find_by(agoda_hotel_id: hotel_result['hotelId'])

      ActiveRecord::Base.transaction do
        hotel.rates.create(
          partner_id: partner_id,
          roomtype_name: hotel_result['roomtypeName'],
          currency: hotel_result['currency'],
          daily_rate: hotel_result['dailyRate'],
          actual_on: actual_on,
          crossed_out_rate: hotel_result['crossedOutRate'],
          discount_percentage: hotel_result['discountPercentage']
        )
      end
    end
  end

  def headers
    @headers ||= { 'Content-Type': 'application/json', Authorization: Partner.agoda.api_key }
  end

  def json_base
    {
      criteria: {
        additional: {
          currency: 'USD',
          occupancy: {
            numberOfAdult: 2,
            numberOfChildren: 0
          },
          discountOnly: false
        }
      }
    }
  end

  def partner_id
    @partner_id ||= Partner.agoda.id
  end

end