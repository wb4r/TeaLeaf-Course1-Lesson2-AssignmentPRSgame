require 'pry'

def clear
  system 'clear'
end

class Player
  attr_accessor :choice
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
end

class Human < Player
  def pick_hand
    begin 
      puts "Choose an option: P/R/S"
      c = gets.downcase.chomp
    end until Game::CHOICES.keys.include?(c)
    self.choice = c
  end
end

class Computer < Player
  def pick_hand
    self.choice = Game::CHOICES.keys.sample
  end
end


class Game
  CHOICES = {'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors'}
  attr_reader :human, :computer
  
  def initialize
    @human = Human.new("Human")
    @computer = Computer.new("Computer")
  end
  
  def compare_hands(human_hand, computer_hand)
    
    if human_hand == computer_hand 
      puts "###  Oh! Oh! TIE!!"
    elsif (human_hand == 'p' && computer_hand == 'r') || (human_hand == 'r' && computer_hand == 's') || (human_hand == 's' && computer_hand == 'p')
      puts "###  The User wins!!"
      puts "User choice: #{CHOICES[human_hand]} vs Computer choice: #{CHOICES[computer_hand]}"
    else 
      puts "###  The Computer wins!!" 
      puts "User choice: #{CHOICES[human_hand]} vs Computer choice: #{CHOICES[computer_hand]}"
    end
    
  end
  
  def play
    a = human.pick_hand
    b = computer.pick_hand
    compare_hands(a, b)
  end
end

replay = 'y'
begin 
  game = Game.new.play
  puts "Do you want to play again? 'y' for yes"
  replay = gets.downcase.chomp
  clear
end until replay != 'y'

