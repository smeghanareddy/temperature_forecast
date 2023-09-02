class ForecastController < ApplicationController

  def show
    session[:address] = params[:address]
    @address = params[:address]

    if params[:address]
      begin
        address = params[:address]

        # Converting full address details to Latitude & Longitude
        geocode = GeocodeService.call(address)
        weather_cache_key = "#{geocode.country_code}/#{geocode.postal_code}"
        @weather_cache_exist = Rails.cache.exist?(weather_cache_key)

        #Cache the forecast details for 30 minutes and forecasting weather details
        @weather = Rails.cache.fetch(weather_cache_key, expires_in: 30.minutes) do
          WeatherService.call(geocode.latitude, geocode.longitude)
        end
      rescue => e
        flash.alert = e.message
      end
    end
  end
end
