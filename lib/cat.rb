class Cat
  attr_accessor :owner, :mood
  attr_reader :name

  @@all = []

  def initialize(name, owner, mood = "nervous")
    @name = name
    self.owner = owner
    self.mood = mood
    self.class.all.push(self)
  end

  def self.all
    @@all
  end
  
end