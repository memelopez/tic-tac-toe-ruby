#!/usr/bin/env ruby
require_relative '../lib/player'
require_relative '../lib/board'
require_relative '../lib/game'

def valid_position?(value)
  value.positive? && value < 10
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
while player_one.empty?
  puts 'Enter a non-empty string name for player 1 (X): '
  player_one = gets.strip.capitalize
end

puts 'Enter name for player 2 (0): '
player_two = gets.strip.capitalize
while player_two.empty?
  puts "Enter a non-empty string for player 2 's name (0): "
  player_two = gets.strip.capitalize
end

while player_one == player_two
  puts "Please enter another name for the player 2 (0), different from #{player_one}: "
  player_two = gets.strip.capitalize
  while player_two.empty?
    puts "Enter a non-empty string for player 2 's name (0): "
    player_two = gets.strip.capitalize
  end
end

player_one = Player.new(player_one, 'X')
player_two = Player.new(player_two, '0')

official_game = Game.new(player_one, player_two)

puts official_game.beginning_message
puts official_game.display_board

begin
  puts "It's #{official_game.whos_turn_player.name}'s turn.(#{official_game.whos_turn_player.mark})."
  puts 'Enter the position you want to mark: '
  play_target = gets.to_i

  until valid_position?(play_target) && official_game.available_pos?(play_target)
    puts "#{official_game.whos_turn_player.name}, please enter a valid position in the board (1-9) that is not marked already."
    play_target = gets.to_i
  end

  official_game.make_play(play_target, official_game.whos_turn_player.mark)
  puts official_game.display_board

end while !official_game.game_over?

puts official_game.show_result
