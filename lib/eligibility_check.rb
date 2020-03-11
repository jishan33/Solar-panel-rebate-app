require 'uri'
require 'csv'


class Solar_panel_rebate_egilibility_check
  def initialize(name)
    @name = name
  end

  def ower_of_the_property
    puts "Are you the property owner and the current occupier?"
    puts "1. yes"
    puts "2. no"
    answer = gets.chomp.to_i
    if answer == 1
      puts "check the next question."
      received_solar_rebate_before
    elsif answer == 2
      puts "sorry, your are not eligible."
    else
      puts "no valid input."
    end
  end
  
  def received_solar_rebate_before
    puts "Have you received solar panel rebate before?"
    puts "1. yes"
    puts "2. no"
    answer = gets.chomp.to_i
    if answer == 1
      puts "sorry, your are not eligible."
    elsif answer == 2
      puts "check the next question."
      existed_solar_panel
    else
      puts "no valid input."
    end
  end
  def existed_solar_panel
    puts "Do you have an existed solar panel?"
    puts "1. yes"
    puts "2. no"
    answer = gets.chomp.to_i
    if answer == 1
      puts "sorry, your are not eligible."
    elsif answer == 2
      puts "check the next question."
      combined_houshold_income
    else
      puts "no valid input."
    end
  end
  def combined_houshold_income
   puts "Is your household income below $180,000aud ?"
    puts "1. yes"
    puts "2. no"
    answer = gets.chomp.to_i
    if answer == 1
      puts "check the next question."
      property_value
    elsif answer == 2
      puts "sorry, your are not eligible."
    else
      puts "no valid input."
    end
  end
  def property_value
    puts "Is your property value more than $3 millions ?" 
    puts "1. yes"
    puts "2. no"
    answer = gets.chomp.to_i
    if answer == 1
      puts "sorry, your are not eligible."
    elsif answer == 2
      puts "congrats! You are eligible for this rebate!"
    else
      puts "no valid input."
    end
  end
end