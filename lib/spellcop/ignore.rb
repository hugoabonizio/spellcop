module Spellcop
  IGNORE = ['utf']
  
  class ::String
    def spellcop_ignore?
      IGNORE.include? downcase or chars.first == chars.first.upcase
    end
  end
end