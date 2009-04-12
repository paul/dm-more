require 'pathname'
begin
  # Try using the one local in git, first
  require Pathname(__FILE__).dirname.parent.parent.expand_path + 'dm-data-objects-adapter/lib/data_objects_adapter'
rescue LoadError
  # Otherwise, use the gem
  require 'dm-data-objects-adapter'
end


gem 'do_sqlite3', '~>0.9.12'
require 'do_sqlite3'

module DataMapper::Adapters
    class Sqlite3Adapter < DataObjectsAdapter
      module SQL #:nodoc:
        private

        # TODO: once the driver's quoting methods become public, have
        # this method delegate to them instead
        def quote_value(value)
          case value
            when TrueClass  then super('t')
            when FalseClass then super('f')
            else
              super
          end
        end
      end # module SQL

      include SQL
    end # class Sqlite3Adapter

    const_added(:Sqlite3Adapter)
end # module DataMapper::Adapters
