require 'httparty'

class GetData
  include HTTParty
  base_uri 'which-technical-exercise.herokuapp.com'

  attr_reader :email

  def initialize(email)
    @email = email
  end

  def directions
    dir = self.class.get("/api/#{@email}/directions")
    dir.parsed_response['directions']
  end

  def location(x, y)
    loc = self.class.get("/api/#{@email}/location/#{x}/#{y}")
    loc.parsed_response['message']
  end
end
