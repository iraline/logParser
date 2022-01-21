require './manipulate_file'

file = ManipulateFile.new("../games.log")

puts file.mount_json(file.qty_lines)
