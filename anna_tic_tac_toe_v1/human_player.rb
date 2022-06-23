class HumanPlayer
attr_reader :mark
    def initialize(mark_value)
        unless mark_value == :X || mark_value == :O
            raise ArgumentError.new  "only Xs and Os allowed!"
        end
        @mark = mark_value
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
       return [[position[0].to_i , position[-1].to_i], [@mark]]
    end

end