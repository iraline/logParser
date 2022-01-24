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

  def mount_json
    obj = { @name => { "lines" => @file.length()} }
    JSON.pretty_generate(obj)
  end

end
