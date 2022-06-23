class HumanPlayer
attr_reader :mark
    def initialize(mark_value)
       allowed = %w(x X o O)
        if !allowed.include?(mark_value)
            puts "only Xs and Os allowed!"
        end
        @mark = mark_value.upcase
    end

    def get_position
        puts "#{@mark} it's your turn: put two numnbers, no spaces :)"
       position = gets.chomp.split("")
       allowed = ["0","1","2"]
        position.each do |c|
              if  !allowed.include?(c)
                    puts "SORRY, only 0's, 1's, and 2's allowed."
                    return self.get_position
              end
        end
       return [position[0].to_i,position[-1].to_i]
    end

end