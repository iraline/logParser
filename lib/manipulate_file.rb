# frozen_string_literal: true

require 'json'

# Class to help manipulate a file
class ManipulateFile
  attr_reader :file

  def initialize(file)
    @file = File.readlines(file, chomp: true)
    @name = File.basename(file)
    rescue Errno::ENOENT
    raise 'File doesn`t exist.'
  end

  def show_first_line
    @file[0]
  end

  def mount_object
    kills, total_kills = show_players_kills
    { 
      @name => { 
      'lines' => @file.length, 
      'players' => show_players_name, 
      'kills' => kills,
      'total_kills' => total_kills 
      } 
    }
  end

  private

  def show_players_kills
    kills = Hash[]
    x = 0
    for element in self.file do
      if element.include?('Kill:')
        kill = element.split(' ') 
        if !kill[5].include?('<world>') 
          if kills.include?(kill[5])
            kills[kill[5]] += 1
          else
            kills[kill[5]] = 1
          end
        else 
          if kills.include?(kill[7])
            kills[kill[7]] -= 1
          else
            kills[kill[7]] = -1
          end
        end
        x +=1
      end
    end
    [kills,x]
  end

  def show_players_name
    players = []

    @file.each do |line|
      next unless line.include?('ClientUserinfoChanged:')

      player = line.split('\\')[1]
      
      next if players.include?(player)

      players.append(player)
    end
    
    players
  end
end
