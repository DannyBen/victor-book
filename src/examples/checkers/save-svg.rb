require './board'
require './cell'
require './piece'

board = Board.new
board.save 'board'

board = Board.new
[1, 3, 5, 7].each do |col|
  board.add_piece 0, col, dark: true
  board.add_piece 6, col, dark: false
end

[0, 2, 4, 6].each do |col|
  board.add_piece 1, col, dark: true
  board.add_piece 7, col, dark: false
end
board.save 'filled-board'
