require_relative "inventory.rb"

class Grocery < Inventory
	
	def initialize
		@unit= "Kg"
	    super :item, :quantity
	end
	
end