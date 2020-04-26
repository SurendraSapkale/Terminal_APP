require_relative "inventory.rb"

class Meat < Inventory
	
	def initialize
		@unit= "Kg"
	    super :item, :quantity
	end
	
end