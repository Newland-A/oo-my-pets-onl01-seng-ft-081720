require 'pry'
class Owner
  # code goes here
  # attr_accessor  :pets
  attr_reader  :name, :species

  @@all = []
  
  #instance methods
  def initialize(name)
    #name equals victoria
    @name = name
    #name returns owner
    # @pets = pets
    @@all << self
    @species = "human"
    
   #binding.pry
  end
  #@@pets returns 
  def say_species
    "I am a #{@species}."
  end
#pets
  def cats
    Cat.all.select{|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select{|dog| dog.owner == self}
  end

  # def buy_cat(name)
  #   name = Cat.new(name)
  #   @pets[:cats] << name 
  # end 
  def buy_cat(name)
    name = Cat.new(name, self)
  end 

  def buy_dog(name)
    name = Dog.new(name, self)
  end 

  def walk_dogs
    dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    cats.each {|cat| cat.mood = "happy"}
  end
  def sell_pets
    pets = cats + dogs
    pets.each {|pet| pet.mood = "nervous"}
    pets.each {|pets| pets.owner = nil}
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

#class methods

  def self.all
    #returns empty array
    @@all
    #binding.pry
  end

  def self.reset_all
    #returns empty array like its supposed too.
    @@all.clear
  end

  def self.count
    #counts the length of the owners array
    @@all.length
    #binding.pry
  end
  #binding.pry
end

