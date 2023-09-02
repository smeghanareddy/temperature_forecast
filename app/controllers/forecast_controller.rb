class ForecastController < ApplicationController

  def show
    session[:address] = params[:address]
    @address = params[:address]

    if params[:address]
      begin
        address = params[:address]
        geocode = GeocodeService.call(address)

        @weather = WeatherService.call(geocode.latitude, geocode.longitude)      
        
      rescue => e
        flash.alert = e.message
      end
    end
  end
end
