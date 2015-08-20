


class Player 
  attr_accessor :choice
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
  
  def to_s
    "#{name} has chosen: #{choice}"
  end
end


class Human < Player 
  def pick_hand
    array = ['p', 's', 'r']
    self.choice = array.sample
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
    @human = Human.new("bob")
    @computer = Computer.new("r2d2")
  end
  
  def play 
    human.pick_hand
    computer.pick_hand
    puts human
    puts computer
    #compare_hands
  end
  
  def compare_hands
  end
end

game = Game.new.play