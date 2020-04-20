# Write your code below game_hash
require "pry"

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def player_helper(game_hash)
  game_hash[:home][:players].concat(game_hash[:away][:players]) #combines the two player arrays into 1 array
end


def player_stats(player_name)
  player_helper(game_hash).each do |stats_hash| #selects through each player hash
    if stats_hash[:player_name] === player_name #if a players name matches our given name, it returns that players stats
     return stats_hash
    end
  end
end

def player_with_biggest(key_youre_compairing) #this function finds the player with the largest value from a key
  largest = 0
  player_hash = nil
  player_helper(game_hash).map do |data|
    if largest < data[key_youre_compairing]
      largest = data[key_youre_compairing]
      player_hash = data
    end
  end
  return player_hash #returns only the hash to allow for more usability
end

def team_helper(team)
  game_hash.map {|key, value| if value[:team_name] === team 
      return value end }
end

def num_points_scored(player_name)
  player_stats(player_name)[:points]
end

def shoe_size(player_name)
  player_stats(player_name)[:shoe]
end

def team_colors(team)
  team_helper(team)[:colors]
end

def team_names
  [game_hash[:home][:team_name], game_hash[:away][:team_name]]
end

def player_numbers(team)
  team_helper(team)[:players].map {|num| num[:number]}
end

def big_shoe_rebounds
  return player_with_biggest(:shoe)[:rebounds]
end

def most_points_scored
 return player_with_biggest(:points)[:player_name]
end

def team_total_points(home_or_away) #totals the points of a particular team
  total = 0
  i = 0
  while i < game_hash[home_or_away][:players].count
    total += game_hash[home_or_away][:players][i][:points] #increases the total with every player passed
    i+=1
  end
  return total
end

def winning_team
  if team_total_points(:home) > team_total_points(:away) #compaires the point totals for each team returned from the function
    return game_hash[:home][:team_name]
  end
  return game_hash[:away][:team_name]
end


def player_with_longest_name #exact same as 'player_with_biggest' but had to allow for '.length' to get an int from the string
  largest = 0
  player_hash = nil
  player_helper(game_hash).map do |data|
    if largest < data[:player_name].length
      largest = data[:player_name].length
      player_hash = data
    end
  end
  return player_hash[:player_name]
end
  
  
  #this function uses 'player_with_biggest' to see if "Bismack Biyombo" had the most steals.
  #by using player_stats we can grab player_with_longest_name's amount of steals and compare it to the player with the most
def long_name_steals_a_ton? 
  if player_with_biggest(:steals)[:steals] === player_stats(player_with_longest_name())[:steals]
    return true 
  end
  return false 
end