require 'directions'

RSpec.describe Directions do
  let(:array) { [] }
  subject(:directions) { described_class.new(array) }

  describe '#initalize' do
    it 'should start with dir 0' do
      expect(directions.curr_dir).to eq(0)
    end

    it 'should show the array' do
      expect(directions.directions).to eq(array)
    end
  end

  describe '#update_directions' do
    context 'go right only' do
      let(:array) { %w[right] }

      it 'should update the curr direction' do
        directions.update_directions
        expect(directions.curr_dir).to eq(90)
      end
    end

    context 'go left only' do
      let(:array) { %w[left] }

      it 'should update the curr direction' do
        directions.update_directions
        expect(directions.curr_dir).to eq(270)
      end
    end

    context 'go right and left' do
      let(:array) { %w[right left] }

      it 'should update the curr direction' do
        directions.update_directions
        expect(directions.curr_dir).to eq(0)
      end
    end
  end

  describe '#degree_update' do
    context 'doing a full rotation' do
      let(:array) { %w[right right right right] }

      it 'should show the curr direction is 0' do
        directions.update_directions
        expect(directions.curr_dir).to eq(0)
      end
    end

    context 'doing a full rotation + 1' do
      let(:array) { %w[right right right right right] }

      it 'should show the curr direction is 90' do
        directions.update_directions
        expect(directions.curr_dir).to eq(90)
      end
    end

    context 'doing left when facing north' do
      let(:array) { %w[left] }

      it 'should show 270 degrees' do
        directions.update_directions
        expect(directions.curr_dir).to eq(270)
      end
    end
  end

  describe '#dir_with_degrees' do
    context 'having both dir and degrees' do
      let(:array) do
        %w[
          forward
          right
          forward
          forward
          forward
          left
          forward
          forward
          left
        ]
      end

      let(:output) do
        [
          ['forward', 0],
          ['right', 90],
          ['forward', 90],
          ['forward', 90],
          ['forward', 90],
          ['left', 0],
          ['forward', 0],
          ['forward', 0],
          ['left', 270]
        ]
      end

      it 'should show the correct degress and dir' do
        directions.update_directions
        expect(directions.dir_with_degrees).to eq(output)
      end
    end
  end
end
