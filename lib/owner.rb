
class Owner
  attr_reader :name, :species, :mood
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    save
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
    @@all.clear
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def buy_cat(cat_name)
    new_cat = Cat.new(cat_name, self)
  end

  def feed_cats
    my_cats = self.cats
    my_cats.map do |cat|
      cat.mood = "happy"
    end
  end
  

  
  def dogs
    Dog.all.select {|dog| dog.owner == self}  
  end
  
  
  def buy_dog(dog_name)
    new_dog = Dog.new(dog_name, self)
  end

  def walk_dogs
    my_dogs = self.dogs
    my_dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def sell_pets
    self.dogs.map do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
    self.cats.map do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

  def say_species
    "I am a human."
  end

end