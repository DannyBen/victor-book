require 'victor'
require 'debug'

class Grid < Victor::SVG

  attr_reader :cols, :rows, :cell_size, :width, :height, :colors

  def initialize(cols, rows, cell_size: 20)
    @cell_size = cell_size
    @cols = cols
    @rows = rows
    @width = cols * cell_size
    @height = rows * cell_size
    @colors = ['#FF6961', '#77DD77', '#FFD700']

    super viewBox: "0 0 #{width} #{height}"
    generate_grid
  end

private

  def generate_grid
    css['.cell'] = { stroke: :white, rx: (cell_size * 0.1).round }

    cols.times do |col|
      rows.times do |row|
        x = col * cell_size
        y = row * cell_size
        rect class: 'cell', x: x, y: y,
          width: cell_size, height: cell_size,
          fill: colors.sample
      end
    end
  end
end

grid = Grid.new 6, 2
puts grid
grid.save 'grid'
