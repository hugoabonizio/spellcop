module Spellcop
  class FileChecker
    attr_reader :warnings
    
    def initialize(filename)
      @file = File.read(filename)
      @warnings = []
      @dict = FFI::Hunspell.dict('en_US')
    end
    
    def check!
      comments = @file.scan /(\s#(.*)|^#(.*))/
      comments.each do |comment|
        url_removed_comment = comment.first.strip.gsub /https?:\/[^\s]+/, ''
        words = url_removed_comment.scan /(\w+)/
        words.each do |result|
          word = result.compact.first
          if !@dict.check? word and !word.spellcop_ignore?
            @warnings << { word: word, suggestions: @dict.suggest(word) }
          end
        end
      end
      @warnings
    end
  end
end