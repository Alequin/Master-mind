module UserInput

  def self.get_single_digit_input(min, max)

    if(min < 0 || min > 8)
      raise ArgumentError, "The min value must be greater than -1 and less than 9. Not #{min}"
    end
    if(max < 1 || max > 9)
      raise ArgumentError, "The max value must be greater than 0 and less than 10. Not #{max}"
    end

    loop{
      selected_position = gets.chomp
      if(selected_position.size == 1 && selected_position.scan(/[1-9]/).size != 0)
        if( !(selected_position.to_i < min || selected_position.to_i > max) )
          return selected_position.to_i
        end
      end
      puts "Sorry the value has to be a number between 1-9"
      print "Try again: "
    }
  end

end
