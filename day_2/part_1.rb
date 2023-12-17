# input = [
# "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green",
# "Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue",
# "Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red",
# "Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red",
# "Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green",
# ]

input = File.read("input.txt").split("\n")

def max_colour(game_input, colour)
  game_input.scan(/(\d+) #{colour}/).flatten.map(&:to_i).max || 0 # || 0 in case nil
end

output = input.reduce(0) do |sum, game|
  game_num = /Game (\d+):/.match(game)[1].to_i

  green_max = max_colour(game, 'green')
  blue_max = max_colour(game, 'blue')
  red_max = max_colour(game, 'red')

  red_max <= 12 && green_max <= 13 && blue_max <= 14 ? sum + game_num : sum
end

puts output