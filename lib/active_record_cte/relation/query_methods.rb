module ActiveRecord
  module QueryMethods
    attr_accessor :with_values, :is_recursive

    def with(query)
      return self if query.blank?

      relation = clone
      relation.with_values << query.flatten
      relation
    end

    def with_recursive(query)
      return self if query.blank?

      relation = clone
      relation.is_recursive = true
      relation.with_values << query.flatten
      relation
    end

    def build_with_clause(arel)
      ctes = with_values.map do |cte_query|
        table = Arel::Table.new(cte_query[0])
        query = cte_query[1]

        case query
        when Arel::Nodes::Union
          Arel::Nodes::As.new(table, query)
        else
          raise 'Not Implemented!'
        end

      end

      if is_recursive
        arel.with(:recursive, *ctes)
      else
        arel.with(*ctes)
      end
    end

    def build_arel_with_cte
      arel = build_arel_without_cte
      build_with_clause(arel) unless @with_values.empty?
      arel
    end

    alias_method_chain :build_arel, :cte
  end
end
