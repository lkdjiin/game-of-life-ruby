class Canvas

  SCALE = 4

  def initialize
    @canvas  = `document.getElementById('canvas')`
    @context = `#@canvas.getContext('2d')`
    @height  = `#@canvas.height`
    @width   = `#@canvas.width`
  end

  def clear
    draw_rect(0, 0, @width, @height, 'black')
  end

  def pixel(x, y)
    draw_rect(x * SCALE, y * SCALE, SCALE, SCALE, 'white')
  end

  private

  def draw_rect(x, y, w, h, color)
    `#@context.fillStyle = #{color}`
    `#@context.fillRect(#{x}, #{y}, #{w}, #{h})`
  end

end
