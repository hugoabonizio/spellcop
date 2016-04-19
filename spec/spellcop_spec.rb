require 'spec_helper'

describe Spellcop do
  it 'should find typos' do
    file = Spellcop::FileChecker.new('spec/files/example.rb')
    file.check!
    expect(file.warnings.size).to be > 0
  end
end
