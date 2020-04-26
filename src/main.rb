#Main Application
def add_case
	puts "Please enter name of the item"
		name = gets.chomp
	
		puts "Please enter quantity of the #{name}"
	
	    	begin			
				quantity = gets.chomp.to_i
			rescue
				puts "Please enter quantity for #{name} in whole numbers only"
			end
	
		if $category == "DAIRY"
				Dairy.add_item(name,quantity)
			elsif $category == "MEAT"
				Meat.add_item(name,quantity)
			else Grocery.add_item(name,quantity)
		end
	
				
		puts "Any more items to add under this category ? Answer Y/N."
	  	$yes_no = gets.chomp.upcase
end

def del_case
	puts "Please enter name of the item"
		name = gets.chomp
	
		puts "Please enter quantity of the #{name}"
	
	    	begin			
				quantity = gets.chomp.to_i
			rescue
				puts "Please enter quantity for #{name} in whole numbers only"
			end
	
	if $category == "DAIRY"
				Dairy.remove_item(name,quantity)
			elsif $category == "MEAT"
				Meat.remove_item(name,quantity)
			else Grocery.remove_item(name,quantity)
		end
	
	puts "Any more items to delete from this category ? Answer Y/N."
	  	$yes_no = gets.chomp.upcase
	
end

require_relative "./classes/dairy.rb"
require_relative "./classes/grocery.rb"
require_relative "./classes/meat.rb"
$yes_no = "Y"
puts " WELCOME TO INVENTORY MANAGEMENT APP"

goback_flag = false
until goback_flag
	puts "PLEASE CHOOSE ONE OF THE FOLLOWING MENU OPTIONS:"
	puts "OPTION 1 : TO ADD NEW STOCK TO THE INVENTORY"
	puts "OPTION 2 : TO REMOVE USED STOCK FROM THE INVENTORY"
	puts "OPTION 3 : TO VIEW CURRENT STOCK ON HAND"

	begin
	   	option = gets.chomp.to_i
	rescue TypeError
		puts "PLEASE ENTER THE APPROPRIATE OPTION NUMBER"
	end

#TO GET CATEGORY FROM THE INVENTORY
	puts "PLEASE CHOOSE YOUR CATEGORY FROM THE FOLLOWING OPTIONS:"
	puts "DAIRY, MEAT, GROCERY."
	$category = gets.chomp.upcase
	
	case
		when option == 1
		    go_on = false
			until go_on
				add_case
				if $yes_no == "N" 
		     		go_on = true
				end	
			end
		puts "Inventory has been updated"
	
		when option == 2
			go_on = false
			until go_on
				del_case
				if $yes_no == "N" 
		     		go_on = true
				end	
			end
		puts "Inventory has been updated"
	
	
		when option == 3
	
			if $category == "DAIRY"
				Dairy.view_inventory
			elsif $category == "MEAT"
				Meat.view_inventory
			else Grocery.view_inventory
			end
	
	end

	puts "DO YOU WANT TO GO TO MAIN MENU OPTION ? ANSWER Y/N"
	go_back = gets.chomp.upcase
	if go_back == "N"
		goback_flag = true
	end

end

