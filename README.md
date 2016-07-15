# ColorContrast

Calculate a contrasting color for a given hex code.
Based on the YIQ method to calculate contrast.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'color_contrast'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install color_contrast

## Usage
```ruby
ColorContrast.get_contrast("#000000") # => "light"
ColorContrast.get_contrast("#0000ff") # => "light"

# hashtag is not needed for input
ColorContrast.get_contrast("00ff00") # => "dark"
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ronaldchacon/color_contrast.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
