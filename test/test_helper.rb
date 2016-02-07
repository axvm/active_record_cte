$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'active_record_cte'

require 'sqlite3'

require 'minitest/autorun'
require 'minitest/rg'

#FIXME need to implement test in pg and fix for sqlite
raise 'Test doesnt works with SQLlite'
test_db = File.absolute_path('cte_test.db')

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: test_db
)

class TestDBSchema < ActiveRecord::Migration
  def change
    create_table :foos do |t|
      t.string :str
      t.integer :int
    end
  end
end

class Foo < ActiveRecord::Base
end

File.delete test_db
TestDBSchema.migrate(:up)
Foo.create([
  { str: 'string',   int: 123 },
  { str: 'string2',  int: 321 },
  { str: 'string3',  int: nil },
  { str: nil,        int: 131 },
])
