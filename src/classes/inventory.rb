require 'fileutils'
require 'colorize'
class Inventory
	attr_accessor :item, :quantity, :category
	
	
	def initialize
		@item =""
		@quantity = 0
		@category = ""
	end
	
	def self.add_item(name, quantity,category)
		if category == "DAIRY"
			ifile_name = "./classes/dairy.txt"
			ofile_name = "./classes/dairy_new.txt"
		elsif category == "MEAT"
			ifile_name = "./classes/meat.txt"
			ofile_name = "./classes/meat_new.txt"
		else
			ifile_name = "./classes/grocery.txt"
			ofile_name = "./classes/grocery_new.txt"
		end
		File.open("#{ifile_name}", "r")
		input_lines = File.readlines("#{ifile_name}")
		output_lines = Array.new(0)
		input_lines.map do |line|
			line_contents = line.split
			if line_contents[0] == name
				add_quantity = line_contents[1].to_i + quantity
				line_contents[1] = add_quantity
				output_lines << line_contents.join(' ')
			else
				output_lines << line_contents.join(' ')
			end
		end	

		File.new("#{ofile_name}", 'w+')
		File.open("#{ofile_name}", "w+") do |f|
  		f.puts(output_lines)
	end
        FileUtils.mv("#{ofile_name}", "#{ifile_name}")
		
	end
	
	def self.remove_item(name, quantity,category)
		
		if category == "DAIRY"
			ifile_name = "./classes/dairy.txt"
			ofile_name = "./classes/dairy_new.txt"
		elsif category == "MEAT"
			ifile_name = "./classes/meat.txt"
			ofile_name = "./classes/meat_new.txt"
		else
			ifile_name = "./classes/grocery.txt"
			ofile_name = "./classes/grocery_new.txt"
		end
		
		
		File.open("#{ifile_name}", "r")
		input_lines = File.readlines("#{ifile_name}")
		output_lines = Array.new(0)
		input_lines.map do |line|
			line_contents = line.split
			if line_contents[0] == name
				add_quantity = line_contents[1].to_i - quantity
				line_contents[1] = add_quantity
				output_lines << line_contents.join(' ')
			else
				output_lines << line_contents.join(' ')
			end
		end	

		File.new("#{ofile_name}", 'w+')
		File.open("#{ofile_name}", "w+") do |f|
  		f.puts(output_lines)
		end		
        
		FileUtils.mv("#{ofile_name}", "#{ifile_name}")
		
	end
	
	def self.view_inventory(category)
		
		if category == "DAIRY"
			ifile_name = "./classes/dairy.txt"
		elsif category == "MEAT"
			ifile_name = "./classes/meat.txt"
		else
			ifile_name = "./classes/grocery.txt"
		end
		
		
		file = File.open("#{ifile_name}", "r")
		puts"INVENTORY ITEMS ARE:".black.on_white
		puts file.read
		file.close
	end
end