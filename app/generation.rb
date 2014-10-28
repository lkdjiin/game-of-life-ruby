class Generation

  def initialize(width, height)
    @height = height
    @width = width
  end

  def create
    Array.new(@height) { Array.new(@width) { rand(2) } }
  end
end
