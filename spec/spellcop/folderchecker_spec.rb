require 'spec_helper'

describe Spellcop::FolderChecker do
  before do
    @folder = Spellcop::FolderChecker.new('spec/files')
    @folder.check!
  end
  
  it 'should check recursively by default' do
    expect(@folder.files.include? 'spec/files/ruby/3_typos.rb').to eq true
  end
  
  it 'should agregate warnings' do
    expect(@folder.warnings.size).to be >= 2
  end
  
  it 'should find warnings in subfiles' do
    expect(@folder.warnings.select { |elem| elem[:file] == 'spec/files/ruby/3_typos.rb' }).not_to be_empty
  end
end