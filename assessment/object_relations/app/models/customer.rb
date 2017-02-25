require_relative 'restaurant.rb'
require_relative 'review.rb'

require 'pry'

class Customer
	attr_reader :name
	attr_accessor :reviews
	@@all = []
	def initialize(name)
		@name = name
		@reviews = []
		@@all << self
	end

	def self.all
		@@all
	end

	def self.find_by_name(name)
# 		good use of the method instead of the class variable.
		self.all.find do |customer|
			customer.name == name
		end
	end

	def add_review(string,restaurant)
# 		looks good.
		review = Review.new(string)
		self.reviews << review
		review.customer = self
		review.restaurant = restaurant
		restaurant.reviews << review
	end
end

customer = Customer.new('bob')
  # <>
customer.add_review('it was good', Restaurant.new('Chicken Place'))
  # result: a new review tied ot the restaurant, and tied to the customer
binding.pry
