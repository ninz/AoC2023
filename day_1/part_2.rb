require 'pp'

input = File.read("input.txt").split

number_mapping = {"one" => "1", "two" => "2", "three" => "3", "four" => "4", "five" => "5", "six" => "6", "seven" => "7", "eight" => "8", "nine" => "9"}

edge_case_replacements = {
  "oneight" => "18",
  "twone" => "21",
  "threeight" => "38",
  "fiveight" => "58",
  "sevenine" => "79",
  "eightwo" => "82",
  "eighthree" => "83",
  "nineight" => "98"
}

# input = %w[
#   two1nine
#   eightwothree
#   abcone2threexyz
#   xtwone3four
#   4nineeightseven2
#   zoneight234
#   7pqrstsixteen
# ]


input.map! do |x|
  edge_case_replacements.each {|weird, normal| x.gsub!(Regexp.new(weird), normal)}
  number_mapping.each {|letters, digit| x.gsub!(Regexp.new(letters), digit)}
  x
end


solution = input.reduce(0) do |memo, word|
  new_word = word.delete "a-z"
  code = (new_word[0] + new_word[-1]).to_i
  memo + code
end

puts solution
