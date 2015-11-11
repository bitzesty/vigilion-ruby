# Vigilion

This Ruby gem is for integrating with the Vigilion Anti-Virus & Malware file scanning service.

If you are using Rails, you should use are [Rails gem](
https://github.com/vigilion/vigilion-rails), which includes
integration with Active Record and Action Controller.

## Installation

Add vigilion to your `Gemfile` and then run ` bundle install`

`gem vigilion`

or install it by hand

`gem install vigilion`

This gem uses faraday as HTTP middleware, so you may use any HTTP
backend you want, `Net:HTTP` is the default.

## Configuration

You need to configure the client before making any API requests e.g. in an initializer.

```
Vigilion.configure do |config|
  config.api_key = 'xxxxxxx'
end
```

Vigilion documentation [https://vigilion.readme.io/docs/ruby](https://vigilion.readme.io/docs/ruby)

(c) 2015 Bit Zesty Ltd.
