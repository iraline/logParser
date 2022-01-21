require './manipulate_file'

file = ManipulateFile.new("../games.log")

kills = file.get_players_kills

obj = { file.name => { "lines" => file.qty_lines, "players" => file.get_players_name, "kills" => kills[0], "total_kills" => kills[1]} }


puts file.mount_json(obj)