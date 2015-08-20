require 'pry'

class Players 
  attr_accessor :choice, :name
  
  def initialize(name)
    @name = name
    @choice = choice
  end
end


module Combinations
  CHOICES = {'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors'}
end


class Human < Players
  include Combinations
  #@@choice = true
  
  def choose
    begin 
      puts "Choose an option: P/R/S"
      self.choice = gets.downcase.chomp
    end while !Combinations::CHOICES.keys.include?(self.choice)
  end
  
  # def self.combs
  #   @@choice
  # end
end


class Computer < Players
  include Combinations
  #@@choice = true
  
  def choose
    self.choice = Combinations::CHOICES.keys.sample
  end
  
  # def self.combs
  #   @@choice
  # end
end

# class Comparator 
#   #attr_accessor :human, :computer
  
#   puts "--"
#   puts Human.combs
#   puts Computer.combs
#   puts "--"
  
# end

human = Human.new("Human Player")
computer = Computer.new("R2P2 Master")
human.choose
computer.choose
puts human.choice
puts computer.choice




