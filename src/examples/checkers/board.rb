require 'victor'

class Board < Victor::Component
  
  # Since all components provide Width and height, we can use these properties
  # to calculate this component's dimensions dynamically.
  def width = @width ||= (cell_width * 8) + (board_margin * 2)
  def height = @height ||= (cell_height * 8) + (board_margin * 2)

  # Separate the SVG generation to logical units.
  def body
    add_frame
    add_cells
    add_pieces
  end

  # Provide a public interface for consumers to add pieces after creating 
  # the board instance. Note that once the component was rendered, its SVG
  # is frozen - meaning this method must be called before rendering.
  # For this reason, we only remember the added pieces in an array for later
  # use.
  def add_piece(row, col, dark: false)
    piece = Piece.new dark: dark,
      x: col * cell_width + board_margin + 10,
      y: row * cell_height + board_margin + 10
    
    pieces.push piece
  end

  def style
    {
      '.board-frame': {
        fill: '#d1bfa7',
        stroke: '#6a3f2b'
      },
      '.inner-frame': {
        fill: '#6a3f2b',
        stroke: '#6a3f2b',
        stroke_width: (board_margin * 0.7).round
      },
    }
  end

private

  def board_margin = @board_margin ||= 50
  def cell_width = @cell_width ||= sample_cell.width
  def cell_height = @cell_height ||= sample_cell.height
  def sample_cell = @sample_cell ||= Cell.new

  def pieces = @pieces ||= []

  # Add a double-rectangle board frame
  def add_frame
    add.rect class: 'board-frame', x: 0, y: 0, width: width, height: height
    add.rect class: 'inner-frame', x: board_margin, y: board_margin,
      width: width - (board_margin * 2),
      height: height - (board_margin * 2)
  end

  # Create the 8x8 grid.
  def add_cells
    8.times do |row|
      dark = row.even?
      8.times do |col|
        cell = Cell.new dark: dark,
          x: col * cell_width + board_margin,
          y: row * cell_height + board_margin

        embed cell
        dark = !dark
      end
    end
  end

  # Add all pieces as requested by #add_piece
  def add_pieces
    pieces.each { |piece| embed piece }
  end
end
