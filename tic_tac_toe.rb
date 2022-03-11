puts "Lets play a game of Tic-Tac-Toe!"

def assign_name(number)
    puts "Please enter player #{number}'s name."
    gets
end
def assign_symbol(number)
    puts "Please enter player #{number}'s symbol (e.g o or x)."
    gets
end

def example_grid
    puts "The board will be displayed as follows, please choose your selection by entering its corresponding number."
    num_grid = [["1", "|", "2", "|", "3"],["4", "|", "5", "|", "6"],["7", "|", "8", "|", "9"]]
    puts num_grid[0].join, num_grid[1].join, num_grid[2].join
end

class Game
    def initialize(name, symbol)
        @name = name
        @symbol = symbol
    end
    
    @@grid = [["-", "-", "-"],["-", "-", "-"],["-", "-", "-"]]
    puts @@grid[0].join("|"), @@grid[1].join("|"), @@grid[2].join("|")

    def play_round(number, symbol)
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

end  
player_one = Game.new(assign_name(1), assign_symbol(1))
player_two = Game.new(assign_name(2), assign_symbol(2))

example_grid()

player_one.play_round(2, "x")
