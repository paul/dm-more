require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

describe DataMapper::Adapters::PostgresAdapter do
  before :all do
    @adapter = DataMapper.setup(:default, 'postgres://postgres@localhost/dm_core_test')
  end

  it_should_behave_like 'An Adapter'

end
