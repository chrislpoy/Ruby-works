# Define the maze class
class Maze
    attr_reader :rows, :cols, :player_row, :player_col
  
    def initialize(rows, cols)
      @rows = rows
      @cols = cols
      @player_row = rand(rows)
      @player_col = rand(cols)
      @maze = Array.new(rows) { Array.new(cols, ' ') }
      @maze[@player_row][@player_col] = 'P'
      generate_obstacles
      generate_treasures
    end
  
    def generate_obstacles
      num_obstacles = rows * cols / 5
      num_obstacles.times do
        row, col = rand(rows), rand(cols)
        @maze[row][col] = 'X'
      end
    end
  
    def generate_treasures
      num_treasures = rows * cols / 10
      num_treasures.times do
        row, col = rand(rows), rand(cols)
        @maze[row][col] = '$'
      end
    end
  
    def move(direction)
      case direction
      when 'w'
        @player_row -= 1 if @player_row > 0
      when 's'
        @player_row += 1 if @player_row < rows - 1
      when 'a'
        @player_col -= 1 if @player_col > 0
      when 'd'
        @player_col += 1 if @player_col < cols - 1
      end
    end
  
    def display
      system("clear") || system("cls")
      @maze.each { |row| puts row.join(' ') }
    end
  
    def play
      loop do
        display
        puts "Use WASD to move, or 'q' to quit"
        print "Enter your move: "
        direction = gets.chomp.downcase
        break if direction == 'q'
        move(direction)
      end
      puts "Thanks for playing!"
    end
  end
  
  # Create a maze and play the game
  maze = Maze.new(10, 20)
  maze.play
  