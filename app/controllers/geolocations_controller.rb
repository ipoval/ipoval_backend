class GeolocationsController < ApplicationController
  def current
    response.header["Access-Control-Allow-Origin"] = "*"
    response.header["Access-Control-Allow-Headers"] = "Origin, X-Requested-With, Content-Type, Accept"

    render(json: { location: 'Irvine, CA' })
  end
end
