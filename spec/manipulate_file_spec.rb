# frozen_string_literal: true

require 'manipulate_file'

describe '#show_first_line' do
  it 'read the first line of the file' do
    @content = 'Test 1,2,3'

    main = ManipulateFile.new('test.txt')

    expect(main.show_first_line).to eq(@content)
  end

  it 'treat error when file doesn`t exist' do
    arq = 'teste'

    expect { ManipulateFile.new(arq) }.to raise_error("File doesn't exist.")
  end
end
