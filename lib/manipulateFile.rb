class ManipulateFile
    
    attr_reader :file

    def initialize(file)
        begin
            @file = File.readlines(file, chomp: true)
        rescue Errno::ENOENT
            puts "File doesn't exist."
        end
    end

    def getFirstLine
        print self.file[0]
        return self.file[0]
    end
    
end
