# frozen_string_literal: true

# Class to help manipulate a file
class ManipulateFile
  attr_reader :file

  def initialize(file)
    @file = File.readlines(file, chomp: true)
  rescue Errno::ENOENT
    raise "File doesn't exist."
  end

  def show_first_line
    file[0]
  end
end
