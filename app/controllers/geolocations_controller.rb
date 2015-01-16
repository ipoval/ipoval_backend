class GeolocationsController < ApplicationController
  def current
    response.header["Access-Control-Allow-Origin"] = "*"
    response.header["Access-Control-Allow-Headers"] = "Origin, X-Requested-With, Content-Type, Accept"

    location = Geocoder.search(params.slice(:latitude, :longitude).values.join(',')).first
    location_str = ''

    city = location.data["address_components"].detect { |tuple| tuple['types'].include?('locality') }
    if city.present?
      location_str << city['long_name']
    end

    state = location.data["address_components"].detect { |tuple| tuple['types'].include?('administrative_area_level_1') }
    if state.present?
      location_str << ', ' if city.present?
      location_str << state['short_name']
    end

    render(json: { location: location_str })
  rescue
    render(json: { location: '' })
  end
end
