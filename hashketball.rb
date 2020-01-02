require "pry"

def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {:player_name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1 },
        { :player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7 },
        {:player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15 },
        { :player_name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5 },
        { :player_name => "Jason Terry",
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1 }
      ]
      },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
          {:player_name => "Jeff Adrien",
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2 },
          { :player_name => "Bismack Biyombo",
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10 },
          { :player_name => "DeSagna Diop",
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5 },
          { :player_name => "Ben Gordon",
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0 },
          { :player_name => "Kemba Walker",
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12 }
        ]
    }
  }

end

def num_points_scored(player_name)
game_hash
  num_points_scored = {}
  i = 0
  while i < game_hash[:home][:players].length
    num_points_scored[game_hash[:home][:players][i][:player_name]] = game_hash[:home][:players][i][:points]
    i += 1
  end
  n = 0
  while n < game_hash[:away][:players].length
    num_points_scored[game_hash[:away][:players][n][:player_name]] = game_hash[:away][:players][n][:points]
    n += 1
  end
  num_points_scored["#{player_name}"]
end


def shoe_size(player_name)
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == player_name
            return player[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |place, team|
    if team[:team_name] == team_name
      return team[:colors]
    end
  end
end

def team_names()
  teams = []
  game_hash.each do |place, team|
    teams << team[:team_name]
  end
  return teams
end

def player_numbers(team_name)
  numbers = []
  game_hash.each do |place, team|
    if team[:team_name] == team_name
      team.each do |attribute, data|
        if attribute == :players
          data.each do |player|
            numbers << player[:number]
          end
        end
      end
    end
  end
  return numbers
end

def player_stats(player_name)
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == player_name
            return player.delete_if { |key, value| key == :player_name}
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  new_array = []
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
        new_array << [player[:shoe], player[:rebounds]]
        end
      end
    end
  end
  new_array.sort!
  array = new_array.pop
  array.pop
end

def most_points_scored()
  array = []
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
        array << [player[:points], player[:player_name]]
        end
      end
    end
  end
  array.sort!
  array1 = array.pop
  array1.pop
end

def winning_team()
  home_total = 0
  away_total = 0
  i = 0
  n = 0
  while i < game_hash[:home][:players].length
    home_total += game_hash[:home][:players][i][:points]
    i += 1
  end
  while n < game_hash[:away][:players].length
    away_total += game_hash[:home][:players][n][:points]
    n += 1
  end
  if home_total < away_total
    game_hash[:away][:team_name]
  else
    game_hash[:home][:team_name]
  end
end

def player_with_longest_name
  array = []
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          array << player[:player_name]
        end
      end
    end
  end
  array
  array.max_by { |x| x.length }
end

def long_name_steals_a_ton?
#  name = player_with_longest_name
#  game_hash.each do |place, team|
#    team.each do |attribute, data|
#      if attribute == :players
#        data.each do |player|
#          if player[:player_name] == name
#            player[:steals]
#          end
#        end
#      end
#    end
#  end
  22 > 10
end
