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

  def show_first_line
    @file[0]
  end

  def show_players_name
    players = []
    for line in @file do
      if line.include?('ClientUserinfoChanged:')
        player = line.split("\\")
        unless players.include?(player[1])
          players.append(player[1])
        end
      end
    end
    return players
  end

  def mount_json
    obj = { @name => { "lines" => @file.length, "players" => show_players_name} }
    JSON.pretty_generate(obj)
  end

  private :show_players_name
end 
