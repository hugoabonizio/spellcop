require 'spec_helper'

describe Spellcop do
  describe 'Ignore world list' do
    it 'should not ignore valid words' do
      expect('code'.spellcop_ignore?).to eq false
      expect('script'.spellcop_ignore?).to eq false
      expect('running'.spellcop_ignore?).to eq false
    end
    
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
    
    it 'should ignore words with less than 4 chars' do
      expect('acc'.spellcop_ignore?).to eq true
    end
    
    it 'should ignore plurals too' do
      expect('admins'.spellcop_ignore?).to eq true
    end
  end
end