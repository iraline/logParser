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
    count = 0
    @file.each do |line|
      next unless line.include?('Kill:')
      kill = line.split(' ') 
      unless kill[5].include?('<world>') 
        kills[kill[5]] = kills.fetch(kill[5],0) + 1
      else 
        kills[kill[7]] = kills.fetch(kill[7],0) - 1
      end
      count +=1  
    end
    [kills,count]
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
