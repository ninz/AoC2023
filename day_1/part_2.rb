require 'pp'

input = File.read("input.txt").split

number_mapping = {"one" => "1", "two" => "2", "three" => "3", "four" => "4", "five" => "5", "six" => "6", "seven" => "7", "eight" => "8", "nine" => "9"}

# input = %w[
# 	two1nine
# 	eightwothree
# 	abcone2threexyz
# 	xtwone3four
# 	4nineeightseven2
# 	zoneight234
# 	7pqrstsixteen
# ]

File.open("intermediate_output_part_2.txt", "w") do |out|

	input.map! do |x|
		# puts x

		min_indices = {}
		number_mapping.each do |letters, digit|
			min_indices[letters] = x.index(letters)
		end


		min = min_indices.reject {|k, v| v.nil?}.min {|pair1, pair2| pair1[1] <=> pair2[1] }


		max_indices = {}
		number_mapping.each do |letters, digit|
			max_indices[letters] = x.rindex(letters)
		end

		max = max_indices.reject {|k, v| v.nil?}.max {|pair1, pair2| pair1[1] <=> pair2[1] } 


		# pp(x, min, max)
		# puts '-----'

		x.gsub!(Regexp.new(min[0]), number_mapping[min[0]]) unless min.nil?
		x.gsub!(Regexp.new(max[0]), number_mapping[max[0]])
		# out << "#{x}\n"
		# puts x
		# puts "====="
		x
	end
end


solution = input.reduce(0) do |memo, word|
	puts word
	new_word = word.delete "a-z"
	puts new_word
	code = new_word.length > 1 ? (new_word[0] + new_word[-1]).to_i : new_word[0].to_i
	puts code
	puts "-----"
	memo + code
end

puts solution
