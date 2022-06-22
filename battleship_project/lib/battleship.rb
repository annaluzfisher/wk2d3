require_relative "board"
require_relative "player"

class Battleship
attr_reader :player , :board

    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = n*n / 2
    end

    def start_game
        @board.place_random_ships
        puts @board.num_ships
        @board.print
    end

    def lose?
        if @remaining_misses > 0 
            return false
        else
            puts "you lose"
            return true
        end
    end

    def win?
        if @board.num_ships > 0 
            return false
        else
            puts "you win"
            return true
        end
    end

    def game_over?
         self.win? || self.lose? ? true : false
    end
    
    def turn 
        pos = @player.get_move
       if  @board.attack(pos) 
            @board.print
           
            puts @remaining_misses
       else
         @board.print
          @remaining_misses -= 1
         puts @remaining_misses
       end
    end

end