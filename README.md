[![Gem Version](https://badge.fury.io/rb/error_arranger.svg)](https://badge.fury.io/rb/error_arranger)

# ErrorArranger

Gem for Rails to enable arrange error object before rescue_from handles.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'error_arranger'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install error_arranger

## Usage

implement method `arrange_exception!(exception)` to your controller.

e.g.

```ruby
class ApplicationController < ActionController::Base
  def arrange_exception!(exception)
    # doing something great with exception
  end
end
```

The method `arrange_exception!(exception)` will be called before rescue handlers rescues the error whenever your Rails appliraction raises error.

## dependencies

* Rails '>= 5.2.0', '<6.0'

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/error_arranger. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
