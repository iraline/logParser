require 'manipulate_file'

describe '#get_first_line' do
  it 'read the first line of the file' do   
    @content = "Test 1,2,3"

    main = ManipulateFile.new("test.txt")

    expect(main.get_first_line).to eq(@content)
  end
    
  it 'treat error when file doesn`t exist' do
    arq = "teste"
    main = ManipulateFile.new(arq)

    expect(main.file).to eq(nil)
  end
end 
