require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

describe DataMapper::Adapters::MysqlAdapter do
  before :all do
    @adapter = DataMapper.setup(:default, 'mysql://root@localhost/dm_core_test')
  end

  it_should_behave_like 'An Adapter'

end
