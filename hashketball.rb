def game_hash
  big_hash = {
    :home => {
      :team_name => "Brooklyn Nets", 
      :colors => ["Black", "White"], 
      :players => [{
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
      },
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
      },
        ]
    },
  }
end

def num_points_scored(name)
  game_hash.each do |homeaway, keys|
    keys[:players].each do |player|
      if player[:player_name] == name
      return player[:points]
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |homeaway, keys|
    keys[:players].each do |player|
      if player[:player_name] == name
      return player[:shoe]
      end
    end
  end
end

def team_colors(team)
  game_hash.each do |homeaway, keys|
    if keys[:team_name] == team 
    return keys[:colors]
    end
  end
end

def team_names
  name_array = []
  name_array.push(game_hash[:home][:team_name])
  name_array.push(game_hash[:away][:team_name])
end

def player_numbers(team)
  number_array = []
  game_hash.each do |homeaway, keys|
    keys[:players].each do |player|
    if keys[:team_name] == team
      number_array.push(player[:number])
    end
  end
end
number_array
end

def player_stats(name)
  stats_hash = {}
  game_hash.each do |homeaway, keys|
    keys[:players].each do |player|
      if player[:player_name] == name
      stats_hash = {:number => player[:number], :shoe => player[:shoe], :points => player[:points], :rebounds => player[:rebounds], :assists => player[:assists], :steals => player[:steals], :blocks => player[:blocks], :slam_dunks => player[:slam_dunks]}
      end
    end
  end
  stats_hash
end

def big_shoe_rebounds
  size = 0 
  rebounds = 0
  game_hash.each do |homeaway, keys|
    keys[:players].each do |player|
      if player[:shoe] > size
        size = player[:shoe]
        rebounds = player[:rebounds]
      end
    end
  end
  rebounds
end

def most_points_scored
  points = 0
  name = " "
  game_hash.each do |homeaway, keys|
    keys[:players].each do |player|
      if player[:points] > points 
        points = player[:points]
        name = player[:player_name]
      end
    end
  end
  name
end

def winning_team 
  home_scores = []
  away_scores = [] 
  team = ""
  game_hash[:home][:players].each do |player|
    home_scores.push(player[:points])
  end
  game_hash[:away][:players].each do |player|
    away_scores.push(player[:points])
  end
  home_total = home_scores.reduce(0){|sum, n| sum + n }
  away_total = away_scores.reduce(0){|sum, n| sum + n }
  if home_total > away_total
    game_hash[:home][:team_name]
  else
    game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  longest = 0
  name = ""
  game_hash.each do |homeaway, keys|
    keys[:players].each do |player|
      if player[:player_name].length > longest
        longest = player[:player_name].length
        name = player[:player_name]
      end
    end
  end
  name
end

def long_name_steals_a_ton?
  longest_name = player_with_longest_name
  steals = 0
  name = 0
  game_hash.each do |homeaway, keys|
    keys[:players].each do |player|
      if player[:steals] > steals
        steals = player[:steals]
        name = player[:player_name]
      end
    end
  end
  if name == longest_name
    return true
  else
    return false
  end
end



