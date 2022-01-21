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

  def mount_json(lines,players)
    obj = { self.name => { "lines" => lines, "players" => players} }
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

end


