# PLAYERS *PicK* a HAND of either paper, rock or scissors. The two hads are *CompareD* 
# and you get a RESULT
# PLAYERS-HAND    RESULT
# PICK    COMPARE
#

class Player
  attr_accessor :choice
  attr_reader :name
  
  def initialize(name)
    @name = name
    
  end
  
  def to_s
    "#{name} currently has a choice of #{choice}"
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
  attr_reader :player, :computer
  
  def initialize
    @player = Human.new("Bob")
    @computer = Computer.new("R2D2")
  end
  
  def play 
    player.pick_hand
    computer.pick_hand
    puts player
    puts computer
    #compare_hands
  end
end

game = Game.new.play