# frozen_string_literal: true

require './manipulate_file'

<<<<<<< HEAD
kills = file.get_players_kills

obj = { file.name => { "lines" => file.qty_lines, "players" => file.get_players_name, "kills" => kills[0], "total_kills" => kills[1]} }

=======
file = ManipulateFile.new('../games.log')
>>>>>>> 6c22aeb185c6034bcd611ed6b8badf257adc366b

puts JSON.pretty_generate(file.mount_object)
