require_relative 'board'

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
