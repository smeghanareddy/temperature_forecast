require 'uri'
require 'net/http'
class WeatherService
    
  def self.call(latitude, longitude) 
    url = "https://api.openweathermap.org/data/2.5/weather?lat=#{latitude}&lon=#{longitude}&units=imperial&appid=4d06fc2854e61724b6ed8eab3d811cfb"
    uri = URI(url)
    res = Net::HTTP.get_response(uri)

    body = JSON.parse(res.body)
    body or raise IOError.new "OpenWeather response body failed"
    body["main"] or raise IOError.new "OpenWeather main section is missing"
    body["main"]["temp"] or raise IOError.new "OpenWeather temperature is missing"
    body["main"]["temp_min"] or raise IOError.new "OpenWeather temperature minimum is missing"
    body["main"]["temp_max"] or raise IOError.new "OpenWeather temperature maximum is missing"
    body["weather"] or raise IOError.new "OpenWeather weather section is missing"
    body["weather"].length > 0 or raise IOError.new "OpenWeather weather section is empty"
    body["weather"][0]["description"] or raise IOError.new "OpenWeather weather description is missing"

    weather = OpenStruct.new
    weather.temperature = body["main"]["temp"]
    weather.temperature_min = body["main"]["temp_min"]
    weather.temperature_max = body["main"]["temp_max"]
    weather.humidity = body["main"]["humidity"]
    weather.pressure = body["main"]["pressure"]
    weather.description = body["weather"][0]["description"]
    weather
  end
    
end