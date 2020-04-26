File.open("dairy.txt", "r")
input_lines = File.readlines("dairy.txt")
output_lines = Array.new(0)

input_lines.map do |line|
		line_contents = line.split
			if line_contents[0] == "Milk"
				add_quantity = line_contents[1].to_i + 2
				line_contents[1] = add_quantity
				output_lines << line_contents.join(' ')
			else
				output_lines << line_contents.join(' ')
			end
end	

File.new("dairy_new.txt", 'w+')
File.open("dairy_new.txt", "w+") do |f|
  f.puts(output_lines)
end

require 'fileutils'
FileUtils.mv('dairy_new.txt', 'dairy.txt')

#p output_lines
#File.new("dairy_new.txt", 'w+')
#File.open("dairy_new.txt", 'w+') do |i|
#	output_lines.each { |element| i.puts(element)}
#end
