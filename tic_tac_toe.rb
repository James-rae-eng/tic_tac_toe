class User
    attr_reader :name, :symbol, :selections
    def initialize(name, symbol)
        @name = name
        @symbol = symbol
        @selections = []
    end
end

class Grid
    def initialize
        @board = [["-", "-", "-"],["-", "-", "-"],["-", "-", "-"]]
        @winning_combo = [[1,2,3], [4,5,6], [7,8,9], [1,5,9], [3,5,7], [1,4,7], [2,5,8], [3,6,9]]
        @board_positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end

    def example_board
        puts "The board will be displayed as follows, please choose your selection by entering its corresponding number."
        num_grid = [["1", "|", "2", "|", "3"],["4", "|", "5", "|", "6"],["7", "|", "8", "|", "9"]]
        puts num_grid[0].join, num_grid[1].join, num_grid[2].join
    end  

    def update_board(number, symbol)
        #take player selection and apply to board
        if number <= 3
            adjusted = number - 1
            @board[0][adjusted] = symbol
        elsif number > 3 && number <= 6
            adjusted = number - 4
            @board[1][adjusted] = symbol
        elsif number > 6 && number <= 9
            adjusted = number - 7
            @board[2][adjusted] = symbol
        else
            puts "Invalid input"
        end
        @board_positions.delete(number)
        puts @board[0].join("|"), @board[1].join("|"), @board[2].join("|")
    end

    def winning_combo?(user)
        #check if any array from winning_combo becomes empty when user.selections is removed from it
        @winning_combo.any? do |combo|
            (combo - user.selections).empty?
        end
    end

    def board_full?
        @board_positions.empty?
    end

    def valid_selection(selection)
        @board_positions.include?(selection)
    end
end


class Game 
    attr_reader :board

    def initialize
        @board = Grid.new
        @current_user = nil
    end

    def create_user(number)
        puts "Please enter player #{number}'s name."
        name = gets.chomp
        puts "player #{number}, please enter a single character to be your game marker (e.g o or x)."
        while symbol = gets.chomp
            case 
            when symbol == "-" || symbol == ""
                puts "Invalid selection, please choose a different character"
            when symbol.length >= 2
                puts "Please choose a single character"
            when number == 2 && symbol == @user_1.symbol
                puts "player 1 has already chosen that character, please choose again"
            else 
                break
            end
        end
        User.new(name, symbol)
    end

    def play_round(user)
        #take player selection, apply it to board & their selections array
        #then check if game is over and swap player if not
        puts "#{user.name} select your position"
        while @selection = gets.chomp.to_i
            case
            when board.valid_selection(@selection) == false
                puts "invalid selection, please choose again"
            else
                break
            end
        end
        user.selections.push(@selection)
        board.update_board(@selection, user.symbol)
        game_over?()
        if game_over?() == false 
            swap_user()
        end
    end

    def swap_user()
        if @current_user == @user_1
            @current_user = @user_2
        else
            @current_user = @user_1
        end
    end

    def game_over?
        if board.board_full? == true
            true
        elsif board.winning_combo?(@current_user) == true
            true
        else
            false
        end
    end

    def replay_game
        puts "Game over, would you like to play again? Enter y / n"
        choice = gets.chomp.to_s.downcase
        if choice == "y"
            game = Game.new
            game.play
        elsif choice == "n"
            puts "Thanks for playing!"
        else
            puts "Invalid selection"
        end
    end

    def play
        puts "Lets play a game of Tic-Tac-Toe!"
        @user_1 = create_user(1)
        @user_2 = create_user(2)
        board.example_board
        @current_user = [@user_1, @user_2].sample

        while game_over?() == false
            play_round(@current_user)
        end

        if board.board_full? == true
            puts "The board is full, it's a draw!"
        elsif board.winning_combo?(@current_user) == true
            puts "#{@current_user.name} you win!"
        end
        
        replay_game()
    end
end  

game = Game.new
game.play