#!/usr/bin/env ruby
require_relative '../lib/player'
require_relative '../lib/board'

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

puts "Enter name for player 2 (0): "
player_two = gets.strip.capitalize

while player_one == player_two do
  puts "Please enter another name for the player 2 (0), different from #{player_one}: "
  player_two = gets.strip.capitalize
end

player_one = Player.new(player_one, 'X')
player_two = Player.new(player_two, '0')

official_board = Board.new 

puts "Great! We are all set. #{player_one.name} will play #{player_one.mark}s and #{player_two.name} will play #{player_two.mark}s."
puts official_board.print_board

play_target = -1

while official_board.plays_count < 9 do
  if (official_board.plays_count % 2 == 0) 
    puts "Its #{player_one.name}'s turn. Enter a valid board position to play: "
    play_target = gets.chomp
    official_board.update_cell(play_target, player_one.mark)
  else 
    puts "Its #{player_two.name}'s turn. Enter a valid board position to play: "
    play_target = gets.chomp
    official_board.update_cell(play_target, player_two.mark)
  end
  puts official_board.print_board
end
