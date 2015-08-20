

class First
  attr_accessor :var
  def initialize
    @var = var
  end
  
  def varim
    puts "@@class_var = 99"
  end
end

class Second < First
  attr_accessor :bar
  #bar.varim
end

bar = Second.new
bar.varim

