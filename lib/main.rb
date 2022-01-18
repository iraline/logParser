require './manipulate_file'

file = ManipulateFile.new("../games.log")

obj = { file.name => { "lines" => file.qty_lines} }

puts file.mount_json(obj)