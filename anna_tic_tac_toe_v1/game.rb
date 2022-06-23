require_relative "human_player.rb"
require_relative "board.rb"

class Game

   def initialize #(playerone, playertwo)
    @player1 = HumanPlayer.new(:O)
    @player2 = HumanPlayer.new(:X)
    @current_player = @player1
    @board = Board.new
   end

   def switch_turn
     @current_player == @player1 ?@current_player = @player2 :  @current_player = @player1
    end
  
    def play
        while @board.empty_positions?
            @board.print
            move = @current_player.get_position
            @board.place_mark(move[0],move[1].join)
            if @board.win?(move[-1].join)
                puts "You win!"
                @board.print
                return "Play again?"
            else
                self.switch_turn
            end
         end
         return "it's a draw!\n Play again?"
    end

end

g = Game.new
g.play