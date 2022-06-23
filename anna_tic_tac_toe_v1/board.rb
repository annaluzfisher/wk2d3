
class Board

    attr_reader :grid ,:blank
    def initialize
        @grid = Array.new(3){Array.new(3 , "_")}
        @blank = "_"
    end

    def valid?(pos)
       return true if !self[pos].nil?
       return false
    end

    def [] (pos)
        r = pos[0]
        c = pos[1]
        return @grid[r][c]
    end

    def board_empty?(pos)
        return true if self[pos] == @blank
        return false
    end

    def place_mark (pos,mark)
        if !self.valid?(pos) || !self.board_empty?(pos)
            puts "that spot may be taken or out of bounds - try again!"
        end
        
        r = pos[0]
        c = pos[1]
        @grid[r][c] = mark
    end

    def print
        puts "._____."
        @grid.each {|subarr| puts "|#{subarr.join("|")}|"}
    end

    def win_row?(mark)
        var = false
        @grid.each do |row|
            
                var = true if row[0] == row[1] && row[1] == row[2]
            return true if var == true && mark == row[0]
           
        end
        return false
    end
    
    def win_column?(mark)
        var = false
        @grid[0].each_with_index do|ele,idx|
                if ele == @grid[1][idx] && ele == @grid[2][idx]
                    var = true
                    winner = ele
                end
                return true if var == true && winner == mark
            end
        return false
    end

     def win_diagonal?(mark)
        
       dia1 = @grid.map.with_index {|ele,i| @grid[i][i] }
       dia2 = @grid.map.with_index {|ele,i| @grid[i][-i-1] }
       if dia1.uniq.count == 1 && dia1[0] == mark
        return true
       elsif  dia2.uniq.count == 1 && dia2[0] == mark
        return true
       else
        return false
       end
    end
require "byebug"
    def win?(mark)
        # debugger
        return true if (self.win_row?(mark) || self.win_column?(mark)) || self.win_diagonal?(mark)
        return false
    end
    
    def empty_positions?
        @grid.flatten.any?(@blank)
    end

end
