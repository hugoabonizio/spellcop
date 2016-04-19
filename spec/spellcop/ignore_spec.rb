require 'spec_helper'

describe Spellcop do
  describe 'Ignore world list' do
    it 'should ignore words in list' do
      expect('utf'.spellcop_ignore?).to eq true
    end
    
    it 'should ignore capitalized words' do
      expect('PDF'.spellcop_ignore?).to eq true
    end
  end
end