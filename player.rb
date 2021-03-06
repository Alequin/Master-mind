require_relative 'board'
require_relative 'user_input'

class Player

  attr_reader :type

  def initialize(type)
    if(type != :HUMAN && type != :AI)
      raise ArgumentError, "Type must be either :HUMAN or :AI"
    end
    @type = type
  end

  def get_new_code

    case @type
    when :HUMAN
      return get_code_from_player
    when :AI
      return ai_make_code
    end

  end

  def make_guess_as_human
    guess = nil

    loop{
      guess = Array.new

      print "| "
      all_pegs = Board.All_pegs
      Board.print_peg_options
      puts ""
      4.times { |loop_count|
        puts "Select colour #{loop_count+1}"
        user_input = nil
        loop{
          user_input = UserInput.get_single_digit_input()
          break if user_input >= 1 && user_input <= 6
          puts "Sorry that value must be between 1 - 6"
          print "Try again: "
        }

        current_guess = all_pegs[user_input-1]
        guess.push(current_guess)
        puts "#{current_guess.Colour}"
      }

      print_confirmation_message(guess)
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

  def make_guess_as_ai(code)

    if(@ai_guess == nil)
      set_up_ai_array
    end

    @ai_guess.each_with_index { |peg, index|
      if(@locked_indices.include?(index))
        next
      end

      if(code[index] == peg)
        @locked_indices.push(index)
      else
        next_guess = nil
        loop{
          previous_guess = @ai_guess[index]
          next_guess = Board.All_pegs[rand(5)]
          break if previous_guess != next_guess
        }
        @ai_guess[index] = next_guess
      end
    }

    result = Array.new
    @ai_guess.each { |peg|
      result.push(peg)
    }
    return result
  end

  private

  def get_code_from_player

    puts "You need to make a code"
    puts ""
    return self.make_guess_as_human

  end

  def ai_make_code

    new_code = Array.new
    all_pegs = Board.All_pegs

    4.times {
      new_code.push(all_pegs[rand(all_pegs.size-1)])
    }

    return new_code

  end

  def print_confirmation_message(guess)
    puts "Is this correct?"
    print "|"
    guess.each { |guess_peg|
      print " #{guess_peg.Colour} |"
    }
  end

  def set_up_ai_array
      @ai_guess = Array.new
      4.times {
        @ai_guess.push(nil)
      }
      @locked_indices = Array.new
    end
end
