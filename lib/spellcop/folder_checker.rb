module Spellcop
  class FolderChecker
    attr_reader :warnings, :files
    
    def initialize(foldername, recursive = true)
      @warnings = []
      if recursive
        @folder = "#{foldername}/**/*.rb"
      else
        @folder = "#{foldername}/*.rb"
      end
      @files = []
    end
    
    def check!
      Dir[@folder].each do |file|
        result = { file: file, warnings: FileChecker.new(file).check! }
        @warnings << result unless result[:warnings].empty?
        @files << file
      end
      @warnings
    end
  end
end