class Board

  attr_reader :code, :guesses

  class Pegs

    attr_reader :Colour

    def initialize(colour)
      @Colour = colour
    end

  end

  @@Red_peg = Pegs.new("Red")
  def self.Red_peg
    return @@Red_peg
  end

  @@Blue_peg = Pegs.new("Blue")
  def self.Blue_peg
    return @@Blue_peg
  end

  @@Yellow_peg = Pegs.new("Yellow")
  def self.Yellow_peg
    return @@Yellow_peg
  end

  @@Green_peg = Pegs.new("Green")
  def self.Green_peg
    return @@Green_peg
  end

  @@White_peg = Pegs.new("White")
  def self.White_peg
    return @@White_peg
  end

  @@Black_peg = Pegs.new("Black")
  def self.Black_peg
    return @@Black_peg
  end

  @@All_pegs = [Board.Red_peg, Board.Blue_peg, Board.Yellow_peg, Board.Green_peg,
  Board.White_peg, Board.Black_peg]
  def self.All_pegs
    return @@All_pegs
  end

  def initialize
    @guesses ] Array.new
  end

  #Takes an array of four pegs to act as the code
  def set_code(code)
    input_correct?(code)
    @Code = code
  end

  def add_guess(guess)
    input_correct?(guess)
    @guesses.push(guess)
  end

  def print_board
    
  end

  private

  #Checks if the given input is four peg objects in an array
  def input_correct?(to_check)
    if(to_check.size != 4 || !to_check.all?{|peg| peg.class == Pegs})
      raise ArgumentError, "The input should be an array of four peg objects"
    end
  end

end
