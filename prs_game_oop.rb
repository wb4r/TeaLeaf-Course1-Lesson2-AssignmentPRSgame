require 'pry'

def clear
  system 'clear'
end


# Choosing both players
module Choosable
  @@options_mother = ["p", "r", "s"] 
  
  def player2_pick
    @@options_mother.sample
  end
  def player1_pick
    begin 
      puts "Choose an option: P/R/S"
      option = gets.downcase.chomp
      clear
    end while !@@options_mother.include?(option)
    option
  end
end


# Comparing both players picks
class WhoWins 
  attr_accessor :player1pick, :player2pick

  def comparing_picks(player1pick, player2pick)
    @player1pick = player1pick
    @player2pick = player2pick

    if player1pick == player2pick 
      puts "###  Oh! Oh! TIE!!"
    elsif (player1pick == 'p' && player2pick == 'r') || (player1pick == 'r' && player2pick == 's') || (player1pick == 's' && player2pick == 'p')
      puts "###  The User wins!!"
      puts "User: #{player1pick.upcase} vs Computer: #{player2pick.upcase}"
    else 
      puts "###  The Computer wins!!" 
      puts "User: #{player1pick.upcase} vs Computer: #{player2pick.upcase}"
    end
  end
end  


# Initializing players
class Players < WhoWins
  attr_accessor :name 
  include Choosable
  
  def initialize(name)
    @name = name
  end
end


# Engine of the Game
class PRS_Game < Players
  def initialize
    player1 = Players.new("Human")
    player2 = Players.new("Computer")
    
    player2_hand = player2.player2_pick
    player1_hand =  player1.player1_pick
    
    comparison = WhoWins.new
    comparison.comparing_picks(player1_hand, player2_hand)
  end
end


puts "WELCOME TO PRS GAME!"
puts ""


replay = 'y'
while replay == 'y'
  start_game = PRS_Game.new
  puts "=> Do you want to play again?"
  replay = gets.downcase.chomp
  clear
end

puts "Bye!!"
