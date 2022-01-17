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
end 