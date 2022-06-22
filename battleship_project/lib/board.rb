class Board

attr_reader   :grid , :size 

    def initialize(n)
        @grid = Array.new(n){Array.new(n, :N)}
        @size = n*n
    end

    def [] (pos)
        r,c = pos
       return @grid[r][c]
    end

    def []=(pos, x)
        r,c = pos
        @grid[r][c] = x
    end

    def num_ships
        @grid.flatten.count(:S)
    end

    def attack (position)
        if self[position] == :S #self[position] is the same as self.[](position)
            self[position]= :H
            puts "you sunk my battleship!"
            return true
        else 
            self[position]= :X
            return false
        end
    end

    def place_random_ships
        amt = @size/4
        length = Math.sqrt(@size)
        while self.num_ships < amt
            @grid[rand(length)][rand(length)] = :S
        end
    end
   

    def hidden_ships_grid
        @grid.map do |rows|
            rows.map { |ele|   ele == :S ? :N : ele }
       end
    end

    def self.print_grid(grid)
        grid.each {|sub| puts sub.join(" ") }
    end
    
    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end
end
