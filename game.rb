require_relative 'player'

class Game

  @@TOTAL_ROUNDS = 12

  def initialize(code_breaker, code_maker)
    if(code_breaker.class != Player || code_maker.class != Player)
      raise ArgumentError, "Code breaker and code maker must both be an instance of Player"
    end
    @Code_breaker = code_breaker
    @Code_maker = code_maker
  end

  def run_game_loop

    #make new Board
    @Game_board = Board.new

    #build code
    @Game_board.set_code(@Code_maker.get_new_code)

    puts "The code has been created. Let the game Start"

    round = 1
    win = false
    while(round <= @@TOTAL_ROUNDS)
      puts "Round #{round}/#{@@TOTAL_ROUNDS}"
      case @Code_breaker.type
      when :HUMAN
        run_human_guess_round
      when :AI
        run_ai_guess_round
      end

      if(@Code_breaker.type == :HUMAN)
        @Game_board.print_board
      end

      if(@Game_board.win?)
        win = true
        break
      end
      round += 1

    end

    if(@Code_breaker.type == :AI)
      @Game_board.print_board
    end

    if(win)
      puts "Congratulations, you figured out the code"
    else
      puts "Sorry you ran out of attempts"
    end
  end

  private

  def run_human_guess_round

    loop{
      puts "What would you like to do?"
      puts "(1) make guess (2) view board"

      case gets.chomp
      when "1"
        @Game_board.push_guess(@Code_breaker.make_guess_as_human)
        break
      when "2"
        @Game_board.print_board
      else
        puts "Sorry that input was not valid"
      end
    }

  end

  def run_ai_guess_round
    @Game_board.push_guess(@Code_breaker.make_guess_as_ai(@Game_board.Code))
  end

end
