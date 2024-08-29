class WeatherService
  include HTTParty
  base_uri 'api.openweathermap.org/data/2.5'

  def initialize(api_key)
    @api_key = api_key
  end

  def current_weather(location)
    options = { query: { q: location, appid: @api_key, units: 'metric' } }
    self.class.get('/weather', options)
  end
end
