require 'uri'
require 'csv'
require 'colorize'


class Solar_panel_rebate_egilibility_check
  def initialize(name)
    @name = name
  end
  
  def ower_of_the_property
    puts "Are you the property owner and the current occupier?".colorize(:light_blue)
    puts "1. Yes 2. No".colorize(:light_blue)
    answer = gets.chomp.to_i
    return unless answer_check(answer)
    received_solar_rebate_before
  end
  
  def received_solar_rebate_before
    puts "Is this your first apply for solar panel rebate?".colorize(:light_blue)
    puts "1. Yes 2. No".colorize(:light_blue)
    answer = gets.chomp.to_i
    return unless answer_check(answer)
    existed_solar_panel
  end

  def existed_solar_panel
    puts "Is this your first solar panel installation?".colorize(:light_blue)
    puts "1. Yes 2. No".colorize(:light_blue)

    answer = gets.chomp.to_i
    return unless answer_check(answer)
    combined_houshold_income
  end

  def combined_houshold_income
    puts "Is your household income below $180,000aud?".colorize(:light_blue)
    puts "1. Yes 2. No".colorize(:light_blue)
    answer = gets.chomp.to_i
    return unless answer_check(answer)
    property_value
  end
  
  def property_value
    puts "Is your property value less than $3 millions?" .colorize(:light_blue)
    puts "1. Yes 2. No".colorize(:light_blue)
    answer = gets.chomp.to_i
    if answer == 1
      puts "congrats! You are eligible for this rebate!".colorize(:light_red)
    elsif answer == 2
    puts "Sorry, your are not eligible."
    else
      puts "no valid input."
    end
  end
  def answer_check(answer)
    if answer == 1
      puts "Please answer the next question.".colorize(:light_blue)
      return true
    elsif answer == 2
      puts "Sorry, your are not eligible."
      return false
    else
      puts "It is no a valid input."
      return false
    end
  end
end