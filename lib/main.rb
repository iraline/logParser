# frozen_string_literal: true

require './manipulate_file'

file = ManipulateFile.new('../games.log')

puts file.mount_json
