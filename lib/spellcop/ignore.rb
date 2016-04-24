module Spellcop
  IGNORE = ['utf']
  
  class ::String
    def spellcop_ignore?
      IGNORE.include? downcase or chars.first == chars.first.upcase or include? '_' or include? '-' or chars.size < 4
    end
  end
end