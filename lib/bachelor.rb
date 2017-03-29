require 'pry'

def get_first_name_of_season_winner(data, season)
  data.each { |title_season, contestants|

    if title_season == season
      contestants.each { |contestant_info|

        contestant_info.each { |attribute, info|
          return contestant_info["name"].split(" ")[0] if attribute == "status" && info == "Winner"
        }
      }
    end
  }
end

def get_contestant_name(data, occupation)
  data.each { |title_season, contestants|

    contestants.each { |contestant_info|

      contestant_info.each { |attribute, info|
        return contestant_info["name"] if attribute == "occupation" && info == occupation
      }
    }
  }
end

def count_contestants_by_hometown(data, hometown)
  hometown_count = 0
  data.each { |title_season, contestants|

    contestants.each { |contestant_info|

      contestant_info.each { |attribute, info|
        hometown_count += 1 if attribute == "hometown" && info == hometown
      }
    }
  }

  hometown_count
end

def get_occupation(data, hometown)
  data.each { |title_season, contestants|

    contestants.each { |contestant_info|

      contestant_info.each { |attribute, info|
        return contestant_info["occupation"] if attribute == "hometown" && info == hometown
      }
    }
  }
end

def get_average_age_for_season(data, season)
  num_of_contestants = 0
  age_sum = 0
  data.each { |title_season, contestants|

    if title_season == season
      contestants.each { |contestant_info|
        num_of_contestants += 1

        contestant_info.each { |attribute, info|
          age_sum += contestant_info["age"].to_f if attribute == "age"
        }
      }
    end
  }

  return (age_sum / num_of_contestants).round
end
