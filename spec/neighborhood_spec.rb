require './app/neighborhood.rb'

describe Neighborhood do

  describe '#next_state' do

    let(:alive)       { [1, 1, 1, 0, 0, 0, 0, 0, 0] }
    let(:dead)        { [0, 0, 1, 0, 0, 0, 0, 0, 0] }
    let(:dead2)       { [1, 1, 1, 1, 1, 1, 1, 1, 1] }
    let(:dead3)       { [0, 0, 0, 0, 0, 0, 0, 0, 0] }
    let(:status_quo1) { [1, 1, 1, 1, 0, 0, 0, 0, 0] }
    let(:status_quo2) { [0, 1, 1, 1, 1, 0, 0, 0, 0] }

    it 'returns 1 when it will be alive' do
      neighborhood = Neighborhood.new(alive)
      expect(neighborhood.next_state).to eq 1
    end

    it 'returns 0 when it will be dead' do
      [dead, dead2, dead3].each do |cells|
        neighborhood = Neighborhood.new(cells)
        expect(neighborhood.next_state).to eq 0
      end
    end

    it 'returns old state in other cases' do
      neighborhood = Neighborhood.new(status_quo1)
      expect(neighborhood.next_state).to eq 0

      neighborhood = Neighborhood.new(status_quo2)
      expect(neighborhood.next_state).to eq 1
    end
  end

end
