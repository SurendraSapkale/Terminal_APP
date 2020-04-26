file = File.open("dairy.txt", "r+")
	
#File.foreach("dairy.txt") { 
#	|line| 
	file.each_with_index do |line, index|
		
		puts line
		puts index
	
		line_contents = Array.new(0)
		line_contents = line.split
		if line_contents[0] == "Milk"
			add_quantity = line_contents[1].to_i + 2
			line_contents[1] = add_quantity.to_s
		new_line = line_contents.join(" ")
			p new_line
#		line.puts ("#{new_line}",line_num)
#			line.gsub("#{line}", "#{new_line}")
		file.rewind
 		file.write("#{new_line}")
		end
	end
		#}



#file='GettysburgAddress.txt'
#File.readlines(file).each do |line|
#  puts line
#end
