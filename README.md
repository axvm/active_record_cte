# ActiveRecordCTE

Allows you to use CTE in ActiveRecord Relations. At this moment implemented only recursive query for ActiveRecord 3. Pull requests for other versions are welcome.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_record_cte'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install active_record_cte

## Usage

    class Foo < ActiveRecord::Base
      #attr_accessor :col1, :col2
    end

    non_recursive = Foo.select('id, col1, col2').where('col1 IS NOT NULL')
    recursive = Foo.select('id, col1, col2').from('cte_table').where(col2: 'something')

    union = non_recursive.union(recursive)

    Foo.with_recursive(cte_table: union).pluck(:id) #Or something else

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/axvm/active_record_cte. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

