require 'yaml'
require 'json'

class Person
  attr_accessor :name, :age, :gender
  
  def initialize(name, age, gender)
    @name = name
	@age = age
	@gender = gender
  end
  
  def to_yaml
    YAML.dump ({ 
	  :name => @name,
	  :age => @age,
	  :gender => @gender
	})
  end

  def to_json
    JSON.dump ({ 
	  :name => @name,
	  :age => @age,
	  :gender => @gender
	})
  end
  
  def self.from_yaml(string)
    data = YAML.load string
    p data
    self.new(data[:name], data[:age], data[:gender])	
  end

  def self.from_json(string)
    data = JSON.load string
    p data
    self.new(data['name'], data['age'], data['gender'])	
  end
end

p = Person.new "David", 28, "male"
p "Object #{p}" 
p "YAML #{p.to_yaml} "
p "JSON #{p.to_json} "


p = Person.from_yaml(p.to_yaml)
puts "YAML =>> Name #{p.name}" 
puts "Age #{p.age}" 
puts "Gender #{p.gender}" 

p = Person.from_json(p.to_json)
puts "JSON =>> Name #{p.name}" 
puts "Age #{p.age}" 
puts "Gender #{p.gender}" 

  