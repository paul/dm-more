#require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'spec_helper'))

require 'rubygems'

require File.join(File.dirname(__FILE__), '..', 'lib', 'yaml_adapter')
require 'dm-core'
require 'dm-core/spec/adapter_shared_spec'

describe DataMapper::Adapters::YamlAdapter do
  before :all do
    @adapter = DataMapper.setup(:default, :adapter => 'yaml',
                                          :path    => File.join(File.dirname(__FILE__), 'db'))
  end

  it_should_behave_like 'An Adapter'

end
