class Neighborhood

  ALIVE = 3
  STATUS_QUO = 4

  def initialize(cells)
    @subject = cells[4]
    @sum = cells.reduce(:+)
  end

  def next_state
    case @sum
    when ALIVE then 1
    when STATUS_QUO then @subject
    else
      0
    end
  end
end
