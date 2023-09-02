# README

This README would normally document whatever steps are necessary to get the
application up and running.

**Things that are covered

1. Accept an address as input
2. Retrieve forecast data for the given address. This should include, at minimum, the current temperature (Bonus points - Retrieve high/low and/or extended forecast)
3. Display the requested forecast details to the user
4. Cache the forecast details for 30 minutes for all subsequent requests by zip codes. Display indicator if result is pulled from cache.

Few Address details
1. 189 chambers st, new york
2. 123 239th Way SE, Sammamish, Washington, 98074
3. 85021, Phoenix, AZ, USA
4. Mays Landing Rd, Mays Landing, New Jersey, 08330
5. 112 Ouklip Rd, Wilro Park

Basic Code related information
1. In this project, we are using geocoder services to convert full address into latitude, longitude, country code and zip code
2. We are also using openWeather API for accessing the weather information through latitude and logitude
    https://api.openweathermap.org/data/2.5/weather?lat=#{latitude}&lon=#{longitude}&units=imperial&appid=#{api_key}
3. For using openWeather API we need to generate api key
3. We need to enable cache to forecast 30 minutes for all subsequent requests by zip codes.(run rails dev:cache)
4. We need to display the true if it is cached else false

Commands need to run
rails dev:cache #for enabling cache
rails test:all # for unit testing



