require 'manipulateFile'

describe 'ManipulateFile' do
    it 'should read the first line of the file' do   
        @content = "Test 1,2,3"

        arq = File.new("test.log","w")
        arq.puts @content
        arq.close

        main = ManipulateFile.new(arq)

        expect(main.getFirstLine).to eq(@content)
    end

    it 'should treat error when file doesn`t exist' do
        arq = "teste"
        main = ManipulateFile.new(arq)

        expect(main.file).to eq(nil)
    end
end 
