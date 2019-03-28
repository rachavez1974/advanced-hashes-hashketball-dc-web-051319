def game_hash
  game_hash = { :home => {  :team_name => "Brooklyn Nets",
                            :colors => ["Black", "White"],
                            :players => { "Alan Anderson" => { :number => 0,
                                                               :shoe => 16,
                                                               :points => 22,
                                                               :rebounds => 12,
                                                               :assists => 12,
                                                               :steals => 3,
                                                               :blocks => 1,
                                                               :slam_dunks => 1
                                                          },
                                       "Reggie Evans" => {   :number => 30,
                                                             :shoe => 14,
                                                             :points => 12,
                                                             :rebounds => 12,
                                                             :assists => 12,
                                                             :steals => 12,
                                                             :blocks => 12,
                                                             :slam_dunks => 7
                                                          },
                                      "Brook Lopez" =>  {    :number => 11,
                                                             :shoe => 17,
                                                             :points => 17,
                                                             :rebounds => 19,
                                                             :assists => 10,
                                                             :steals => 3,
                                                             :blocks => 1,
                                                             :slam_dunks => 15
                                                           },
                                      "Mason Plumlee" => {   :number => 1,
                                                             :shoe => 19,
                                                             :points => 26,
                                                             :rebounds => 12,
                                                             :assists => 6,
                                                             :steals => 3,
                                                             :blocks => 8,
                                                             :slam_dunks => 5
                                                        },   
                                      "Jason Terry" =>  {    :number => 31,
                                                             :shoe => 15,
                                                             :points => 19,
                                                             :rebounds => 2,
                                                             :assists => 2,
                                                             :steals => 4,
                                                             :blocks => 11,
                                                             :slam_dunks => 1
                                                        }              
                                    }

                                     
                      },
            :away => {  :team_name => "Charlotte Hornets",
                        :colors => ["Turquoise", "Purple"],
                        :players => { "Jeff Adrien" => {     :number => 4,
                                                             :shoe => 18,
                                                             :points => 10,
                                                             :rebounds => 1,
                                                             :assists => 1,
                                                             :steals => 2,
                                                             :blocks => 7,
                                                             :slam_dunks => 2
                                                          },
                                       "Bismak Biyombo" => { :number => 0,
                                                             :shoe => 16,
                                                             :points => 12,
                                                             :rebounds => 4,
                                                             :assists => 7,
                                                             :steals => 7,
                                                             :blocks => 15,
                                                             :slam_dunks => 10
                                                          },
                                      "DeSagna Diop" =>  {   :number => 2,
                                                             :shoe => 14,
                                                             :points => 24,
                                                             :rebounds => 12,
                                                             :assists => 12,
                                                             :steals => 4,
                                                             :blocks => 5,
                                                             :slam_dunks => 5
                                                           },
                                      "Ben Gordon" =>      { :number => 8,
                                                             :shoe => 15,
                                                             :points => 33,
                                                             :rebounds => 3,
                                                             :assists => 2,
                                                             :steals => 1,
                                                             :blocks => 1,
                                                             :slam_dunks => 0
                                                            },   
                                      "Brendan Haywood" =>  {:number => 33,
                                                             :shoe => 15,
                                                             :points => 6,
                                                             :rebounds => 12,
                                                             :assists => 12,
                                                             :steals => 22,
                                                             :blocks => 5,
                                                             :slam_dunks => 12
                                                            }
                                    } 
                      }
          }

  game_hash

end

  def home_team_name
    game_hash[:home][:team_name]
  end
  #return mumber of points score for a particular player
  def num_points_scored(player)
   points = 0 
   players_info_hash = return_players_info
    players_info_hash.each do |member, stats|
      if player == member
         stats.each do |type, score|
          if type.to_s == "points"
            points = score
          end
        end
      end
    end
    points
  end
   
def shoe_size(player)
  size = 0
  players_info_hash = return_players_info
    players_info_hash.each do |member, stats|
      if player == member
         stats.each do |type, snicker|
          if type.to_s == "shoe"
            size = snicker
          end
        end
      end
    end
    size
end

def team_colors(team_name)
  colors = []
  game_hash.each do |playing_at, team_hash|
    team_hash.each do |team_info, team_trait|
      if team_trait.to_s == team_name
        colors = game_hash[playing_at.to_sym][:colors]
      end
    end
  end
  colors
end

def team_names
  teams = []
    game_hash.each do |playing_at, team_hash|
      team_hash.each do |team_info, team_trait|
        if team_info.to_s == "team_name"
          teams.push(team_trait)
        end
      end
    end
  teams
end
 
 #break up this problem into two parts
 #find team's name
 #the get their jersey's numbers
def player_numbers(team_name)
  jersey_numbers = []
  players_info_hash = {}
   game_hash.each do |playing_at, team_hash|
      team_hash.each do |team_info, team_trait|
        if team_trait.to_s == team_name
          players_info_hash = game_hash[playing_at.to_sym][:players]
          jersey_numbers = players_jersey_numbers(players_info_hash)
        end
      end
   end
   jersey_numbers
 end
 
