require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

describe DataMapper::Adapters::Sqlite3Adapter do
  before :all do
    @adapter = DataMapper.setup(:default, "sqlite3::memory:")
  end

  it_should_behave_like 'An Adapter'

end
