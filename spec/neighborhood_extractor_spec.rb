require './app/neighborhood_extractor.rb'

describe NeighborhoodExtractor do

  let(:generation) do
    [
      [0, 1, 0, 1],
      [1, 0, 1, 0],
      [0, 1, 1, 0]
    ]
  end

  it 'returns 9 cells' do
    x, y = 1, 1
    extractor = NeighborhoodExtractor.new(generation, x, y)
    expect(extractor.cells.size).to eq 9
  end

  describe 'inner position' do
    specify 'x=1 y=1' do
      extractor = NeighborhoodExtractor.new(generation, 1, 1)
      expect(extractor.cells).to eq [0, 1, 0, 1, 0, 1, 0, 1, 1]
    end
  end

  describe 'borders' do
    specify 'x=1 y=0' do
      extractor = NeighborhoodExtractor.new(generation, 1, 0)
      expect(extractor.cells).to eq [0, 1, 1, 0, 1, 0, 1, 0, 1]
    end

    specify 'x=2 y=2' do
      extractor = NeighborhoodExtractor.new(generation, 2, 2)
      expect(extractor.cells).to eq [0, 1, 0, 1, 1, 0, 1, 0, 1]
    end

    specify 'x=0 y=1' do
      extractor = NeighborhoodExtractor.new(generation, 0, 1)
      expect(extractor.cells).to eq [1, 0, 1, 0, 1, 0, 0, 0, 1]
    end

    specify 'x=3 y=1' do
      extractor = NeighborhoodExtractor.new(generation, 3, 1)
      expect(extractor.cells).to eq [0, 1, 0, 1, 0, 1, 1, 0, 0]
    end

  end
end
