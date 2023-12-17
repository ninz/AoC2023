# input = %w{ 1abc2 pqr3stu8vwx a1b2c3d4e5f treb7uchet}
input = File.read("input.txt").split

solution = input.reduce(0) do |memo, word|
  new_word = word.delete "a-z"
  code = (new_word[0] + new_word[-1]).to_i
  memo + code
end

puts solution
