require 'spec_helper'

describe Spellcop do
  describe 'Ignore world list' do
    it 'should ignore words in list' do
      expect('utf'.spellcop_ignore?).to eq true
    end
    
    it 'should ignore capitalized words' do
      expect('PDF'.spellcop_ignore?).to eq true
    end
    
    it 'should ignore string with _ or -' do
      expect('to_a'.spellcop_ignore?).to eq true
      expect('page_size'.spellcop_ignore?).to eq true
    end
  end
end