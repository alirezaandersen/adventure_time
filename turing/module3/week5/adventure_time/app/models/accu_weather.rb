class AccuWeather

  def self.service
    AccuWeatherService.new
  end

  def five_day_forecast(lat_long)

  end
  # get location key
# http://dataservice.accuweather.com/
# GET /locations/v1/cities/geoposition/search?apikey=AlmUewQ7UAizJz2JMSZhbjYkOq3K7H9j&q=39.9015%2C-104.9407 HTTP/1.1
# lat/long with a %2c between

# this will return a location id. known as key
# {
#   "Version": 1,
#   "Key": "347776",
#   "Type": "City",
#   "Rank": 45,
#   "LocalizedName": "Thornton",
#   "EnglishName": "Thornton",
#   "PrimaryPostalCode": "80229",
#   "Region": {
#     "ID": "NAM",
#     "LocalizedName": "North America",
#     "EnglishName": "North America"
#   },

# once you get the key you need to make the call to get the forecast like this
 # /forecasts/v1/daily/5day/347776?apikey=AlmUewQ7UAizJz2JMSZhbjYkOq3K7H9j HTTP/1.1
 # after the 5day/Location Key = 3477776?
 #this will return a forecast for 5 days like below
#
#  I will need to extract the DailyForecasts Maximum and Minimum temps
# {
#   "Headline": {
#     "EffectiveDate": "2016-06-13T14:00:00-06:00",
#     "EffectiveEpochDate": 1465848000,
#     "Severity": 2,
#     "Text": "Thunderstorms, some severe, Monday afternoon through Monday evening",
#     "Category": "thunderstorm",
#     "EndDate": "2016-06-14T02:00:00-06:00",
#     "EndEpochDate": 1465891200,
#     "MobileLink": "http://m.accuweather.com/en/us/thornton-co/80229/extended-weather-forecast/347776?lang=en-us",
#     "Link": "http://www.accuweather.com/en/us/thornton-co/80229/daily-weather-forecast/347776?lang=en-us"
#   },
#   "DailyForecasts": [
#     {
#       "Date": "2016-06-11T07:00:00-06:00",
#       "EpochDate": 1465650000,
#       "Temperature": {
#         "Minimum": {
#           "Value": 60,
#           "Unit": "F",
#           "UnitType": 18
#         },
#         "Maximum": {
#           "Value": 91,
#           "Unit": "F",
#           "UnitType": 18
#         }
#       },
#       "Day": {
#         "Icon": 4,
#         "IconPhrase": "Intermittent clouds"
#       },
#       "Night": {
#         "Icon": 38,
#         "IconPhrase": "Mostly cloudy"
#       },
#       "Sources": [
#         "AccuWeather"
#       ],
#       "MobileLink": "http://m.accuweather.com/en/us/thornton-co/80229/daily-weather-forecast/347776?day=1&lang=en-us",
#       "Link": "http://www.accuweather.com/en/us/thornton-co/80229/daily-weather-forecast/347776?day=1&lang=en-us"
#     },
end
