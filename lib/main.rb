#!/usr/bin/env ruby

class Main
    
    attr_reader :file

    def initialize(file)
        @file = File.readlines(file, chomp: true)
    end

    def getFirstLine
        print self.file[0]
        return self.file[0]
    end
    
end