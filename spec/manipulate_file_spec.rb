require 'manipulate_file'

describe '#get_first_line' do
  it 'read the first line of the file' do   
    @content = "Test 1,2,3"

    main = ManipulateFile.new("test.txt")

    expect(main.get_first_line).to eq(@content)
  end
    
  it 'treat error when file doesn`t exist' do
    arq = "teste"
     
    expect { ManipulateFile.new(arq) }.to raise_error("File doesn't exist.")

  end
end 

describe '#qty_lines' do
  it 'read number of lines of a file' do   

    main = ManipulateFile.new("test.txt")

    expect(main.qty_lines).to be > 0
  end
end 

describe '#mount_json' do
  it 'create a json object' do   
    
    main = ManipulateFile.new("test.txt")
   
    obj = { main.name => { "lines" => main.qty_lines} }

    expect(main.mount_json(obj)).to eq(JSON.pretty_generate(obj))
  end
end

describe '#get_players_name' do
  it 'get the players name' do   
    @content = ["Test1","Test2","Test3"]

    main = ManipulateFile.new("test.txt")

    expect(main.get_players_name).to eq(@content)
  end
end 

describe '#get_players_kills' do
  it 'get quantity of kills from each player and de sum of all' do   
    @content = [{"Test1"=> 1 , "Test2"=> 1},2]

    main = ManipulateFile.new("test.txt")

    expect(main.get_players_kills).to eq(@content)
  end
end 

