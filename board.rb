# board.rb
require_relative 'cells'

class Board
  def initialize(rows, cols)
    @rows = rows
    @cols = cols
    @board = Array.new(@rows) { Array.new(@cols) { Cell.new } }
  end

  def randomize
    @board.each do |row|
        row.each do |cell|
            cell.alive = [true, false].sample  
        end
    end
  end

  def display
    @board.each do |row|
        row.each do |cell|
            print cell
        end
        puts
    end
  end

  def next
    next_board = Array.new(@rows) { Array.new(@cols) { Cell.new } }
    @board.each_with_index do |row, i|
        row.each_with_index do |cell, j|
            live_neighbors = number_of_neighbors(i, j)
            
            if cell.alive
                if live_neighbors < 2 || live_neighbors > 3
                    next_board[i][j].alive = false
                else
                    next_board[i][j].alive = true
                end
            elsif live_neighbors == 3
                next_board[i][j].alive = true
            end
        end
    end

    @board = next_board
  end

  private

  def number_of_neighbors(row, col)
    neighbors = 0

    (row - 1..row + 1).each do |i|
        (col - 1..col + 1).each do |j|
            next if i < 0 || i >= @rows || j < 0 || j >= @cols || (i == row && j == col)
            neighbors += 1 if @board[i][j].alive
        end
    end

    neighbors
  end
end