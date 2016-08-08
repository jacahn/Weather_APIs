class Forecast
  attr_reader :temp_f, :weather, :icon, :city, :state
  def initialize(city, state)
    url ="http://api.wunderground.com/api/#{ENV["wunderground_api_key"]}/conditions/q/#{state}/#{city}.json"
    # this gem makes the request for us
    response = HTTParty.get(url)
    @temp_f = response["current_observation"]["temp_f"]
    @icon = response["current_observation"]["icon_url"]
    @weather = response["current_observation"]["weather"]
    @city = city
    @state = state
  end
end
