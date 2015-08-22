require 'pry'

class Player
  attr_reader :name
  attr_accessor :choice
  
  def initialize(name)
    @name = name
    @choice = choice
  end
  
  def pick_hand(player)
    if player.name != "R2P2"
      begin
        puts "#{self.name.capitalize} please, pick an option 'p', 'r', 's':"
        self.choice = gets.downcase.chomp
      end until Game::CHOICES.include?(choice)
    else
      self.choice = Game::CHOICES.sample
    end
  end
end

class Human < Player 
  attr_reader :name
  
  def initialize(name)
    puts "Please, choose a name: "
    name = gets.chomp
    @name = name
    sleep(2)
    system 'clear'
  end
end

class Computer < Player 
end

module Comparable
  def compare
    system 'clear'
    if @human.choice == @computer.choice
      puts "=> Tie"
    elsif (@human.choice == "r" && @computer.choice == "s") ||
          (@human.choice == "p" && @computer.choice == "r") ||
          (@human.choice == "s" && @computer.choice == "p")
      puts "=> Human win!"
    else
      puts "=> Computer win!"
    end
    puts ""
    puts "Human choice: #{@human.choice} // Computer choice: #{@computer.choice}"
  end
end

class Game
  attr_reader :human, :computer, :choice
  CHOICES = ['p', 'r', 's']
  include Comparable
  
  def initialize
    wellcome
    @human = Human.new("Human")
    @computer = Computer.new("R2P2")
  end
  
  def wellcome
    system 'clear'
    puts "Wellcome to PRS Game!"
    puts ""
  end
  
  def human_hand
    @human.pick_hand(@human)
  end
  
  def computer_hand
    @computer.pick_hand(@computer)
  end
  
  def play
    human_hand
    computer_hand
    compare
  end
end

replay = 'y'
begin
  new_game = Game.new.play
  puts ""
  puts "Do you want to play again?"
  replay = gets.chomp
end until replay != 'y'