require_relative 'user_input'
require_relative 'game'
require_relative 'player'


puts "------------------------------------------------"
puts "Welcome to Master Mind"
puts "------------------------------------------------"

code_breaker = nil
code_maker = nil

loop{
  puts "Do you want to play as the code breaker or code maker?"
  puts "(1) Code breaker"
  puts "(2) Code maker"

  case UserInput.get_single_digit_input
  when 1
    code_breaker = Player.new(:HUMAN)
    code_maker = Player.new(:AI)
    break
  when 2
    code_breaker = Player.new(:AI)
    code_maker = Player.new(:HUMAN)
    break
  else
    puts "Sorry that input was not valid"
  end
}

game = Game.new(code_breaker, code_maker)
game.run_game_loop
