# main.rb
require_relative 'board'

def clear_console
  print "\e[H\e[2J" # Clears the console screen
end

# Create a new board with 10 rows and 10 columns
board = Board.new(10, 10)

# Randomize the initial state of the board
board.randomize

loop.with_index do |_, i|
  clear_console
  puts "Generation: #{i}"
  board.next
  board.display

  sleep 1
end
