# frozen_string_literal: true

require 'manipulate_file'

describe ManipulateFile do
  describe '#show_first_line' do
    it 'read the first line of the file' do
     
      main = ManipulateFile.new("test.txt")
     
      expect(main.show_first_line).to eq('Test 1,2,3')
    end

    it 'treat error when file doesn`t exist' do
      arq = 'teste'

      expect { ManipulateFile.new(arq) }.to raise_error('File doesn`t exist.')
    end
  end

  describe '#mount_object' do
    it 'create a response object' do

      main = ManipulateFile.new('test.txt')

      obj = { 'test.txt' => { 'lines' => 6, 'players' => ['Test1','Test2','Test3'] } }

      expect(main.mount_object).to eq(obj)
    end
  end
end 

describe '#get_players_kills' do
  it 'get quantity of kills from each player and de sum of all' do   
    @content = [{"Test1"=> 1 , "Test2"=> 1},2]

    main = ManipulateFile.new("test.txt")

    expect(main.get_players_kills).to eq(@content)
  end
end 

