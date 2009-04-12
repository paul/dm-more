require 'pathname'
require Pathname(__FILE__).dirname + '../lib/mysql_adapter'

require 'rubygems'
require 'dm-core'
require 'dm-core/spec/adapter_shared_spec'

begin
  # Try using the one local in git, first
  require Pathname(__FILE__).dirname.parent.parent.expand_path + 'dm-data-objects-adapter/lib/data_objects_adapter'
rescue LoadError
  # Otherwise, use the gem
  require 'dm-data-objects-adapter'
end


