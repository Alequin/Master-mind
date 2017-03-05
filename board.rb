class Board

  attr_reader :code, :guesses

  class Pegs

    attr_reader :Colour

    def initialize(colour)
      @Colour = colour
    end

    # Converts an array of Pegs to an array of strings which represent the colour
    # of the pegs
    def self.change_pegs_to_strings(array_of_pegs)

      string_array = Array.new
      array_of_pegs.each { |peg|
        string_array.push(peg.Colour)
      }

      return string_array

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

  @@Blank = "blank"
  @@Red = "red"
  @@White = "white"

  def initialize
    @guesses = Array.new
    @guess_results = Array.new
  end

  #Takes an array of four pegs to act as the code
  def set_code(code)
    input_correct?(code)
    @Code = code
  end

  def push_guess(guess)
    input_correct?(guess)
    @guesses.push(guess)
    @guess_results.push(compare_guess_and_code(guess))
  end

  def print_board

    index = @guesses.size-1
    puts "Guesses"
    puts "------------------------------------------------"
    while(index >= 0)

      current_guess = Pegs.change_pegs_to_strings(@guesses[index])
      guess_string = make_board_string(current_guess)
      result_of_guess_string = make_board_string(@guess_results[index])

      puts "Guess: #{guess_string}"
      puts "Result: #{result_of_guess_string}"
      puts "------------------------------------------------"

      index -= 1
    end

    def win?
      result = @guess_results[@guess_results.size-1].all? { |value| value == @@Red }
      return result
    end

  end

  private

  #Checks if the given input is four peg objects in an array
  def input_correct?(to_check)
    if(to_check.size != 4 || !to_check.all?{|peg| peg.class == Pegs})
      raise ArgumentError, "The input should be an array of four peg objects"
    end
  end

  def compare_guess_and_code(guess)
    input_correct?(guess)

    result_index = 0;
    result = Array.new
    index_to_ignore_guess = Array.new
    index_to_ignore_code = Array.new

    for i in 0..@Code.size-1
      if(@Code[i] == guess[i])
        result.push(@@Red)
        index_to_ignore_guess.push(i)
        index_to_ignore_code.push(i)
      end
    end

    guess.each_with_index { |guess_peg, guess_index|
      if(index_to_ignore_guess.include?(guess_index))
        next
      end
      @Code.each_with_index {|code_peg, code_index|
        if(index_to_ignore_code.include?(code_index))
          next
        end
        if(guess_peg == code_peg)
          result.push(@@White)
          index_to_ignore_guess.push(guess_index)
          index_to_ignore_code.push(code_index)
          break
        end
      }
    }

    while(result.size < 4)
      result.push(@@Blank)
    end

    return result

  end

  def make_board_string(array)
    result = ""
    array.each_with_index { |string, i|
      result += "#{string} "
      if(i < array.size-1)
        result += "| "
      end
    }

    return result
  end



end
