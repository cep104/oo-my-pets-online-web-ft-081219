require 'pry'
class Owner
  attr_reader :name, :species
  attr_accessor :pets
  
  @@all = []
  @@pets = { :dogs => [], :cats => [] }
  def initialize(name)
    @name = name 
    @species = "human"
     @@all << self
  # binding.pry
  end
  
  def say_species 
    "I am a human."
  end

  def self.all 
    @@all
  end
  
  def self.count 
   @@all.length
  end
  
  def self.reset_all
     @@all.clear
  end
  def pets 
    @@pets
  end
  def cats 
    Cat.all.select{|cat| cat.owner == self}
  end
  
  def dogs 
    Dog.all.select{|dog| dog.owner == self}
  end
  
  def buy_cat(cat_name)
    @@pets[:cats] << Cat.new(cat_name,self)
  end
  
  def buy_dog(dog_name)
    @@pets[:dogs] << Dog.new(dog_name,self)
  end
  
  def walk_dogs
    self.dogs.each do |dog| 
      dog.mood = "happy" 
    end
  end
  
  def feed_cats 
    self.cats.each do |cat|
      cat.mood = "happy"
    end 
  end
  
  def sell_pets
    pets = self.dogs + self.cats

    pets.each do |pet|
      pet.mood = "nervous"
      # pet.owner = nil
    end
 end
    
  
  
 def list_pets
    "I have #{@@pets[:dogs].length} dog(s), and #{@@pets[:cats].length} cat(s)."
  end
end