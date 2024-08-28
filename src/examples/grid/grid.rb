require 'victor'
require 'debug'

class Grid
  include Victor

  attr_reader :cols, :rows, :cell_size, :width, :height, :colors

  def initialize(cols, rows, cell_size: 20)
    @cell_size = cell_size
    @cols = cols
    @rows = rows
    @width = cols * cell_size
    @height = rows * cell_size
    @colors = ['#FF6961', '#77DD77', '#FFD700']
  end

  def svg = @svg ||= svg!
  def save(path) = svg.save(path)
  def to_s = svg.render

private

  def svg!
    svg = SVG.new viewBox: "0 0 #{width} #{height}"
    svg.css['.cell'] = { stroke: :white, rx: (cell_size * 0.1).round }

    cols.times do |col|
      rows.times do |row|
        x = col * cell_size
        y = row * cell_size
        svg.rect class: 'cell', x: x, y: y,
          width: cell_size, height: cell_size,
          fill: colors.sample
      end
    end

    svg
  end
end

grid = Grid.new 8, 3
puts grid
grid.save 'grid'
