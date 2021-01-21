require 'spec_helper'
require 'get_data'
require 'pry'

RSpec.describe GetData do

  subject(:get_data) { described_class.new(email) }

  let(:email) { 'test@example.com' }
  let(:result_text) do
    "The search party has already recovered the kittens and they're happily back"\
    " at home. Please zip up your code and send it to richard.hart@which.co.uk"
  end

  describe '#directions' do
    context '200 response' do
      let(:response) do
        VCR.use_cassette 'get_directions' do
          get_data.directions
        end
      end

      it 'returns array of data' do
        expect(response).to be_an_instance_of(Array)
      end
    end
  end


  describe '#location' do
    context '200 response' do
      let(:response) do
        VCR.use_cassette 'get_location' do
          get_data.location(5,2)
        end
      end

      it 'returns search result' do
        expect(response).to eq result_text
      end
    end
  end
end
