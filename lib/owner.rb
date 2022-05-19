class Owner
  # code goes here
  attr_reader :name
  @@all = []

  def initialize name
    @name = name
    species
    @@all << self
  end

  def species 
    "human"
  end

  def say_species
    p "I am a #{species}."
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

  def cats 
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs 
    Dog.all.select { |dog| dog.owner == self}
  end

  def buy_cat name
    Cat.new(name, owner = self, mood= "")
  end
  
  def buy_dog name
    Dog.new(name, owner = self, mood= "")
  end

  def walk_dogs 
    self.dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    pets = self.dogs + self.cats
    pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end

  def list_pets 
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end