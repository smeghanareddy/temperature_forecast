require 'test_helper'

class GeocodeServiceTest < ActiveSupport::TestCase

  test "1.call with known address" do
    address = "189 chambers st, new york"
    geocode = GeocodeService.call(address)
    assert_in_delta 41.5074325, geocode.latitude, 0.1
    assert_in_delta -74.0117016, geocode.longitude, 0.1
    assert_equal "us", geocode.country_code
    assert_equal "12550", geocode.postal_code
  end

  test "2.call with known address" do
    address = "85021, Phoenix, AZ, USA"
    geocode = GeocodeService.call(address)
    assert_in_delta 33.562020316117525, geocode.latitude, 0.1
    assert_in_delta -112.09313347890625, geocode.longitude, 0.1
    assert_equal "us", geocode.country_code
    assert_equal "85021", geocode.postal_code
  end

end