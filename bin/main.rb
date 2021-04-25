#!/usr/bin/env ruby
require_relative '../lib/player'
require_relative '../lib/board'

def empty_name?(name)
  name == ''
end

def valid_position?(value)
  value.positive? && value < 10
end

def different_names?(name1, name2)
  name1 == name2
end

puts '
_______ _          _______             _______
|__   __(_)        |__   __|           |__   __|
   | |   _  ___ ______| | __ _  ___ ______| | ___   ___
   | |  | |/ __|______| |/ _` |/ __|______| |/ _ \ / _ \
   | |  | | (__       | | (_| | (__       | | (_) |  __/
   |_|  |_|\___|      |_|\__,_|\___|      |_|\___/ \___|
	 '

puts "Welcome to the game. Let's get started! \nPlease enter name for player 1 (X): "
player_one = gets.strip.capitalize
while empty_name?(player_one)
  puts 'Enter a non-empty name for player 1 (X): '
  player_one = gets.strip.capitalize
end

puts 'Enter name for player 2 (0): '
player_two = gets.strip.capitalize
while empty_name?(player_two)
  puts 'Enter a non-empty name for player 2 (0): '
  player_two = gets.strip.capitalize
end

while different_names?(player_one, player_two)
  puts "Please enter another name for the player 2 (0), different from #{player_one}: "
  player_two = gets.strip.capitalize
  while empty_name?(player_two)
    puts 'Enter a non-empty name for player 2 (0): '
    player_two = gets.strip.capitalize
  end
end

player_one = Player.new(player_one, 'X')
player_two = Player.new(player_two, '0')

official_board = Board.new

puts 'Great! We are all set.'
puts "#{player_one.name} will play #{player_one.mark}s and #{player_two.name} will play #{player_two.mark}s."
puts ''
puts official_board.print_board

while official_board.plays_count < 9
  if official_board.plays_count.even?
    puts "Its #{player_one.name}'s turn. Enter the position you want to mark: "
    play_target = gets.to_i
    until valid_position?(play_target) && official_board.free_cell?(play_target)
      puts 'Please enter a valid position in the board (1-9) that is not marked already.'
      play_target = gets.to_i
    end
    official_board.update_cell(play_target, player_one.mark)
  else
    puts "Its #{player_two.name}'s turn. Enter the position you want to mark: "
    play_target = gets.to_i
    until valid_position?(play_target) && official_board.free_cell?(play_target)
      puts 'Please enter a valid position in the board (1-9) that is not marked already.'
      play_target = gets.to_i
    end
    official_board.update_cell(play_target, player_two.mark)
  end
  puts official_board.print_board
end
