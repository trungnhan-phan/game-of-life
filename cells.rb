class Cell
    attr_accessor :alive

    def initialize(alive = false) 
        @alive = alive
    end

    def to_s
        @alive ? 'x' : ' '
    end

end

  