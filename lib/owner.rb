require 'pry'

class Owner
  
  attr_reader :name, :species #cannot change owners name to only add a setter method to set the name
   @@all = []
  
  def initialize(name, species = "human")
    @name = name
    @species = species
    save
  end  
  
   def say_species
     return "I am a #{species}."
   end 
   
   def save
    @@all << self
   end 
   
   def self.all 
     @@all
   end 
   
   def self.count
    @@all.count
   end 
   
   def self.reset_all
    @@all = [] #I added the empty array so that owners can be re-added the empty array. I can also use @@all.clear
   end  
   
   def cats #returnsa a collection of all the cats that belong to the owner
     Cat.all.select do |all_cats|
       all_cats.owner == self
     end
   end 
   
   def dogs
     Dog.all.select do |all_dogs|
       all_dogs.owner == self
    end
  end 
  
  def buy_cat(cats_name)
    Cat.new(cats_name, self) 
  end 
  
  def buy_dog(dogs_name)
    Dog.new(dogs_name, self)
  end  
  
  def walk_dogs
    Dog.all.each do |doggie|
      doggie.mood = "happy"
    end
  end  
  
  def feed_cats
   Cat.all.each do |hungry_cats|
    hungry_cats.mood = "happy"
    end
  end  
  
  def sell_pets
    [dogs, cats].each do |pets|
      pets.each do |value|
      value.mood = "nervous"
      value.owner = nil
      end
    end
  end  
  
  def list_pets
    return "I have #{self.count} dog (s), and #{self.count} cat (s)."
  end  
end