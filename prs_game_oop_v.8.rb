require 'pry'

class Player
  attr_reader :name
  attr_accessor :choice
  
  def initialize(name)
    @name = name
    @choice = choice
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
  
  def pick_hand
    begin
      system 'clear'
      puts "#{self.name.capitalize} please, pick an option 'p', 'r', 's':"
      self.choice = gets.downcase.chomp
    end until Game::CHOICES.include?(choice)
  end
end

class Computer < Player
  def pick_hand
    self.choice = Game::CHOICES.sample
  end
end

module Comparable
  def compare(human, computer)
    system 'clear'
    if human == computer
      puts "=> Tie"
    elsif (human == "r" && computer == "s") ||
          (human == "p" && computer == "r") ||
          (human == "s" && computer == "p")
      puts "=> Human win!"
    else
      puts "=> Computer win!"
    end
    puts ""
    puts "#{@human.name.capitalize}'s' choice: #{human} // Computer's choice: #{computer}"
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
    @human.pick_hand
  end
  
  def computer_hand
    @computer.pick_hand
  end
  
  def play_again?
    puts ""
    puts "Do you want to play again #{@human.name.capitalize}?"
    replay = gets.downcase.chomp
    if replay == 'y'
      play
    end
  end
  
  def play
    human_hand
    computer_hand
    compare(@human.choice, @computer.choice)
    play_again?
  end
end

Game.new.play
