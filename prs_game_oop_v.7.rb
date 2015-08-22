require 'pry'




class Player
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
  
  def pick_hand(player)
    if player == @human 
      
    else
      
    end
end

class Human < Player 
  def pick_hand
    begin
      puts "Pick an option 'p', 'r', 's':"
      choice = gets.chomp
    end until Game::CHOICES.include?(choice)
  end
end

class Computer < Player 
  def pick_hand
    Game::CHOICES.sample
  end
end

module Comparable
end


class Game
  attr_reader :human, :computer
  CHOICES = ['p', 'r', 's']
  
  def initialize
    @human = Human.new("Human")  
    @computer = Computer.new("R2P2")
  end
  
  def human_hand
    puts @human.pick_hand
  end
  
  def computer_hand
    puts @computer.pick_hand
  end
  
  def play
    pick_hand(human)
    pick_hand(computer)
    #human_hand
    #computer_hand
  end
  
end

new_game = Game.new.play