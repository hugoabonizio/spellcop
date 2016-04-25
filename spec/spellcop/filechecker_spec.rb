require 'spec_helper'

describe Spellcop::FileChecker do
  context 'ruby_1.rb' do
    before do
      @file = Spellcop::FileChecker.new('spec/files/ruby/example.rb')
      @file.check!
    end
    
    it 'should find typos' do
      expect(@file.warnings.size).to eq 3
    end
    
    it 'should find expected typos' do
      ['tihs', 'worg', 'wordl'].each_with_index do |typo, index|
        expect(@file.warnings[index][:word]).to eq typo
      end
    end
  end
  
  context 'url.rb' do
    before do
      @file = Spellcop::FileChecker.new('spec/files/ruby/url.rb')
      @file.check!
    end
    
    it 'should ignore URLs' do
      result = @file.warnings.select { |warning| warning[:word] == 'upsert' }
      expect(result).to be_empty
    end
  end
end