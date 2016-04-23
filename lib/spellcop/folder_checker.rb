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
        @warnings << { file: file, warnings: FileChecker.new(file).check! }
        @files << file
      end
      @warnings
    end
  end
end