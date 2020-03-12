require 'uri'
require 'csv'
require 'colorize'
require 'gemoji'


class Eligibility_check
  def initialize(name)
    @name = name
    @answers =[]
  end

  def instruction
    puts "Hello, this is a solar panel rebate eligibility check process, please follow the questions and them with a valid input 1 is yes and 2 is no. Simpliy type 1 or 2 will be sufficient. Alothough you type any other inputs, this program will guide you through the whole process. if you wish to leave the process immediately type 3".colorize(:blue)
    puts "---"*20
    ower_of_the_property
  end

  private
  def ower_of_the_property
    puts "Are you the property owner and the current occupier?".colorize(:light_blue)
    user_input_options
    answer = gets.chomp.to_i
    return ower_of_the_property unless answer_check(answer)
    received_solar_rebate_before
  end
  
  def received_solar_rebate_before
    puts "Is this your first apply for solar panel rebate?".colorize(:light_blue)
    user_input_options
    answer = gets.chomp.to_i
    return received_solar_rebate_before unless answer_check(answer)
    existed_solar_panel
  end

  def existed_solar_panel
    puts "Is this your first solar panel installation?".colorize(:light_blue)
    user_input_options

    answer = gets.chomp.to_i
    return existed_solar_panel unless answer_check(answer)
    combined_houshold_income
  end

  def combined_houshold_income
    puts "Is your household income below $180,000aud?".colorize(:light_blue)
    user_input_options
    answer = gets.chomp.to_i
    return combined_houshold_income unless answer_check(answer)
    property_value
  end
  
  def property_value
    puts "Is your property value less than $3 millions?" .colorize(:light_blue)
    user_input_options
    answer = gets.chomp.to_i
    return property_value unless answer_check(answer)
    eligibility_response
  end

  def eligibility_response
    if @answers.size == 0
       puts "Congrats! You are eligible for solar panel rebate #{Emoji.find_by_alias("clap").raw} #{Emoji.find_by_alias("clap").raw} #{Emoji.find_by_alias("clap").raw}".colorize(:red)
    else 
      puts "Sorry, you are not eligible for solar panel rebate program."
    end
  end

  def answer_check(answer)
  while answer != 1 || answer != 2
    if answer == 1 
      puts "Please read the next line #{Emoji.find_by_alias("point_right").raw}.".colorize(:light_yellow)
      puts " "
      return true
    elsif answer == 2
      puts "Please read the next line #{Emoji.find_by_alias("point_right").raw}.".colorize(:light_yellow)
      puts " "
      @answers << answer 
      return true
    elsif answer == 3
      exit
    else
      puts "It is no a valid input. Please type 1. yes or 2. no."
      puts " "
      return false
    end
  end
  end
  def user_input_options
    puts "1. Yes 2. No ".colorize(:light_blue)
    puts "if you wish to leave this eligibility check process, type 3".colorize(:green)
  end
end