require 'json'

class ManipulateFile
    
  attr_reader :file, :name

  def initialize(file)
    begin
        @file = File.readlines(file, chomp: true)
        @name = File.basename(file)
    rescue Errno::ENOENT
      raise "File doesn't exist."
    end
  end

  def get_first_line
    self.file[0]
  end

  def qty_lines
    self.file.length()
  end

  def mount_json(obj)
    JSON.pretty_generate(obj)
  end

  def get_players_name
    players = []
    for element in self.file do
      if element.include?('ClientUserinfoChanged:')
        player = element.split("\\")
        if not players.include?(player[1])
          players.append(player[1])
        end
      end
    end
    return players
  end

  def get_players_kills
    kills = Hash[]
    x = 0
    for element in self.file do
      if element.include?('Kill:')
        kill = element.split(" ") #campos 5 e 6
        if !kill[5].include?("<world>")
          x = x + 1
          if kills.include?(kill[5])
            kills[kill[5]] = kills[kill[5]] + 1
          else
            kills[kill[5]] = 1
          end
        end
      end
    end
    [kills,x]
  end

end


