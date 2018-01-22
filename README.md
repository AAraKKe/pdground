[![Gem Version](https://badge.fury.io/rb/pdground.svg)](https://badge.fury.io/rb/pdground)
# Pdground

PDGRound allows you to round a number with an uncertainty using the PDG rounding rules.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pdground'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pdground

## Usage

Pdground provides an easy to use function to round a given number with an uncertainty using the PDG rules. The rule [states the following](http://pdg.lbl.gov/2010/reviews/rpp2010-rev-rpp-intro.pdf) [Sec 5.3]:

> The basic rule states that if the three highest order digits of the error lie between 100 and 354, we round to two signiﬁcant digits. If they lie between 355 and 949, we round to one signiﬁcant digit. Finally, if they lie between 950 and 999, we round up to 1000 and keep two signiﬁcant digits. In all cases, the central value is given with a precision that matches that of the error

For example, given the value `12.2135 +- 0.03215` the rounded value reults in `12.214 +- 0.032` while for the value `12.2135 +- 0.06515` the rounded value reults in `12.21 +- 0.07`.

Using `Pdground` in your code it is as simple as doing:

```ruby
require 'pdground'

value = 12.2135
error = 0.06515
result = Pdground::round(meas: value, unc: error)
puts "Rounded value: #{result[0]}"
puts "Rounded error: #{result[1]}"
# Rounded value: 12.21
# Rounded error: 0.07 
```

## Contributing

Contributions to this project are only accepted in its [GitLab repo](https://gitlab.com/jparaque/pdground)
If you want to contribute to improve this gem with any bug fix or new feature:
* First open an issue to discuss the bug or feature
* Place a merge request referring to the issue once agreed to include it

Tests **must be added** to ensure maintainability.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
