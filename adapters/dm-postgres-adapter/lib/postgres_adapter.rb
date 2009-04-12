require 'pathname'
begin
  # Try using the one local in git, first
  require Pathname(__FILE__).dirname.parent.parent.expand_path + 'dm-data-objects-adapter/lib/data_objects_adapter'
rescue LoadError
  # Otherwise, use the gem
  require 'dm-data-objects-adapter'
end

gem 'do_postgres', '~>0.9.12'
require 'do_postgres'

module DataMapper::Adapters
  class PostgresAdapter < DataObjectsAdapter
    module SQL #:nodoc:
      private

      def supports_returning?
        true
      end
    end #module SQL

    include SQL
  end # class PostgresAdapter

  const_added(:PostgresAdapter)

end # module DataMapper::Adapters
