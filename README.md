# Vigilion

[![Circle CI](https://circleci.com/gh/vigilion/vigilion-ruby.svg?style=shield)](https://circleci.com/gh/vigilion/vigilion-ruby)
[![Code Climate](https://codeclimate.com/repos/573cf901083c0a124a008778/badges/5ca311f1f7ac8dfa6dd2/gpa.svg)](https://codeclimate.com/repos/573cf901083c0a124a008778/feed)


This Ruby gem is for integrating with the [Vigilion Anti-Virus & Malware file scanning service](https://www.vigilion.com/).

If you are using Rails, you should use our [Rails gem](
https://github.com/vigilion/vigilion-rails), which includes
integration with Active Record and Action Controller.

## Installation

Add vigilion to your `Gemfile` and then run `bundle install`

`gem 'vigilion'`

or install it by hand

`gem install vigilion`

This gem uses faraday as HTTP middleware, so you may use any HTTP
backend you want, `Net:HTTP` is the default.

## Configuration

You need to configure the client before making any API requests e.g. in an initializer.

```
Vigilion.configure do |config|
  config.access_key_id = ENV['VIGILION_API_KEY']
  config.secret_access_key = ENV['VIGILION_API_SECRET']
end
```

Vigilion [API documentation](https://docs.vigilion.com/)

(c) 2015 Bit Zesty Ltd.
