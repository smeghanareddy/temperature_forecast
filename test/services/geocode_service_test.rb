require 'test_helper'

class GeocodeServiceTest < ActiveSupport::TestCase

  test "call with known address" do
    address = "189 chambers st, new york"
    geocode = GeocodeService.call(address)
    assert_in_delta 41.5074325, geocode.latitude, 0.1
    assert_in_delta -74.0117016, geocode.longitude, 0.1
    assert_equal "us", geocode.country_code
    assert_equal "12550", geocode.postal_code
  end

end