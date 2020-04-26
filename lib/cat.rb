require 'pry'
class Cat
  attr_accessor :mood
  attr_reader :name, :owner
  @@all = []
  def initialize(name,owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@all << self
  end
  def owner=(owner)
    @owner = owner
  end

  def self.all
    @@all
  end
end