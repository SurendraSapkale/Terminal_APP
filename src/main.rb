require 'colorize'
require 'pastel'

#Main Application
def add_case
	puts "Please enter name of the item"
		name = gets.chomp
	
		puts "Please enter quantity of the #{name}"
	
	    	begin			
				quantity = Integer(gets.chomp)
			rescue ArgumentError
                puts "Please enter quantity for #{name} in whole numbers only".red
                exit
			end
	
		if $category == "DAIRY"
				Dairy.add_item(name,quantity,$category)
			elsif $category == "MEAT"
				Meat.add_item(name,quantity,$category)
			else Grocery.add_item(name,quantity,$category)
		end
	
				
		puts "Any more items to add under this category ? Answer Y/N."
	  	$yes_no = gets.chomp.upcase
end

def del_case
	puts "Please enter name of the item"
		name = gets.chomp
	
		puts "Please enter quantity of the #{name}"
	
	    	begin			
				quantity = Integer(gets.chomp)
			rescue ArgumentError
                puts "Please enter quantity for #{name} in whole numbers only".red
                exit
			end
	
    	if $category == "DAIRY"
				Dairy.remove_item(name,quantity,$category)
			elsif $category == "MEAT"
				Meat.remove_item(name,quantity,$category)
			else Grocery.remove_item(name,quantity,$category)
		end
	
	puts "Any more items to delete from this category ? Answer Y/N."
	  	$yes_no = gets.chomp.upcase
	
end

require_relative "./classes/dairy.rb"
require_relative "./classes/grocery.rb"
require_relative "./classes/meat.rb"
require 'terminal-table'

$yes_no = "Y"

pastel = Pastel.new
color_text = pastel.blue("WELCOME TO INVENTORY MANAGEMENT APP")

rows = []
rows << [""]
table = Terminal::Table.new :title => color_text, :rows => rows
puts table

puts " "
goback_flag = false
until goback_flag
    puts "PLEASE CHOOSE ONE OF THE FOLLOWING MENU OPTIONS:".blue.on_white
    puts " "
	puts "OPTION 1 : TO ADD NEW STOCK TO THE INVENTORY".green.on_black
	puts "OPTION 2 : TO REMOVE USED STOCK FROM THE INVENTORY".red.on_black
	puts "OPTION 3 : TO VIEW CURRENT STOCK ON HAND".blue.on_black

	begin
	   	option = Integer(gets.chomp)
	rescue ArgumentError
        puts "PLEASE ENTER THE APPROPRIATE OPTION NUMBER".red
        exit
	end

#TO GET CATEGORY FROM THE INVENTORY
	puts "PLEASE CHOOSE YOUR CATEGORY FROM THE FOLLOWING OPTIONS:".blue.on_white
	puts "DAIRY, MEAT, GROCERY.".yellow.on_black
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
		puts "Inventory has been updated".green
	
		when option == 2
			go_on = false
			until go_on
				del_case
				if $yes_no == "N" 
		     		go_on = true
				end	
			end
		puts "Inventory has been updated".green
	
	
		when option == 3
	
			if $category == "DAIRY"
				Dairy.view_inventory($category)
			elsif $category == "MEAT"
				Meat.view_inventory($category)
			else Grocery.view_inventory($category)
			end
	
	end

	puts "DO YOU WANT TO GO TO MAIN MENU OPTION ? ANSWER Y/N".white.on_black
	go_back = gets.chomp.upcase
	if go_back == "N"
		goback_flag = true
	end

end


