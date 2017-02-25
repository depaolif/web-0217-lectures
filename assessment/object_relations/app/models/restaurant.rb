class Restaurant
	attr_accessor :reviews, :name
	@@all = []
  
  def initialize(name=nil)
  	@name = name
  	@reviews = []
  	@@all << self
  end

  def self.all
  	@@all
  end

  def self.find_by_name(name)
  	self.all.find do |restaurant|
		restaurant.name == name
	end
  end

  def customers
# 	  great job here.
  	self.reviews.map do |review|
  		review.customer
  	end
  end

end
