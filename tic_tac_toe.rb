class User
    attr_reader :name, :symbol

    def initialize(name, symbol)
        @name = name
        @symbol = symbol
    end
end

class Grid

    def example_board
        puts "The board will be displayed as follows, please choose your selection by entering its corresponding number."
        num_grid = [["1", "|", "2", "|", "3"],["4", "|", "5", "|", "6"],["7", "|", "8", "|", "9"]]
        puts num_grid[0].join, num_grid[1].join, num_grid[2].join
    end

    @@board = [["-", "-", "-"],["-", "-", "-"],["-", "-", "-"]]
    #puts @@board[0].join("|"), @@board[1].join("|"), @@board[2].join("|")

    def update_board(number)
        #take player selection and apply to board
        
    end

end


class Game 
    attr_reader :board

    def initialize
        @board = Grid.new
    end

    def create_user(number)
        puts "Please enter player #{number}'s name."
        name = gets.chomp
        puts "Please enter player #{number}'s symbol (e.g o or x)."
        symbol = gets.chomp
        User.new(name, symbol)
    end


    def play_round(number, symbol)
        #take player selection and apply to board
        #display updated board
        #check if update is game over (and say if it is)
        #loop to next player if not game over
        if number <= 3
            adjusted = number - 1
            @@grid[0][adjusted] = symbol
        elsif number >3 && number <= 6
            adjusted = number - 4
            @@grid[0][adjusted] = symbol
        elsif number > 6 && number <= 9
            adjusted = number - 7
            @@grid[0][adjusted] = symbol
        else
            puts "Invalid input"
        end
        puts @@grid[0].join("|"), @@grid[1].join("|"), @@grid[2].join("|")
        
    
    end

    def play
        puts "Lets play a game of Tic-Tac-Toe!"
        user_1 = create_user(1)
        user_2 = create_user(2)
        board.example_board
        #player (random to start then alternate) make a selection (loop)
        #when game is over (win or board full) display winner
        #Restart game?
    end
end  

game = Game.new
game.play

