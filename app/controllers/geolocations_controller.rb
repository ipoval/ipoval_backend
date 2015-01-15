class GeolocationsController < ApplicationController
  def current
    render(json: { location: 'Irvine, CA' })
  end
end
