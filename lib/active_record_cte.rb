require "active_record_cte/version"
require 'active_record'

case ActiveRecord::VERSION::MAJOR
when 3
  require 'active_record_cte/relation'
  require 'active_record_cte/querying'
  require 'active_record_cte/relation/query_methods'
else
  raise "Unsupported AR version (#{ActiveRecord::VERSION::STRING})"
end
