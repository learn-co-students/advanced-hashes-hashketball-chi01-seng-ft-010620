def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {
          :player_name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        {
          :player_name => "Reggie Evans",
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        {
          :player_name => "Brook Lopez",
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        {
          :player_name => "Mason Plumlee",
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        {
          :player_name => "Jason Terry",
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {
          :player_name => "Jeff Adrien",
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        {
          :player_name => "Bismack Biyombo",
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        },
        {
          :player_name => "DeSagna Diop",
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        {
          :player_name => "Ben Gordon",
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        {
          :player_name => "Kemba Walker",
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
      ]
    }
  }
end


def num_points_scored(player_name)
  points = 0 
  players_array = game_hash[:home][:players] + game_hash[:away][:players]
  players_array.each do |player|
    if player[:player_name] == player_name
      points += player[:points]
    end
  end
  points
end


def shoe_size(player_name)
  player_shoe_size = 0 
  players_array = game_hash[:home][:players] + game_hash[:away][:players]
  players_array.each do |player|
    if player[:player_name] == player_name
      player_shoe_size = player[:shoe]
    end
  end
  player_shoe_size
end


def team_colors(team_name)
  colors = []
  game_hash.each do |location, team|
    if team[:team_name] == team_name
      colors = team[:colors]
    end
  end
  colors
end


def team_names
  new_array = game_hash.map do |location, team|
   team[:team_name] 
  end
  new_array
end


def player_numbers(team_name)
  new_array = []
  game_hash.each do |location, team|
    if team[:team_name] == team_name
     current_players = team[:players]
     new_array = current_players.map do |player|
       player[:number]
     end
   end
  end
  new_array.sort
end


def player_stats(player_name)
  players_array = game_hash[:home][:players] + game_hash[:away][:players]
  players_array.each do |player|
    if player[:player_name] == player_name
      player.delete(:player_name)
      return player
    end
  end
end


def big_shoe_rebounds
  largest_shoe = 0
  largest_player = ""
  players_array = game_hash[:home][:players] + game_hash[:away][:players]
  players_array.each do |player|
    if player[:shoe] > largest_shoe
      largest_shoe = player[:shoe]
      largest_player = player
    end
  end
  largest_player[:rebounds]
end


def most_points_scored
  high_score = 0 
  highest_scoring_player = ""
  players_array = game_hash[:home][:players] + game_hash[:away][:players]
  players_array.each do |player|
    if player[:points] > high_score
      high_score = player[:points]
      highest_scoring_player = player[:player_name]
    end
  end
  highest_scoring_player
end


def winning_team
  home_total = 0 
  away_total = 0 
  game_hash[:home][:players].each do |player|
    home_total += player[:points]
  end
  game_hash[:away][:players].each do |player|
    away_total += player[:points]
  end
  if home_total > away_total
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end


def player_with_longest_name
  current_longest_name = 0 
  longest_player = ""
  players_array = game_hash[:home][:players] + game_hash[:away][:players]
  players_array.each do |player|
    if player[:player_name].length > current_longest_name
      current_longest_name = player[:player_name].length
      longest_player = player[:player_name]
    end
  end
  longest_player
end


def long_name_steals_a_ton?
  current_longest_name = 0 
  longest_player = ""
  players_array = game_hash[:home][:players] + game_hash[:away][:players]
  players_array.each do |player|
    if player[:player_name].length > current_longest_name
      current_longest_name = player[:player_name].length
      longest_player = player[:player_name]
    end
  end
  current_most_steals = 0 
  thieving_player = ""
  players_array.each do |player|
    if player[:steals] > current_most_steals
      current_most_steals = player[:steals]
      thieving_player = player[:player_name]
    end
  end
  if longest_player == thieving_player
    return true 
  else
    return false 
  end
end




