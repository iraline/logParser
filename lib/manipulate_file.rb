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
    @file[0]
  end

  def get_players_name
    players = []
    for element in @file do
      if element.include?('ClientUserinfoChanged:')
        player = element.split("\\")
        if not players.include?(player[1])
          players.append(player[1])
        end
      end
    end
    return players
  end

  def mount_json
    obj = { @name => { "lines" => @file.length, "players" => self.get_players_name} }
    JSON.pretty_generate(obj)
  end

end
