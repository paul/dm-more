require 'pathname'
begin
  # Try using the one local in git, first
  require Pathname(__FILE__).dirname.parent.parent.expand_path + 'dm-data-objects-adapter/lib/data_objects_adapter'
rescue LoadError
  # Otherwise, use the gem
  require 'dm-data-objects-adapter'
end

gem 'do_mysql', '~>0.9.12'
require 'do_mysql'

module DataMapper::Adapters
  class MysqlAdapter < DataObjectsAdapter
    module SQL #:nodoc:
      private

      def supports_default_values? #:nodoc:
        false
      end

      # TODO: once the driver's quoting methods become public, have
      # this method delegate to them instead
      def quote_name(name) #:nodoc:
        "`#{name.gsub('`', '``')}`"
      end

      # TODO: once the driver's quoting methods become public, have
      # this method delegate to them instead
      def quote_value(value) #:nodoc:
        case value
        when TrueClass  then super(1)
        when FalseClass then super(0)
        else
          super
        end
      end

      def regexp_operator(operand)
          'REGEXP'
      end

      def not_regexp_operator(operand)
          'NOT REGEXP'
      end
    end #module SQL

    include SQL
  end # class MysqlAdapter

  const_added(:MysqlAdapter)
end # module DataMapper::Adapters
