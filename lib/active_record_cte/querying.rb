module ActiveRecord
  module Querying
    delegate :with, :with_recursive, to: :scoped
  end
end
