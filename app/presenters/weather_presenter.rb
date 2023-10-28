# frozen_string_literal: true
class WeatherPresenter

  def initialize(data)
    @data = data
  end

  def nice_weather?
    weather_condition == 'Sunny' || weather_condition == 'Partly cloudy'
  end

  def location_name
    @data['location']['name']
  end

  def weather_condition
    @data['current']['condition']['text']
  end

  def weather_icon
    @data['current']['condition']['icon']
  end

  def temperature
    @data['current']['temp_c']
  end

  def good_to_read_outside?
    nice_weather? && temperature > 15
  end

  def encourage_text
    if good_to_read_outside?
      'You can go for the walk!'
    else
      "Maybe it's better to read a book or watch a movie!"
    end
  end

end
