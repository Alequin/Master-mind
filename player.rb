require_relative 'board'
require_relative 'user_input'

class Player

  attr_reader :name, :type

  def initialize(name, type)

    if(type != :HUMAN && type != :AI)
      raise ArgumentError, "Type must be either :HUMAN or :AI"
    end

    @name = name
    @type = type
  end

  def get_new_code

    case @type
    when :HUMAN
      raise NotImplementedError
    when :AI
      return ai_make_code
    end

  end

  def make_guess

    guess = nil

    loop{
      guess = Array.new

      print "| "
      all_pegs = Board.All_pegs
      all_pegs.each_with_index { |peg, index|
        print "#{index+1}:#{peg.Colour} | "
      }
      puts ""
      4.times { |loop_count|
        puts "Select colour #{loop_count+1}"
        guess.push(all_pegs[UserInput.get_single_digit_input(1, 6)-1])
        puts "#{guess[loop_count].Colour}"
      }

      puts "Is this correct?"
      print "|"
      guess.each { |guess_peg|
        print " #{guess_peg.Colour} |"
      }
      puts ""
      puts "(1)yes | (2)No"
      case gets.chomp.downcase
      when "1"
        break
      when "yes"
        break
      end
    }

    return guess

  end

  private

  def get_code_from_player

  end

  def ai_make_code

    new_code = Array.new
    all_pegs = Board.All_pegs

    4.times {
      new_code.push(all_pegs[rand(all_pegs.size-1)])
    }

    return new_code

  end

end
