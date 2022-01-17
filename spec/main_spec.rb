require 'main'

describe 'Main' do
    it 'should read the first line of the file and print into screen' do   
        @content = "Test 1,2,3"

        arq = File.new("test.log","w")
        arq.puts @content
        arq.close

        main = Main.new(arq)

        expect(main.getFirstLine).to eq(@content)
    end

    it 'should treat error when file doesn`t exist' do
        arq = "teste"
        main = Main.new(arq)

        expect(main.file).to eq(nil)
    end
end 