require "uri"
require "csv"
require "colorize"
require "gemoji"

class EligibilityCheck
  def initialize(name)
    @name = name
    @no_arr = []
  end

  def start_process
    render_ascii_art
    instruction
    owner_of_the_property 
    received_solar_rebate_before
    existed_solar_panel
    combined_houshold_income
    property_value
    eligibility_response
  end

  def render_ascii_art
    puts file_contents = CSV.read("./lib/image")
  end

  private

  def instruction
    puts "Hello, this is a solar panel rebate eligibility check process, please follow the questions and them with a valid input 1 is yes and 2 is no. Simply type 1 or 2 will be sufficient. Although you respond with any other inputs, this program will guide you through the whole process. if you wish to leave the process type 3 as your response.".colorize(:blue)
    puts "---" * 20
  end

  def owner_of_the_property
    puts "Are you the property owner and the current occupier?".colorize(:light_blue)
    user_input_options
    answer = gets.chomp.to_i
    return owner_of_the_property unless answer_check(answer)
  end

  def received_solar_rebate_before
    puts "Is this your first apply for solar panel rebate?".colorize(:light_blue)
    user_input_options
    answer = gets.chomp.to_i
    return received_solar_rebate_before unless answer_check(answer)
  end

  def existed_solar_panel
    puts "Is this your first solar panel installation?".colorize(:light_blue)
    user_input_options
    answer = gets.chomp.to_i
    return existed_solar_panel unless answer_check(answer)
  end

  def combined_houshold_income
    puts "Is your household income below $180,000aud?".colorize(:light_blue)
    user_input_options
    answer = gets.chomp.to_i
    return combined_houshold_income unless answer_check(answer)
  end

  def property_value
    puts "Is your property value less than $3 millions?".colorize(:light_blue)
    user_input_options
    answer = gets.chomp.to_i
    return property_value unless answer_check(answer)
  end

  def eligibility_response
    if @no_arr.size == 0
      clap = Emoji.find_by_alias("clap").raw + " "
      puts "Congrats! You are eligible for solar panel rebate #{clap * 3}".colorize(:red)
    else
      puts "Sorry, you are not eligible for solar panel rebate program."
    end
  end

  def answer_check(answer)
      if answer == 1
        puts "Please read the next line #{Emoji.find_by_alias("point_right").raw}.".colorize(:light_yellow)
        puts " "
        return true
      elsif answer == 2
        puts "Please read the next line #{Emoji.find_by_alias("point_right").raw}.".colorize(:light_yellow)
        puts " "
        @no_arr << answer
        return true
      elsif answer == 3
        exit
      else
        puts "It is no a valid input. Please type 1. yes or 2. no."
        puts " "
        return false
      end 
  end

  def user_input_options
    puts "1. Yes 2. No ".colorize(:light_blue)
    puts "if you wish to leave this eligibility check process, type 3".colorize(:green)
  end
end
