require "spellcop/version"
require 'ffi/hunspell'

module Spellcop
  class FileChecker
    attr_reader :warnings
    
    def initialize(filename)
      @file = File.read(filename)
      @warnings = []
      @dict = FFI::Hunspell.dict('en_US')
    end
    
    def check!
      comments = @file.scan /#(.*)/
      comments.each do |comment|
        words = comment.first.strip.scan /@(\w+)|\[(\w+)| (\w+)/
        words.each do |result|
          word = result.compact.first
          unless @dict.check? word
#             puts "wrong: #{word}"
            @warnings << { word: word, suggest: @dict.suggest(word) }
          end
        end
      end
    end
  end
end
