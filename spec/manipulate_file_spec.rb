# frozen_string_literal: true

require 'manipulate_file'

describe ManipulateFile do
  describe '#show_first_line' do
    it 'read the first line of the file' do
      main = ManipulateFile.new('test.txt')

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

      obj = { 'test.txt' => { 'lines' => 6, 'players' => %w[Test1 Test2 Test3] , 'kills'=> {'Test1'=>1 , 'Test2'=>1},"total_kills"=>2} }

      expect(main.mount_object).to eq(obj)
    end
  end

end