def players_jersey_numbers(players)
  jersey_numbers = []
  players.each do |name, info|
    info.each do |stat_name, value|
      if stat_name.to_s == "number"
        jersey_numbers.push(value)
      end
    end
  end
  jersey_numbers
end

#Build a method, player_stats, that takes in an argument of a player's name 
#and returns a hash of that player's stats.
def player_stats(player)
  players_info_hash = return_players_info
  player_stats = {}
    players_info_hash.each do |member, stats|
      if member.to_s == player
        player_stats = stats
      end
    end
  player_stats  
end

def big_shoe_rebounds
  #find biggest shoe by putting all shoes in array and find max
  #use biggest shoe to find the name of the player.
  #use player's name to retrieve its rebounds
 
  players_info_hash = return_players_info
  shoe_numbers = players_shoe_numbers(players_info_hash)
  name = who_wears_biggest_shoe(shoe_numbers.max)
  get_rebounds(name)
end

  

#returns an array of all shoes sizes worn by players
def players_shoe_numbers(players)
  shoe_numbers = []
  players.each do |name, info|
    info.each do |stat_name, value|
      if stat_name.to_s == "shoe"
        shoe_numbers.push(value)
      end
    end
  end
  shoe_numbers  
end

#returns the name of the player who wears the biggest shoe
def who_wears_biggest_shoe(shoe_size)
  name = ""
  players_info_hash = return_players_info
    players_info_hash.each do |player, stats|
      hold_player = player
        stats.each do |type, value|
          if type.to_s == "shoe" && value == shoe_size
            name = hold_player
        end
    end
  end
  name
end

def get_rebounds(name)
  rebounds = 0
  players_info_hash = return_players_info
    players_info_hash.each do |player, stats|
      if player.to_s == name
        stats.each do |type, value|
          if type.to_s == "rebounds"
            rebounds = value  
          end
        end
      end
    end
    rebounds
end
  
#returns a hash of all the players stats
#it gets you to the third level 
def return_players_info
  players_info_hash = {}
   game_hash.each do |playing_at, team_hash|
      team_hash.each do |team_info, team_trait|
        if team_info.to_s == "players"
            players_info_hash.merge!(team_trait)
        end
      end
   end
   players_info_hash
end

#which player has the most points
def most_points_scored
  points = players_points(return_players_info)
  name = who_has_most_points(points.max)
end

#it returns an array of all the points from players
def players_points(players)
  points = []
  players.each do |name, info|
    info.each do |stat_name, value|
      if stat_name.to_s == "points"
        points.push(value)
      end
    end
  end
  points
end

def who_has_most_points(point)
  name = ""
    return_players_info.each do |player, stats|
      hold_player = player
        stats.each do |type, value|
          if type.to_s == "points" && value == point
            name = hold_player
          end
        end
    end 
  name
end


#returns the name of the teams with their corresponding players
def return_team_with_players_stats
  teams_information = {}
  hold_name = ""
  hold_players = {}
  game_hash.each do |site, team_hash|
    team_hash.each do |team_info, team_trait|
      case team_info.to_s
        when "team_name"
          hold_name = team_trait.to_s
        when "players"
          hold_players = team_trait
      end
      teams_information[hold_name.to_sym] = hold_players
    end
  end  
teams_information
end

def get_team_points(players)
  #put all points into an array
  #sum the array
  points_array = []
  players.each do |name, stats|
    stats.each do |type, score|
      if type.to_s == "points"
        points_array.push(score)
      end
    end
  end
  points_array.sum
end

#returns a hash with team points and names of team
def get_teams_with_points
  team_and_points = {}
    return_team_with_players_stats.each do |team, players|
      team_and_points[team.to_sym] = get_team_points(players)
    end
  team_and_points                  
end

#returns the name of a team with most points
def winning_team
  team = get_teams_with_points.select {|team, points| points == get_teams_with_points.values.max }
  team.keys.join
end


def player_with_longest_name
  array_name = []
  return_team_with_players_stats.each do |team, players|
    players.each do |name, info|
      array_name.push(name)
    end
  end
  array_name.max { |name1, name2| name1.length <=> name2.length }
end

def get_max_steals
  #put all steals into an array
  #return highest steals in array

  #get all the players first
  players = return_players_info      
  steals_array = []
  players.each do |name, stats|
    stats.each do |type, score|
      if type.to_s == "steals"
        steals_array.push(score)
      end
    end
  end
  steals_array.max
end

def get_player_steals(player)
  players = return_players_info
  steals = 0
  players.each do |name, info|
    info.each do |type, stat|
      if type.to_s == "steals"
        steals = stat
      end
    end

  end
  steals
end


def long_name_steals_a_ton?(name = player_with_longest_name)
  answer = nil
    if get_max_steals == get_player_steals(name)
      answer = true
    else
      answer = false
    end
  answer
end














