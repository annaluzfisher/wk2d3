
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

    def place_mark (pos,input)
        if !self.valid?(pos) || !self.board_empty?(pos)
            puts "that spot may be taken or out of bounds - try again!"
        end
        allowed = %w(x X o O)
        if !allowed.include?(input)
            puts "only Xs and Os allowed!"
        end
        r = pos[0]
        c = pos[1]
        @grid[r][c] = input.upcase
    end

    def print
        puts "._____."
        @grid.each {|subarr| puts "|#{subarr.join("|")}|"}
    end

    def win_row?(mark)
        var = false
        @grid.each do |row|
            row.each do|ele| 
                var = true if row[0] == row[1] && row[1] == row[2]
            return true if var == true && mark.upcase == ele
            end
        end
        return false
    end
    
    def win_column?(mark)
        var = false
        @grid[0].each_with_index do|ele,idx|
                var = true if ele == @grid[1][idx] || ele == @grid[2][idx]
                return true if var == true && ele == mark.upcase
            end
        return false
    end

     def win_diagonal?(mark)
        
       dia1 = @grid.map.with_index {|ele,i| @grid[i][i] }
       dia2 = @grid.map.with_index {|ele,i| @grid[i][-i-1] }
       if dia1.uniq.count == 1 && dia1[0] == mark
        return true
       elsif  dia2.uniq.count == 1 && dia1[0] == mark.upcase
        return true
       else
        return false
       end
    end

    def win?(mark)
        return true if self.win_row?(mark) || self.win_column?(mark) || self.win_diagonal?(mark)
    end
    
    def empty_positions?
        @grid.flatten.any?(@blank)
    end

end
