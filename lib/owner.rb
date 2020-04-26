require 'pry'
class Owner
  # attr_accessor :cats, :dogs
  attr_reader :name, :species
  @@all = []
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end
  def say_species
    "I am a human."
  end
  def self.all
    @@all
  end
  def cats
    Cat.all.select {|cat| cat.owner == self}
  end
  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end
  def walk_dogs
    self.dogs.each {|dog|dog.mood="happy"}
  end
  def feed_cats
    self.cats.each {|cat|cat.mood="happy"}
  end
  def buy_cat(cat_name)
    Cat.new(cat_name,self)
  end
  def buy_dog(dog_name)
    Dog.new(dog_name,self)
  end
  def sell_pets
    # binding.pry
    self.cats.each {|cat|cat.mood="nervous" ; cat.owner=nil}
    self.dogs.each {|dog|dog.mood="nervous" ; dog.owner=nil}
  end
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

  def self.count
    @@all.length
  end
  def self.reset_all
    @@all = []
  end
end