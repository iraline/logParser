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
    @content = "Test 1,2,3"

    arq = File.new("test.log","w")
    arq.puts @content
    arq.close

    main = ManipulateFile.new(arq)

    expect(main.qty_lines).to be > 0
  end
end 

describe '#mount_json' do
  it 'create a json object' do   
    
    @content = "Test 1,2,3"

    arq = File.new("test.log","w")
    arq.puts @content
    arq.close

    main = ManipulateFile.new(arq)
   
    obj = { main.name => { "lines" => main.qty_lines} }


    expect(main.mount).to eq(@content)
  end
end 

context "when user asks number of lines" do
  it "print a JSON object showing the number" do
    result = LogParser.new.line_count
    JSONobj = {"games.log":{"lines":5306}}.to_json
    expect(result).to eq(JSONobj)
  end
end

