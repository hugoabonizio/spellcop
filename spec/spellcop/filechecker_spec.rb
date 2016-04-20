require 'spec_helper'

describe Spellcop::FileChecker do
  context 'ruby_1.rb' do
    before do
      @file = Spellcop::FileChecker.new('spec/files/ruby_1.rb')
      @file.check!
    end
    
    it 'should find typos' do
      expect(@file.warnings.size).to eq 4
    end
    
    it 'should find expected typos' do
      puts @file.warnings
      ['tihs', 'worg', 'wordl'].each_with_index do |typo, index|
        expect(@file.warnings[index][:word]).to eq typo
      end
    end
  end
end