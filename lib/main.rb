# frozen_string_literal: true

require './manipulate_file'

file = ManipulateFile.new('../games.log')

puts JSON.pretty_generate(file.mount_object)
