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
      
      # remove repeated words guessing that if they are being repeated
      # several times, they aren't typos
      repeated = Hash.new(0)
      @warnings.each do |file|
        file[:warnings].each do |warning|
          repeated[warning[:word]] += 1
        end
      end
      
      @warnings.map do |file|
        file[:warnings].select! { |warning| repeated[warning[:word]] < 3 }
        if file[:warnings].empty?
          nil
        else
          file
        end
      end.compact
    end
  end
end