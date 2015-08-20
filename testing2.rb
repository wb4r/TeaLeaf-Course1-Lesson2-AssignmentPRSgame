class SuperKlass
  def initialize(name)
    @name = name
  end
end

class Klass1 < SuperKlass
  attr_accessor :var_klass1
  
  def testing1
    @var_klass1 = "mada"
  end
end

class Klass2 < SuperKlass
  attr_accessor :var_klass2
  
  def testing2
    @var_klass2 = "faca"
  end
  
  # to use "mada" here:
  def initialize(name)
    #obj3 = Klass1.new("Import-Export")
    #obj3.testing2
  end
end

obj1 = Klass1.new("Objekt 1 Klass 1")
obj2 = Klass2.new("Objekt 2 Klass 2")
puts obj1.testing1
puts obj2.testing2

obj3 = Klass2.new("importe-exporte")
puts obj3
