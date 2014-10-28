require './app/generation.rb'

describe Generation do

  before do
    @width = 4
    @height = 3
    @generation = Generation.new(@width, @height)
  end

  specify { expect(@generation).to respond_to :create }

  describe '#create' do

    it 'returns an array with the right height' do
      expect(@generation.create.size).to eq @height
    end

    it 'returns an array with the right width' do
      expect(@generation.create.first.size).to eq @width
    end

    it 'creates random cells' do
      srand(0)
      expect(@generation.create.first).to eq [0, 1, 1, 0]
    end

  end

end
