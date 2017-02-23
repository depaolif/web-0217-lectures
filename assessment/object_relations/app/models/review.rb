class Review
	attr_reader :text
	attr_accessor :customer, :restaurant
	@@all = []
	def initialize(text)
		@text = text
		@@all << self
	end

	def self.all
		@@all
	end

end

