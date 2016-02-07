module ActiveRecord
  class Relation
    MULTI_VALUE_METHODS.push *[ :with ]
  end
end
