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

  def show_players_name
    players = []
    @file.each do |line|
      next unless line.include?('ClientUserinfoChanged:')

      player = line.split('\\')
      players.append(player[1]) unless players.include?(player[1])
    end
    players
  end

  def mount_object
    obj = { @name => { 'lines' => @file.length, 'players' => show_players_name } }
  end

  private :show_players_name
end
