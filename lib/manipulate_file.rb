require 'json'

class ManipulateFile
    
  attr_reader :file, :name

  def initialize(file)
    begin
        @file = File.readlines(file, chomp: true)
        @name = File.basename(file)
    rescue Errno::ENOENT
        puts "File doesn't exist."
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
end
