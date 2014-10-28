class NeighborhoodExtractor < Struct.new(:generation, :x, :y)

  def cells
    [ *extract(y - 1), *extract(y), *extract(y + 1) ]
  end

  private

  def extract(row_index)
    group_of_tree(ensure_overlapping(row_index))
  end

  def ensure_overlapping(index)
    if index < 0
      generation.size - 1
    elsif index == generation.size
      0
    else
      index
    end
  end

  def group_of_tree(row_index)
    row = generation[row_index]
    if x == 0
      [row[-1], *row[x..x+1] ]
    elsif x == generation.first.size - 1
      [*row[x-1..x], row[0]]
    else
      row[x-1..x+1]
    end
  end

end
