#Game 
  #compare
  #orchestra
#Player 
  #PH Choose
  #PC Choose
require 'pry'

class Player
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
  
  def to_s
    puts "@#{human} @#{computer}"
  end
end
  
class Human < Player 
  def pick_hand
    choice = Game::ARRAY.sample
  end
end

class Computer < Player
  def pick_hand
    choice = Game::ARRAY.sample
  end
end  

module Comparable
  def compare_hands(humanchoice, computerchoice)
    h = humanchoice
    c = computerchoice
    binding.pry
    if h == c
      puts "=> Tie"
    elsif (h == "rock" && c == "scissors") ||
          (h == "paper" && c == "rock") ||
          (h == "scissors" && c == "paper")
      puts "=> Human win!"
    else
      puts "=> Computer win!"
    end
  end
end

class Game
  attr_reader :human, :computer
  ARRAY = ['r', 'p', 's']
  include Comparable
  
  def initialize
    @human = Human.new("bob")
    @computer = Computer.new("r2d2")
  end
  def play
    humanchoice = human.pick_hand
    computerchoice = computer.pick_hand
    compare_hands(humanchoice, computerchoice)
  end
end
  

new_play = Game.new.play
puts @human
  
  
  
  
  
  
  
  
  
  
  
  
  
  