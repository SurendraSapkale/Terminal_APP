require_relative "inventory.rb"

class Dairy < Inventory
	
	def initialize
		@unit = "Ltr"
		super :item, :quantity
		
	end
	
end