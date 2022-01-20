require './manipulate_file'

file = ManipulateFile.new("../games.log")

obj = { file.name => { "lines" => file.qty_lines, "players" => file.get_players_name} }

puts file.mount_json(obj)