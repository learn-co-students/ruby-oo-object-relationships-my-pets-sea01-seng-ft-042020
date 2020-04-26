require 'pry'
class Owner
  # code goes here
  attr_reader :species, :name
  @@all = []
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end
  def say_species
    "I am a #{species}."
  end
  def self.all
    @@all
  end
  def self.count
    self.all.count
  end
  def self.reset_all
    #binding.pry
    @@all.clear
  end
  def cats
    Cat.all.select {|cat| cat.owner == self}
  end
  def dogs
    Dog.all.select {|dog| dog.owner ==self}
  end
  def pets
    #binding.pry
    dogs + cats
  end
  def buy_cat(cat)
    #binding.pry
    Cat.new(cat,self)
  end
  def buy_dog(dog)
    Dog.new(dog, self)
  end
  def walk_dogs
    self.dogs.select {|dog| dog.mood = "happy"}
  end
  def feed_cats
    self.cats.select {|cat| cat.mood = "happy"}
  end
  def sell_pets
    #binding.pry
    self.pets.select {|pets| pets.mood = "nervous" ; pets.owner = nil}
  end
  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end
