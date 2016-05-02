# ColorHelpers
[![Gem Version](https://badge.fury.io/rb/color_helpers.svg)](https://badge.fury.io/rb/color_helpers) [![Code Climate](https://codeclimate.com/github/mschneider85/color_helpers/badges/gpa.svg)](https://codeclimate.com/github/mschneider85/color_helpers) [![Build Status](https://travis-ci.org/mschneider85/color_helpers.svg?branch=master)](https://travis-ci.org/mschneider85/color_helpers)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'color_helpers'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install color_helpers

## Usage

```ruby
<%= random_hex_color %> // prints a random hex color e.g. "#ff0000"
```
```ruby
<%= hex_to_rgb(hex_color) %> // converts hex color string to rgb color string
```
```ruby
<%= rgb_to_hex(rgb_color) %> // converts rgb color string to hex color string
```
_hex_color argument accepts an input string e.g. "#ff0000"_
```ruby
<%= darken_color(hex_color, amount)  %> // amount: 0 to 1, default: 0.4
```
```ruby
<%= lighten_color(hex_color, amount)  %> // amount: 0 to 1, default: 0.6
```
```ruby
<%= contrasting_text_color(hex_color)  %> // Options: :monochrome, default: false
```
```ruby
<%= color_to_grayscale(hex_color)  %> // converts color to greyscale
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/mschneider85/color_helpers/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
