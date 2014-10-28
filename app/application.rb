require 'opal'
require 'canvas'
require 'generation'
require 'neighborhood'
require 'neighborhood_extractor'
require 'kernel'

class Game

  def initialize(generation, canvas, iteration)
    @iteration = iteration
    @height = generation.size
    @width = generation.first.size
    @generation = generation
    @canvas = canvas
  end

  def start
    draw
    @iteration -= 1
    if @iteration > 0
      update
      after_ms(500) { start }
    end
  end

  def draw
    @canvas.clear
    @generation.each_with_index do |line, y|
      line.each_with_index do |cell, x|
        @canvas.pixel(x, y) if cell == 1
      end
    end
  end

  def update
    temp = (0...@height).map do |y|
      (0...@width).map do |x|
        extractor = NeighborhoodExtractor.new(@generation, x, y)
        Neighborhood.new(extractor.cells).next_state
      end
    end
    @generation = temp
  end

end

canvas = Canvas.new
generation = Generation.new(100, 100).create
iteration = 100
game = Game.new(generation, canvas, iteration)
game.start
