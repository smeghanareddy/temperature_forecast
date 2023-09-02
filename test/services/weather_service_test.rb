require 'test_helper'

class WeatherServiceTest < ActiveSupport::TestCase

  test "1.call with known parameters" do
    latitude = 41.5074325
    longitude = -74.0117016
    weather = WeatherService.call(latitude, longitude)
    assert_includes -4..84, weather.temperature
    assert_includes -4..84, weather.temperature_min
    assert_includes -4..84, weather.temperature_max
    assert_includes 0..100, weather.humidity
    assert_includes 900..1100, weather.pressure
    refute_empty weather.description
  end

  test "2. call with known parameters" do
    latitude = 33.562020316117525
    longitude = -112.09313347890625
    weather = WeatherService.call(latitude, longitude)
    assert_includes -4..84, weather.temperature
    assert_includes -4..84, weather.temperature_min
    assert_includes -4..84, weather.temperature_max
    assert_includes 0..100, weather.humidity
    assert_includes 900..1100, weather.pressure
    refute_empty weather.description
  end

end