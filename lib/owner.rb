require "pry"
class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name, species = "human")
    @name = name
    @species = species
    self.class.all.push(self)
  end

  def say_species
     "I am a #{self.species}."
  end

  def cats
    Cat.all.select {|instance| instance.owner == self}
  end

  def dogs
    Dog.all.select {|instance| instance.owner == self}
  end

  def buy_cat(name)
    Cat.new(name,self)
  end

  def buy_dog(name)
    Dog.new(name,self)
  end

  def walk_dogs
    Dog.all.map {|instance| instance.mood = "happy"}
  end

  def feed_cats
    Cat.all.map {|instance| instance.mood = "happy"}
  end

  def sell_pets
    Cat.all.map do |instance|
      instance.mood = "nervous"
     instance.owner = nil
    end
    Dog.all.map do |instance|
      instance.mood = "nervous"
     instance.owner = nil
    end

  end

  def list_pets
    cat_count = self.cats.count
    dog_count = self.dogs.count
    "I have #{dog_count} dog(s), and #{cat_count} cat(s)."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

end