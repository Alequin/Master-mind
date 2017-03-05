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
    while(round <= @@TOTAL_ROUNDS)

      case @Code_breaker.type
      when :HUMAN
        run_human_guess_round
      when :AI
        run_ai_guess_round
      end



    end

  end

  private

  def run_human_guess_round



  end

  def run_ai_guess_round

  end



end
