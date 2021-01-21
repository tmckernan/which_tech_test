require_relative 'get_data'
require_relative 'location'
require_relative 'directions'

class WhichHunt
  attr_reader :data

  def initialize(email)
    @data = GetData.new(email)
  end

  def find_which
    find_location
    data.location(find_location[0], find_location[1])
  end

  private

  def get_directions
    Directions.new(data.directions).update_directions
  end

  def find_location
    Location.new(get_directions).return_coordinates
  end
end

