require "spec_helper"
require "which_hunt"

RSpec.describe WhichHunt do
  let(:email) { "test@example.com" }
  let(:result_text) do
    "The search party has already recovered the kittens and they're happily back"\
    " at home. Please zip up your code and send it to richard.hart@which.co.uk"
  end

  describe "#find_which" do
    context "200 response" do
      let(:response) do
        VCR.use_cassette "which_hunt" do
          described_class.new(email).find_which
        end
      end

      it "returns search result" do
        expect(response).to eq result_text
      end
    end
  end
end
